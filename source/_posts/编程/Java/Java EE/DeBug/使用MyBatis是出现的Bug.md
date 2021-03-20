---
title: 使用MyBatis是出现的Bug
categories: 
  - 编程
  - Java
  - Java EE
  - DeBug
date: 2019-06-09 17:26:12
updated: 2020-04-11 09:21:19
abbrlink: 5aecc643
---
<div id='my_toc'><a href="/blog/5aecc643/#Type-interface-mapper-UserMapper-is-not-known-to-the-MapperRegistry" class="header_1">Type interface mapper.UserMapper is not known to the MapperRegistry.</a>&nbsp;<br><a href="/blog/5aecc643/#分1-没有引入Mapper-xml" class="header_2">分1:没有引入Mapper.xml</a>&nbsp;<br><a href="/blog/5aecc643/#解决" class="header_3">解决</a>&nbsp;<br><a href="/blog/5aecc643/#分析2-没有引入Mapper接口路径" class="header_2">分析2:没有引入Mapper接口路径</a>&nbsp;<br><a href="/blog/5aecc643/#解决" class="header_3">解决</a>&nbsp;<br><a href="/blog/5aecc643/#总结" class="header_2">总结</a>&nbsp;<br><a href="/blog/5aecc643/#Table-'mybatis-tb_calzz'-doesn't-exist" class="header_1">Table 'mybatis.tb_calzz' doesn't exist</a>&nbsp;<br><a href="/blog/5aecc643/#错误提示" class="header_2">错误提示</a>&nbsp;<br><a href="/blog/5aecc643/#分析" class="header_2">分析</a>&nbsp;<br><a href="/blog/5aecc643/#Error-querying-database-Query-was-empty" class="header_1">Error querying database. ...Query was empty</a>&nbsp;<br><a href="/blog/5aecc643/#原因" class="header_2">原因</a>&nbsp;<br><a href="/blog/5aecc643/#解决" class="header_2">解决</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Type interface mapper.UserMapper is not known to the MapperRegistry. #
```cmd
org.apache.ibatis.binding.BindingException: Type interface mapper.UserMapper is not known to the MapperRegistry.
    at org.apache.ibatis.binding.MapperRegistry.getMapper(MapperRegistry.java:47)
    at org.apache.ibatis.session.Configuration.getMapper(Configuration.java:745)
    at org.apache.ibatis.session.defaults.DefaultSqlSession.getMapper(DefaultSqlSession.java:292)
    at test.ManyToManyTest.main(ManyToManyTest.java:18)
```
## 分1:没有引入Mapper.xml ##
这是因为没有在`mybatis-config.xml`中引入`UserMapper.xml.`
### 解决 ###
在`mybatis`根配置文件`mybatis-config.xml`中,引入`UserMapper.xml`即可:`<mapper resource="mapper/UserMapper.xml"/>`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd" >
<configuration>
    ......
    <mappers>
        <mapper resource="mapper/UserMapper.xml"/>
    </mappers>
    ......
</configuration>
```
## 分析2:没有引入Mapper接口路径 ##
### 解决 ###
引入`StudentMapper.java`接口即可:
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<!-- 该配置文件包含对 MyBatis 系统的核心设置 -->
<configuration>
    ......
    <mappers>
        <mapper class="mapper.ClazzMapper"/>
        <mapper class="mapper.StudentMapper"/>
    </mappers>
    ......
</configuration>
```
## 总结 ##
引入`Mapper.xml`映射文件,使用`resource`属性,而引入接口则使用`class`属性.
# Table 'mybatis.tb_calzz' doesn't exist #
## 错误提示 ##
```cmd
DEBUG [main] ==>  Preparing: select * from tb_student where id=? 
DEBUG [main] ==> Parameters: 1(Integer)
DEBUG [main] ====>  Preparing: select * from tb_calzz where id=? 
DEBUG [main] ====> Parameters: 1(Integer)
org.apache.ibatis.exceptions.PersistenceException: 
### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table 'mybatis.tb_calzz' doesn't exist
### The error may exist in mapper/ClazzMapper.java (best guess)
### The error may involve mapper.ClazzMapper.selectClazzById-Inline
### The error occurred while setting parameters
### SQL: select * from tb_calzz where id=?
```
## 分析 ##
提示很明显,说`mybatis`数据库中不存在`tb_calzz`这个表.这种情况:
- 要么是这个表不存在,如果是这样,创建进入数据库,创建这个表即可。
- 要么是`SQL`中这个表名字打错了,这种情况,修改`SQL`语句,把表名改为正确的表名即可.

# Error querying database. ...Query was empty #
```cmd
org.apache.ibatis.exceptions.PersistenceException: 
### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Query was empty
### The error may exist in mapper/UserMapper.xml
### The error may involve mapper.UserMapper.selectUserById-Inline
### The error occurred while setting parameters
### SQL: 
```
## 原因 ##
映射文件`mapper/UserMapper.xml`中`id`为`selectUserById`的`select`标签中没有写`SQL`语句。
## 解决 ##
写上`SQL`语句即可。
