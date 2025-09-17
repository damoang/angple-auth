package testdata

import (
	"context"
	"fmt"
	"os"
	"path/filepath"

	"github.com/damoang/angple-auth/utils"
	"github.com/testcontainers/testcontainers-go"
	"github.com/testcontainers/testcontainers-go/modules/mysql"
	"github.com/testcontainers/testcontainers-go/wait"
	"go.uber.org/zap"
)

var logger = utils.GetLogger()

func SetupTestContainer(projectRoot string) *mysql.MySQLContainer {
	ctx := context.Background()

	dbname := "dmg-test"
	username := "mysqltest"
	password := "mysqltest"
	mysqlContainer, err := mysql.Run(ctx,
		"",
		mysql.WithDatabase(dbname),
		mysql.WithUsername(username),
		mysql.WithPassword(password),
		testcontainers.CustomizeRequest(testcontainers.GenericContainerRequest{
			ContainerRequest: testcontainers.ContainerRequest{
				FromDockerfile: testcontainers.FromDockerfile{
					Context:    filepath.Join(projectRoot, "testdata", "mysql"),
					Dockerfile: "Dockerfile",
					Repo:       "mysql-test",
					Tag:        "8.0.35",
					KeepImage:  true,
				},
				WaitingFor: wait.ForListeningPort("3306/tcp"),
				Name:       "mysql-test",
			},
			Started: true,
			Reuse:   true,
		}),
		testcontainers.WithTmpfs(map[string]string{"/var/lib/mysql": "rw,size=512m"}),
	)

	if err != nil {
		logger.Panic("TestMain: failed to start container", zap.Error(err))
	}

	host, err := mysqlContainer.Host(ctx)
	if err != nil {
		logger.Panic("TestMain: failed to container host", zap.Error(err))
	}

	port, err := mysqlContainer.MappedPort(ctx, "3306")
	if err != nil {
		logger.Panic("TestMain: failed to container port", zap.Error(err))
	}

	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local", username, password, host, port.Port(), dbname)
	os.Setenv("MYSQL_DSN", dsn)

	return mysqlContainer
}
