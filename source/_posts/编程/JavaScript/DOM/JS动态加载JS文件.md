---
title: JS动态加载JS文件
categories: 
  - 编程
  - JavaScript
  - DOM
date: 2019-12-10 11:19:12
updated: 2020-04-11 09:21:19
abbrlink: 61c2129d
---
<div id='my_toc'><a href="/blog/61c2129d/#直接document-write" class="header_1">直接document.write</a>&nbsp;<br><a href="/blog/61c2129d/#动态改变已有script的src属性" class="header_1">动态改变已有script的src属性</a>&nbsp;<br><a href="/blog/61c2129d/#动态创建script元素" class="header_1">动态创建script元素</a>&nbsp;<br><a href="/blog/61c2129d/#使用jQuery" class="header_1">使用jQuery</a>&nbsp;<br><a href="/blog/61c2129d/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 直接document.write
```html
<script language="javascript">
    document.write("<script src='test.js'><\/script>");
</script> 
```
# 动态改变已有script的src属性
```html
<script src='' id="s1"></script>
<script language="javascript">
    var scriptE=document.getElementById("s1");
    scriptE.src="test.js"
</script>
```
# 动态创建script元素
```html
<script>
    var headDom = document.getElementsByTagName('HEAD').item(0);
    var scriptDom= document.createElement("script");
    scriptDom.type = "text/javascript";
    scriptDom.src="test.js";
    headDom.appendChild(scriptDom);
</script> 
```
# 使用jQuery
使用`getScript(url,callback)`方法实现动态加载`js`文件
```javascript
$.getScript('test.js',function(){
    alert('done');
});
```
# 参考资料
[https://www.jb51.net/article/17992.htm](https://www.jb51.net/article/17992.htm)
[https://www.jb51.net/article/139481.htm](https://www.jb51.net/article/139481.htm)
