---
title: SpringMVC配置文件声明报错
categories: 
  - 编程
  - Java
  - Java EE
  - 解决方案
  - Spring MVC
date: 2019-05-14 21:32:11
updated: 2020-04-11 09:21:19
abbrlink: fb0eb9bb
---
<div id='my_toc'><a href="/blog/fb0eb9bb/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/fb0eb9bb/#解决方案" class="header_1">解决方案</a>&nbsp;<br><a href="/blog/fb0eb9bb/#安装Spring-Tools3插件" class="header_2">安装Spring Tools3插件</a>&nbsp;<br><a href="/blog/fb0eb9bb/#方案1" class="header_2">方案1</a>&nbsp;<br><a href="/blog/fb0eb9bb/#方案2" class="header_2">方案2</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

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
