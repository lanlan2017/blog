---
title: 普通项目如何安全升级成Maven项目
categories: 
  - Java
  - Java EE
  - 环境搭建
abbrlink: 34b76da1
date: 2021-09-01 16:52:26
updated: 2022-04-04 00:51:44
---
# 问题描述
我之前的项目用到的jar包都放在lib目录中，最近我打算升级成Maven项目。

但是直接在Maven中填写依赖时，运行时出现了问题。经过调试，我发现这是由于有些jar包没有被Maven导入造成的。

但是用到的jar包挺多的，密密麻麻的，人眼是很难查找到底丢失了那个jar包。

# 解决方案
## 1、先不用Maven管理jar包
先不使用Maven导入jar包，直接从原来项目的lib目录中复制全部的jar包到，Maven项目的lib目录中。

这样是可以完美运行的，和原来的项目一样。

## 2、逐步替换jar包
成功运行之后，把Maven项目的lib中的jar包逐个替换成pom依赖即可。
