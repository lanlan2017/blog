---
title: Linux 文件的权限
categories: 
  - Linux
  - 通用
  - 文件和目录的权限
abbrlink: 34b03a11
date: 2021-06-23 15:25:38
updated: 2022-04-04 00:51:45
---
# 文件的权限
用于控制**进程**对系统中**文件和目录**的访问
## 权限的三个级别
- 文件主，同组用户，其他用户
- 每个文件有唯一的属主

## 普通文件的权限
- 读、写、可执行
- 不可写文件也可能会被删除

# 两类可执行文件
## 程序文件（可执行文件）
- 二进制的CPU指令集合，满足操作系统规定的格式才可以被加载运行

## 脚本文件：文本文件
- 默认的**解释**程序为`/bin/sh`
- 可以在文件的第一行自行指定解释程序（必须是第一行，`#!`必须是这个文件首先出现的两个字符），例如：
```c
#!/bin/bash 
#!/usr/bin/bc
```
- 解释程序也可以是用户自己编写的应用程序
- 脚本程序运行时，实际上是由解释程序创建了一个进程

`#!`是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。
