package routes

import (
	"github.com/damoang/angple-auth/internal/handlers"
	"github.com/damoang/angple-auth/internal/middleware"
	"github.com/gofiber/fiber/v2"
)

func SetupRoutes(app *fiber.App) {
	auth := app.Group("/auth")

	auth.Get("/verify", middleware.Protected(), handlers.AuthVerify)
	auth.Get("/:provider", handlers.Auth)
	auth.Get("/:provider/callback", handlers.AuthCallback)
}
