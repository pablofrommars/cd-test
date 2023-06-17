#! /bin/bash

action_tag=$1
new_version=$2
user_name=$2
user_email=$4

git -c user.name="${user_name}" -c user.email="${user_email}" \
	tag "v${new_version}"

git tag -d ${action_tag}

git push origin --follow-tags --atomic HEAD:${GITHUB_BASE_REF##*/}