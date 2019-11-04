---
title: 快速使用VSCode打开给定文件
categories: 
  - 批处理
  - 应用
date: 2019-08-05 00:29:34
updated: 2019-10-30 13:53:55
abbrlink: 5c6bafc2
---
- [使用VSCode快速打开一个给定的文件](/blog/html/5c6bafc2/#使用VSCode快速打开一个给定的文件)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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

>原文链接: [快速使用VSCode打开给定文件](https://lanlan2017.github.io/blog/5c6bafc2/)
