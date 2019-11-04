---
title: SpringMVC配置文件声明报错
categories: 
  - Java
  - Java EE
  - 解决方案
  - Spring MVC
date: 2019-05-14 21:32:11
updated: 2019-10-30 11:55:39
abbrlink: fb0eb9bb
---
- [问题描述](/blog/html/fb0eb9bb/#问题描述)
- [解决方案](/blog/html/fb0eb9bb/#解决方案)
    - [安装Spring Tools3插件](/blog/html/fb0eb9bb/#安装Spring-Tools3插件)
    - [方案1](/blog/html/fb0eb9bb/#方案1)
    - [方案2](/blog/html/fb0eb9bb/#方案2)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 问题描述 #
在导入项目的时候,`springmvc`的配置文件声明,也就是第一行的`beans`标签,经常报错.
# 解决方案 #
## 安装Spring Tools3插件 ##
这里需要用到`Spring Tools3`插件,
## 方案1 ##
点击配置文件下方的`Namespaces`标签,可以看到有写功能勾选上了,现在逐个取消勾选,然后再次勾选上.
## 方案2 ##
复制`beans`标签里面的所有内容,然后删除掉原来的配置文件,再次创建一个新的`Spring`配置文件,然后粘贴到新文件的`beans`标签下,这个时候可能还是会报错,是因为有写标签的声明没有引入,点击文件下方的`Namespaces`标签,勾选上相关声明即可。

>原文链接: [SpringMVC配置文件声明报错](https://lanlan2017.github.io/blog/fb0eb9bb/)