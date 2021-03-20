---
title: JS 获取tbody标签的DOM对象
categories: 
  - 编程
  - JavaScript
  - DOM
date: 2019-12-12 14:24:44
updated: 2020-04-11 09:21:19
abbrlink: 70388ccf
---
<div id='my_toc'><a href="/blog/70388ccf/#使用tBodies方法" class="header_1">使用tBodies方法</a>&nbsp;<br><a href="/blog/70388ccf/#通过tbody上的id属性" class="header_1">通过tbody上的id属性</a>&nbsp;<br><a href="/blog/70388ccf/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 使用tBodies方法
```html
var table = document.getElementById('cal_panel');
var tbody = table.tBodies[0];
```
推荐使用这种方式.
# 通过tbody上的id属性
```html
<tbody id='cal_panel_body'>
......
</tbody>
```
然后通过:
```javascript
var tbody = document.getElementById('cal_panel_body');
```
来获取.
# 参考资料
[https://bbs.csdn.net/topics/360143208](https://bbs.csdn.net/topics/360143208)
