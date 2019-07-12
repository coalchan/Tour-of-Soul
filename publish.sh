#!/bin/bash

set -e

msg=$1
if [[ -z "$msg" ]]; then
  echo "提交信息不能为空"
  exit -1
fi

git checkout master

echo "---------------------------gitbook build..."
gitbook build

git checkout gh-pages

echo "---------------------------commit static..."
cp -rf _book/* .
git add .
git commit -m "$msg"

echo "---------------------------push static..."
git push origin gh-pages

git checkout master
