package handlers

import (
	"fmt"
	"os"
	"time"

	"encoding/base64"
	"encoding/json"

	"github.com/damoang/angple-auth/internal/config"
	"github.com/damoang/angple-auth/internal/database"
	"github.com/damoang/angple-auth/internal/models"
	"github.com/damoang/angple-auth/internal/repository"
	"github.com/damoang/angple-auth/utils"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"go.uber.org/zap"
)

var logger = utils.GetLogger()

func saveCSRFToSession(c *fiber.Ctx, stateKey string, csrfToken string) error {
	sessionStore := config.GetSessionStore()
	sess, err := sessionStore.Get(c)
	logger.Debug("saveCSRFToSession", zap.Any("sessionID", sess.ID()))
	if err != nil {
		return err
	}

	var state map[string]string
	if v := sess.Get("oauth_state"); v != nil {
		state = v.(map[string]string)
	}

	if state == nil {
		state = make(map[string]string)
	}

	logger.Debug("saveCSRFToSession", zap.Any("state", state))

	state[stateKey] = csrfToken
	sess.Set("oauth_state", state)

	logger.Debug("saveCSRFToSession", zap.Any("state", state))
	if err := sess.Save(); err != nil {
		logger.Debug("saveCSRFToSession", zap.Any("err", err))
		return err
	}

	return nil
}

func verifyCSRFFromSession(c *fiber.Ctx, stateKey string, csrfToken string) error {
	sessionStore := config.GetSessionStore()
	sess, err := sessionStore.Get(c)
	logger.Debug("loadCSRFFromSession", zap.Any("sessionID", sess.ID()))
	if err != nil {
		return err
	}
	logger.Debug("loadCSRFFromSession", zap.Any("stateKey", stateKey))

	var state map[string]string
	if v := sess.Get("oauth_state"); v != nil {
		state = v.(map[string]string)
	}

	logger.Debug("loadCSRFFromSession", zap.Any("state", state))

	if state[stateKey] != csrfToken {
		return fmt.Errorf("invalid CSRF: expected=%s, actual=%s", csrfToken, state[stateKey])
	}

	delete(state, stateKey)
	sess.Set("oauth_state", state)

	if err := sess.Save(); err != nil {
		return err
	}

	return nil
}

func Auth(c *fiber.Ctx) error {
	providerName := c.Params("provider")
	logger.Debug("Auth", zap.String("provider", providerName))

	returnToUrl := c.Query("url", "/")
	logger.Debug("Auth", zap.String("returnToUrl", returnToUrl))

	csrfToken, err := utils.GenerateCSRFToken(32)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).SendString("Generate CSRF token failed " + err.Error())
	}

	state := models.AuthState{
		CSRFToken: csrfToken,
		ReturnTo:  fmt.Sprintf("%s/plugin/social/social_login_callback.php", utils.GetHostname()),
	}

	stateJson, err := json.Marshal(state)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).SendString("Generate statejson failed " + err.Error())
	}

	stateBase64 := base64.URLEncoding.EncodeToString(stateJson)

	if err := saveCSRFToSession(c, stateBase64, csrfToken); err != nil {
		logger.Debug("Auth", zap.Any("err", err))
		return c.Status(fiber.StatusInternalServerError).SendString("save CSRF to session failed " + err.Error())
	}

	conf := config.GetProvider(providerName).GetOauth2Conf()
	url := conf.AuthCodeURL(stateBase64)
	logger.Debug("Auth", zap.String("RedirectURL", url))
	return c.Redirect(url)
}

func AuthCallback(c *fiber.Ctx) error {
	providerName := c.Params("provider")
	stateBase64 := c.FormValue("state")
	logger.Debug("AuthCallback", zap.Any("stateBase64", stateBase64))

	stateJson, err := base64.URLEncoding.DecodeString(stateBase64)
	if err != nil {
		return c.Status(fiber.StatusBadRequest).SendString("Invalid state " + err.Error())
	}

	var state models.AuthState
	if err := json.Unmarshal(stateJson, &state); err != nil {
		return c.Status(fiber.StatusBadRequest).SendString("Invalid state")
	}
	logger.Debug("AuthCallback", zap.String("CSRFToken", state.CSRFToken))
	logger.Debug("AuthCallback", zap.String("ReturnToURL", state.ReturnTo))

	if err := verifyCSRFFromSession(c, stateBase64, state.CSRFToken); err != nil {
		logger.Debug("AuthCallback", zap.Any("err", err))
		return c.Status(fiber.StatusInternalServerError).SendString("Authentication failed: " + err.Error())
	}

	code := c.FormValue("code")
	logger.Debug("AuthCallback", zap.String("code", code))

	provider := config.GetProvider(providerName)
	conf := provider.GetOauth2Conf()

	logger.Debug("AuthCallback", zap.Any("endpoint", conf.Endpoint))
	providerToken, err := conf.Exchange(c.Context(), code)
	if err != nil {
		logger.Debug("AuthCallback", zap.String("err", err.Error()))
		return c.Status(fiber.StatusInternalServerError).SendString("Authentication failed: " + err.Error())
	}

	logger.Debug("AuthCallback", zap.Any(fmt.Sprintf("providerToken(%v)", providerName), providerToken))

	profileResp, err := provider.FetchProfile(providerToken.AccessToken)
	logger.Debug("AuthCallback", zap.Any("profileResp", profileResp))
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).SendString("Get profile failed: " + err.Error())
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256,
		jwt.MapClaims{
			"email": profileResp.Email,
			"exp":   jwt.NewNumericDate(time.Now().Add(time.Hour * 72)),
			"iat":   jwt.NewNumericDate(time.Now()),
		},
	)

	jwtToken, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		return c.SendStatus(fiber.StatusInternalServerError)
	}

	logger.Debug("AuthCallback", zap.String("jwtToken", jwtToken))
	cookie := new(fiber.Cookie)
	cookie.Domain = utils.GetCookieDomain()
	cookie.Name = "angjwt"
	cookie.Value = jwtToken
	cookie.HTTPOnly = true
	cookie.Path = "/"
	c.Cookie(cookie)

	return c.Redirect(state.ReturnTo)
}

func getMemberID(email string) string {
	// query DB to get member id with email
	repo := repository.NewMemberRepository(database.DBConn)

	return repo.GetMember(email).Id
}

func AuthVerify(c *fiber.Ctx) error {
	angJwt := c.Cookies("angjwt")
	logger.Debug("AuthVerify", zap.String("angJWT", angJwt))

	user := c.Locals("user").(*jwt.Token)
	claims := user.Claims.(jwt.MapClaims)
	logger.Debug("AuthVerify", zap.Any("claims", claims))
	email := claims["email"].(string)

	c.Set("X-Auth-Authenticated", "1")
	c.Set("X-Auth-Member-Id", getMemberID(email))

	return c.SendStatus(fiber.StatusOK)
}
