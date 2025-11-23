package middleware

import (
	"os"

	"github.com/damoang/angple-auth/utils"
	jwtware "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"
)

// Protected protect routes
func Protected() fiber.Handler {
	return jwtware.New(jwtware.Config{
		SigningKey:   jwtware.SigningKey{Key: []byte(os.Getenv("JWT_SECRET"))},
		ErrorHandler: jwtError,
	})
}

func jwtError(c *fiber.Ctx, err error) error {
	logger := utils.GetLogger()
	logger.Debug("jwtError: ", zap.String("err", err.Error()))

	c.Set("X-Auth-Authenticated", "0")
	if err.Error() == "missing or malformed JWT" {
		return c.Status(fiber.StatusOK).
			JSON(fiber.Map{"status": "error", "message": "Missing or malformed JWT", "data": nil})
	}
	return c.Status(fiber.StatusOK).
		JSON(fiber.Map{"status": "error", "message": "Invalid or expired JWT", "data": nil})
}
