---
title: Git 更新推送流程
categories: 
  - Git
  - 命令
abbrlink: 6a91baf
date: 2019-10-31 20:20:41
updated: 2022-04-04 00:51:45
---
# 进入项目地址
```shell
cd blog/blog/
```
# 拉取远程分支
```git
git pull origin master
```
# 查看更新
```shell
git status
```
## 一步到位
```bash
cd blog/blog/ && git pull origin master && git status
```
# 处理冲突或者其他操作
省略....

# 添加所有文件
```shell
git add .^
git status
```
# 提交
## 提交语句开始
```shell
git commit -m '
```
## 写入提交描述
省略...
## 描述结束符
```shell
'
```
# 推送到指定分支
```shell
git push origin master
```
# 输入GitHub用户名
```shell
lanlan2017
```
# 输入密码
省略...
