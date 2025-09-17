package repository

import (
	"github.com/damoang/angple-auth/internal/models"
	"gorm.io/gorm"
)

type Repo struct {
	db *gorm.DB
}

func NewMemberRepository(db *gorm.DB) *Repo {
	return &Repo{db: db}
}

func (r *Repo) CreateMember(member models.Member) {
	panic("Not implemented")
}

func (r *Repo) GetMember(email string) models.AuthMember {
	member := models.AuthMember{}
	r.db.Model(&models.Member{}).Find(&member, "mb_email = ?", email).Take(&member)
	return member
}

func (r *Repo) UpdateMember(member models.Member) {
	panic("Not implemented")
}

func (r *Repo) DeleteMember(member models.Member) {
	panic("Not implemented")
}
