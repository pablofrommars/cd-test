#! /bin/bash

branch=$1
version=$2
user_name=$3
user_email=$4

sed -i "s/^version: .*$/version: ${version}/" pubspec.yaml

git add pubspec.yaml 

git -c user.name="${user_name}" -c user.email="${user_email}" \
	commit -m "Update pubspec version to ${version}"

git push origin HEAD:${branch}