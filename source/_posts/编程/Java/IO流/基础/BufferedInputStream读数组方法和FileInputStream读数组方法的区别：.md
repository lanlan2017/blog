---
title: BufferedInputStream读数组方法和FileInputStream读数组方法的区别：
categories: 
  - Java
  - Java IO流
  - 基础
abbrlink: d4b540e
date: 2018-08-22 14:32:39
updated: 2022-04-04 00:51:44
---
# 区别
- `BufferedInputStream`读数组方法，尽量读满整个数组，然后再返回，所以可能会多次读取，才返回。
- 而`FileInputStream`的读数组方法只会读取一次，读到多少就返回多少。读取一次，就返回一次。不管数组有没有读满。
