package server

import (
	"net/http"
	"time"

	"gitea.lcs.s3ns.tech/lcs-onboarding-info/logger"
)

type SrvLogger struct {
	handler http.Handler
}

func middleCors(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, UPDATE")
		w.Header().Set("Access-Control-Allow-Headers", "*")
		w.Header().Set("Cache-Control", "no-cache")
		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusOK)
			return
		}
		next.ServeHTTP(w, r)
	})
}

func (l *SrvLogger) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	start := time.Now()
	logger := logger.NewLogger()
	l.handler.ServeHTTP(w, r)
	logger.InfoServerRequest(r.Method, r.URL.Path, time.Since(start).String())
}

func middleLogger(handler http.Handler) *SrvLogger {
	return &SrvLogger{handler}
}
