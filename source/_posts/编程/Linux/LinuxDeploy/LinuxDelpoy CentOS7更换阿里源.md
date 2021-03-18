---
title: LinuxDelpoy CentOS7更换阿里源
categories: 
  - 编程
  - Linux
  - LinuxDeploy
date: 2021-03-16 02:19:57
updated: 2021-03-17 11:20:44
abbrlink: 3c20575c
---
<div id='my_toc'><a href="/blog/3c20575c/#安装wget" class="header_1">安装wget</a>&nbsp;<br><a href="/blog/3c20575c/#更换阿里源" class="header_1">更换阿里源</a>&nbsp;<br><a href="/blog/3c20575c/#更换成功后清除缓存并重建" class="header_1">更换成功后清除缓存并重建</a>&nbsp;<br><a href="/blog/3c20575c/#安装vim" class="header_1">安装vim</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 安装wget
```shell
yum install wget
```
# 更换阿里源
```shell
cd /etc/yum.repos.d/
# 备份
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
cat CentOS-Base.repo
#更换阿里源
wget http://mirrors.aliyun.com/repo/Centos-altarch-7.repo -O /etc/yum.repos.d/CentOS-Base.repo
#查看是否更换成功
cat /etc/yum.repos.d/CentOS-Base.repo
```
# 更换成功后清除缓存并重建
```shell
yum clean all
yum makecache
```
# 安装vim
```shell
yum install vim
```
