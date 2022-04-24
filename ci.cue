package ci

import (
	"dagger.io/dagger"

	"github.com/aweris/dagger-actions/golangci"
)

dagger.#Plan & {
	client: filesystem: ".": read: contents: dagger.#FS
	actions: {
		_source: client.filesystem["."].read.contents

		lint: {
			go: golangci.#Lint & {
				source:  _source
				version: "1.45"
			}
		}
	}
}
