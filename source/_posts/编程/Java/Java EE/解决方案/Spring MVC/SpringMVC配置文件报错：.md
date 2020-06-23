---
title: SpringMVC配置文件报错：
categories:
  - 编程
  - Java
  - Java EE
  - 解决方案
  - Spring MVC
abbrlink: a61ce5bb
date: 2019-05-01 17:11:48
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/a61ce5bb/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/a61ce5bb/#解决方案" class="header_2">解决方案</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 问题描述 ##
今天Eclipse中Spring MVC的配置文件报错如下:
```java
Referenced file contains errors (http://www.springframework.org/schema/mvc/spring-mvc.xsd). For more information, right click on the message 
 in the Problems View and select "Show Details..."
```
## 解决方案 ##
这可能是因为版本不对应导致的,打开链接：
[http://www.springframework.org/schema/mvc/](http://www.springframework.org/schema/mvc/)
你会看到一个多个版本链接列表,点击对应的版本的链接打开文件,我这里使用的是`4.3`版本的,所以我点击`4.3`版本的链接
然后浏览器会打开这个文件,复制地址栏上的URL:`http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd`,替换上面报错的`http://www.springframework.org/schema/mvc/spring-mvc.xsd`即可。
