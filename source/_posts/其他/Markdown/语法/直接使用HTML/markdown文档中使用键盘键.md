---
title: markdown文档中使用键盘键
categories: 
  - 其他
  - Markdown
  - 语法
  - 直接使用HTML
date: 2018-10-26 11:23:58
updated: 2019-12-17 05:18:53
abbrlink: 6507a83c
---
<div id='my_toc'><a href="/blog/6507a83c/#键盘键" class="header_2">键盘键</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 键盘键 ##
markdown中可以插入html标签来实现更加丰富的显示效果。例如`<kbd>`标签来插入键盘按键：<kbd>Ctrl</kbd>+<kbd>H</kbd>

> **定义和用法**
>`<kbd>`标签定义键盘文本。
> 说到技术概念上的特殊样式时，就要提到 `<kbd>`标签。
> 正如你已经猜到的，它用来表示文本是从键盘上键入的。
> 浏览器通常用等宽字体来显示该标签中包含的文本。`<kbd>`标签经常用在于计算机相关的文档和手册中。例如：
> 键入`<kbd>quit</kbd>`来退出程序，或者键入`<kbd>menu</kbd>`来返回主菜单。
```markdown
<kbd>Ctrl</kbd>+<kbd>H</kbd>
```
显示效果：
<kbd>Ctrl</kbd>+<kbd>H</kbd>
参考：[http://www.w3school.com.cn/tags/tag_kbd.asp](http://www.w3school.com.cn/tags/tag_kbd.asp)
