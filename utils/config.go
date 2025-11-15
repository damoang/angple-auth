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
