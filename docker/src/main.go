package main

import (
	"gitea.lcs.s3ns.tech/lcs-onboarding-info/server"
)

func main() {
	srv := server.ServerCfg{
		ListenPort: ":8080",
	}

	srv.Run()
}
