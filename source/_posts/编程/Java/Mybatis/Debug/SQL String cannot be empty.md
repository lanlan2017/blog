---
title: SQL String cannot be empty
categories: 
  - 编程
  - Java
  - Mybatis
  - Debug
date: 2020-08-27 06:01:25
updated: 2021-03-18 02:43:27
abbrlink: d4015775
---
# 错误提示
<pre>
Exception in thread "main" org.apache.ibatis.exceptions.PersistenceException: 
&#35;&#35;&#35; Error querying database.  Cause: java.sql.SQLException: <mark>SQL String cannot be empty</mark>
&#35;&#35;&#35; The error may exist in <mark>mapper/UserMapper.xml</mark>
&#35;&#35;&#35; The error may involve <mark>mapper.UserMapper.selectUserById</mark>
&#35;&#35;&#35; The error occurred while executing a query
&#35;&#35;&#35; SQL: 
&#35;&#35;&#35; Cause: java.sql.SQLException: SQL String cannot be empty
	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:149)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectOne(DefaultSqlSession.java:76)
	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:87)
	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:57)
	at com.sun.proxy.$Proxy5.selectUserById(Unknown Source)
	at test.ManyToManyTest2.main(ManyToManyTest2.java:16)
    ......
</pre>

# 分析
`mapper/UserMapper.xml`文件中id为`mapper.UserMapper.selectUserById`的这条`select`语句,忘了写`SQL`语句:

<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;
&lt;mapper namespace="mapper.UserMapper"&gt;
    <mark>&lt;select id="selectUserById" parameterType="int"
        resultMap="userMap"&gt;
    &lt;/select&gt;</mark>
    &lt;resultMap type="domain.User" id="userMap"&gt;
        &lt;id property="id" column="id" /&gt;
        &lt;result property="userName" column="username" /&gt;
        &lt;result property="loginName" column="loginname" /&gt;
        &lt;result property="password" column="password" /&gt;
        &lt;result property="phone" column="phone" /&gt;
        &lt;result property="address" column="address" /&gt;
        &lt;collection property="orders" javaType="ArrayList"
            ofType="domain.Order" column="id" select="mapper.OrderMapper.selectOrdersByUserId"&gt;
            &lt;id property="id" column="id" /&gt;
            &lt;result property="code" column="code" /&gt;
            &lt;result property="total" column="total" /&gt;
        &lt;/collection&gt;
    &lt;/resultMap&gt;
&lt;/mapper&gt;
</pre>

# 解决方案
将`SQL`语句写上即可:
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;
&lt;mapper namespace="mapper.UserMapper"&gt;
    <mark>&lt;select id="selectUserById" parameterType="int"
        resultMap="userMap"&gt;
        <strong>select * from tb_user where id=&#35;{id}</strong>
    &lt;/select&gt;</mark>
    &lt;resultMap type="domain.User" id="userMap"&gt;
        &lt;id property="id" column="id" /&gt;
        &lt;result property="userName" column="username" /&gt;
        &lt;result property="loginName" column="loginname" /&gt;
        &lt;result property="password" column="password" /&gt;
        &lt;result property="phone" column="phone" /&gt;
        &lt;result property="address" column="address" /&gt;
        &lt;collection property="orders" javaType="ArrayList"
            ofType="domain.Order" column="id" select="mapper.OrderMapper.selectOrdersByUserId"&gt;
            &lt;id property="id" column="id" /&gt;
            &lt;result property="code" column="code" /&gt;
            &lt;result property="total" column="total" /&gt;
        &lt;/collection&gt;
    &lt;/resultMap&gt;
&lt;/mapper&gt;
</pre>
