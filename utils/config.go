package utils

import (
	"os"

	"github.com/joho/godotenv"
)

const (
	DEV        = "dev"
	PROD       = "prod"
	DOTENV_DEV = ".env.dev"
)

var mode string

func InitEnv() {
	InitAppEnv()
	LoadConfig()
}

func InitAppEnv() {
	mode = os.Getenv("APP_ENV")
	if mode == "" {
		mode = DEV
	}
}

func IsDev() bool {
	return mode == DEV
}

func IsProd() bool {
	return mode == PROD
}

func LoadConfig(envfiles ...string) error {
	if IsDev() {
		if len(envfiles) == 0 {
			return godotenv.Load(DOTENV_DEV)
		}
		return godotenv.Load(envfiles...)
	}

	// TODO: use viper
	panic("Not Implemented")
}

func GetHostname() string {
	return os.Getenv("HOSTNAME")
}

func GetCookieDomain() string {
	return os.Getenv("COOKIE_DOMAIN")
}
