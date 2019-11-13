---
title: Git SSH配置过程
categories:
  - Git
abbrlink: 8d23490d
date: 2019-11-13 16:22:20
updated: 2019-11-13 16:22:20
---
- [Git SSH配置过程](/blog/null/#Git-SSH配置过程)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# Git SSH配置过程 #
## 配置邮箱和用户名 ##
### 配置邮箱 ###
```shell
git config --global user.email "your_email@example.com"
```
### 配置用户名 ###
```shell
git config --global user.name "your_name"
```
### 查看效果 ###
```shell
git config --global  --list
```
```shell
Administrator@DESKTOP-8ISAT6B MINGW64 /e/Blog
$ git config --global  --list
core.quotepath=false
user.email=18251956727@163.com
user.name=lanlan2017
```
## 生成密钥对 ##
### 生成默认长度的密钥对 ###
```shell
ssh-keygen -t rsa -C "18251956727@163.com"
```
### 生成指定长度的密钥对 ###
```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
## 将公钥添加到Github上 ##
## 添加密钥文件到 ##
```shell
ssh-add 文件名
```
## 测试链接是否成功 ##
```shell
ssh -T git@github.com
```
# 参考资料 #
[https://www.cnblogs.com/yangshifu/p/9919817.html](https://www.cnblogs.com/yangshifu/p/9919817.html)
[https://www.cnblogs.com/e-cat/p/10862208.html](https://www.cnblogs.com/e-cat/p/10862208.html)