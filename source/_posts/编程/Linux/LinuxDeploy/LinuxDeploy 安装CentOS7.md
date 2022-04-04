---
title: LinuxDeploy 安装CentOS7
categories: 
  - Linux
  - LinuxDeploy
abbrlink: ecdc8418
date: 2021-03-15 02:42:04
updated: 2022-04-04 00:51:45
---
# 简介
本文介绍，如何在安卓手机上安装centos,并设置共享文件夹。
# 本文用到的软硬件
- 一部root过的手机手机
- LinuxDeploy软件
- BusyBox Free软件

# root手机
我的旧手机是OPPO R9全网通(OPPO R9plusm A),该手机的Root方法是，回退到系统版本到2016xxx版，然后下载KingRoot这个App,然后在手机上使用KingRoot来获取root权限即可

# 安装App
## 下载安装 BusyBox LinuxDeploy
可以在github上的release下载：
- [https://github.com/meefik/busybox/releases/](https://github.com/meefik/busybox/releases/)
- [https://github.com/meefik/linuxdeploy/releases](https://github.com/meefik/linuxdeploy/releases)
也可以从Gooogle play store上下载：
- BusyBox我看Google play store上有两个版本，这两个版本应该都可以，我安装的是第一个版本的
  - [https://play.google.com/store/apps/details?id=stericson.busybox](https://play.google.com/store/apps/details?id=stericson.busybox)
  - [https://play.google.com/store/apps/details?id=ru.meefik.busybox](https://play.google.com/store/apps/details?id=ru.meefik.busybox)
- [https://play.google.com/store/apps/details?id=ru.meefik.linuxdeploy](https://play.google.com/store/apps/details?id=ru.meefik.linuxdeploy)

## BusyBox使用介绍
安装最新版的BusyBox到/system/xbin

## LinuxDeploy操作详解
### 修改配置文件名
把配置文件名改为centos,这部可以省略。
### 环境设置
#### 勾选 屏幕常亮、锁定WiFi、开启CPU唤醒这三项。

#### 勾选 时间戳、显示图标、联网更新

#### 设置PATH变量为/system/xbin

### 三点按钮介绍
#### 安装按钮
该按钮的功能类似于重装系统，点击该按钮将会从头开始安装系统，只有在第一次安装系统的时候才点击该按钮。如果你已经安装好系统，并且在系统中做了一些工作，则不要再点击这个安装按钮，否则，重装系统后你之前在系统中做的工作会丢失，你讲得到一个全新的系统。
#### 配置按钮
该按钮的功能类似于系统更新，点击该按钮可以更新设置，更新已经安装的软件。后续如果修改Linux属性，则点击该按钮更新属性。

### 查看当前手机架构

### 设置操作系统属性

选择 发行版，选择 架构，选择 发行版GNU/Linux版本，修改 源地址，我这里用的是阿里云的源地址：[http://mirrors.aliyun.com/centos-altarch/](http://mirrors.aliyun.com/centos-altarch/)，你也可以选择其他源地址，我的手机架构是aarch64,可以在 源地址的/7/os/目录下找到aarch64即可：(http://mirrors.aliyun.com/centos-altarch/7/os/aarch64/)。这样的源地址就可以用。

选择安装方式 输入安装路径
我这里选择的是 目录 安装方式，安装路径设置为 /data/centos/。

输入用户名 密码

选择本地化为UTF-8编码的简体中文(zh_CN.UTF-8)

勾选SSH



安装图形化界面

我这里只需要SSH服务即可，为了节约资源，就不安装图形化界面了。

### 启动Linux

