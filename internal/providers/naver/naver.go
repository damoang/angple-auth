package naver

import (
	"os"

	"github.com/damoang/angple-auth/utils"
	"golang.org/x/oauth2"
)

const (
	AuthURL    string = "https://nid.naver.com/oauth2.0/authorize"
	TokenURL   string = "https://nid.naver.com/oauth2.0/token"
	ProfileURL string = "https://openapi.naver.com/v1/nid/me"
)

var logger = utils.GetLogger()

type provider struct {
	Oauth2Conf *oauth2.Config
}

func getClientID() string {
	if utils.IsDev() {
		return os.Getenv("NAVER_CLIENT_ID")
	}

	panic("Not implemented")
}

func getClientSecret() string {
	if utils.IsDev() {
		return os.Getenv("NAVER_CLIENT_SECRET")
	}

	panic("Not implemented")
}

func getRedirectURL() string {
	if utils.IsDev() {
		return os.Getenv("NAVER_REDIRECT_URL")
	}

	panic("Not implemented")
}

func New() *provider {
	oauth2Conf := &oauth2.Config{
		ClientID:     getClientID(),
		ClientSecret: getClientSecret(),
		RedirectURL:  getRedirectURL(),
		Scopes:       []string{
			// "https://www.googleapis.com/auth/userinfo.email",
		}, // you can use other scopes to get more data
		Endpoint: oauth2.Endpoint{
			AuthURL:  AuthURL,
			TokenURL: TokenURL,
		},
	}

	return &provider{oauth2Conf}
}

func (p *provider) GetOauth2Conf() *oauth2.Config {
	return p.Oauth2Conf
}

func (p *provider) GetProfileURL() string {
	return ProfileURL
}
