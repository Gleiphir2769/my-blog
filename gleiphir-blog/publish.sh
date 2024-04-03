#!/bin/bash

# 检查是否传入了提交消息
if [ -z "$1" ]; then
  echo "请提供提交消息作为参数。"
  exit 1
fi

# 执行 hugo 命令构建网站
echo "正在构建网站..."
hugo

if [ $? -ne 0 ]; then
  echo "构建网站时出错。"
  exit 1
fi

# 主目录的 Git 操作
echo "正在添加主目录更改到 Git..."
git add .

echo "正在提交主目录更改..."
git commit -m "$1"

if [ $? -ne 0 ]; then
  echo "提交主目录更改时出错。"
  exit 1
fi

echo "正在将主目录更改推送到远程仓库..."
git push

if [ $? -ne 0 ]; then
  echo "推送主目录更改时出错。"
  exit 1
fi

# 进入 public 目录
cd public

if [ $? -ne 0 ]; then
  echo "进入 public 目录时出错。"
  exit 1
fi

# public 目录的 Git 操作
echo "正在添加 public 目录更改到 Git..."
git add .

echo "正在提交 public 目录更改..."
git commit -m "$1"

if [ $? -ne 0 ]; then
  echo "提交 public 目录更改时出错。"
  exit 1
fi

echo "正在将 public 目录更改推送到远程仓库..."
git push

if [ $? -ne 0 ]; then
  echo "推送 public 目录更改时出错。"
  exit 1
fi

echo "成功完成所有操作。"