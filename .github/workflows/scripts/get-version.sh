#! /bin/bash

ref=$(git for-each-ref --sort=-creatordate --count 1 --format="%(refname:short)" "refs/tags/v*")

pattern="^v(.*)$"

if [[ $ref =~ $pattern ]]; then
	echo "Version ${version} retrieved" >> $GITHUB_STEP_SUMMARY
	version=${BASH_REMATCH[1]}
else
	version=""
fi

echo "VERSION=${version}" >> "$GITHUB_OUTPUT"