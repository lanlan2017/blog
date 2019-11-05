---
title: Linux 常用指令
categories: 
  - Linux
  - 通用
date: 2018-11-11 16:35:46
updated: 2019-11-04 17:02:02
abbrlink: e44da
---
- [前言](/blog/e44da/#前言)
- [文件目录相关命令](/blog/e44da/#文件目录相关命令)
    - [创建一个空白文件命令touch](/blog/e44da/#创建一个空白文件命令touch)
    - [文件复制命令cp](/blog/e44da/#文件复制命令cp)
    - [文件移动命令mv](/blog/e44da/#文件移动命令mv)
        - [实例 移动文件到其他目录](/blog/e44da/#实例-移动文件到其他目录)
        - [使用移动命令重命名文件](/blog/e44da/#使用移动命令重命名文件)
    - [文件删除命令rm](/blog/e44da/#文件删除命令rm)
        - [无法删除的情况](/blog/e44da/#无法删除的情况)
    - [参考链接](/blog/e44da/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 前言 #
我这里是在git-bash中运行的，因为懒得打开虚拟机了，在Linux终端上运行效果也一样。

# 文件目录相关命令 #
## 创建一个空白文件命令touch ##
命令格式
```
touch 新文件名
```
例如，在当前目录下创建一个test.txt的空白文件：
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
$ ls -l
total 8
-rw-r--r-- 1 lan 197609 3622 11月 11 17:06 'Linux 常用指令.md'
-rw-r--r-- 1 lan 197609 1537 11月  5 17:17  linux下删除目录及其子目录下某种类型文件.md
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
$ touch text.txt
```
运行结果：
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
$ ls -l
total 8
-rw-r--r-- 1 lan 197609 3622 11月 11 17:06 'Linux 常用指令.md'
-rw-r--r-- 1 lan 197609 1537 11月  5 17:17  linux下删除目录及其子目录下某种类型文件.md
-rw-r--r-- 1 lan 197609    0 11月 11 17:06  text.txt
```
## 文件复制命令cp ##
**命令格式**
```
cp [option] source1 source2 source3 ... directory
```
**参数说明**
- `-a`:是指archive的意思，也说是指复制所有的目录
- `-d`:若源文件为连接文件(link file)，则复制连接文件属性而非文件本身
- `-f`:强制(force)，若有重复或其它疑问时，不会询问用户，而强制复制
- `-i`:若目标文件(destination)已存在，在覆盖时会先询问是否真的操作
- `-l`:建立硬连接(hard link)的连接文件，而非复制文件本身
- `-p`:与文件的属性一起复制，而非使用默认属性
- `-r`:递归复制，用于目录的复制操作
- `-s`:复制成符号连接文件(symbolic link)，即“快捷方式”文件
- `-u`:若目标文件比源文件旧，更新目标文件 

例如将当前博客站点目录bolg5复制一份到到同级目录blog5copy:
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5
$ cd ..
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog
$ cp -r bolg5 blog5copy
```
运行结束后，就复制了一份站点目录文件到同级目录(Blog)下的blog5copy目录了。这个blog5copy相当于一个博客站点目录的备份。

## 文件移动命令mv ##
**命令格式**
```
mv [-fiv] source destination
```
**参数说明**
- `-f`:force，强制直接移动而不询问
- `-i`:若目标文件(destination)已经存在，就会询问是否覆盖
- `-u`:若目标文件已经存在，且源文件比较新，才会更新
### 实例 移动文件到其他目录 ###
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5dug/source/_posts/Linux
$ mv 'Linux 常用指令.md' ../../../../*5/source/_posts/Linux
```
这个命令会把`/e/Blog/bolg5dug/source/_posts/Linux`目录下的`'Linux 常用指令.md'`文件移动到，`/e/Blog/bolg5/source/_posts/Linux`目录下。
### 使用移动命令重命名文件 ###
在当前目录下使用移动命令可以达到给文件重命名的效果：
为了不误删我之前写的文章，先来创建一个测试文件：
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
$ touch test.txt
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
$ ls -l
total 8
-rw-r--r-- 1 lan 197609 2447 11月 11 16:58 'Linux 常用指令.md'
-rw-r--r-- 1 lan 197609 1537 11月  5 17:17  linux下删除目录及其子目录下某种类型文件.md
-rw-r--r-- 1 lan 197609    0 11月 11 16:59  test.txt
```
使用mv命令重命名：
```
$ mv test.txt rename.txt
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
```
重命名结果：
```
$ ls -l
total 8
-rw-r--r-- 1 lan 197609 2447 11月 11 16:58 'Linux 常用指令.md'
-rw-r--r-- 1 lan 197609 1537 11月  5 17:17  linux下删除目录及其子目录下某种类型文件.md
-rw-r--r-- 1 lan 197609    0 11月 11 16:59  rename.txt
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/bolg5/source/_posts/Linux
```
## 文件删除命令rm ##
**命令格式**
```
rm [fir] 文件或目录
```
**参数说明**
- `-f`:强制删除
- `-i`:交互模式，在删除前询问用户是否操作
- `-r`:递归删除，常用在目录的删除

### 无法删除的情况 ###
```shell
$ rm -rf latex/
rm: cannot remove 'latex/': Device or resource busy
```
这是因为有程序在使用当前的目录，打开资源监视器，输入句柄(目录绝对路径)找到该程序，关闭该程序。然后就可以删除了。
## 参考链接 ##
[https://www.cnblogs.com/liaojie970/p/6746230.html](https://www.cnblogs.com/liaojie970/p/6746230.html)

>原文链接: [Linux 常用指令](https://lanlan2017.github.io/blog/e44da/)
