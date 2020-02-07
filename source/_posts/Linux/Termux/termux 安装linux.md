---
title: termux 安装linux
categories: 
  - Linux
  - Termux
date: 2019-10-31 15:08:27
updated: 2019-12-17 05:18:52
abbrlink: 45517ea0
---
<div id='my_toc'><a href="/blog/45517ea0/#首先先下载Termux" class="header_1">首先先下载Termux</a>&nbsp;<br><a href="/blog/45517ea0/#安装proot" class="header_1">安装proot</a>&nbsp;<br><a href="/blog/45517ea0/#获取root权限" class="header_1">获取root权限</a>&nbsp;<br><a href="/blog/45517ea0/#安装git并获取atilo" class="header_1">安装git并获取atilo</a>&nbsp;<br><a href="/blog/45517ea0/#进去atilo下并获取权限" class="header_1">进去atilo下并获取权限</a>&nbsp;<br><a href="/blog/45517ea0/#查看支持的版本" class="header_1">查看支持的版本</a>&nbsp;<br><a href="/blog/45517ea0/#安装ubuntu" class="header_1">安装ubuntu</a>&nbsp;<br><a href="/blog/45517ea0/#启动ubuntu" class="header_1">启动ubuntu</a>&nbsp;<br><a href="/blog/45517ea0/#卸载ubuntu" class="header_1">卸载ubuntu</a>&nbsp;<br><a href="/blog/45517ea0/#安装centos" class="header_1">安装centos</a>&nbsp;<br><a href="/blog/45517ea0/#通过anLinux安装" class="header_1">通过anLinux安装</a>&nbsp;<br><a href="/blog/45517ea0/#安装centos" class="header_2">安装centos</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

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
