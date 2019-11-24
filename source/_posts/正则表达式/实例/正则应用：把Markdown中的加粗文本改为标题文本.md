---
title: 正则应用：把Markdown中的加粗文本改为标题文本
categories: 
  - 正则表达式
  - 实例
date: 2018-10-11 09:12:13
updated: 2019-11-14 11:39:33
abbrlink: 1d153e30
---
<div id='my_toc'>

- [实现](/blog/1d153e30/#实现)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

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

>原文链接: [正则应用：把Markdown中的加粗文本改为标题文本](https://lanlan2017.github.io/blog/1d153e30/)
