#! /bin/bash

ref=$(git for-each-ref --sort=-creatordate --count 1 --format="%(refname:short)" "refs/tags/v*")

echo "Ref ${ref} retrieved"

[[ $ref =~ "^v(.*)$" ]]
version=${BASH_REMATCH[1]}

echo "Version ${version} retrieved"
echo "Version ${version} retrieved" >> $GITHUB_STEP_SUMMARY
echo "VERSION=${version}" >> "$GITHUB_OUTPUT"
