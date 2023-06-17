#! /bin/bash

version=$1

sed -i "s/^version: .*$/version: ${version}/" pubspec.yaml
