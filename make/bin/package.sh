#!/usr/bin/env bash

set -Eeuo pipefail

main()
{
  mkdir -p "build/package"

  # Building Hugo Theme

  # Building Hugo
  mkdir -p "build/package/hugo"
  hugo \
    --source "hugo" \
		--cleanDestinationDir \
		--destination "../build/package/hugo" \
		--quiet
  
  # Creating the archive
  tar -cvf "build/package/website.tar.gz" -C "build/package/hugo" "."
}

main "${@}"