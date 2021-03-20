---
title: Java Stack 堆栈
categories:
  - 编程
  - Java
  - Java 集合
abbrlink: b5d86588
date: 2018-12-17 20:48:33
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/b5d86588/#Stack对象简介" class="header_2">Stack对象简介</a>&nbsp;<br><a href="/blog/b5d86588/#Stack对象方法" class="header_2">Stack对象方法</a>&nbsp;<br><a href="/blog/b5d86588/#构造方法" class="header_3">构造方法</a>&nbsp;<br><a href="/blog/b5d86588/#常用方法" class="header_3">常用方法</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Stack对象简介
Stack 类表示`后进先出`（LIFO）的对象堆栈。它通过五个操作对类 Vector 进行了扩展 ，允许将向量视为堆栈。它提供了通常的 push 和 pop 操作，以及取堆栈顶点的 peek 方法、测试堆栈是否为空的 empty 方法、在堆栈中查找项并确定到堆栈顶距离的 search 方法。 


# Stack对象方法
## 构造方法
|方法|描述|
|:-|:-|
|`Stack()`|创建一个空堆栈。|

## 常用方法
|方法|描述|
|:-|:-|
|`boolean empty()`|测试堆栈是否为空。 |
|`E peek()`|查看堆栈顶部的对象，但不从堆栈中移除它。 |
|`E pop()`|移除堆栈顶部的对象，并作为此函数的值返回该对象。 |
|`E push(E item)`|把项压入堆栈顶部。 |
|`int search(Object o)`|返回对象在堆栈中的位置，以 1 为基数。 |
