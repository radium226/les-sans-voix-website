#!/usr/bin/env bash

set -Eeuo pipefail

export REPO_BRANCH="website"

main()
{
    declare repo_url="$( git remote get-url "origin" )" 
    mkdir -p "build"
    cd "build"
    git clone --branch "${REPO_BRANCH}" "${repo_url}"
    #git clean -fdx
    cp "../index.html" "./index.html"
    git add --all
    git commit -m "Deploy website! "
    git push -u "origin" "website"
}

main "${@}"