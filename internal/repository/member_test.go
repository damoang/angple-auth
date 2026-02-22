package repository

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/damoang/angple-auth/internal/database"
	"github.com/damoang/angple-auth/testdata"
	"github.com/damoang/angple-auth/utils"
	"github.com/stretchr/testify/assert"
	"github.com/testcontainers/testcontainers-go"
	"go.uber.org/zap"
)

var logger = utils.GetLogger()

func TestMain(m *testing.M) {
	wd, _ := os.Getwd()
	projectRoot := filepath.Join(wd, "../..")

	utils.InitAppEnv()
	if err := utils.LoadConfig(filepath.Join(projectRoot, utils.DOTENV_DEV)); err != nil {
		logger.Panic("TestMain", zap.NamedError("failed to load dotenv", err))
	}

	c := testdata.SetupTestContainer(projectRoot)

	defer func() {
		if err := testcontainers.TerminateContainer(c); err != nil {
			logger.Debug("TestMain: failed to terminate container", zap.Error(err))
		}
	}()

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
