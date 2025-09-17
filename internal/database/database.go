package database

import (
	"os"

	// "github.com/damoang/angple-auth/internal/models"
	"github.com/damoang/angple-auth/utils"
	"go.uber.org/zap"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DBConn *gorm.DB
var logger = utils.GetLogger()

func ConnectDB() {
	dsn := os.Getenv("MYSQL_DSN")
	logger.Debug("ConnectDB", zap.String("dsn", dsn))

	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database. " + err.Error())
	}

	// db.AutoMigrate(&models.Member{})
	DBConn = db
}
