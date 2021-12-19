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
