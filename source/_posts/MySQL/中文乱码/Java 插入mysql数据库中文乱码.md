---
title: Java 插入mysql数据库中文乱码
categories: 
  - MySQL
  - 中文乱码
date: 2018-12-03 20:49:58
updated: 2019-11-14 11:39:31
abbrlink: 84e4b0d4
---
<div id='my_toc'>

- [问题描述](/blog/84e4b0d4/#问题描述)
- [解决方案](/blog/84e4b0d4/#解决方案)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

## 问题描述 ##
我在使用java向mysql数据库中插入信息的时候，发现中文全部变成了诡异的问号`?`。中文乱码了，但是我检查了，数据库的字符集，校对集都是正常的。java项目用的编码也和数据库的编码一样。但是不知道怎么回事，输入就是乱码。
## 解决方案 ##
在URL中指定数据库编码就行了:注意数据库和后面的配置使用`?`隔开。
```
jdbc:mysql:///usersinfo?characterEncoding=gbk
```
>原文链接: [Java 插入mysql数据库中文乱码](https://lanlan2017.github.io/blog/84e4b0d4/)
