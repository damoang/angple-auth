package providers

import (
	"os"

	"github.com/damoang/angple-auth/internal/models"
	"github.com/damoang/angple-auth/utils"
	"golang.org/x/oauth2"
)

type ProfileEndpoint struct {
	ProfileURL string
}

type Provider interface {
	GetOauth2Conf() *oauth2.Config
	GetProfileEndpoint() *ProfileEndpoint
	FetchProfile(accessToken string) (*models.UnifiedProfile, error)
}

func GetClientID(envKey string) string {
	if utils.IsDev() {
		return os.Getenv(envKey)
	}

	panic("Not implemented")
}

func GetClientSecret(envKey string) string {
	if utils.IsDev() {
		return os.Getenv(envKey)
	}

	panic("Not implemented")
}

func GetRedirectURL(envKey string) string {
	if utils.IsDev() {
		return os.Getenv(envKey)
	}

	panic("Not implemented")
}
