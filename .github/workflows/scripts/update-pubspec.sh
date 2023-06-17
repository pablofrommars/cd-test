#! /bin/bash

version=$1
user_name=$2
user_email=$3

sed -i "s/^version: .*$/version: ${version}/" pubspec.yaml

git add pubspec.yaml 

git -c user.name="${user_name}" -c user.email="${user_email}" \
	commit -m "Update pubspec version to ${{version}}"