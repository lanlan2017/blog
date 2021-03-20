---
title: Java 集合 Iterator用法整理
categories:
  - 编程
  - Java
  - Java 集合
abbrlink: c26fdf44
date: 2018-12-14 23:10:23
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/c26fdf44/#迭代器" class="header_2">迭代器</a>&nbsp;<br><a href="/blog/c26fdf44/#Iterator的接口" class="header_2">Iterator的接口</a>&nbsp;<br><a href="/blog/c26fdf44/#迭代方法" class="header_2">迭代方法</a>&nbsp;<br><a href="/blog/c26fdf44/#参考链接" class="header_2">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 迭代器
迭代器是一种设计模式，Iterator是Java迭代器最简单的实现。它是一个对象，它可以遍历并选择序列中的对象，而开发人员不需要了解该序列的底层结构。
使用集合对象的`.iterator()`返回一个Iterator。第一次调用Iterator的next()方法时，它返回序列的第一个元素。
# Iterator的接口
```java
public interface Iterator 
{  
　　boolean hasNext();  //获得序列中的下一个元素。
　　Object next();  //检查序列中是否还有元素。
　　void remove();  //将迭代器新返回的元素删除。
}  
```
# 迭代方法
```java
for(Iterator it = c.iterator(); it.hasNext(); ){  
　　Object o = it.next();  
　　 //do something  
}  
```
# 参考链接
[https://www.cnblogs.com/hasse/p/5024193.html](https://www.cnblogs.com/hasse/p/5024193.html)
[http://www.cnblogs.com/lxqiaoyixuan/p/7156944.html](http://www.cnblogs.com/lxqiaoyixuan/p/7156944.html)
