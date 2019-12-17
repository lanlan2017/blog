---
title: 安装了多个java 如何切换java版本
categories: 
  - Java
  - Java 基础
date: 2019-10-06 10:42:44
updated: 2019-12-17 05:17:09
abbrlink: 957ae50e
---
<div id='my_toc'></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
------------------------------------------
请输入选择:11
成功: 指定的值已得到保存。
已经修改 "JAVA_HOME" 为 %JAVA_HOME_11%
请按任意键继续. . .

```
可以看到切换之前是`Java8`,切换后为`Java11`
### 查看是否切换成功 ###
运行上面创建`TJava.bat`,查看运行效果:
```
java version "11.0.4" 2019-07-16 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.4+10-LTS)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.4+10-LTS, mixed mode)
请按任意键继续. . .
```
可以看到现在已经成功切换为`Java11`了
