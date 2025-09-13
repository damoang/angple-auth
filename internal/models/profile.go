package models

type NaverProfileResponse struct {
	ResultCode string       `json:"resultcode"`
	Message    string       `json:"message"`
	Response   NaverProfile `json:"response"`
}

type NaverProfile struct {
	ID       string `json:"id"`
	Email    string `json:"email"`
	Name     string `json:"name"`
	Nickname string `json:"nickname"`
}
