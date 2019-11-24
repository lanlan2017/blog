---
title: termux 安装linux
categories: 
  - Linux
  - Termux
date: 2019-10-31 15:08:27
updated: 2019-11-14 11:39:31
abbrlink: 45517ea0
---
<div id='my_toc'>

- [首先先下载Termux](/blog/45517ea0/#首先先下载Termux)
- [安装proot](/blog/45517ea0/#安装proot)
- [获取root权限](/blog/45517ea0/#获取root权限)
- [安装git并获取atilo](/blog/45517ea0/#安装git并获取atilo)
- [进去atilo下并获取权限](/blog/45517ea0/#进去atilo下并获取权限)
- [查看支持的版本](/blog/45517ea0/#查看支持的版本)
- [安装ubuntu](/blog/45517ea0/#安装ubuntu)
- [启动ubuntu](/blog/45517ea0/#启动ubuntu)
- [卸载ubuntu](/blog/45517ea0/#卸载ubuntu)
- [安装centos](/blog/45517ea0/#安装centos)
- [通过anLinux安装](/blog/45517ea0/#通过anLinux安装)
    - [安装centos](/blog/45517ea0/#安装centos)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
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

>原文链接: [termux 安装linux](https://lanlan2017.github.io/blog/45517ea0/)
