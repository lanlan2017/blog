---
title: Linux 硬链接
categories:
  - 编程
  - Linux
  - 通用
  - 文件系统
abbrlink: 753ee3c2
date: 2021-06-20 16:31:30
updated: 2021-06-20 16:31:30
---
# 硬连接
- 目录表由目录项构成，目录项是一个“`文件名-i节点号`”对
- 根据文件系统的存储结构，可以在同一目录或者不同目录中的两个目录项，有相同的i节点号
- 每个目录项指定的“`文件名-i节点号`”映射关系，叫做1个硬连接
- 硬连接数目(link数)：**同一i节点被目录项引用的次数**

# ln: 普通文件的硬连接
创建一个文件的硬链接：
```
[root@localhost Linux命令风格；文件系统]# ls
useEnv  useEnv.c
[root@localhost Linux命令风格；文件系统]# ln useEnv.c useEnvC
[root@localhost Linux命令风格；文件系统]# ls
useEnv  useEnv.c  useEnvC
[root@localhost Linux命令风格；文件系统]# 
```
查看文件以及文件的硬链接的详细信息：
```
[root@localhost Linux命令风格；文件系统]# ls -l
总用量 24
-rwxr-xr-x. 1 root root 71024 6月  18 22:19 useEnv
-rw-r--r--. 2 root root   239 6月  18 22:19 useEnv.c
-rw-r--r--. 2 root root   239 6月  18 22:19 useEnvC
[root@localhost Linux命令风格；文件系统]# 
```
可以发现useEnv.c和useEnvC的前几项都完全相同。而useEnv.c和useEnvC的link数都是2.
查看文件的i节点：
```
[root@localhost Linux命令风格；文件系统]# ls -i
524413 useEnv  524446 useEnv.c  524446 useEnvC
[root@localhost Linux命令风格；文件系统]# 
```
可以发现文件useEnv.c和useEnvC的i节点都相同。
**useEnv.c与useEnvC同时存在时，地位完全平等**，硬链接创建完毕后，就无法知道哪个文件是先创建的，哪个文件是后创建的。
删除useEnv.c文件，
```
[root@localhost Linux命令风格；文件系统]# rm useEnv.c 
rm：是否删除普通文件 "useEnv.c"？y
[root@localhost Linux命令风格；文件系统]# ls -l
总用量 20
-rwxr-xr-x. 1 root root 71024 6月  18 22:19 useEnv
-rw-r--r--. 1 root root   239 6月  18 22:19 useEnvC
[root@localhost Linux命令风格；文件系统]# 
```
可以发现则useEnvC仍存在但link数减1。
只有一个文件的link数减到0时，该文件的磁盘空间才会被清理掉。


硬连接，只限于**同一文件系统中**的**普通文件**

# 目录表的硬连接
不允许对目录用ln命令建立硬连接
一般来说,目录的link数=直属子目录数+2

![](https://gitee.com/XiaoLan223/images/raw/master/Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure/3.png)

目录表的硬连接示意图：
![](https://gitee.com/XiaoLan223/images/raw/master/Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure/4.png)

# 硬链接的作用
可以对同一个文件起不同的文件名

一个文件位于另一个个文件系统中，不同的文件系统的i节点不能通用。
也就是硬链接不能跨越文件系统。