package naver

import (
	"errors"

	"github.com/damoang/angple-auth/internal/models"
	"github.com/damoang/angple-auth/internal/providers"
	"github.com/damoang/angple-auth/utils"
	"github.com/go-resty/resty/v2"
	"go.uber.org/zap"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/endpoints"
)

const (
	NAVER_CLIENT_ID     string = "NAVER_CLIENT_ID"
	NAVER_CLIENT_SECRET string = "NAVER_CLIENT_SECRET"
	NAVER_REDIRECT_URL  string = "NAVER_REDIRECT_URL"

	PROFILE_URL string = "https://openapi.naver.com/v1/nid/me"
)

type provider struct {
	oauth2Conf      *oauth2.Config
	profileEndpoint *providers.ProfileEndpoint
	profile         *NaverProfile
}

type NaverProfile struct {
	ResultCode string `json:"resultcode"`
	Message    string `json:"message"`
	Response   struct {
		ID           string `json:"id"`
		Email        string `json:"email"`
		Name         string `json:"name"`
		Nickname     string `json:"nickname"`
		ProfileImage string `json:"profile_image"`
	} `json:"response"`
}

var logger = utils.GetLogger()
var profileEndpoint = providers.ProfileEndpoint{
	ProfileURL: PROFILE_URL,
}

func New(pConfig providers.Config) providers.Provider {
	oauth2Conf := &oauth2.Config{
		ClientID:     pConfig.GetClientID(NAVER_CLIENT_ID),
		ClientSecret: pConfig.GetClientSecret(NAVER_CLIENT_SECRET),
		RedirectURL:  pConfig.GetRedirectURL(NAVER_REDIRECT_URL),
		Scopes: []string{
			"profile",
			"email",
		}, // you can use other scopes to get more data
		Endpoint: endpoints.Naver,
	}

	return &provider{
		oauth2Conf:      oauth2Conf,
		profileEndpoint: &profileEndpoint,
		profile:         new(NaverProfile),
	}
}

func (p *provider) GetOauth2Conf() *oauth2.Config {
	return p.oauth2Conf
}

func (p *provider) GetProfileEndpoint() *providers.ProfileEndpoint {
	return p.profileEndpoint
}

func (p *provider) FetchProfile(accessToken string) (*models.UnifiedProfile, error) {
	logger.Debug("FetchProfile", zap.String("profileURL", p.GetProfileEndpoint().ProfileURL))

	client := resty.New()

	response, err := client.R().
		SetAuthToken(accessToken).
		SetResult(p.profile).
		Get(p.GetProfileEndpoint().ProfileURL)

	logger.Debug("FetchProfile", zap.Any("profileResp", response))
	logger.Debug("FetchProfile", zap.Any("naverProfileResponse", p.profile))
	if err != nil {
		return nil, err
	}

	profile := &models.UnifiedProfile{
		Provider: "naver",
		ID:       p.profile.Response.ID,
		Email:    p.profile.Response.Email,
		Name:     p.profile.Response.Name,
		Picture:  p.profile.Response.ProfileImage,
	}

	if p.profile.ResultCode != "00" {
		return profile, errors.New(p.profile.Message)
	}

	return profile, err
}
