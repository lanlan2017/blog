---
title: Linux 打包与压缩
categories:
  - 编程
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: 96be915a
date: 2021-06-15 22:29:29
updated: 2021-06-15 22:29:29
---
# tar:文件归档
## 功能
tar命令最早为顺序访问的磁带机设备而设计的(Tape ARchive，磁带归档)，用于保留和恢复磁带上的文件
## 命令语法
```
tar ctxv[f device]] file-list
```
### 功能字母
选项第一字母指定要执行的操作，是必需的
常用的功能字幕如下表所示

|tar第一个功能字母|描述|
|:---|:---|
|c|Create创建新磁带。从头开始写，以前存于磁带上的数据会被覆盖掉|
|t|Table列表。磁带上的文件名列表，当不指定文件名时，将列出所有的文件|
|x|eXtract抽取。从磁带中抽取指定的文件。当不指定文件名时，抽取所有文件|

### 非功能字母
除功能字母外的其它选项

|tar非功能字母|描述|
|:---|:---|
|v|Verbose冗长。每处理一个文件，就打印出文件的文件名，并在该名前冠|
|以功能字母|
|**f File**|。指定设备文件名|
|z|采用压缩格式(gzip算法）|
|j|采用压缩格式(bzip2算法)|


## tar的使用：磁带机操作
```
tar cvf /dev/rct0 .
```
将当前目录树备份到设备/dev/rct0中，圆点目录是当前目录
```
tar tvf /dev/rct0
```
查看磁带设备/dev/rct0上的文件目录
```
tar xvf /dev/rct0
```
将磁带设备/dev/rct0上的文件恢复到文件系统中

## tar的使用：文件打包
```
tar cvf my.tar *.[ch] makefile
```
指定普通文件代替设备文件，将多个文件或目录树存储成一个文件。这是UNIX世界早期最常用的文件和目录打包工具
这一命令危险的误操作是：
```
tar cvf *.[ch] makefile
```
漏掉了功能字母`f`必需的“设备文件名”，按照shell对文件名的展开规则，会覆盖掉现存的排位第一的文件
例如shell会把星号替换成如下命令：
```
tar cvf a1.c a2.c ab.h makefile
```
## tar的使用：目录打包
设work是一个有多个层次的子目录
### 打包目录为.tar
```
tar cvf work.tar work
```
### 打包目录为.tar.gz
```
tar cvzf work.tar.gz work
```
### 他报目录为.tar.bz2
```
tar cvjf work.tar.bz2 work
```
### 查看.tar文件中的文件目录
查看归档文件中的文件目录：
```
tar tvf work.tar.gz   
```
### 解压.tar文件
从归档文件中恢复目录树：
```
tar xvf work.tar.gz
```
注意：文件名后缀.tar,.tar.gz,.tar.bz2仅仅是惯例，不是系统级强制要求

# 文件压缩和解压缩相关命令

gzip/gunzip    (执行速度快）
bzip2/bunzip2   (占用较多的CPU时间）
