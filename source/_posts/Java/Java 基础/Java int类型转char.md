---
title: Java int类型转char
categories: 
  - Java
  - Java 基础
date: 2019-08-23 13:18:52
updated: 2019-12-17 05:18:52
abbrlink: 569c8e52
---
<div id='my_toc'><a href="/blog/569c8e52/#前言" class="header_1">前言</a>&nbsp;<br><a href="/blog/569c8e52/#原因" class="header_1">原因</a>&nbsp;<br><a href="/blog/569c8e52/#数字0到9转为'0'到'9'字符的正确做法" class="header_1">数字0到9转为'0'到'9'字符的正确做法</a>&nbsp;<br><a href="/blog/569c8e52/#先计算出正确的ASCII码在转为字符" class="header_2">先计算出正确的ASCII码在转为字符</a>&nbsp;<br><a href="/blog/569c8e52/#使用自动类型转换进行计算" class="header_3">使用自动类型转换进行计算</a>&nbsp;<br><a href="/blog/569c8e52/#直接计算" class="header_3">直接计算</a>&nbsp;<br><a href="/blog/569c8e52/#Character-forDigit-数字-进制-方法进行转换" class="header_2">Character.forDigit(数字,进制)方法进行转换</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 前言 #
最近想随机生成一串包含数字和字母的字符串.但是我发现把int类型的数字通过强制类型转换为char类型字符的时候出现了乱码.
# 原因 #
字符`'0'`的`ASCII`编码值是`48`,如果直接通过类似如下的强制类型转换:
```java
char ch=(int) 0;
```
得到的字符不是`'0'`,而是其他字符。
# 数字0到9转为'0'到'9'字符的正确做法 #
## 先计算出正确的ASCII码在转为字符 ##
### 使用自动类型转换进行计算 ###
在char类型和int类型进行计算时,会自动把char类型转为int类型,所以可以先把字符`'0'`和`数字`进行计算得到正确的`ASCII`编码值,然后再强制类型转为字符.如下所示:
```java
int i=2;
char c = (char)('0' + i);
```
### 直接计算 ###
当然换成如下写法也是可以的.
```java
int i=2;
char c = (char)(48 + i);
```
## Character.forDigit(数字,进制)方法进行转换 ##
```java
int i=2;
char c = Character.forDigit(i,10);
```
