#!/bin/bash

#参数 1：分支名
branch=${1-master}
#参数 2：提交信息
message=${2-'init commit.'}

echo "branch: $branch, message: $message"

# 创建一个临时孤儿分支，孤儿分支不包含历史提交记录
git checkout --orphan "tmp-$branch"
# 添加所有文件
git add -A
# 提交所有文件
git commit -m "$message"
# 删除本地 master 分支
git branch -D "$branch"
# 将 tmp-master 分支改名为 master
git branch -m "$branch"
# 强制将本地 master 分支推送到远程
git push -f origin "$branch"
