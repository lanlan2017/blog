---
title: Java 插入mysql数据库中文乱码
categories:
  - 编程
  - MySQL
  - 中文乱码
abbrlink: 84e4b0d4
date: 2018-12-03 20:49:58
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/84e4b0d4/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/84e4b0d4/#解决方案" class="header_2">解决方案</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

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
