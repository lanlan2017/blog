---
title: String concatenation as argument to 'StringBuffer.append()' call
categories: 
  - Java
  - Java 基础
  - 代码优化
date: 2019-10-03 21:19:47
updated: 2019-12-17 05:17:09
abbrlink: e14f1dac
---
<div id='my_toc'><a href="/blog/e14f1dac/#解决-String-concatenation-as-argument-to-'StringBuffer.append-'-call-警告#" class="header_1">解决 String concatenation as argument to 'StringBuffer.append()' call 警告#</a><br><a href="/blog/e14f1dac/#问题描述" class="header_2">问题描述</a><br><a href="/blog/e14f1dac/#分析原因" class="header_2">分析原因</a><br><a href="/blog/e14f1dac/#解决方案" class="header_2">解决方案</a><br><a href="/blog/e14f1dac/#1.-全部使用append方法" class="header_3">1. 全部使用append方法</a><br><a href="/blog/e14f1dac/#替换-+-号为-.append" class="header_4">替换`+`号为`).append(`</a><br><a href="/blog/e14f1dac/#使用IDE的查找替换功能进行替换" class="header_4">使用IDE的查找替换功能进行替换</a><br><a href="/blog/e14f1dac/#写代码实现替换" class="header_4">写代码实现替换</a><br><a href="/blog/e14f1dac/#2.-忽略" class="header_3">2. 忽略</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 解决 String concatenation as argument to 'StringBuffer.append()' call 警告#
## 问题描述 ##
最近带idea中老是收到下面这个警告:
```
Warning:(20, 16) String concatenation as argument to 'StringBuffer.append()' call
```
出现警告的代码:
```java
sb.append("<property name=\"" + group1 + "\" value=\"${" + group1+ "}\"/>\r\n");
```
## 分析原因 ##
其实这个提示是表示方法使用不恰当,因为`StringBuffer`对象的`append`方法目的就是做对象拼接用的,里面再通过"`+`"来拼接就不得当,这是编译器对`Java`的代码规范。

## 解决方案 ##
### 1. 全部使用append方法 ###
#### 替换`+`号为`).append(` ####
因为`append`方法的返回值还是`StringBuffer`,所以可以链式调用,我们可以通过链式调用来替换掉里面的加号。
也就是，将:
```java
sb.append("<property name=\"" + group1 + "\" value=\"${" + group1+ "}\"/>\r\n");
```
替换成:
```java
sb.append("<property name=\"").append(group1).append("\" value=\"${").append(group1).append("}\"/>\r\n");
```
#### 使用IDE的查找替换功能进行替换 ####
当然,手动替换可能有些繁琐,需要使用`查找替换功能`,
1. 查找:`+`
2. 替换为:`).append(`即可。

#### 写代码实现替换 ####
核心代码如下:
```java
/**
 * 把StringBuffer或StringBuilder中的字符串连接符<code>+</code>替换append()方法
 *
 * @return 替换后的字符串.
 */
public String StringConnectorToAppend(String stringBufferAppendCode) {
    String returnValue = "// " + stringBufferAppendCode + "\n";
    return returnValue + stringBufferAppendCode.replaceAll("\\s*\\+\\s*", ").append(");
}
```
### 2. 忽略 ###
这个不替换也能运行,而且替换后代码长度变长了,不好阅读,可以选择忽略.
