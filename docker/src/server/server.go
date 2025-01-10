package server

import (
	"net/http"
	"time"

	"gitea.lcs.s3ns.tech/lcs-onboarding-info/handlers"
)

type ServerCfg struct {
	ListenPort  string
	IdleTimout  time.Duration
	ReadTimeout time.Duration
	WriteTimout time.Duration
}

func NewServer(listenPort string) *ServerCfg {

	return &ServerCfg{
		ListenPort:  listenPort,
		IdleTimout:  time.Minute,
		ReadTimeout: 10 * time.Second,
		WriteTimout: 30 * time.Second,
	}
}

func (srv *ServerCfg) Run() {

	mux := http.NewServeMux()

	

	mux.HandleFunc("/healthz", handlers.HealthHandler)
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		handlers.IndexHandler(w, r)
	})

	muxWrap := middleLogger(middleCors(mux))
	server := &http.Server{
		Addr:         srv.ListenPort,
		Handler:      muxWrap,
		IdleTimeout:  srv.IdleTimout,
		ReadTimeout:  srv.ReadTimeout,
		WriteTimeout: srv.WriteTimout,
	}
	server.ListenAndServe()
}
