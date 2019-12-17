---
title: 最新版MySQL数据库驱动的问题
categories: 
  - MySQL
  - debug
date: 2019-10-23 15:59:21
updated: 2019-12-15 10:01:44
abbrlink: 17349c5f
---
<div id='my_toc'><a href="/blog/17349c5f/#最新版MySQL数据库驱动的问题" class="header_1">最新版MySQL数据库驱动的问题</a><br><a href="/blog/17349c5f/#问题1-驱动名称不对" class="header_2">问题1 驱动名称不对</a><br><a href="/blog/17349c5f/#解决方案" class="header_3">解决方案</a><br><a href="/blog/17349c5f/#问题2-没有指定时区" class="header_2">问题2 没有指定时区</a><br><a href="/blog/17349c5f/#解决方案" class="header_3">解决方案</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

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
