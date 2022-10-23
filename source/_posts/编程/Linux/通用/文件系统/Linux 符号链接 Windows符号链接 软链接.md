---
title: Linux 符号链接 Windows符号链接 软链接
categories: 
  - 编程
  - Linux
  - 通用
  - 文件系统
abbrlink: 72e4a8f6
date: 2021-06-20 17:07:09
updated: 2022-10-23 21:58:17
---
# 符号链接
## 符号链接也叫软链接
- 用特殊文件“符号链接文件”来实现
- 文件中仅包括了一个路径名
- 命令ln -s和ls -l

```
ln -s users_on sym.link
ls -l sym.link
lrwxrwxrwx 1 guest other 8 Jul 26 16:57 sym.link->users_on
```
- 类型为l，大小为8字节，文件中只存放users_on字符串
- 文件的最后一次写时间以后不再变化
- 一旦建立了符号链接，删除操作**删除的是符号链接文件**，其它所有操作都将访问符号链接所引用的文件

## 符号链接的实现
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure/5.png)

## 符号链接中的相对路径
若符号链接包含绝对路径名，引用绝对路径名
若符号链接包含相对路径名，是相对于符号链接文件的位置(不是相对于调用进程的当前工作目录)

设当前目录（bash进程的当前目录）为d
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure/6.png)

```
ln -s  d1/dlb d1/dx
```
在d1下新建文件dx
访问d1/dx实际访问d1/d1/d1b

# 硬链接与符号链接的比较
## 硬链接
- 在数据结构层次上实现
- **只适用于文件，不适用于目录**
- 不同文件系统之间也不行
- 硬链接能够完成的功能软链接可以做到

## 符号链接
- 在算法软件上实现
- 硬链接能够完成的功能软链接都可以做到
- **适用于目录，也适用于不同的文件系统**
- 同硬链接相比要占用操作系统内核的一部分开销
- 循环式符号链接，以及处理方法（解析路径时设置符号链接解析计数器）

## Windows符号链接 软链接 
https://blog.csdn.net/x534119219/article/details/79111936

### mklink帮助文档
```
C:\Users\my>mklink /?
创建符号链接。

MKLINK [[/D] | [/H] | [/J]] Link Target

        /D      创建目录符号链接。默认为文件
                符号链接。
        /H      创建硬链接而非符号链接。
        /J      创建目录联接。
        Link    指定新的符号链接名称。
        Target  指定新链接引用的路径
                (相对或绝对)。

C:\Users\my>
```
### 示例 给目录创建符号链接

在`D:\网络共享`目录下，给`G:\dev2\idea_workspace\MyJavaTools\runable`目录创建一个同名的符号链接：

```
C:\Users\my>mklink /j D:\网络共享\runable G:\dev2\idea_workspace\MyJavaTools\runable
为 D:\网络共享\runable <<===>> G:\dev2\idea_workspace\MyJavaTools\runable 创建的联接

C:\Users\my>
```