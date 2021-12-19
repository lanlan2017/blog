---
title: Termux使用 清华安装源
categories: 
  - 编程
  - Linux
  - Termux
date: 2019-11-30 17:48:40
updated: 2021-03-20 10:11:38
abbrlink: 100bdc9a
---
# 更换国内源
更换`Termux`清华大学源,加快软件包下载速度. 
## 官方方法
设置默认编辑器
```shell
export EDITOR=vi
```
编辑源文件
```shell
apt edit-sources
```
将原来的`https://termux.net`官方源替换为`http://mirrors.tuna.tsinghua.edu.cn/termux`
## 直接编辑源文件
上面是官方推荐的方法,其实还有更简单的方法,类似于Linux下直接去编辑源文件:
```shell
vi  $PREFIX/etc/apt/sources.list
```
## 修改效果
```shell
u0_a391@localhost~ cat $PREFIX/etc/apt/sources.list
# The main termux repository:
# deb https://termux.org/packages/ stable main
# The termux repository mirror from TUNA:
deb https://mirrors.tuna.tsinghua.edu.cn/termux stable main

```
