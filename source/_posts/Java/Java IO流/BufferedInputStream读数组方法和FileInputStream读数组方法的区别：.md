---
title: BufferedInputStream读数组方法和FileInputStream读数组方法的区别：
categories: 
  - Java
  - Java IO流
date: 2018-08-22 14:32:39
updated: 2019-11-25 00:23:43
abbrlink: d4b540e
---
<div id='my_toc'>

- [区别](/blog/d4b540e/#区别)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 区别 ##
- `BufferedInputStream`读数组方法，尽量读满整个数组，然后再返回，所以可能会多次读取，才返回。
- 而`FileInputStream`的读数组方法只会读取一次，读到多少就返回多少。读取一次，就返回一次。不管数组有没有读满。

>原文链接: [BufferedInputStream读数组方法和FileInputStream读数组方法的区别：](https://lanlan2017.github.io/blog/d4b540e/)
