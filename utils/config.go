package utils

import (
	"os"
)

var mode string

func InitAppEnv() {
	mode = os.Getenv("APP_ENV")
}

func IsDev() bool {
	return mode == "dev"
}

func IsProd() bool {
	return mode == "prod"
}

func GetHostname() string {
	if IsDev() {
		return os.Getenv("DEV_HOSTNAME")
	}

	return os.Getenv("HOSTNAME")
}

func GetCookieDomain() string {
	if IsDev() {
		return os.Getenv("DEV_COOKIE_DOMAIN")
	}

	return os.Getenv("COOKIE_DOMAIN")
}
