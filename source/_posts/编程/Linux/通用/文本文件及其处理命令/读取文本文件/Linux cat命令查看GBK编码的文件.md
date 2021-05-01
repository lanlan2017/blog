---
title: Linux cat命令查看GBK编码的文件
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: 324d9ef7
date: 2021-03-18 05:00:27
updated: 2021-03-18 05:07:02
---
<div id='my_toc'><a href="/blog/324d9ef7/#cat命令查看GBK编码的文件" class="header_1">cat命令查看GBK编码的文件</a>&nbsp;<br><a href="/blog/324d9ef7/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/324d9ef7/#解决方案" class="header_2">解决方案</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# cat命令查看GBK编码的文件
## 问题描述
我有个Windows的批处理文件(.bat),但是批处理文件的编码是GBK,我的Linux上使用的编码是utf-8,用cat查看这个文件的时候发现是乱码
```
[root@localhost blog]# cat StartWriting.bat
@echo off
REM Ȑ»»ƌ·
echo %~d0
%~d0
REM ½񫵱ǰĿ¼
echo %~dp0
set blogRoot=%~dp0
cd %blogRoot%
echo ´򿩰ostĿ¼:%~dp0source\_posts
set postRoot=%~dp0source\_posts
explorer %postRoot%
echo ՚%blogRoot%Ŀ¼Ђ´򿩧it-bash
start git-bash --cd=%blogRoot%

choice /t 10 /d n /m ˇ·򀮈¡Զ³̸𩄬ɏ²»-ȡ)

IF ERRORLEVEL 2 goto end

    echo -ȡԶ³̷ז§
    git pull origin master
:end
    REM echo ³͐򾢊
    REM pause[root@localhost blog]# 
```

## 解决方案
```shell
cat 文件名 | iconv -f GBK -t UTF-8
```
例如：
```shell
cat StartWriting.bat | iconv -f GBK -t UTF-8
```
运行效果：
```
[root@localhost blog]# cat StartWriting.bat | iconv -f GBK -t UTF-8
@echo off
REM 切换盘符
echo %~d0
%~d0
REM 进入当前目录
echo %~dp0
set blogRoot=%~dp0
cd %blogRoot%
echo 打开post目录:%~dp0source\_posts
set postRoot=%~dp0source\_posts
explorer %postRoot%
echo 在%blogRoot%目录下打开git-bash
start git-bash --cd=%blogRoot%

choice /t 10 /d n /m 是否拉取远程更新(默认不拉取)

IF ERRORLEVEL 2 goto end

    echo 拉取远程分支
    git pull origin master
:end
    REM echo 程序结束
    REM pause[root@localhost blog]# 
```
