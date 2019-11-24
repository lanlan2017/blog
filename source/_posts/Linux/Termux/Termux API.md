---
title: Termux API
categories: 
  - Linux
  - Termux
date: 2019-11-03 19:40:56
updated: 2019-11-14 11:39:31
abbrlink: b709eab2
---
<div id='my_toc'>

- [Termux API有什么用](/blog/b709eab2/#Termux-API有什么用)
- [手机上安装Termux API APP](/blog/b709eab2/#手机上安装Termux-API-APP)
- [Termux里面安装Termux-api软件包](/blog/b709eab2/#Termux里面安装Termux-api软件包)
- [常用命令](/blog/b709eab2/#常用命令)
    - [获取电池信息](/blog/b709eab2/#获取电池信息)
    - [获取相机信息](/blog/b709eab2/#获取相机信息)
    - [获取与设置剪贴板](/blog/b709eab2/#获取与设置剪贴板)
        - [查看当前剪贴板内容](/blog/b709eab2/#查看当前剪贴板内容)
        - [设置新的剪贴板内容](/blog/b709eab2/#设置新的剪贴板内容)
    - [获取通讯录列表](/blog/b709eab2/#获取通讯录列表)
    - [查看短信内容列表](/blog/b709eab2/#查看短信内容列表)
    - [发送短信](/blog/b709eab2/#发送短信)
    - [拨打电话](/blog/b709eab2/#拨打电话)
    - [WiFi相关](/blog/b709eab2/#WiFi相关)
    - [termux API小结](/blog/b709eab2/#termux-API小结)
- [参考资料](/blog/b709eab2/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# Termux API有什么用 #
Termux:API，用于访问手机硬件,实现更多的可玩性,可以实现如下等功能:
- 访问电池信息
- 获取相机设备信息
- 获取本机设备信息
- 获取设置`剪贴板`信息
- 获取通讯录信息
- 获取设置手机短信
- 拨打号码
- 振动设备

# 手机上安装Termux API APP #
从Google Play上下载Termux API,然后安装.
# Termux里面安装Termux-api软件包 #
安装完Termux-api APP后,Termux里面必须安装对应的包后才可以实现操作手机底层. 
```shell
pkg install termux-api
```
# 常用命令 #
下面只列举一些可能会用到的,想要获取更多关于`Termux-api`的话,那就去参考官方文档.
## 获取电池信息 ##
```shell
termux-battery-status
```
## 获取相机信息 ##
```shell
termux-camera-info
```
## 获取与设置剪贴板 ##
### 查看当前剪贴板内容 ###
```shell
termux-clipboard-get
```
### 设置新的剪贴板内容 ###
```shell
termux-clipboard-set HelloWorld
```
## 获取通讯录列表 ##
```shell
termux-contact-list
```
## 查看短信内容列表 ##
```shell
termux-sms-inbox
```
## 发送短信 ##
```shell
termux-sms-send
```
支持同时发送多个号码,实现群发的效果,官方介绍如下:
```shell
termux-sms-send -n number(s)  recipient number(s) - separate multiple numbers by commas
```
发送测试
```shell
termux-sms-send -n 10001 cxll
```
这个好像不支持了,出现的错误如下:
```shell
termux-sms-send -n 10086 192
{
  "error": "Sending SMS is no longer permitted by Google"
}
```
## 拨打电话 ##
```shell
termux-telephony-call
```
拨打电话`需要授予电话权限`,下面拨打10086试试:
```shell
termux-telephony-call 10086
```
## WiFi相关 ##
获取当前WiFi连接信息
```shell
termux-wifi-connectioninfo
```
## termux API小结 ##
直接操作调动系统底层的话,可以通过编程来实现`自动定时短信发送`,语音播报等功能,DIY空间无线.

# 参考资料 #
[https://www.sqlsec.com/2018/05/termux.html](https://www.sqlsec.com/2018/05/termux.html)
