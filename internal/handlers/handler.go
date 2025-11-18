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

func Auth(c *fiber.Ctx) error {
	providerName := c.Params("provider")
	logger.Debug("Auth", zap.String("provider", providerName))

	returnToUrl := c.Query("url", "/")
	logger.Debug("Auth", zap.String("returnToUrl", returnToUrl))

	// FIXME : CSRF token and ReturnTo URL
	state := models.AuthState{
		CSRFToken: "random_string",
		ReturnTo:  "http://localhost/plugin/social/social_login_callback.php",
		// ReturnTo:  "http://localhost" + returnToUrl,
	}

	stateJson, err := json.Marshal(state)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).SendString("generate statejson failed " + err.Error())
	}

	stateBase64 := base64.URLEncoding.EncodeToString(stateJson)

	conf := config.GetProvider(providerName).GetOauth2Conf()
	url := conf.AuthCodeURL(stateBase64)
	logger.Debug("Auth", zap.String("RedirectURL", url))
	return c.Redirect(url)
}

func AuthCallback(c *fiber.Ctx) error {
	providerName := c.Params("provider")
	stateBase64 := c.FormValue("state")

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

	code := c.FormValue("code")
	logger.Debug("AuthCallback", zap.String("code", code))

	provider := config.GetProvider(providerName)
	conf := provider.GetOauth2Conf()

	logger.Debug("AuthCallback", zap.Any("endpoint", conf.Endpoint))
	providerToken, err := conf.Exchange(c.Context(), code)
	if err != nil {
		logger.Debug("AuthCallback", zap.String("err", err.Error()))
		return c.Status(fiber.StatusInternalServerError).SendString("Authentication failed " + err.Error())
	}

	logger.Debug("AuthCallback", zap.Any(fmt.Sprintf("providerToken(%v)", providerName), providerToken))

	profileResp, err := provider.FetchProfile(providerToken.AccessToken)
	logger.Debug("AuthCallback", zap.Any("profileResp", profileResp))
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).SendString("Get profile failed " + err.Error())
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
	// FIXME : domain
	cookie.Domain = "localhost"
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
