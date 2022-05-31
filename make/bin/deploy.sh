#!/usr/bin/env bash

set -Eeuo pipefail

main()
{
    declare repo_url=
    if [[ -z "${GITHUB_TOKEN}" ]]; then
        repo_url="$( git config --get "remote.origin.url" )"
    else
        repo_url="https://radium226:${GITHUB_TOKEN}@github.com/radium226/les-sans-voix-website.git"
    fi
    echo "repo_url=${repo_url}" >&2
    
    declare repo_folder_path="build/deploy"
    mkdir -p "${repo_folder_path}"
    git clone --branch "website" "${repo_url}" "${repo_folder_path}"

    git -C "${repo_folder_path}" config user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git -C "${repo_folder_path}" config user.name "github-actions[bot]"

    git -C "${repo_folder_path}" clean -fdx

    tar -xf "build/package/website.tar.gz" -C "build/deploy"
    
    git -C "${repo_folder_path}" add --all
    git -C "${repo_folder_path}" commit -m "Deploy website! "
    git -C "${repo_folder_path}" push -u "origin" "website"
}

main "${@}"