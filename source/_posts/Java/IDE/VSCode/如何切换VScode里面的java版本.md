---
title: 如何切换VScode里面的java版本
categories: 
  - Java
  - IDE
  - VSCode
date: 2019-10-06 21:46:08
updated: 2019-10-30 13:53:55
abbrlink: 6221fd78
---
- [如何切换VScode里面的java版本](/blog/html/6221fd78/#如何切换VScode里面的java版本)
    - [1. 电脑使用新版本的java](/blog/html/6221fd78/#1-电脑使用新版本的java)
    - [2. 重装VScode里面的java环境](/blog/html/6221fd78/#2-重装VScode里面的java环境)
    - [总结](/blog/html/6221fd78/#总结)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 如何切换VScode里面的java版本 #
最近用`VScode`打开新版本的`java`代码,发现无法通过编译,这肯定是因为我用的旧版本的`java`。
## 1. 电脑使用新版本的java ##
排查后发现是`java`版本不对,然后我把电脑上`java`版本切换为新版,然后发现,通过其他编译可以正常编译运行,但是`VSCode`里面就是无法编译运行,个人猜测`VScode`里面使用的还是旧版本的`java`,网上找了一通没有找到该怎么切换`VScode`里面的`java`版本.
## 2. 重装VScode里面的java环境 ##
保证现在电脑里用的是新版本的`java`,然后卸载`VScode`里面的`java`环境(`Java Extension Pack`),然后重启`VScode`,再重新安装`Java`插件(`Java Extension Pack`),这个使用插件就会使用电脑里的新版本的`java`.
## 总结 ##
这样做就是`重装插件比较耗时`,不过还算能用,有人知道怎么切换`VScode`里面的`java`版本的话教教我.

>原文链接: [如何切换VScode里面的java版本](https://lanlan2017.github.io/blog/6221fd78/)
