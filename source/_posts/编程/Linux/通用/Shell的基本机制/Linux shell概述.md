---
title: Linux shell概述
categories: 
  - Linux
  - 通用
  - Shell的基本机制
abbrlink: d37dc0ec
date: 2021-06-26 14:22:30
updated: 2022-04-04 00:51:45
---
# Linux shell概述
## Unix的shell
### shell种类
- `B-shell`：由Stephen R. Bourne(1944-)在贝尔实验室开发，是最早被普遍认可的shell，早期UNIX的标准shell， /bin/sh,
- `C-shell`: /bin/csh 由加利福尼亚大学的William N. Joy(也叫Bill Joy)在20世纪70年代开发，最初用在BSD2.0。Joy在1982年与他人共同创办了Sun Microsystems
- `K-shell`: Korn shell，/bin/ksh 贝尔实验室的David Korn在1986年开发。是B-shell的超集，支持带类型的变量，数组
- `/bin/bash`：Bourne Again shell，是Linux上的标准shell， 兼容Bourne Shell，扩展了B-shell，吸收了C shell的某特点。交互式使用时命令行编辑非常方便
- 管理员在创建用户时，设置了用户的登录shell

## Shell的功能
- shell是命令解释器
- 文件名替换，命令替换，变量替换
- 历史替换，别名替换
- 流程控制的内部命令 (内部命令和外部命令)

## Shell的特点
- 主要用途：**批处理，执行效率比算法语言低**
- shell编程风格和C语言等算法语言的区别
- shell是面向命令处理的语言，提供的流程控制结构通过对一些内部命令的解释实现
- 如同C语言设计思路一样，shell本身设计得非常精炼，但是它提供了灵活的机制（策略与机制相分离）
  - shell许多灵活的功能，通过shell替换实现
  - 例如：流程控制所需的条件判断，四则运算，都由shell之外的命令完成

## 理解Unix的shell
### 学习bash的目的
- 交互方式下：熟习shell的替换机制、转义机制，掌握循环等流程控制，可以编写复合命令
- 非交互方式：编写shell脚本程序，把一系列的操作，编纂成一个脚本文件，批量处理

### 主要内容
- 重定向与管道
- 方便交互使用的功能：历史替换与别名替换
- shell变量
- shell的变量替换，命令替换，文件名替换
- 元字符，如：单引号，双引号
- 流程控制
- 子程序

