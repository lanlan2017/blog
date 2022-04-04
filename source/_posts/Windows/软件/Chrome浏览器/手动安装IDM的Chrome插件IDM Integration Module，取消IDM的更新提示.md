---
title: 手动安装IDM的Chrome插件IDM Integration Module，取消IDM的更新提示
categories: 
  - Windows
  - 软件
  - Chrome浏览器
abbrlink: 845de5e4
date: 2021-07-12 17:08:09
updated: 2022-04-04 00:51:44
---
# Chrome手动安装IDM插件IDM Integration Module
## 输入IDM在Chrome商店的网址进行安装
在Chrome商店中输入IDM Integration Module无法直接搜索到该插件，可以输入如下的地址进行访问：
```
https://chrome.google.com/webstore/detail/idm-integration-module/ngpampappnmepgilojfohadhhmbhlaek
```
## 拖动IDM安装目录下的 IDMGCExt.crx 文件到Chrome中进行安装
进入Chrome扩展程序界面，或者输入如下地址进入：
```
chrome://extensions/
```
然后，进入IDM的安装路径，找到IDMGCExt.crx文件，把它拖动到Chrome扩展程序界面中进行安装
```
C:\Program Files (x86)\Internet Download Manager\IDMGCExt.crx
```
# 取消IDM更新提示
打开注册表，进入路径：
```
计算机\HKEY_CURRENT_USER\SOFTWARE\DownloadManager
```
找到名称为
```
LstCheck
```
的数据项，然后双击它，这个数据项保存的是更新提示的日期，最后一个数是当前年，把最后一个数的年份修改为99。
也就是2099年才显示更新提示。
