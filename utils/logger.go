package utils

import "go.uber.org/zap"

var logger *zap.Logger

func GetLogger() *zap.Logger {
	if logger == nil {
		logger, _ = zap.NewDevelopment()
		defer logger.Sync()
	}

	return logger
}
