---
title: Linux man命令
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: 6e64ba3d
date: 2021-04-04 14:24:18
updated: 2021-04-06 16:55:53
---
<div id='my_toc'><a href="/blog/6e64ba3d/#man命令简介" class="header_1">man命令简介</a>&nbsp;<br><a href="/blog/6e64ba3d/#man命令分页器" class="header_2">man命令分页器</a>&nbsp;<br><a href="/blog/6e64ba3d/#man命令的几种用法" class="header_1">man命令的几种用法</a>&nbsp;<br><a href="/blog/6e64ba3d/#man-name" class="header_2">man name</a>&nbsp;<br><a href="/blog/6e64ba3d/#man-section-name" class="header_2">man section name</a>&nbsp;<br><a href="/blog/6e64ba3d/#man-k-regexp" class="header_2">man -k regexp</a>&nbsp;<br><a href="/blog/6e64ba3d/#手册页内容" class="header_2">手册页内容</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# man命令简介
Linux最常用命令一般由两到三个字母构成，man取自manual（手册）的前三个字母。

## man命令分页器

|man命令分页器|功能|
|:---|:---|
|q|退出|
|空格|下一页|
|上下箭头|上移下移|

# man命令的几种用法
## man name
这里的name，可以是命令的名字，可以是系统调用的名字，也可以是库函数的名字，也可以是系统配置文件。
## man section name
section是一个数字编号，1表示第一章
例如
```
man 1 sheep #查看第一章的sleep命令
```

|章节编号|描述|
|:---|:---|
|1|命令|
|2|系统调用|
|3|库函数|
|5|配置文件|


## man -k regexp
列出关键字(keyword)与正则表达式regexp匹配的手册项目录

## 手册页内容
- 列出基本功能和语法
- 对于C语言的函数调用，列出头文件和链接函数库
- 功能说明
- SEE ALSO：有关的其它项目的名字和章节号
