package handlers

import (
	"os"
	"time"

	"encoding/base64"
	"encoding/json"

	"github.com/damoang/gongrok/internal/config"
	"github.com/damoang/gongrok/internal/database"
	"github.com/damoang/gongrok/internal/models"
	"github.com/damoang/gongrok/internal/repository"
	"github.com/damoang/gongrok/utils"
	"github.com/go-resty/resty/v2"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"go.uber.org/zap"
)

var logger = utils.GetLogger()

func Auth(c *fiber.Ctx) error {
	returnToUrl := c.Query("url", "/")
	logger.Debug("Auth", zap.String("returnToUrl", returnToUrl))

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

	conf := config.GetOauth2Conf().Oauth2Conf
	url := conf.AuthCodeURL(stateBase64)
	logger.Debug("Auth", zap.String("RedirectURL", url))
	return c.Redirect(url)
}

func AuthCallback(c *fiber.Ctx) error {
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

	providerConf := config.GetOauth2Conf()
	conf := providerConf.Oauth2Conf
	logger.Debug("AuthCallback", zap.Any("endpoint", conf.Endpoint))
	naverToken, err := conf.Exchange(c.Context(), code)
	if err != nil {
		logger.Debug("AuthCallback", zap.String("err", err.Error()))
		return c.Status(fiber.StatusInternalServerError).SendString("Authentication failed " + err.Error())
	}

	logger.Debug("AuthCallback", zap.Any("naverToken", naverToken))

	logger.Debug("AuthCallback", zap.String("profileURL", providerConf.ProfileURL))
	var naverProfileResponse models.NaverProfileResponse

	client := resty.New()
	profileResp, err := client.R().
		SetAuthToken(naverToken.AccessToken).
		SetResult(&naverProfileResponse).
		Get(providerConf.ProfileURL)

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).SendString("Get profile failed " + err.Error())
	}

	logger.Debug("AuthCallback", zap.Any("profileResp", profileResp))
	logger.Debug("AuthCallback", zap.Any("naverProfileResponse", naverProfileResponse))

	token := jwt.NewWithClaims(jwt.SigningMethodHS256,
		jwt.MapClaims{
			"email": naverProfileResponse.Response.Email,
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
	logger.Debug("auth verify", zap.String("angJWT", angJwt))

	user := c.Locals("user").(*jwt.Token)
	claims := user.Claims.(jwt.MapClaims)
	logger.Debug("auth verify", zap.Any("claims", claims))
	email := claims["email"].(string)

	c.Set("X-Member-Id", getMemberID(email))

	return c.SendStatus(fiber.StatusOK)
}
