#!/bin/bash

set -e

msg=$1
if [[ -z "$msg" ]]; then
  echo "提交信息不能为空"
  exit -1
fi

# 首次需要运行 gitbook install 安装 book.json 中要到的插件

bash compile.sh "$msg"

bash publish.sh "$msg"
