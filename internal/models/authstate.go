package models

type AuthState struct {
	CSRFToken string `json:"csrf_token"`
	ReturnTo  string `json:"return_to"`
}
