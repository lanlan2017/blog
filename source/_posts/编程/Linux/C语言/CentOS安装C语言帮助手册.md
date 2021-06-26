---
title: CentOS安装C语言帮助手册
categories:
  - 编程
  - Linux
  - C语言
abbrlink: '19662e41'
date: 2021-06-23 13:53:12
updated: 2021-06-23 13:53:12
---
# CentOS安装C语言帮助手册
CentOS系统有可能默认没有安装C语言帮助手册，man一个函数时会找不到帮助文件，用下面的命令安装：
```
yum install man-pages.noarch
```
## centos没有c语言的帮助手册
```
[root@localhost Linux命令风格；文件系统]# man malloc
没有 malloc 的手册页条目
[root@localhost Linux命令风格；文件系统]# 
```
## 安装.noarch版本的man-pages
```
[root@localhost Linux命令风格；文件系统]# yum install man-pages.noarch
已加载插件：fastestmirror
Determining fastest mirrors
epel/aarch64/metalink                                                                                                                | 8.8 kB  00:00:00     
 * epel: mirrors.bfsu.edu.cn
base                                                                                                                                 | 3.6 kB  00:00:00     
centos-7-aarch64                                                                                                                     | 3.6 kB  00:00:00     
extras                                                                                                                               | 2.9 kB  00:00:00     
nodesource                                                                                                                           | 2.5 kB  00:00:00     
updates                                                                                                                              | 2.9 kB  00:00:00     
(1/2): extras/7/aarch64/primary_db                                                                                                   | 245 kB  00:00:01     
(2/2): updates/7/aarch64/primary_db                                                                                                  | 1.2 MB  00:00:05     
正在解决依赖关系
--> 正在检查事务
---> 软件包 man-pages.noarch.0.3.53-5.el7 将被 安装
--> 解决依赖关系完成

依赖关系解决

============================================================================================================================================================
 Package                                架构                                版本                                    源                                 大小
============================================================================================================================================================
正在安装:
 man-pages                              noarch                              3.53-5.el7                              base                              5.0 M

事务概要
============================================================================================================================================================
安装  1 软件包

总下载量：5.0 M
安装大小：4.6 M
Is this ok [y/d/N]: y
Downloading packages:
man-pages-3.53-5.el7.noarch.rpm                                                                                                      | 5.0 MB  00:00:21     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  正在安装    : man-pages-3.53-5.el7.noarch                                                                                                             1/1 
  验证中      : man-pages-3.53-5.el7.noarch                                                                                                             1/1 

已安装:
  man-pages.noarch 0:3.53-5.el7                                                                                                                             

完毕！
[root@localhost Linux命令风格；文件系统]#
```
## 验证
### man malloc
```
MALLOC(3)                                                       Linux Programmer's Manual                                                      MALLOC(3)

NAME
       malloc, free, calloc, realloc - allocate and free dynamic memory

SYNOPSIS
       #include <stdlib.h>

       void *malloc(size_t size);
       void free(void *ptr);
       void *calloc(size_t nmemb, size_t size);
       void *realloc(void *ptr, size_t size);

DESCRIPTION
       The  malloc()  function  allocates  size bytes and returns a pointer to the allocated memory.  The memory is not initialized.  If size is 0, then
       malloc() returns either NULL, or a unique pointer value that can later be successfully passed to free().
......
```
### man 3 printf
```
PRINTF(3)                                                       Linux Programmer's Manual                                                      PRINTF(3)

NAME
       printf, fprintf, sprintf, snprintf, vprintf, vfprintf, vsprintf, vsnprintf - formatted output conversion

SYNOPSIS
       #include <stdio.h>

       int printf(const char *format, ...);
       int fprintf(FILE *stream, const char *format, ...);
       int sprintf(char *str, const char *format, ...);
       int snprintf(char *str, size_t size, const char *format, ...);

       #include <stdarg.h>

       int vprintf(const char *format, va_list ap);
       int vfprintf(FILE *stream, const char *format, va_list ap);
       int vsprintf(char *str, const char *format, va_list ap);
       int vsnprintf(char *str, size_t size, const char *format, va_list ap);

   Feature Test Macro Requirements for glibc (see feature_test_macros(7)):

       snprintf(), vsnprintf():
           _BSD_SOURCE || _XOPEN_SOURCE >= 500 || _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L;
           or cc -std=c99

DESCRIPTION
......
```

# 参考资料
<https://blog.csdn.net/yasi_xi/article/details/8658333>
<https://blog.csdn.net/caiyaodeng/article/details/45291905>