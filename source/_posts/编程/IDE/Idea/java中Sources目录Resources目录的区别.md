---
title: java中Sources目录Resources目录的区别
categories: 
  - IDE
  - Idea
abbrlink: 7ac11fb
date: 2019-12-22 12:58:12
updated: 2022-04-04 00:51:45
---
# 什么是Sources目录
Sources目录**用来存放java文件**.java项目中最常见的Sources目录就是src目录,当打包成jar时,Sources目录下的.java文件会被编译成.class文件.
# 什么是Resources目录
`Resources`目录用来存放程序需要使用的**资源文件**.当打包成`jar`时,会**直接复制`Resources`目录下的所有文件到`jar`包中**,也就是说`Resources`目录下的.`java`文件不会不会被编译成.`class`文件.
所以这个目录可以用来存放一些java模板文件,例如将各种排序算法的java文件放在其中,然后写个程序根据命令行参数,输出这里面的java模板文件。
# 相同点
都会被打包到jar包中.
# 不同点
- `Sources`目录下的.`java`文件会被编译成.`class`文件.
- `Resources`目录下的.`java`文件不会被编译.
