---
title: Java正则表达式
categories:
  - 编程
  - Java
  - Java 基础
  - Java 正则表达式
abbrlink: 4ea1809c
date: 2019-01-11 22:02:27
updated: 2019-12-17 05:18:52
---
<div id='my_toc'></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 本文内容已经丢失
只剩下如下内容：
这里我们只替换了第一次，before_ONE`a`_TWOa_THREEa_End,然后StringBuffer中处理完毕的文本为`before_ONEA`，未处理的文本为`_TWOa_THREEa_End`，最后调用m.appendTail(sb);把未处理的文本也追加入到StringBuffer中，处理完毕的文本为:`before_ONEA_TWOa_THREEa_End`

### 小结
- `find()`方法匹配子串的时候都会**记下**本次成功**匹配子串的`开始位置`和`结束位置`**
- `appendReplacement(sb`,`replacement)`方法先获取所有`从上次匹配的结束位置，到本次匹配结束位置的所有字符串`，然后`替换其中匹配的部分`，最后追加到`sb`中。
- `appendReplacement(sb)`方法把结束位置到文本结尾的所有字符追加到`sb`中。
- 使用appendReplace()和appendTail()方法可以更加灵活的进行替换操作，注意要结合find()方法使用。
