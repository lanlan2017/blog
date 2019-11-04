---
title: Java 集合 Iterator用法整理
categories: 
  - Java
  - Java 集合
date: 2018-12-14 23:10:23
updated: 2019-10-30 13:53:55
abbrlink: c26fdf44
---
- [迭代器](/blog/html/c26fdf44/#迭代器)
- [Iterator的接口](/blog/html/c26fdf44/#Iterator的接口)
- [迭代方法](/blog/html/c26fdf44/#迭代方法)
- [参考链接](/blog/html/c26fdf44/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 迭代器 ##
迭代器是一种设计模式，Iterator是Java迭代器最简单的实现。它是一个对象，它可以遍历并选择序列中的对象，而开发人员不需要了解该序列的底层结构。
使用集合对象的`.iterator()`返回一个Iterator。第一次调用Iterator的next()方法时，它返回序列的第一个元素。
## Iterator的接口 ##
```java
public interface Iterator 
{  
　　boolean hasNext();  //获得序列中的下一个元素。
　　Object next();  //检查序列中是否还有元素。
　　void remove();  //将迭代器新返回的元素删除。
}  
```
## 迭代方法 ##
```java
for(Iterator it = c.iterator(); it.hasNext(); ){  
　　Object o = it.next();  
　　 //do something  
}  
```
## 参考链接 ##
[https://www.cnblogs.com/hasse/p/5024193.html](https://www.cnblogs.com/hasse/p/5024193.html)
[http://www.cnblogs.com/lxqiaoyixuan/p/7156944.html](http://www.cnblogs.com/lxqiaoyixuan/p/7156944.html)

>原文链接: [Java 集合 Iterator用法整理](https://lanlan2017.github.io/blog/c26fdf44/)
