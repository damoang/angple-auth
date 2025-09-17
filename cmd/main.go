package main

import (
	"github.com/damoang/angple-auth/internal/config"
	"github.com/damoang/angple-auth/internal/routes"
	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"
)

func main() {
	godotenv.Load()

	app := fiber.New()

	config.InitOauth2Config()

	routes.SetupRoutes(app)

	app.Listen(":3000")
}
