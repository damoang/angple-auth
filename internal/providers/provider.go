package providers

import (
	"os"

	"github.com/damoang/angple-auth/internal/models"
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

type Config interface {
	GetClientID(envKey string) string
	GetClientSecret(envKey string) string
	GetRedirectURL(envKey string) string
}

type ProviderConfigDev struct{}

func (p *ProviderConfigDev) GetClientID(envKey string) string {
	return os.Getenv(envKey)
}

func (p *ProviderConfigDev) GetClientSecret(envKey string) string {
	return os.Getenv(envKey)
}

func (p *ProviderConfigDev) GetRedirectURL(envKey string) string {
	return os.Getenv(envKey)
}

type ProviderConfigProd struct{}

func (p *ProviderConfigProd) GetClientID(envKey string) string {
	panic("Not Implemented")
}

func (p *ProviderConfigProd) GetClientSecret(envKey string) string {
	panic("Not Implemented")
}

func (p *ProviderConfigProd) GetRedirectURL(envKey string) string {
	panic("Not Implemented")
}
