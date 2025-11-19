package config

import (
	"encoding/gob"
	"time"

	"github.com/damoang/angple-auth/utils"
	"github.com/gofiber/fiber/v2/middleware/session"
)

var logger = utils.GetLogger()
var sessionStore *session.Store

func InitSessionStore() {
	logger.Debug("InitSessionStore")

	gob.Register(map[string]string{})

	// TODO : replace session storage to redis
	sessionStore = session.New(session.Config{
		// Storage: redisStorage,
		CookieHTTPOnly: true,
		CookieSecure:   true,
		Expiration:     30 * time.Minute,
	})
}

func GetSessionStore() *session.Store {
	return sessionStore
}
