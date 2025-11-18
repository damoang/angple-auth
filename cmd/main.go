package main

import (
	"github.com/damoang/angple-auth/internal/config"
	"github.com/damoang/angple-auth/internal/database"
	"github.com/damoang/angple-auth/internal/routes"
	"github.com/damoang/angple-auth/utils"
	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"
)

func main() {
	godotenv.Load()

	utils.InitAppEnv()

	config.InitProviders()

	database.ConnectDB()

	app := fiber.New()

	routes.SetupRoutes(app)

	app.Listen(":3000")
}
