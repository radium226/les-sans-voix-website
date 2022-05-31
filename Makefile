#!/usr/bin/env make

SHELL = /usr/bin/env
.SHELLFLAGS = bash -eu -c

.ONESHELL:


.PHONY: clean
clean:
	rm -Rf "build"

#build/site.tar.gz:
#	mkdir -p "build/public" && \
#	cd "hugo" && \
#	hugo  \
#		--cleanDestinationDir \
#		--destination "../build/public" \
#		--quiet && \
#	cd ".."
#	tar \
#		-zcf "build/site.tar.gz" \
#		--transform="s,^\.,les-sans-voix," \
#		--directory="build/public" \
#		"."

.PHONY: package
package:
	make/bin/package.sh

.PHONY: deploy
deploy: build
	GITHUB_TOKEN="$(GITHUB_TOKEN)" make/bin/deploy.sh

.PHONY: run
run:
	hugo --verbose serve --disableFastRender