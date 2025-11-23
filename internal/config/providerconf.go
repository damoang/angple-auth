package config

import (
	"github.com/damoang/angple-auth/internal/providers"
	"github.com/damoang/angple-auth/internal/providers/google"
	"github.com/damoang/angple-auth/internal/providers/naver"
	"github.com/damoang/angple-auth/utils"
)

var providerMap map[string]providers.Provider

func InitProviders() {
	providerMap = make(map[string]providers.Provider)

	var providerConfig providers.Config
	if utils.IsDev() {
		providerConfig = &providers.ProviderConfigDev{}
	} else {
		providerConfig = &providers.ProviderConfigDev{}
	}

	addProvider("naver", naver.New(providerConfig))
	addProvider("google", google.New(providerConfig))
}

func addProvider(providerName string, provider providers.Provider) {
	providerMap[providerName] = provider
}

func GetProvider(provider string) providers.Provider {
	return providerMap[provider]
}
