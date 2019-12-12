---
title: JS 获取tbody标签的DOM对象
categories: 
  - JavaScript
  - DOM
date: 2019-12-12 14:24:44
updated: 2019-12-12 14:29:30
abbrlink: 70388ccf
---
<div id='my_toc'><a href="/blog/70388ccf/#使用tBodies方法">使用tBodies方法</a><br/><a href="/blog/70388ccf/#通过tbody上的id属性">通过tbody上的id属性</a><br/><a href="/blog/70388ccf/#参考资料">参考资料</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

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
