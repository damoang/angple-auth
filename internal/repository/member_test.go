package repository

import (
	"os"
	"testing"

	"github.com/damoang/gongrok/internal/database"
	"github.com/damoang/gongrok/utils"
	"github.com/joho/godotenv"
	"github.com/stretchr/testify/assert"
	"go.uber.org/zap"
)

var logger = utils.GetLogger()

func TestMain(m *testing.M) {
	err := godotenv.Load("../../.env")
	if err != nil {
		logger.Panic("TestMain", zap.String("err", err.Error()))
	}

	database.ConnectDB()

	os.Exit(m.Run())
}

func TestGetMember(t *testing.T) {
	db := database.DBConn

	tx := db.Begin()
	t.Cleanup(func() {
		tx.Rollback()
	})

	repo := NewMemberRepository(tx)

	testEmail := "test1@test1111.com"
	member := repo.GetMember(testEmail)
	t.Logf("member.id = %v, member.email = %v", member.Id, member.Email)

	assert.Equal(t, "test1", member.Id, "member ID must be test1")
	assert.Equal(t, testEmail, member.Email, "member Email must be %v", testEmail)
}
