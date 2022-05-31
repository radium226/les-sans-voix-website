#!/usr/bin/env make

SHELL = /usr/bin/env
.SHELLFLAGS = bash -eu -c

.ONESHELL:


.PHONY: clean
clean:
	false

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
package: build/site.tar.gz


.PHONY: deploy
deploy:
	false

.PHONY: run
run:
	hugo --verbose serve --disableFastRender