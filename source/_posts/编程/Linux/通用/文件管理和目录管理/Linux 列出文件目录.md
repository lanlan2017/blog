---
title: Linux 列出文件目录
categories: 
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: 4bfefcf7
date: 2021-05-31 19:11:30
updated: 2022-04-04 00:51:45
---
# ls:文件名列表
## 基本功能
在同一命令行中可以指定0~n个实参
- 不给出实参时，列出当前目录下所有文件和目录
- 实参为文件时，列出文件项
- 实参为目录时，列出目录下的所有文件项

## ls命令有几十个选项
- 控制列表格式，有选择的为每个项目列出某些属性

## 选项-F (Flag)
- 若列出的是目录，就在名字后面缀以斜线`/`
- 若列出的是可执行文件，就在名字后面缀以星号`*`
- 若列出的是符号连接文件，就在名字后面缀以符号`@`
- 若列出的是普通文件，则名字面后无任何标记

现在的终端可以根据颜色还区分文件与目录，在一些很简单的没有颜色的嵌入式终端中`ls -F`比较有用。

## ls选项-l: 长格式列表
例：ls -l arg
-rwxr-x--x l liang stud 519 Jul 5 15:02  arg
### 第1列：文件属性
#### 第1字符为文件类型


|第1个字符|文件类型|
|:---|:---|
|`-`|普通文件|
|`b`|块设备文件(Block)|
|`d`|目录文件(Dir)|
|`c`|字符设备文件(Char)|
|`l`|符号连接文件(Link) |
|`p`|命名管道文件(Pipe)|

### 文件的访问权限
(r读权限，w写权限，x可执行权限)

|ls -l第1列|描述|
|:---|:---|
|2-4字符:|**文件所有者**对文件的访问权限|
|5-7字符:|**同组用户**对文件的访问权限|
|8-10字符:|**其它用户**对文件的访问权限|

### 第2列：文件link数
涉及到此文件的目录项数
### 第3列，第4列：
文件主的名字和组名

### 第5列

|类型|描述|
|:---|:---|
|普通磁盘文件：|列出文件大小(字节数)|
|目录：|列出目录表大小，不是目录下文件长度和|
|符号连接文件：|列出符号连接文件自身的长度|
|字符设备和块设备文件：|列出主设备号和次设备号|
|管道文件：|列出管道内的数据长度|

### 第6列：
文件最后一次被修改的日期和时间
### 第7列：文件名
对于符号连接文件，附带列出符号连接文件的内容

## 选项-h
（human-readable），许多其他命令中也有类似选项
以便于人阅读的方式打印数值 (例如：1K 234M 2G)
## 选项-d
(directory)当ls的参数是目录时，不象默认的情况那样列出目录下的文件，而是**列出目录自身的信息**
```
[root@localhost Linux_Test]# ls -d
.
[root@localhost Linux_Test]# ls -ld
drwxr-xr-x. 18 root root 4096 5月  31 21:06 .
[root@localhost Linux_Test]# 
```

### ls与ls *的区别
```
[root@localhost vi]# ls
encode  helloworld.c  helloworld.out  out.txt  test.txt
[root@localhost vi]# ls *
helloworld.c  helloworld.out  out.txt  test.txt

encode:
helloworld.c  mini.txt
[root@localhost vi]# 
```

### ls -l /etc与ls -ld /etc的区别
```
[root@localhost vi]# ls -l /etc
总用量 1332
-rw-r--r--.  1 root root     12 11月 17 2020 adjtime
-rw-r--r--.  1 root root   1529 4月   1 2020 aliases
drwxr-xr-x.  2 root root   4096 4月  20 17:53 alternatives
......
drwxr-xr-x.  6 root root   4096 3月  16 03:03 yum
-rw-r--r--.  1 root root    970 10月  2 2020 yum.conf
drwxr-xr-x.  2 root root   4096 4月  23 15:07 yum.repos.d
[root@localhost vi]# ls -ld /etc
drwxr-xr-x. 73 root root 4096 5月  31 21:04 /etc
[root@localhost vi]# 
```
## 选项-a
(all)
列出文件名首字符为圆点的文件(默认情况下这些文件不列出，经常会用来保存用户的偏好设置信息或保存某些软件的状态信息)。
## 选项-A
(功能与-a相同，除了不列出. 和..)
例如：

ls
ls -a
ls –ad
```
[root@localhost vi]# ls 
encode  helloworld.c  helloworld.out  out.txt  test.txt
[root@localhost vi]# ls -a
.  ..  encode  helloworld.c  .helloworld.c.swp  helloworld.out  out.txt  test.txt
[root@localhost vi]# ls -A
encode  helloworld.c  .helloworld.c.swp  helloworld.out  out.txt  test.txt
[root@localhost vi]# 
```
## 选项-s
(size)列出文件占用的磁盘空间
```
[root@localhost vi]# ls -s
总用量 32
 4 encode   4 helloworld.c  16 helloworld.out   4 out.txt   4 test.txt
[root@localhost vi]# ls -sh
总用量 32K
4.0K encode  4.0K helloworld.c   16K helloworld.out  4.0K out.txt  4.0K test.txt
[root@localhost vi]#
```
## 选项-i
(i-node)列出文件的i节点号
```
[root@localhost vi]# ls -i
532546 encode  524412 helloworld.c  524416 helloworld.out  524430 out.txt  524431 test.txt
[root@localhost vi]# 
```
