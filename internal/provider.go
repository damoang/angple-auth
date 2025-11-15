package internal

import "golang.org/x/oauth2"

type Provider interface {
	GetOauth2Conf() *oauth2.Config
	GetProfileURL() string
}
