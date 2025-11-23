package models

type UnifiedProfile struct {
	Provider string `json:"provider"`
	ID       string `json:"id"`
	Email    string `json:"email,omitempty"`
	Name     string `json:"name,omitempty"`
	Picture  string `json:"picture,omitempty"`
}
