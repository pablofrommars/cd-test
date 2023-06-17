#! /bin/bash

tag=$1

pattern="^refs/tags/release/(stage|prod)/(major|minor|patch|build)$"

if [[ $tag =~ $pattern ]]; then
	tag=${BASH_REMATCH[0]}
	action=${BASH_REMATCH[2]}
	target=${BASH_REMATCH[1]}

	echo "Bump ${action} for ${target} configured" >> $GITHUB_STEP_SUMMARY

	echo "TAG=${tag}" >> "$GITHUB_OUTPUT"
	echo "ACTION=${action}" >> "$GITHUB_OUTPUT"
	echo "TARGET=${target}" >> "$GITHUB_OUTPUT"
else 
	exit 1
fi
