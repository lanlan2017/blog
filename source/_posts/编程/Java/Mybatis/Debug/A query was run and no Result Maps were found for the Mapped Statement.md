---
title: A query was run and no Result Maps were found for the Mapped Statement
categories: 
  - 编程
  - Java
  - Mybatis
  - Debug
date: 2020-08-25 01:12:01
updated: 2021-03-18 02:43:30
abbrlink: 50f38d8e
---
<div id='my_toc'><a href="/blog/50f38d8e/#错误提示" class="header_1">错误提示</a>&nbsp;<br><a href="/blog/50f38d8e/#分析原因" class="header_1">分析原因</a>&nbsp;<br><a href="/blog/50f38d8e/#错误代码" class="header_2">错误代码</a>&nbsp;<br><a href="/blog/50f38d8e/#解决方案" class="header_1">解决方案</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
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
