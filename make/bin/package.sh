#!/usr/bin/env bash

set -Eeuo pipefail

main()
{
    mkdir -p "build/package"
    tar -cvf "build/package/website.tar.gz" "index.html"
}

main "${@}"