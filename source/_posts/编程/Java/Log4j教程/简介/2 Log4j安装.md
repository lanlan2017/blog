---
title: 2 Log4j 安装
categories:
  - 编程
  - Java
  - Log4j教程
  - 简介
abbrlink: 27bc8c92
date: 2020-08-03 03:36:48
updated: 2020-08-18 11:59:17
---
<div id='my_toc'><a href="/blog/27bc8c92/#使用下载好的lib" class="header_1">使用下载好的lib</a>&nbsp;<br><a href="/blog/27bc8c92/#Maven依赖" class="header_1">Maven依赖</a>&nbsp;<br><a href="/blog/27bc8c92/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 使用下载好的lib
下载`lib`,然后添加到`build path`.
# Maven依赖
到项目文件夹并找到`pom.xml`，添加以下依赖关系:
```xml pom.xml
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.17</version>
</dependency>
```
省略....
# 参考资料
[https://www.w3cschool.cn/java/log4j-installation.html](https://www.w3cschool.cn/java/log4j-installation.html)
[https://wiki.jikexueyuan.com/project/log4j/installation.html](https://wiki.jikexueyuan.com/project/log4j/installation.html)
