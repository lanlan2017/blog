---
title: 安装了多个java 如何切换java版本
categories: 
  - Java
  - java安装
date: 2019-10-06 10:42:44
updated: 2019-12-09 19:45:22
abbrlink: 957ae50e
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/957ae50e/#查看是否切换成功">查看是否切换成功</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
---------------------------------------------
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

>原文链接: [安装了多个java 如何切换java版本](https://lanlan2017.github.io/blog/957ae50e/)
