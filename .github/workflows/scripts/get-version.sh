#! /bin/bash

ref=$(git for-each-ref --sort=-creatordate --count 1 --format="%(refname:short)" "refs/tags/v*")

pattern="^v(.*)$"

if [[ $ref =~ $pattern ]]; then
	version=${BASH_REMATCH[1]}

	echo "Version ${version} retrieved"
	echo "Version ${version} retrieved" >> $GITHUB_STEP_SUMMARY
	echo "VERSION=${version}" >> "$GITHUB_OUTPUT"
else
	exit 1
fi
