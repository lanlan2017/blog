---
title: 解决MySQL错误 Every derived table must have its own alias
categories:
  - 编程
  - MySQL
  - debug
abbrlink: 85e5e68e
date: 2019-10-18 13:51:08
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/85e5e68e/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/85e5e68e/#解决方案" class="header_2">解决方案</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 问题描述 ##
今天使用如下的子查询时:
```sql
select dept_name,avg_salary
from ( select dept_name, avg(salary) as avg_salary
    from instructor 
    group by dept_name
)
where avg_salary>42000;
```
报了`:Every derived table must have its own alias`这个错误
```cmd
mysql> select dept_name,avg_salary
from ( select dept_name, avg(salary) as avg_salary
    from instructor 
    group by dept_name
)
where avg_salary>42000;
1248 - Every derived table must have its own alias
```
## 解决方案 ##
`Every derived table must have its own alias`翻译成中文就是:**每个派生表都必须有自己的别名**
所以给子查询取一个别名即可:
```sql
select dept_name,avg_salary
from ( select dept_name, avg(salary) as avg_salary
    from instructor 
    group by dept_name
) as I
where avg_salary>42000;
```
这样就能正常执行了:
```cmd
mysql> select dept_name,avg_salary
from ( select dept_name, avg(salary) as avg_salary
    from instructor 
    group by dept_name
) as I
where avg_salary>42000;
+------------+--------------+
| dept_name  | avg_salary   |
+------------+--------------+
| Biology    | 72000        |
| Comp. Sci. | 77333.333333 |
| Elec. Eng. | 80000        |
| Finance    | 85000        |
| History    | 61000        |
| Physics    | 91000        |
+------------+--------------+
6 rows in set
```
