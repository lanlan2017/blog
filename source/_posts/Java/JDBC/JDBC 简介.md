---
title: JDBC 简介
categories: 
  - Java
  - JDBC
date: 2018-12-05 00:25:23
updated: 2019-10-30 13:53:55
abbrlink: aa45691f
---
- [JDBC 简介](/blog/html/aa45691f/#JDBC-简介)
- [JDBC编程步骤](/blog/html/aa45691f/#JDBC编程步骤)
    - [加载驱动程序](/blog/html/aa45691f/#加载驱动程序)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

## JDBC 简介 ##
JDBC全称为 `Java Data Base Connectivity` (java数据库连接)。JDBC是一种用于执行SQL语句的Java API，可以为多种关系数据库提供统一访问。
有了JDBC API，就不必为访问mysql数据库专门写一个程序，为访问Oracle数据库又专门写一个程序，或为访问sql server数据库又编写另一个程序等等，程序员只需用JDBC API写一个程序就够了。
## JDBC编程步骤 ##
- 加载驱动程序 
- 获取数据库连接
- 创建Statemant对象
### 加载驱动程序 ##
每个数据库都会提供JDBC的驱动开发包，直接把JDBC操作所需要的开发包(一般为.jar或.zip)添加到eclipse buildpath中即可。

>原文链接: [JDBC 简介](https://lanlan2017.github.io/blog/aa45691f/)
