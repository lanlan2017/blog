---
title: Git 强制拉去远程分支 删除本地分支
categories: 
  - Git
  - 命令
abbrlink: ecbd02e2
date: 2019-12-03 19:17:52
updated: 2022-04-04 00:51:45
---
# 问题描述
我的博客源码放在src分支上,pages放在master分支上,但是今天我在另一个电脑上想写博客,但是我克隆博客源码的时候输错了命令,不小心克隆到了master分支上.master分支上的pages是自动部署的,不需要我操作,我不想再本地上看到任何master分支的内容.
# 解决方案
## 方案1 删除本地仓库 重新克隆src分支
```shell
cd ..
rm -rf blogRoot/
git clone -b src git@github.com:lanlan2017/lanlan2017.github.io.git
```
## 方案2 下载src分支 然后删除本地master分支
```shell
git fetch origin src:src
git checkout src 
git branch -d master
```
### 删除远程master分支的记录
查看远程仓库地址:
```shell
 u0_a391@localhost ~/my/blogRoot> (src) git remote -v                                                                   
origin	git@github.com:lanlan2017/lanlan2017.github.io.git (fetch)
origin	git@github.com:lanlan2017/lanlan2017.github.io.git (push)
```
先删除远程地址,然后再添加远程地址:
```shell
git remote remove origin
git remote add -t src origin git@github.com:lanlan2017/lanlan2017.github.io.git
```
拉去远程src分支,这样本地上就只有远程上的src分支的记录:
```shell
 u0_a391@localhost ~/my/blogRoot> (src) git pull origin src 
From github.com:lanlan2017/lanlan2017.github.io
 * branch            src        -> FETCH_HEAD
 * [new branch]      src        -> origin/src

```
