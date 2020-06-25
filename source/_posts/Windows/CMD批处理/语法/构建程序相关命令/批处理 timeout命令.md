---
title: 批处理 timeout命令
categories: 
  - Windows
  - CMD批处理
  - 语法
  - 构建程序相关命令
date: 2019-09-11 11:20:03
updated: 2020-04-11 09:15:21
abbrlink: 6a7ac4ce
---
<div id='my_toc'><a href="/blog/6a7ac4ce/#timeout命令" class="header_1">timeout命令</a>&nbsp;<br><a href="/blog/6a7ac4ce/#帮助文档" class="header_2">帮助文档</a>&nbsp;<br><a href="/blog/6a7ac4ce/#应用" class="header_2">应用</a>&nbsp;<br><a href="/blog/6a7ac4ce/#30秒后休眠电脑" class="header_3">30秒后休眠电脑</a>&nbsp;<br><a href="/blog/6a7ac4ce/#定时休眠批处理程序" class="header_3">定时休眠批处理程序</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# timeout命令 #
## 帮助文档 ##
```cmd
timeout [/t] timeout [/nobreak] 

描述:
    这个工具接受超时参数，等候一段指定的时间(秒)或等按任意键。它还接受
    一个参数，忽视按键。

参数列表:
    /t        timeout       指定等候的秒数。有效范围从 -1 到 99999 秒。
    /nobreak                忽略按键并等待指定的时间。
    /?                      显示此帮助消息。

注意: 超时值 -1 表示无限期地等待按键。

示例:
    timeout /?
    timeout /t 10
    timeout /t 300 /nobreak
    timeout /t -1
```
## 应用 ##
这个命令可以使用`&&`连接符与其他命令串联到一起,从而实现定时执行后面命令的功能。
### 30秒后休眠电脑 ###
```cmd
timeout /t 30 /nobreak && shutdown -h
```
### 定时休眠批处理程序 ###
下面根据用户输入的秒数来休眠电脑:
```bat
@echo off
set /P waitTime=输入要休眠的秒数:
timeout /t %waitTime% /nobreak && shutdown -h
REM timeout /t %waitTime% /nobreak && echo 休眠电脑啦!
REM pause
```
