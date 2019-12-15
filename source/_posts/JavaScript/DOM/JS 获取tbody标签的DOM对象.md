---
title: JS 获取tbody标签的DOM对象
categories: 
  - JavaScript
  - DOM
date: 2019-12-12 14:24:44
updated: 2019-12-12 14:29:30
abbrlink: 70388ccf
---
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
