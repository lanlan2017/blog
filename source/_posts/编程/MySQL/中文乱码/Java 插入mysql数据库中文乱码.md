---
title: Java 插入mysql数据库中文乱码
categories: 
  - 编程
  - MySQL
  - 中文乱码
date: 2018-12-03 20:49:58
updated: 2021-03-20 10:18:45
abbrlink: 84e4b0d4
---
# 问题描述
我在使用java向mysql数据库中插入信息的时候，发现中文全部变成了诡异的问号`?`。中文乱码了，但是我检查了，数据库的字符集，校对集都是正常的。java项目用的编码也和数据库的编码一样。但是不知道怎么回事，输入就是乱码。
# 解决方案
在URL中指定数据库编码就行了:注意数据库和后面的配置使用`?`隔开。
```
jdbc:mysql:///usersinfo?characterEncoding=gbk
```
