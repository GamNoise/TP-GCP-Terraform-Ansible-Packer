package logger

import (
	"log/slog"
	"os"
	"strings"
)

type Logger struct {
	logger *slog.Logger
}

func NewLogger() *Logger {
	logger := slog.New(slog.NewJSONHandler(os.Stdout,
		&slog.HandlerOptions{
			Level:     getLogLevel(),
			AddSource: addSource(),
		}))

	return &Logger{logger: logger}
}

func getLogLevel() slog.Level {
	logLvl := os.Getenv("LOG_LEVEL")
	switch {
	case strings.ToLower(logLvl) == "info":
		return slog.LevelInfo
	case strings.ToLower(logLvl) == "warning":
		return slog.LevelWarn
	case strings.ToLower(logLvl) == "error":
		return slog.LevelError
	case strings.ToLower(logLvl) == "debug":
		return slog.LevelDebug
	}
	return slog.LevelInfo
}

func addSource() bool {
	logLvl := os.Getenv("LOG_LEVEL")
	switch {
	case strings.ToLower(logLvl) == "info":
		return false
	case strings.ToLower(logLvl) == "warning":
		return false
	case strings.ToLower(logLvl) == "error":
		return true
	case strings.ToLower(logLvl) == "debug":
		return true
	}
	return false

}

func (l *Logger) Info(msg string) {
	l.logger.Info(msg)
}

func (l *Logger) Error(msg string) {
	l.logger.Debug(msg)
}

func (l *Logger) Debug(msg string) {
	l.logger.Debug(msg)
}
