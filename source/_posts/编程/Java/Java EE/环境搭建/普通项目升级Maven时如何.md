---
title: 普通项目升级Maven时如何
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
但是运行时出现了问题。有些jar包。没有在Maven中导入。
但是用到的jar包挺多的，很难查找到底丢失了那个jar包。

# 解决方案
## 先不用Maven管理jar包
先不适用Maven导入jar包，直接从原来项目的lib目录中复制全部的jar包到，Maven项目的lib目录中。
这样是可以完美运行的，和原来的项目一样。
## 逐步替换jar包
成功运行之后，再逐步把Maven项目的lib中的jar包替换成pom依赖即可。
