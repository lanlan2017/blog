---
title: A query was run and no Result Maps were found for the Mapped Statement
categories: 
  - Java
  - Mybatis
  - Debug
abbrlink: 50f38d8e
date: 2020-08-25 01:12:01
updated: 2022-04-04 00:51:44
---
# 错误提示

<pre>
Exception in thread "main" org.apache.ibatis.exceptions.PersistenceException: 
&#35;&#35;&#35; Error querying database.  Cause: org.apache.ibatis.executor.ExecutorException:<mark>A query was run and no Result Maps were found for the Mapped Statement 'mapper.StudentMapper.selectStudentsByClazzId'.  It's likely that neither a Result Type nor a Result Map was specified.</mark>
&#35;&#35;&#35; The error may exist in mapper/StudentMapper.xml
&#35;&#35;&#35; The error may involve mapper.StudentMapper.selectStudentsByClazzId
</pre>

# 分析原因
mapper.StudentMapper.selectStudentsByClazzId这条语句没有设置参数和返回值
## 错误代码
```xml /OneToManyTest3/src/mapper/StudentMapper.xml
<select id="selectStudentsByClazzId">
    select * from tb_student
    <where>clazz_id=#{clazz_id}</where>
</select>
```
# 解决方案
给selectStudentsByClazzId语句加上参数和返回值声明:
<pre>
&lt;select id="selectStudentsByClazzId" <mark>parameterType="int"</mark>
    <mark>resultMap="studentMap"</mark>&gt;
    select * from tb_student
    &lt;where&gt;clazz_id=&#35;{clazz_id}&lt;/where&gt;
&lt;/select&gt;
</pre>
