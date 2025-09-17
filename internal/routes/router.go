package routes

import (
	"github.com/damoang/angple-auth/internal/handlers"
	"github.com/damoang/angple-auth/internal/middleware"
	"github.com/gofiber/fiber/v2"
)

func SetupRoutes(app *fiber.App) {
	auth := app.Group("/auth")

	auth.Get("/:provider", handlers.Auth)
	auth.Get("/:provider/callback", handlers.AuthCallback)
	auth.Get("/:provider/verify", middleware.Protected(), handlers.AuthVerify)
}
