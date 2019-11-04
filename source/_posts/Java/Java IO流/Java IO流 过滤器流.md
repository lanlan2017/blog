---
title: Java IO流 过滤器流
categories: 
  - Java
  - Java IO流
date: 2018-08-21 22:19:08
updated: 2019-10-30 13:53:55
abbrlink: c52cb4ad
---
- [过滤器使用规则](/blog/html/c52cb4ad/#过滤器使用规则)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 过滤器使用规则 ##

过滤器可以和其他过滤器、原始流和阅读器/书写器链接使用，但要遵守以下规则：

- 过滤器流可以置于原始流或其他过滤器流之上；
- 阅读器/书写器可置于原始流、过滤器流或其他阅读器/书写器之上；
- 过滤器流不能放在阅读器/书写器之后。

>原文链接: [Java IO流 过滤器流](https://lanlan2017.github.io/blog/c52cb4ad/)
