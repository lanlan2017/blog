---
title: cmd 创建目录命令 mkdir或md
categories: 
  - Windows
  - CMD 批处理
  - 语法
  - 操作文件或目录的命令
date: 2019-01-31 18:48:22
updated: 2019-12-17 05:18:52
abbrlink: 47a3a21b
---
<div id='my_toc'><a href="/blog/47a3a21b/#cmd-创建目录命令" class="header_2">cmd 创建目录命令</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## cmd 创建目录命令 ##
mkdir命令可以用来创建目录,命令格式如下:
```cmd
D:\学习9\疯狂Java讲义第三版光盘\codes\03\3.1>mkdir /?
创建目录。
mkdir [drive:]path
md [drive:]path
如果命令扩展被启用，mkdir 会如下改变:
如果需要，mkdir 会在路径中创建中级目录。例如: 假设 \a 不
存在，那么:
    mkdir \a\b\c\d
与:
    mkdir \a
    chdir \a
    mkdir b
    chdir b
    mkdir c
    chdir c
    mkdir d
相同。如果扩展被停用，则需要键入 mkdir \a\b\c\d。
```
可以看到使用mkdir,或者md命令都可以创建目录，唯一要注意的就是`目录的格式要写对`，可以是绝对路径(如`mkdir D:\Test`),也可是相对路径(如`mkdir .\myjavadoc\test`).
