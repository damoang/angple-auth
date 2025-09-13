package config

import (
	"os"

	"golang.org/x/oauth2"
)

type providerConf struct {
	Oauth2Conf *oauth2.Config
	ProfileURL string // "https://openapi.naver.com/v1/nid/me"
}

var conf *providerConf

func InitOauth2Config() {
	// goth.UseProviders(
	// 	google.New(os.Getenv("OAUTH_KEY"), os.Getenv("OAUTH_SECRET"), "http://127.0.0.1:3000/auth/google/callback"),
	// 	naver.New("U1N2weAPcWaad8W_v7Xo", "NXUoKuml8d", "http://localtest.me:3000/auth/naver/callback"),
	// )

	oauth2Conf := &oauth2.Config{
		ClientID:     os.Getenv("NAVER_CLIENT_ID"),
		ClientSecret: os.Getenv("NAVER_CLIENT_SECRET"),
		RedirectURL:  os.Getenv("NAVER_REDIRECT_URL"),
		Scopes:       []string{
			// "https://www.googleapis.com/auth/userinfo.email",
		}, // you can use other scopes to get more data
		Endpoint: oauth2.Endpoint{
			AuthURL:  "https://nid.naver.com/oauth2.0/authorize",
			TokenURL: "https://nid.naver.com/oauth2.0/token",
		},
	}

	conf = &providerConf{
		Oauth2Conf: oauth2Conf,
		ProfileURL: "https://openapi.naver.com/v1/nid/me",
	}

}

func GetOauth2Conf() *providerConf {
	return conf
}
