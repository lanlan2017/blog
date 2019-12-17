---
title: 正则应用：把Markdown中的加粗文本改为标题文本
categories: 
  - 正则表达式
  - 实例
date: 2018-10-11 09:12:13
updated: 2019-12-17 05:17:09
abbrlink: 1d153e30
---
<div id='my_toc'><a href="/blog/1d153e30/#实现" class="header_2">实现</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 实现 ##
用notepad++打开该文章，按下ctrl+h打开替换，在查找模式选择框，选择正则表达式，然后输入查找正则表达式：
```
[*]{2}(\d+.+?)[*]{2}
```
输入替换正则表达式：
```
###\1###
```
如图所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/java/my_regex_example/ctrl_b3ctrl_3.png)
