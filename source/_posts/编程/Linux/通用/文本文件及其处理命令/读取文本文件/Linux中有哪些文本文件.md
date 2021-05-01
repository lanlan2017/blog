---
title: Linux中有哪些文本文件
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: bfddd61e
date: 2021-04-22 14:54:05
updated: 2021-04-22 14:54:05
---
# Linux中的文本信息（1）
## 文本文件
- C语言，Java语言等编程文件的源程序语言
- 文本格式的数据文件
- 文本格式的文字信息
- 程序输出

## 系统配置信息
- /etc下的配置文件（功能类似windows的注册表）

# Linux中的文本信息（2）
## 文本型网络协议
- 因特网大部分传输层以上的协议是文本型协议
- 会话层协议：HTTP，POP3，SMTP，IMAP，
- 表示层协议：HTML，XML，MIME

## 文本文件处理的命令
- Linux提供大量的文本文件处理的命令
- 多数命令都有复杂的选项

# 进程的标准输入/输出
## 进程的基本概念
- 进程与程序
  - 程序是个文件，运行之中的程序就是进程。
- 进程的生命周期

## 进程的输入输出
- 标准输入stdin
- 标准输出stdout

# 重定向与管道
## 重定向机制

## 输出重定向
ls –l > filelist.txt
## 输入重定向
sort   < filelist.txt
## 管道机制
ls –l | sort
重定向机制和管道机制的重要性

# 文本文件处理命令的特点（1）
## 特点
- 不指定处理对象文件名时，从标准输入获得数据
- 指定处理对象文件名时，从文件中获取数据
- 多数命令可以指定多个文件
- 处理结果在标准输出显示

## 考虑的因素
- 标准输入/标准输出
- shell的文件通配符
- 输入输出重定向
- 管道

## 灵活性：工具命令的组合
- Linux倾向于提供独立的多个精巧的工具命令，数据格式为文本信息
- 鼓励使用重定向或管道机制将多个工具命令组合在一起，提供灵活的功能
- **应用系统设计时，也应该考虑到这些特点**
  - 例如：数据库内容的展示，直接输出多列文本，考虑到各种工具软件的使用

# 示例
## 输出重定向示例：ls命令
正常情况下的命令会输出在屏幕上(标准输出)：
```
[root@localhost ~]# ls -l
总用量 12
lrwxrwxrwx. 1 root root   15 3月  19 02:30 blog -> /opt/hexo/blog/
drwxr-xr-x. 2 root root 4096 4月  11 17:27 C_Test
lrwxrwxrwx. 1 root root   14 3月  19 21:17 exam -> /opt/hexo/exam
drwxr-xr-x. 2 root root 4096 4月  20 18:21 Linux_Test
lrwxrwxrwx. 1 root root   11 3月  22 02:43 share -> /mnt/files/
drwxr-xr-x. 2 root root 4096 4月  12 02:29 Shell_Test
[root@localhost ~]#
```
把命令的输出重定向到文件中：
```
[root@localhost ~]# ls -l > ls_out.txt
[root@localhost ~]# ls
blog  C_Test  exam  Linux_Test  ls_out.txt  share  Shell_Test
[root@localhost ~]# cat ls_out.txt 
总用量 12
lrwxrwxrwx. 1 root root   15 3月  19 02:30 blog -> /opt/hexo/blog/
drwxr-xr-x. 2 root root 4096 4月  11 17:27 C_Test
lrwxrwxrwx. 1 root root   14 3月  19 21:17 exam -> /opt/hexo/exam
drwxr-xr-x. 2 root root 4096 4月  20 18:21 Linux_Test
-rw-r--r--. 1 root root    0 4月  22 15:08 ls_out.txt
lrwxrwxrwx. 1 root root   11 3月  22 02:43 share -> /mnt/files/
drwxr-xr-x. 2 root root 4096 4月  12 02:29 Shell_Test
[root@localhost ~]# 
```
## 标准输入重定向示例：sort命令
直接输入sort命令时，sort命令会直接冲标准输入读取要处理的文本。
你可以输入一串数字进行排序，如果想结束输入，则按ctrl+D。
然后sort命令将你输入的内容进行升序排序后输出到屏幕上：
```
[root@localhost ~]# sort
98
87
65
54
32
21

//在此处按下Ctrl+D
21
32
54
65
87
98
[root@localhost ~]# 
```
接下来创建一个文件sortFile.txt，写入上面的数字，然后对该文件中的数字进行排序：
```
[root@localhost Linux_Test]# vim sortFile.txt
[root@localhost Linux_Test]# ls
date_test.txt  ls_out.txt  sortFile.txt  vi_replaceAllTest.txt
[root@localhost Linux_Test]# cat sortFile.txt 
98
87
65
54
32
21
[root@localhost Linux_Test]# sort < sortFile.txt 
21
32
54
65
87
98
[root@localhost Linux_Test]# 
```
## 管道示例
```
[root@localhost Linux_Test]# ls
date_test.txt  ls_out.txt  sortFile.txt  vi_replaceAllTest.txt
[root@localhost Linux_Test]# ls |sort
date_test.txt
ls_out.txt
sortFile.txt
vi_replaceAllTest.txt
[root@localhost Linux_Test]# ls | sort > ls_sort.txt
[root@localhost Linux_Test]# cat ls_sort.txt 
date_test.txt
ls_out.txt
ls_sort.txt
sortFile.txt
vi_replaceAllTest.txt
[root@localhost Linux_Test]#
```