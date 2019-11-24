---
title: linux下删除目录及其子目录下某种类型文件
categories: 
  - Linux
  - 通用
date: 2018-08-22 11:31:37
updated: 2019-11-14 11:39:31
abbrlink: d10c0440
---
<div id='my_toc'>

- [问题描述](/blog/d10c0440/#问题描述)
- [命令](/blog/d10c0440/#命令)
- [参数说明](/blog/d10c0440/#参数说明)
- [参考资料](/blog/d10c0440/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 问题描述 ##
Linux下，如果想要删除目录及其子目录下某种类型文件，比如说所有的txt文件，则可以使用下面的命令：
## 命令 ##
```shell
find . -name "*.txt" -type f -print -exec rm -rf {} \;  
```
执行结果：
```shell
$ find . -name "*.txt" -type f -print -exec rm -rf {} \;
./a.txt
./b.txt
./Java/c.txt
./其他/d.txt
```
可以看到，当前目录下的`a.txt`,`b.txt`,子目录`./Java/`下的`c.txt`，子目录`./其他/`下的`d.txt`都被删除掉了。
## 参数说明 ##
`. `: 表示在当前目录下
```shell
-name "*.txt"  
```
表示查找所有后缀为txt的文件
```shell
-type f  
```
表示文件类型为一般正规文件
```
-print
```
表示将查询结果打印到屏幕上
```shell
-exec command  
```
`command`为其他命令，`-exec`后可再接其他的命令来处理查找到的结果，上式中，`{}`表示”由`find`命令查找到的结果“，如上所示，find所查找到的结果放置到{}位置，-exec一直到”\;“是关键字，表示`find`额外命令的**开始（`-exec`）**到**结束（`\;`）**，这中间的就是find命令的额外命令，上式中就是` rm -rf`
## 参考资料 ##
原文：[https://www.cnblogs.com/wyb628/p/7374372.html](https://www.cnblogs.com/wyb628/p/7374372.html)
>原文链接: [linux下删除目录及其子目录下某种类型文件](https://lanlan2017.github.io/blog/d10c0440/)
