package config

import (
	"github.com/damoang/angple-auth/internal/providers"
	"github.com/damoang/angple-auth/internal/providers/google"
	"github.com/damoang/angple-auth/internal/providers/naver"
)

var providerMap map[string]providers.Provider

func InitProviders() {
	providerMap = make(map[string]providers.Provider)

	addProvider("naver", naver.New())
	addProvider("google", google.New())
}

func addProvider(providerName string, provider providers.Provider) {
	providerMap[providerName] = provider
}

func GetProvider(provider string) providers.Provider {
	return providerMap[provider]
}
