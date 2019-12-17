---
title: Java IO流 过滤器流
categories: 
  - Java
  - Java IO流
date: 2018-08-21 22:19:08
updated: 2019-12-15 22:01:44
abbrlink: c52cb4ad
---
<div id='my_toc'>

- [过滤器使用规则](/blog/c52cb4ad/#过滤器使用规则)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 过滤器使用规则 ##

过滤器可以和其他过滤器、原始流和阅读器/书写器链接使用，但要遵守以下规则：

- 过滤器流可以置于原始流或其他过滤器流之上；
- 阅读器/书写器可置于原始流、过滤器流或其他阅读器/书写器之上；
- 过滤器流不能放在阅读器/书写器之后。
