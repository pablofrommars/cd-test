#! /bin/bash

action_tag=$1
new_version="v$2"
user_name=$3
user_email=$4

git push origin --delete ${action_tag}

git -c user.name="${user_name}" -c user.email="${user_email}" \
	tag ${new_version} \
	-m "${new_version}"

git push origin ${new_version}
