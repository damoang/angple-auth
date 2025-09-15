package handlers

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"
	"time"

	"github.com/damoang/gongrok/internal/config"
	"github.com/damoang/gongrok/internal/middleware"
	"github.com/damoang/gongrok/internal/models"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"github.com/joho/godotenv"
	"github.com/stretchr/testify/assert"
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
			w.WriteHeader(http.StatusUnauthorized)
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

func TestMain(m *testing.M) {
	err := godotenv.Load("../../.env")
	if err != nil {
		logger.Panic("TestMain", zap.String("err", err.Error()))
	}
	config.InitOauth2Config()

	code := m.Run()

	os.Exit(code)
}

func prepareAuthRouter(method string, path string, handlers ...fiber.Handler) *fiber.App {
	app := fiber.New()

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
	app := prepareAuthRouter("get", "/:provider", Auth)

	req := httptest.NewRequest("GET", fmt.Sprintf("/auth/naver?url=%s", "/free"), nil)

	resp, err := app.Test(req)
	assert.NoError(t, err)
	defer resp.Body.Close()

	t.Logf("resp: %v", resp)

	assert.Equal(t, http.StatusFound, resp.StatusCode, "response code must be 302")
}

func TestAuthCallback(t *testing.T) {
	server := createMockNaverServer()
	defer server.Close()

	providerConf := config.GetOauth2Conf()
	conf := providerConf.Oauth2Conf
	originalEndpoint := conf.Endpoint
	originalProfileURL := providerConf.ProfileURL

	t.Logf("server URL: %v", server.URL)
	conf.Endpoint = oauth2.Endpoint{
		AuthURL:  server.URL + "/oauth2.0/authorize",
		TokenURL: server.URL + "/oauth2.0/token",
	}
	providerConf.ProfileURL = server.URL + "/v1/nid/me"

	defer func() {
		conf.Endpoint = originalEndpoint
		providerConf.ProfileURL = originalProfileURL
	}()

	app := prepareAuthRouter("get", "/:provider/callback", AuthCallback)

	state := models.AuthState{
		CSRFToken: "random_string",
		ReturnTo:  "http://localhost/test_callback.php",
	}
	stateJSON, _ := json.Marshal(state)
	stateBase64 := base64.URLEncoding.EncodeToString(stateJSON)

	req := httptest.NewRequest("GET", fmt.Sprintf("/auth/naver/callback?code=mock_code&state=%s", stateBase64), nil)

	resp, err := app.Test(req)
	assert.NoError(t, err)
	defer resp.Body.Close()

	t.Logf("resp: %v", resp)

	assert.Equal(t, http.StatusFound, resp.StatusCode, "response code must be 302")
}

func TestAuthVerifyOk(t *testing.T) {
	app := prepareAuthRouter("get", "/:provider/verify", middleware.Protected(), AuthVerify)

	req := httptest.NewRequest("GET", "/auth/naver/verify", nil)

	token := jwt.NewWithClaims(jwt.SigningMethodHS256,
		jwt.MapClaims{
			"email": "mock_user@naver.com",
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
	memberId := resp.Header.Get("X-Member-Id")
	t.Logf("memberId : %v", memberId)
	assert.Equal(t, "member_id", memberId)

	assert.Equal(t, http.StatusOK, resp.StatusCode, "response code must be 200")
}

func TestAuthVerifyUnauthorized(t *testing.T) {
	app := prepareAuthRouter("get", "/:provider/verify", middleware.Protected(), AuthVerify)

	req := httptest.NewRequest("GET", "/auth/naver/verify", nil)

	t.Run("noToken", func(t *testing.T) {
		resp, err := app.Test(req)
		assert.NoError(t, err)
		defer resp.Body.Close()

		t.Logf("resp: %v", resp)

		assert.Equal(t, http.StatusBadRequest, resp.StatusCode, "response code must be 400")
	})

	t.Run("wrongToken", func(t *testing.T) {
		jwtToken := "wrong.jwt.token"
		req.Header.Set("Authorization", "Bearer "+jwtToken)

		resp, err := app.Test(req)
		assert.NoError(t, err)
		defer resp.Body.Close()

		t.Logf("resp: %v", resp)
		assert.Equal(t, http.StatusUnauthorized, resp.StatusCode, "response code must be 401")
	})
}
