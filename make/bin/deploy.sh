#!/usr/bin/env bash

set -Eeuo pipefail

export REPO_BRANCH="website"

main()
{
    declare repo_url="https://radium226:${GITHUB_TOKEN}@github.com/radium226/les-sans-voix-website.git"
    #"$( git config --get "remote.origin.url" )"
    echo "repo_url=${repo_url}" >&2
    
    declare repo_folder_path="$( mktemp -d )"
    mkdir -p "${repo_folder_path}"
    git clone --branch "${REPO_BRANCH}" "${repo_url}" "${repo_folder_path}"

    git -C "${repo_folder_path}" config user.email "github-actions[bot]"
    git -C "${repo_folder_path}" config user.name "Robot"

    #git clean -fdx
    cp "./index.html" "${repo_folder_path}/index.html"
    git -C "${repo_folder_path}" add --all
    git -C "${repo_folder_path}" commit -m "Deploy website! "
    git -C "${repo_folder_path}" push -u "origin" "website"
}

main "${@}"