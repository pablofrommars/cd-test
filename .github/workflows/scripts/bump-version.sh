#! /bin/bash

action=$1
version=$2

# sermver+buildNumber
pattern="^([1-9][[:digit:]]*)\.(0|[1-9][[:digit:]]*).(0|[1-9][[:digit:]]*)\+(0|[1-9][[:digit:]]*)$"

if [[ $version =~ $pattern ]]; then 
  major=${BASH_REMATCH[1]}
  minor=${BASH_REMATCH[2]}
  patch=${BASH_REMATCH[3]}
  build=${BASH_REMATCH[4]}

  case $action in
	major)
		bump="$(($((major)) + 1)).0.0+$(($((build)) + 1))"
		;;
	minor)
		bump="${major}.$(($((minor)) + 1)).0+$(($((build)) + 1))"
		;;
	patch)
		bump="${major}.${minor}.$(($((path)) + 1))+$(($((build)) + 1))"
		;;
	build)
		bump="${major}.${minor}.${patch}+$(($((build)) + 1))"
		;;
	*)
     	exit 1
    	;;
	esac

else
	bump="1.0.0+1"
fi

echo "New version ${bump}" >> $GITHUB_STEP_SUMMARY

echo "VERSION=${bump}" >> "$GITHUB_OUTPUT"