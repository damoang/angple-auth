package config

import (
	"github.com/damoang/angple-auth/internal"
	"github.com/damoang/angple-auth/internal/providers/naver"
	"golang.org/x/oauth2"
)

type providerConf struct {
	Oauth2Conf *oauth2.Config
	ProfileURL string
}

var providerConfMap map[string]*providerConf

func InitOauth2Configs() {
	providerConfMap = make(map[string]*providerConf)

	addOauth2Conf("naver", naver.New())
}

func addOauth2Conf(providerName string, provider internal.Provider) {
	providerConfMap[providerName] = &providerConf{
		Oauth2Conf: provider.GetOauth2Conf(),
		ProfileURL: provider.GetProfileURL(),
	}
}

func GetOauth2Conf(provider string) *providerConf {
	return providerConfMap[provider]
}
