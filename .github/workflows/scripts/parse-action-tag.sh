#! /bin/bash

tag=$1

pattern="^refs/tags/release/(stage|prod)/(major|minor|patch|build)$"

if [[ $tag =~ $pattern ]]; then
	target=${BASH_REMATCH[1]}
	action=${BASH_REMATCH[2]}

	echo "Bump ${action} for ${target} configured" >> $GITHUB_STEP_SUMMARY

	echo "TARGET=${target}" >> "$GITHUB_OUTPUT"
	echo "ACTION=${action}" >> "$GITHUB_OUTPUT"
else 
	exit 1
fi
