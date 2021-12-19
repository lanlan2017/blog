---
title: Type interface mapper.StudentMapper is not known to the MapperRegistry
categories: 
  - 编程
  - Java
  - Mybatis
  - Debug
date: 2020-08-25 02:09:13
updated: 2021-03-18 02:43:27
abbrlink: 2b1c3f5b
---
# 错误提示

<details><summary>展开/折叠</summary><pre>
org.apache.ibatis.binding.BindingException: Type interface mapper.StudentMapper is not known to the MapperRegistry.
	at org.apache.ibatis.binding.MapperRegistry.getMapper(MapperRegistry.java:47)
	at org.apache.ibatis.session.Configuration.getMapper(Configuration.java:779)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.getMapper(DefaultSqlSession.java:291)
	at test.OneToManyTest3.main(OneToManyTest3.java:14)
</pre></details>

# 原因
没有在mybatis根配置文件中注册mapper文件
# 解决方案
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd" >
<configuration>
    <properties resource="db.properties">
    </properties>
    <settings>
        <setting name="logImpl" value="LOG4J" />
    </settings>
    <environments default="mysql">
        <environment id="mysql">
            <transactionManager type="JDBC"></transactionManager>
            <dataSource type="POOLED">
                <property name="driver" value="${driver}" />
                <property name="url" value="${url}" />
                <property name="username" value="${username}" />
                <property name="password" value="${password}" />
            </dataSource>
        </environment>
    </environments>
</configuration>
```
