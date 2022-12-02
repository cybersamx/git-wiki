#!/usr/bin/env bash

# Run this script to generate a local repo for us to play
# around with git.
#
# ./playground.sh my-playground  # Creates a repo my-playground
# ./plyaground.sh                # Creates a repo playground

function main() {
  # Creates the repo from where we call the script.
  dirpath="${PWD}/${1:-playground}"

  rm -rf "${dirpath}"
  git init "${dirpath}"

  cd "${dirpath}"
  pwd
  cp /dev/null log

  for i in {1..4}; do
    msg="Commit $((i))"
    echo "${msg}" >> log
    git add -A
    git commit -m "${msg}"
  done

  cd -
}

# $1 = name of the repo
main "${1}"
