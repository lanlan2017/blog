---
title: 正则表达式 给所有英文单词添加markdown代码段标记
categories: 
  - 正则表达式
  - 实例
  - 匹配markdown标记
date: 2019-03-16 15:47:44
updated: 2019-12-17 05:17:09
abbrlink: b7a12cba
---
<div id='my_toc'><a href="/blog/b7a12cba/#实现" class="header_2">实现</a><br><a href="/blog/b7a12cba/#匹配正则" class="header_3">匹配正则</a><br><a href="/blog/b7a12cba/#替换正则" class="header_3">替换正则</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
手动加麻烦,下面写程序来实现:
## 实现 ##
如果是单纯的匹配英文的话使用`(\w+)`来匹配即可,但是这样会匹配到数字,我不希望匹配到数字,所以使用`([a-zA-Z]\w+)`来匹配,然后使用
```regex
`$1`
```
来替换，这样所有英文前面都加入了代码段标记了.这样好像能达到我的要求.但是又引入新的问题,对于已经添加了代码段标记单词:
```regex
`URL`
```
将会被替换成:
```regex
``URL``
```
这样显然不好,为此匹配正则需要修改,不管英文是否加了代码段标记,我都匹配，然后替换。如下所示:
### 匹配正则 ###
```regex
`?([a-zA-Z]\w+)`?
```
### 替换正则 ###
```regex
`$1`
```
