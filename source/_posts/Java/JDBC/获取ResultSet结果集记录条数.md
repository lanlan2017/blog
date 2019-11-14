---
title: 获取ResultSet结果集记录条数
categories: 
  - Java
  - JDBC
date: 2018-12-05 00:18:01
updated: 2019-11-05 10:32:11
abbrlink: 127223bf
---
- [问题描述](/blog/127223bf/#问题描述)
- [参考链接](/blog/127223bf/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>


<!--
ResultSet表示数据库结果集的数据表，通常通过执行查询数据库的语句生成。 
ResultSet 对象具有指向其当前数据行的`光标`。在最开始的时候，光标被置于第一行`之前`。next() 方法将光标移动到下一行；next()方法在 ResultSet 对象没有下一行时返回 false，所以可以在 while 循环中使用它来迭代结果集。 
-->
## 问题描述 ##
ResultSet 并没有提供类似size() 方法或者length属性的东西，让我们知道ResultSet中有多少个元素，不过在 JDBC 中，ResultSet的`行号是从1开始`，所以最后一行的行号,就等于ResultSet中元素的个数:
```java
rs.last();// 移动到最后
System.out.println(rs.getRow());// 获得结果集长度
```
## 参考链接 ##
[https://blog.csdn.net/DrifterJ/article/details/17720271](https://blog.csdn.net/DrifterJ/article/details/17720271)]([https://blog.csdn.net/DrifterJ/article/details/17720271](https://blog.csdn.net/DrifterJ/article/details/17720271)
[https://blog.csdn.net/qq_21808961/column/info/24405/2](https://blog.csdn.net/qq_21808961/column/info/24405/2)
>原文链接: [获取ResultSet结果集记录条数](https://lanlan2017.github.io/blog/127223bf/)
