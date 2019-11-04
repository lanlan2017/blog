---
title: Git更新推送流程
categories: 
  - Git
date: 2019-10-31 20:20:41
updated: 2019-10-31 20:34:41
abbrlink: 6a91baf
---
- [查看更新](/blog/html/6a91baf/#查看更新)
- [处理冲突或者其他操作](/blog/html/6a91baf/#处理冲突或者其他操作)
- [添加所有文件](/blog/html/6a91baf/#添加所有文件)
- [提交](/blog/html/6a91baf/#提交)
    - [提交语句开始](/blog/html/6a91baf/#提交语句开始)
    - [写入提交描述](/blog/html/6a91baf/#写入提交描述)
    - [描述结束符](/blog/html/6a91baf/#描述结束符)
- [推送到指定分支](/blog/html/6a91baf/#推送到指定分支)
- [输入GitHub用户名](/blog/html/6a91baf/#输入GitHub用户名)
- [输入密码](/blog/html/6a91baf/#输入密码)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
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

>原文链接: [Git更新推送流程](https://lanlan2017.github.io/blog/6a91baf/)
