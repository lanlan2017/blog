---
title: JavaScript 正则表达式
categories: 
  - 编程
  - JavaScript
  - 正则表达式
date: 2019-02-13 00:17:45
updated: 2021-03-20 10:26:20
abbrlink: cd878b94
---
<div id='my_toc'><a href="/blog/cd878b94/#语法" class="header_1">语法</a>&nbsp;<br><a href="/blog/cd878b94/#String对象中的正则表达式" class="header_1">String对象中的正则表达式</a>&nbsp;<br><a href="/blog/cd878b94/#match方法" class="header_2">match方法</a>&nbsp;<br><a href="/blog/cd878b94/#实例" class="header_2">实例</a>&nbsp;<br><a href="/blog/cd878b94/#参考链接" class="header_1">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 语法
```javascript
var patt=new RegExp(pattern,modifiers);
```
或更简单的方法
```javascript
var patt=/pattern/modifiers; 
```
- pattern（模式） 描述了表达式的模式
- modifiers(修饰符) 用于指定全局匹配、区分大小写的匹配和多行匹配

# String对象中的正则表达式
在 JavaScript 中，正则表达式通常用于两个字符串方法 : `search()` 和 `replace()`。
- search() 方法 用于检索字符串中指定的`子字符串`，或检索与正则表达式相匹配的`子字符串`.
    - 如果找到就`返回子串的起始位置`。
    - 如果没找到就返回`-1`。
- replace() 方法 用于在字符串中用一些字符替换另一些字符，或替换一个与正则表达式匹配的`子串`。**返回的是替换后的文本**。

## match方法
match方法返回的是保存所有匹配正则表达式的子串的一个**数组**。

## 实例
```html
<p id="test">测试javascirpt String对象中的正则表达式 hello World</p>
<input type="button" onclick="setID20181128010217()" value="helloworld起始位置:">
<span id="20181128010217"></span>
<input type="button" onclick="setID20181128012951()" value="替换helloWorld:">
<span id="20181128012951"></span>
<script>
    // id="20181128010217" onclick="setID20181128010217()"
    function setID20181128010217() {
        var id = document.getElementById("20181128010217");
        var test = document.getElementById("test");
        var str = test.innerText;
        var start = str.search(/hello world/i);
        id.innerText = start;
    }
    // id="20181128012951" onclick="setID20181128012951()"
    function setID20181128012951() {
        var id = document.getElementById("20181128012951");
        var test = document.getElementById("test");
        test.innerText = test.innerText.replace(/hello world/i, "hello javascript");
    }
</script>
```

<hr><p id="test">测试javascirpt String对象中的正则表达式 hello World</p><input type="button" onclick="setID20181128010217()" value="helloworld起始位置:"><span id="20181128010217"></span><input type="button" onclick="setID20181128012951()" value="替换helloWorld:"><span id="20181128012951"></span>
<script>
    // id="20181128010217" onclick="setID20181128010217()"
    function setID20181128010217() {
        var id = document.getElementById("20181128010217");
        var test = document.getElementById("test");
        var str = test.innerText;
        var start = str.search(/hello world/i);
        id.innerText = start;
    }
    // id="20181128012951" onclick="setID20181128012951()"
    function setID20181128012951() {
        var id = document.getElementById("20181128012951");
        var test = document.getElementById("test");
        test.innerText=test.innerText.replace(/hello world/i,"hello javascript");
    }
</script>
<hr>

# 参考链接
[JavaScript RegExp 对象](http://www.runoob.com/jsref/jsref-obj-regexp.html)
[http://www.runoob.com/js/js-obj-regexp.html](http://www.runoob.com/js/js-obj-regexp.html)
[http://www.runoob.com/js/js-regexp.html](http://www.runoob.com/js/js-regexp.html)
[http://www.runoob.com/jsref/jsref-obj-regexp.html](http://www.runoob.com/jsref/jsref-obj-regexp.html)
[https://www.lansheng.net.cn/blog/f52e78d1/#search() 方法](https://www.lansheng.net.cn/blog/f52e78d1/#search-%E6%96%B9%E6%B3%95)
[https://www.lansheng.net.cn/blog/f52e78d1/#replace() 方法](https://www.lansheng.net.cn/blog/f52e78d1/#replace-%E6%96%B9%E6%B3%95)
