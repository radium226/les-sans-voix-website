#!/usr/bin/env make

SHELL = /usr/bin/env
.SHELLFLAGS = bash -eu -c

.ONESHELL:


.PHONY: clean
clean:
	rm -Rf "build"

.PHONY: package
package:
	make/bin/package.sh

.PHONY: deploy
deploy: build
	GITHUB_TOKEN="$(GITHUB_TOKEN)" make/bin/deploy.sh

.PHONY: run
run:
	hugo --source "hugo" --verbose serve --disableFastRender