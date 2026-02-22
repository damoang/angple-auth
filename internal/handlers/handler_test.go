package handlers

import (
	"fmt"
	"net/http"
	"net/http/httptest"
	"net/url"
	"os"
	"path/filepath"
	"testing"
	"time"

	"github.com/damoang/angple-auth/internal/config"
	"github.com/damoang/angple-auth/internal/database"
	"github.com/damoang/angple-auth/internal/middleware"
	"github.com/damoang/angple-auth/testdata"
	"github.com/damoang/angple-auth/utils"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"github.com/stretchr/testify/assert"
	"github.com/testcontainers/testcontainers-go"
	"go.uber.org/zap"
	"golang.org/x/oauth2"
)

func createMockNaverServer() *httptest.Server {
	mux := http.NewServeMux()

	mux.HandleFunc("/oauth2.0/token", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprintln(w, `{"access_token": "mock_access_token", "refresh_token": "mock_refresh_token", "token_type": "Bearer", "expires_in": "3600"}`)
	})

	mux.HandleFunc("/v1/nid/me", func(w http.ResponseWriter, r *http.Request) {
		authHeader := r.Header.Get("Authorization")
		if authHeader != "Bearer mock_access_token" {
			w.WriteHeader(fiber.StatusUnauthorized)
		}
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprintln(w, `{"resultcode": "00", "message": "success", "response": {
			"id": "32742776",
			"email": "mock_user@naver.com",
			"name": "mock_name"
		}}`)

	})
	return httptest.NewServer(mux)
}

func createMockGoogleServer() *httptest.Server {
	mux := http.NewServeMux()

	mux.HandleFunc("/token", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprintln(w, `{"access_token": "mock_access_token",
			"expires_in": 3599,
			"refresh_token": "mock_refresh_token",
			"scope": "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email",
			"token_type": "Bearer",
			"id_token": "mock_id_token"}`)
	})

	mux.HandleFunc("/oauth2/v2/userinfo", func(w http.ResponseWriter, r *http.Request) {
		authHeader := r.Header.Get("Authorization")
		if authHeader != "Bearer mock_access_token" {
			w.WriteHeader(fiber.StatusUnauthorized)
		}
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprintln(w, `{"id": "123456789012345678901",
			"email": "mock_user@gmail.com",
			"verified_email": true,
			"name": "홍길동",
			"given_name": "길동",
			"family_name": "홍",
			"picture": "https://lh3.googleusercontent.com/mock_picture_path",
			"locale": "ko"}`)
	})
	return httptest.NewServer(mux)
}

func TestMain(m *testing.M) {
	wd, _ := os.Getwd()
	projectRoot := filepath.Join(wd, "../..")

	utils.InitAppEnv()
	if err := utils.LoadConfig(filepath.Join(projectRoot, utils.DOTENV_DEV)); err != nil {
		logger.Panic("TestMain", zap.NamedError("failed to load dotenv", err))
	}

	config.InitProviders()
	config.InitSessionStore()

	c := testdata.SetupTestContainer(projectRoot)

	defer func() {
		if err := testcontainers.TerminateContainer(c); err != nil {
			logger.Debug("TestMain: failed to terminate container", zap.Error(err))
		}
	}()

	database.ConnectDB()

	code := m.Run()

	os.Exit(code)
}

func prepareAuthRouter(app *fiber.App, method string, path string, handlers ...fiber.Handler) *fiber.App {
	auth := app.Group("/auth")

	switch method {
	case "get":
		auth.Get(path, handlers...)
	case "post":
		auth.Post(path, handlers...)
	}

	return app
}

func TestAuth(t *testing.T) {
	app := fiber.New()
	prepareAuthRouter(app, "get", "/:provider", Auth)

	testCases := []struct {
		name     string
		provider string
	}{
		{"naver", "naver"},
		{"google", "google"},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			req := httptest.NewRequest("GET", fmt.Sprintf("/auth/%s?url=%s", tc.provider, "/free"), nil)

			resp, err := app.Test(req)
			assert.NoError(t, err)
			defer resp.Body.Close()

			t.Logf("resp: %v", resp)

			assert.Equal(t, fiber.StatusFound, resp.StatusCode, "response code must be 302")
		})
	}
}

func TestAuthCallback(t *testing.T) {
	app := fiber.New()
	prepareAuthRouter(app, "get", "/:provider", Auth)
	prepareAuthRouter(app, "get", "/:provider/callback", AuthCallback)

	testCases := []struct {
		name             string
		provider         string
		authPath         string
		tokenPath        string
		profilePath      string
		createMockServer func() *httptest.Server
	}{
		{
			name:             "naver",
			provider:         "naver",
			authPath:         "/oauth2.0/authorize",
			tokenPath:        "/oauth2.0/token",
			profilePath:      "/v1/nid/me",
			createMockServer: createMockNaverServer,
		},
		{
			name:             "google",
			provider:         "google",
			authPath:         "/o/oauth2/auth",
			tokenPath:        "/token",
			profilePath:      "/oauth2/v2/userinfo",
			createMockServer: createMockGoogleServer,
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			authReq := httptest.NewRequest("GET", fmt.Sprintf("/auth/%s?url=%s", tc.provider, "/free"), nil)
			authResp, err := app.Test(authReq)
			t.Logf("Auth resp: %v", authResp)
			assert.NoError(t, err)
			assert.Equal(t, fiber.StatusFound, authResp.StatusCode)

			cookie := authResp.Header.Get("Set-Cookie")
			t.Logf("Auth resp Cookie: %v", cookie)
			location := authResp.Header.Get("Location")
			t.Logf("Auth resp Location: %v", location)

			redirectURL, err := url.Parse(location)
			assert.NoError(t, err)
			stateBase64 := redirectURL.Query().Get("state")
			assert.NotEmpty(t, stateBase64)
			t.Logf("stateBase64: %v", stateBase64)

			server := tc.createMockServer()
			defer server.Close()

			provider := config.GetProvider(tc.provider)
			conf := provider.GetOauth2Conf()
			profileEndpoint := provider.GetProfileEndpoint()
			originalEndpoint := conf.Endpoint
			originalProfileURL := profileEndpoint.ProfileURL

			t.Logf("server URL: %v", server.URL)
			conf.Endpoint = oauth2.Endpoint{
				AuthURL:  server.URL + tc.authPath,
				TokenURL: server.URL + tc.tokenPath,
			}
			profileEndpoint.ProfileURL = server.URL + tc.profilePath
			t.Logf("profileURL: %v", profileEndpoint.ProfileURL)

			defer func() {
				conf.Endpoint = originalEndpoint
				profileEndpoint.ProfileURL = originalProfileURL
			}()

			callbackReq := httptest.NewRequest("GET", fmt.Sprintf("/auth/%s/callback?code=mock_code&state=%s", tc.provider, stateBase64), nil)
			callbackReq.Header.Set("Cookie", cookie)

			callbackResp, err := app.Test(callbackReq)
			assert.NoError(t, err)
			defer callbackResp.Body.Close()

			t.Logf("Callback resp: %v", callbackResp)

			assert.Equal(t, fiber.StatusFound, callbackResp.StatusCode, "response code must be 302")
		})
	}
}

func TestAuthVerifyOk(t *testing.T) {
	app := fiber.New()
	prepareAuthRouter(app, "get", "/verify", middleware.Protected(), AuthVerify)

	req := httptest.NewRequest("GET", "/auth/verify", nil)

	token := jwt.NewWithClaims(jwt.SigningMethodHS256,
		jwt.MapClaims{
			"email": "test1@test1111.com",
			"exp":   jwt.NewNumericDate(time.Now().Add(time.Hour * 72)),
			"iat":   jwt.NewNumericDate(time.Now()),
		},
	)

	jwtToken, _ := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	req.Header.Set("Authorization", "Bearer "+jwtToken)

	resp, err := app.Test(req)
	assert.NoError(t, err)
	defer resp.Body.Close()

	t.Logf("headers : %v", resp.Header)
	memberId := resp.Header.Get("X-Auth-Member-Id")
	t.Logf("memberId : %v", memberId)
	assert.Equal(t, "test1", memberId)

	authenticated := resp.Header.Get("X-Auth-Authenticated")
	t.Logf("authenticated : %v", authenticated)
	assert.Equal(t, "1", authenticated, "X-Auth-Authenticated header must be 1")
	assert.Equal(t, fiber.StatusOK, resp.StatusCode, "response code must be 200")
}

func TestAuthVerifyUnauthorized(t *testing.T) {
	app := fiber.New()
	prepareAuthRouter(app, "get", "/verify", middleware.Protected(), AuthVerify)

	req := httptest.NewRequest("GET", "/auth/verify", nil)

	t.Run("noToken", func(t *testing.T) {
		resp, err := app.Test(req)
		assert.NoError(t, err)
		defer resp.Body.Close()

		t.Logf("resp: %v", resp)

		assert.Equal(t, "0", resp.Header.Get("X-Auth-Authenticated"), "X-Auth-Authenticated header must be 0")
		assert.Equal(t, fiber.StatusOK, resp.StatusCode, "response code must be 200")
	})

	t.Run("wrongToken", func(t *testing.T) {
		jwtToken := "wrong.jwt.token"
		req.Header.Set("Authorization", "Bearer "+jwtToken)

		resp, err := app.Test(req)
		assert.NoError(t, err)
		defer resp.Body.Close()

		t.Logf("resp: %v", resp)
		assert.Equal(t, "0", resp.Header.Get("X-Auth-Authenticated"), "X-Auth-Authenticated header must be 0")
		assert.Equal(t, fiber.StatusOK, resp.StatusCode, "response code must be 200")
	})
}
