#!/usr/bin/env bash

set -Eeuo pipefail

main()
{
  mkdir -p "build/package/hugo"

  hugo \
    --source "hugo" \
		--cleanDestinationDir \
		--destination "build/package/hugo" \
		--quiet
    
  tar -cvf "build/package/website.tar.gz" -C "build/package/hugo" "."
}

main "${@}"