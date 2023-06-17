#! /bin/bash

branch=$1
action_tag=$2
new_version=$3
user_name=$4
user_email=$5

git -c user.name="${user_name}" -c user.email="${user_email}" \
	tag "v${new_version}"

git tag -d ${action_tag}

git push origin --follow-tags --atomic HEAD:${branch}