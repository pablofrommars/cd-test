#! /bin/bash

ref=$(git for-each-ref --sort=-creatordate --count 1 --format="%(refname:short)" "refs/tags/v*")

[[ $ref =~ "v(.*)" ]]
version=${BASH_REMATCH[1]}

echo "VERSION=${version}" >> "$GITHUB_OUTPUT"
