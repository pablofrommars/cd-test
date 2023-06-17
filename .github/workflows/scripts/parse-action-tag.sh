#! /bin/bash

tag=$1

[[ tag =~ "^release/(stage|prod)/(major|minor|patch|build)$" ]]
env=${BASH_REMATCH[1]}
action=${BASH_REMATCH[2]}

echo "ENV=${env}" >> "$GITHUB_OUTPUT"
echo "ACTION=${action}" >> "$GITHUB_OUTPUT"
