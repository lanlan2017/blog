---
title: LinuxDeploy CentOS7安装Git
categories: 
  - Linux
  - LinuxDeploy
abbrlink: 21008dc5
date: 2021-03-16 03:29:46
updated: 2022-04-04 00:51:45
---
# 安装
```shell
yum install git
```
# 查看安装成功
```shell
git --version
```
```
[root@localhost ~]# git --version
git version 1.8.3.1
```
# 配置基本信息
```shell
git config --global user.name "用户名"
git config --global user.email "邮箱"
```
查看用户名：
```shell
git config --list
```
# 参考链接
https://www.jianshu.com/p/e6ecd86397fb

# 安装nano
```shell
sudo yum install nano
```
查看安装效果：
```shell
nano --version
```

```
[root@localhost ~]# nano --version
 GNU nano 版本2.3.1 (编译于12:17:13, Apr 28 2015)
 (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007,
 2008, 2009 Free Software Foundation, Inc.
 电子邮件: nano@nano-editor.org        网页: http://www.nano-editor.org/
 编译选项： --enable-color --enable-extra --enable-multibuffer --enable-nanorc --enable-utf8
[root@localhost ~]# 
```
