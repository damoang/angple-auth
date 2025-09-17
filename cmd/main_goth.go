package main

import "os"
import "log"
import "time"

import "github.com/gofiber/fiber/v2"
import "github.com/gofiber/fiber/v2/middleware/session"
import "github.com/gofiber/storage/memory/v2"
import "github.com/gofiber/utils/v2"
import "github.com/markbates/goth"
import "github.com/markbates/goth/providers/google"
import "github.com/markbates/goth/providers/naver"
import "github.com/shareed2k/goth_fiber"

func main_goth() {
	// optional config
	config := session.Config{
		Expiration: 30 * time.Minute,
		Storage:    memory.New(), // From github.com/gofiber/storage/sqlite3
		// Storage:        sqlite3.New(), // From github.com/gofiber/storage/sqlite3
		KeyLookup:    "cookie:_gothic_session",
		CookieDomain: "",
		CookiePath:   "/",
		// CookieSecure:   os.Getenv("ENVIRONMENT") == "production",
		CookieSecure:   false,
		CookieHTTPOnly: true, // Should always be enabled
		CookieSameSite: "Lax",
		KeyGenerator:   utils.UUIDv4,
	}

	// create session handler
	sessions := session.New(config)

	goth_fiber.SessionStore = sessions

	app := fiber.New()

	goth.UseProviders(
		google.New(os.Getenv("OAUTH_KEY"), os.Getenv("OAUTH_SECRET"), "http://127.0.0.1:3000/auth/google/callback"),
		naver.New("U1N2weAPcWaad8W_v7Xo", "NXUoKuml8d", "http://localtest.me:3000/auth/naver/callback"),
	)

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Damonang API, It works!")
		// c.Set(fiber.HeaderContentType, fiber.MIMETextHTMLCharsetUTF8)
		// return c.SendString("Welcome! <a href='/auth/naver'>Login with Naver</a>")
	})

	app.Get("/hello", func(c *fiber.Ctx) error {
		return c.SendString("Hello, API!")
	})

	app.Get("/auth/:provider", func(c *fiber.Ctx) error {
		// https://github.com/gofiber/fiber/issues/292
		err := goth_fiber.BeginAuthHandler(c)
		if err != nil {
			return c.SendString(err.Error())
		}

		value, _ := goth_fiber.GetFromSession("naver", c)
		log.Println("session: ", value)
		log.Println("SessionStore: ", goth_fiber.SessionStore)
		return err
	})

	app.Get("/auth/:provider/callback", func(c *fiber.Ctx) error {
		log.Println("SessionStore: ", goth_fiber.SessionStore)
		value, _ := goth_fiber.GetFromSession("naver", c)
		log.Println("session: ", value)

		user, err := goth_fiber.CompleteUserAuth(c)
		if err != nil {
			return c.Status(fiber.StatusInternalServerError).SendString("Authentication failed " + err.Error())
		}

		return c.JSON(user)
	})

	app.Listen(":3000")
}
