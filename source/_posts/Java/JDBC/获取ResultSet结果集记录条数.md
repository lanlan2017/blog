---
title: 获取ResultSet结果集记录条数
categories: 
  - Java
  - JDBC
date: 2018-12-05 00:18:01
updated: 2019-12-16 02:40:59
abbrlink: 127223bf
---
<div id='my_toc'><a href="/blog/127223bf/#问题描述" class="header_2">问题描述</a><br><a href="/blog/127223bf/#参考链接" class="header_2">参考链接</a><br></div>
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
ResultSet表示数据库结果集的数据表，通常通过执行查询数据库的语句生成。 
ResultSet 对象具有指向其当前数据行的`光标`。在最开始的时候，光标被置于第一行`之前`。next() 方法将光标移动到下一行；next()方法在 ResultSet 对象没有下一行时返回 false，所以可以在 while 循环中使用它来迭代结果集。 
## 问题描述 ##
ResultSet 并没有提供类似size() 方法或者length属性的东西，让我们知道ResultSet中有多少个元素，不过在 JDBC 中，ResultSet的`行号是从1开始`，所以最后一行的行号,就等于ResultSet中元素的个数:
```java
rs.last();// 移动到最后
System.out.println(rs.getRow());// 获得结果集长度
```
## 参考链接 ##
[https://blog.csdn.net/DrifterJ/article/details/17720271](https://blog.csdn.net/DrifterJ/article/details/17720271)]([https://blog.csdn.net/DrifterJ/article/details/17720271](https://blog.csdn.net/DrifterJ/article/details/17720271)
[https://blog.csdn.net/qq_21808961/column/info/24405/2](https://blog.csdn.net/qq_21808961/column/info/24405/2)
