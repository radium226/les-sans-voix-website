#!/usr/bin/env bash

set -Eeuo pipefail

export REPO_BRANCH="website"

main()
{
    git remote

    declare repo_url="$( git remote get-url "origin" )"
    declare repo_folder_path="$( mktemp -d )"
    mkdir -p "${repo_folder_path}"
    git clone --branch "${REPO_BRANCH}" "${repo_url}" "${repo_folder_path}"

    git -C "${repo_folder_path}" config user.email "robot@robot.io"
    git -C "${repo_folder_path}" config user.name "Robot"

    #git clean -fdx
    cp "./index.html" "${repo_folder_path}/index.html"
    git -C "${repo_folder_path}" add --all
    git -C "${repo_folder_path}" commit -m "Deploy website! "
    git -C "${repo_folder_path}" push -u "origin" "website"
}

main "${@}"