package google

import (
	"github.com/damoang/angple-auth/internal/models"
	"github.com/damoang/angple-auth/internal/providers"
	"github.com/damoang/angple-auth/utils"
	"github.com/go-resty/resty/v2"
	"go.uber.org/zap"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/endpoints"
)

const (
	GOOGLE_CLIENT_ID     string = "GOOGLE_CLIENT_ID"
	GOOGLE_CLIENT_SECRET string = "GOOGLE_CLIENT_SECRET"
	GOOGLE_REDIRECT_URL  string = "GOOGLE_REDIRECT_URL"

	PROFILE_URL string = "https://www.googleapis.com/oauth2/v2/userinfo"
)

type provider struct {
	oauth2Conf      *oauth2.Config
	profileEndpoint *providers.ProfileEndpoint
	profile         *GoogleProfile
}

type GoogleProfile struct {
	ID            string `json:"id"`
	Email         string `json:"email"`
	VerifiedEmail bool   `json:"verified_email"`
	Name          string `json:"name"`
	GivenName     string `json:"given_name"`
	FamilyName    string `json:"family_name"`
	Picture       string `json:"picture"`
	Locale        string `json:"locale"`
}

var logger = utils.GetLogger()
var profileEndpoint = providers.ProfileEndpoint{
	ProfileURL: PROFILE_URL,
}

func New(pConfig providers.Config) providers.Provider {
	oauth2Conf := &oauth2.Config{
		ClientID:     pConfig.GetClientID(GOOGLE_CLIENT_ID),
		ClientSecret: pConfig.GetClientSecret(GOOGLE_CLIENT_SECRET),
		RedirectURL:  pConfig.GetRedirectURL(GOOGLE_REDIRECT_URL),
		Scopes: []string{
			"https://www.googleapis.com/auth/userinfo.email",
			"https://www.googleapis.com/auth/userinfo.profile",
		}, // you can use other scopes to get more data
		Endpoint: endpoints.Google,
	}

	return &provider{
		oauth2Conf:      oauth2Conf,
		profileEndpoint: &profileEndpoint,
		profile:         new(GoogleProfile),
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
	logger.Debug("FetchProfile", zap.Any("googleProfileResponse", p.profile))
	if err != nil {
		return nil, err
	}

	profile := &models.UnifiedProfile{
		Provider: "google",
		ID:       p.profile.ID,
		Email:    p.profile.Email,
		Name:     p.profile.Name,
		Picture:  p.profile.Picture,
	}

	return profile, err
}
