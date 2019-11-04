---
title: 最新版MySQL数据库驱动的问题
categories: 
  - MySQL
  - debug
date: 2019-10-23 15:59:21
updated: 2019-10-30 11:55:40
abbrlink: 17349c5f
---
- [最新版MySQL数据库驱动的问题](/blog/html/17349c5f/#最新版MySQL数据库驱动的问题)
    - [问题1 驱动名称不对](/blog/html/17349c5f/#问题1-驱动名称不对)
        - [解决方案](/blog/html/17349c5f/#解决方案)
    - [问题2 没有指定时区](/blog/html/17349c5f/#问题2-没有指定时区)
        - [解决方案](/blog/html/17349c5f/#解决方案)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 最新版MySQL数据库驱动的问题 #
## 问题1 驱动名称不对 ##
```cmd
Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary.
```
### 解决方案 ###
将数据库驱动名称`com.mysql.jdbc.Driver`改成`com.mysql.cj.jdbc.Driver`.
## 问题2 没有指定时区 ##
```cmd
SQLException : java.sql.SQLException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the serverTimezone configuration property) to use a more specifc time zone value if you want to utilize time zone support.
```
### 解决方案 ###
在
```
jdbcUrl=jdbc:mysql://localhost:3306/spring
```
后面加上`?serverTimezone=UTC`,如下所示:
```
jdbcUrl=jdbc:mysql://localhost:3306/spring?serverTimezone=UTC
```
**如果有多个查询字符串要用&隔开,并且&要转义成`&amp;`**
但如果你的jdbcUrl类似下面：
```
jdbcUrl=jdbc:mysql://localhost:3306/spring?serverTimezone=UTC&characterEncoding=utf-8
```
就是有多个`params`的时候需要以&分开，但&要改为`&amp;`  如下：
```
jdbcUrl=jdbc:mysql://localhost:3306/spring?serverTimezone=UTC&amp;characterEncoding=utf-8
```

>原文链接: [最新版MySQL数据库驱动的问题](https://lanlan2017.github.io/blog/17349c5f/)