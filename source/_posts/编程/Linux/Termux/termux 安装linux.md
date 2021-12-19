---
title: termux 安装linux
categories: 
  - 编程
  - Linux
  - Termux
date: 2019-10-31 15:08:27
updated: 2020-04-11 09:21:19
abbrlink: 45517ea0
---
# 首先先下载Termux

从应用商店下载安装即可，属于存储权限
# 安装proot
```shell
pkg install proot
```
# 获取root权限
```shell
termux-chroot
```
# 安装git并获取atilo
```shell
pkg install git
git clone https://github.com/YadominJinta/atilo
```
# 进去atilo下并获取权限
```shell
cd atilo/
chmod +x atilo
```
# 查看支持的版本
```shell
~/atilo ./atilo list  
alpine                                                     arch                                                       centos                                                     debian                                                     fedora                                                     kali                                                       opensuse                                                   parrot                                                     ubuntu                                                     ubuntults
```

# 安装ubuntu
```shell
./atilo install ubuntu
```
# 启动ubuntu
```shell
startubuntu
```
# 卸载ubuntu
```shell
./atilo remove ubuntu
```
# 安装centos
```shell
./atilo install centos
```
# 通过anLinux安装
先从应用商店下载安装anLinux,然打开anLinux，按提示安装。
## 安装centos
```shell
pkg install wget openssl-tool proot tar -y && hash -r && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/CentOS/centos.sh && bash centos.sh
```
