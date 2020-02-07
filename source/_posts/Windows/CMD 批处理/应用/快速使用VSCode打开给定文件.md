---
title: 快速使用VSCode打开给定文件
categories: 
  - Windows
  - CMD 批处理
  - 应用
date: 2019-08-05 00:29:34
updated: 2020-01-06 12:57:32
abbrlink: 5c6bafc2
---
<div id='my_toc'><a href="/blog/5c6bafc2/#使用VSCode快速打开一个给定的文件" class="header_1">使用VSCode快速打开一个给定的文件</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 使用VSCode快速打开一个给定的文件 #
创建一个`.bat`文件,粘贴如下命令,然后配置该文件所在的目录添加到`path`环境变量中.然后启动运行框(`Win+R`),输入该赔处理文件名称即可运行该批处理文件.
```bat
:: 关闭回显
@echo off
:: 输入文件路径
set /P input="输入要打开的文件的路径:"
:: 使用vscode打开该文件
start F:\Program" "Files\Microsoft" "VS" "Code\Microsoft" "VS" "Code\Code.exe "%input%"
```
最后一行代码是关键代码,注意路径之间如果有空格则要用双引号包裹起来.
