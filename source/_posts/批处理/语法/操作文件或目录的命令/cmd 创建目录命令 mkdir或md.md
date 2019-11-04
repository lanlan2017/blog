---
title: cmd 创建目录命令 mkdir或md
categories: 
  - 批处理
  - 语法
  - 操作文件或目录的命令
date: 2019-01-31 18:48:22
updated: 2019-10-30 13:53:55
abbrlink: 47a3a21b
---
- [cmd 创建目录命令](/blog/html/47a3a21b/#cmd-创建目录命令)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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

>原文链接: [cmd 创建目录命令 mkdir或md](https://lanlan2017.github.io/blog/47a3a21b/)
