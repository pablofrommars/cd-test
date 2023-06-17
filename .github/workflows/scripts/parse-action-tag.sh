#! /bin/bash
base_ref=$1
tag=$2

base_ref_pattern="^refs/heads/(.*)$"

if [[ $base_ref =~ $base_ref_pattern ]]; then
	branch=${BASH_REMATCH[1]}

	echo "BRANCH=${branch}" >> "$GITHUB_OUTPUT"
else 
	exit 1
fi

tag_pattern="^refs/tags/release/(stage|prod)/(major|minor|patch|build)$"

if [[ $tag =~ $tag_pattern ]]; then
	tag=${BASH_REMATCH[0]}
	action=${BASH_REMATCH[2]}
	target=${BASH_REMATCH[1]}

	echo "Bump ${action} for ${target} configured on ${branch}" >> $GITHUB_STEP_SUMMARY

	echo "TAG=${tag}" >> "$GITHUB_OUTPUT"
	echo "ACTION=${action}" >> "$GITHUB_OUTPUT"
	echo "TARGET=${target}" >> "$GITHUB_OUTPUT"
else 
	exit 1
fi
