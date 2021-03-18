---
title: LinuxDeploy CentOS7安装Git
categories: 
  - 编程
  - Linux
  - LinuxDeploy
date: 2021-03-16 03:29:46
updated: 2021-03-17 11:20:44
abbrlink: 21008dc5
---
<div id='my_toc'><a href="/blog/21008dc5/#安装" class="header_1">安装</a>&nbsp;<br><a href="/blog/21008dc5/#查看安装成功" class="header_1">查看安装成功</a>&nbsp;<br><a href="/blog/21008dc5/#配置基本信息" class="header_1">配置基本信息</a>&nbsp;<br><a href="/blog/21008dc5/#参考链接" class="header_1">参考链接</a>&nbsp;<br><a href="/blog/21008dc5/#安装nano" class="header_1">安装nano</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
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
