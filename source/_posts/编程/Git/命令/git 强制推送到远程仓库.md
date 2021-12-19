---
title: git 强制推送到远程仓库
categories: 
  - 编程
  - Git
  - 命令
date: 2019-12-01 15:16:23
updated: 2020-04-11 09:21:19
abbrlink: 3f12657a
---
# 问题描述
今天我使用自动部署`Travis CI`自动部署的Hexo博客的时候,仓库名称不小心填错了,导致我的Github上的其他仓库被覆盖了.
# 解决方案
进入本地仓库,然后`强制推送`到被错误覆盖的仓库上.
# 格式1
```shell
git push 远程仓库名 分支名 --force
```
例如:
```shell
git push origin master --force
```
# 格式2
```shell
git push -f 远程仓库名 分支名
```
例如:
```shell
git push -f origin master
```
# 参考资料
[https://blog.csdn.net/WangJQ12/article/details/80974031](https://blog.csdn.net/WangJQ12/article/details/80974031)
