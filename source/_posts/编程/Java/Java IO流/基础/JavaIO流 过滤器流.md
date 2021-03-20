---
title: JavaIO流 过滤器流
categories: 
  - 编程
  - Java
  - Java IO流
  - 基础
date: 2018-08-21 22:19:08
updated: 2021-03-20 08:44:48
abbrlink: c52cb4ad
---
<div id='my_toc'><a href="/blog/c52cb4ad/#过滤器使用规则" class="header_1">过滤器使用规则</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 过滤器使用规则

过滤器可以和其他过滤器、原始流和阅读器/书写器链接使用，但要遵守以下规则：

- 过滤器流可以置于原始流或其他过滤器流之上；
- 阅读器/书写器可置于原始流、过滤器流或其他阅读器/书写器之上；
- 过滤器流不能放在阅读器/书写器之后。
