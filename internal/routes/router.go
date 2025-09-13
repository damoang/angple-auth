package routes

import (
	"github.com/damoang/gongrok/internal/handlers"
	"github.com/damoang/gongrok/internal/middleware"
	"github.com/gofiber/fiber/v2"
)

func SetupRoutes(app *fiber.App) {
	auth := app.Group("/auth")

	auth.Get("/:provider", handlers.Auth)
	auth.Get("/:provider/callback", handlers.AuthCallback)
	auth.Get("/:provider/verify", middleware.Protected(), handlers.AuthVerify)
}
