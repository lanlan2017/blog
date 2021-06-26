---
title: Linux 设定文件和目录的权限
categories:
  - 编程
  - Linux
  - 通用
  - 文件和目录的权限
abbrlink: 975cf8c
date: 2021-06-24 13:32:33
updated: 2021-06-24 13:32:33
---
# 演示：文件的读写权限
```
[root@localhost 验证]# tree -N
.

0 directories, 0 files
[root@localhost 验证]# umask
0022
[root@localhost 验证]# echo "hell world" >newfile.txt
[root@localhost 验证]# ls -l newfile.txt 
-rw-r--r--. 1 root root 11 6月  26 11:52 newfile.txt
[root@localhost 验证]# 
```
创建新文件时，文件的权限受到两方面的影响，一个是umask值，另一个是重定向命令（`>`）的open调用时指定的文件权限。
没有修改权限的文件，依旧可以删除：
