---
title: Linux文本文件读取命令
categories: 
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: 9f27513a
date: 2021-04-22 14:43:39
updated: 2022-04-04 00:51:45
---
# 逐屏显示文件的more和less命令
当一个文件内容比较长的的时候，屏幕显示不完全，则通常会使用到more和less命令。
## 历史
more：最先由BSD UNIX开发
less：Linux上广泛使用
## 使用方法
### more 文件
more  shudu.c 指定一个文件
### more 多个文件
more *.[ch]     指定多个文件

例如使用`more *.txt`查看当前目录下的所有.txt文件
```
[root@localhost Linux_Test]# more *.txt
::::::::::::::
date_test.txt
::::::::::::::
2020-01-24 04:05:06
2021/4/25
::::::::::::::
ls_out.txt
::::::::::::::
总用量 12
lrwxrwxrwx. 1 root root   15 3月  19 02:30 blog -> /opt/hexo/blog/
drwxr-xr-x. 2 root root 4096 4月  11 17:27 C_Test
lrwxrwxrwx. 1 root root   14 3月  19 21:17 exam -> /opt/hexo/exam
drwxr-xr-x. 2 root root 4096 4月  20 18:21 Linux_Test
-rw-r--r--. 1 root root    0 4月  22 15:08 ls_out.txt
lrwxrwxrwx. 1 root root   11 3月  22 02:43 share -> /mnt/files/
drwxr-xr-x. 2 root root 4096 4月  12 02:29 Shell_Test
::::::::::::::
ls_sort.txt
::::::::::::::
date_test.txt
ls_out.txt
--More--(34%)

```


ls -l | more    指定0个文件
less  shudu.c

# 打印文件内容的cat和od命令
# 显示文件的头部和尾部的命令head和tail
