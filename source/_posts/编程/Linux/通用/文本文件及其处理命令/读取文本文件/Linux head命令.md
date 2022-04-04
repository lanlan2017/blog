---
title: Linux head命令
categories: 
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: 9f06639c
date: 2021-04-24 11:43:48
updated: 2022-04-04 00:51:45
---
# Linux查看文件头命令：head
## head --help
```
[root@localhost Linux_Test]# head --help
用法：head [选项]... [文件]...
Print the first 10 lines of each FILE to standard output.
With more than one FILE, precede each with a header giving the file name.
With no FILE, or when FILE is -, read standard input.

Mandatory arguments to long options are mandatory for short options too.
  -c, --bytes=[-]K         print the first K bytes of each file;
                             with the leading '-', print all but the last
                             K bytes of each file
  -n, --lines=[-]K         print the first K lines instead of the first 10;
                             with the leading '-', print all but the last
                             K lines of each file
  -q, --quiet, --silent    不显示包含给定文件名的文件头
  -v, --verbose        总是显示包含给定文件名的文件头
      --help        显示此帮助信息并退出
      --version        显示版本信息并退出

K 后面可以跟乘号:
b 512, kB 1000, K 1024, MB 1000*1000, M 1024*1024,
GB 1000*1000*1000, G 1024*1024*1024, 对于T, P, E, Z, Y 同样适用。

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告head 的翻译错误
要获取完整文档，请运行：info coreutils 'head invocation'
[root@localhost Linux_Test]#
```
## head -n 行数
head默认只选择10 行， 加上-n 选项可以选择行数
显示文件ab.c 中前 15 行：
```
head n 15 ab.c
```
显示三个文件各自的前23 行共显示 69 行
```
head n 23 a.c b.c c.c | more
```
