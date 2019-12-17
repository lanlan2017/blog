---
title: Hexo博客 网站名中文乱码
categories: 
  - Hexo
  - Debug
date: 2018-08-29 19:35:07
updated: 2019-12-17 05:17:08
abbrlink: 87aa90c2
---
<div id='my_toc'><a href="/blog/87aa90c2/#设置语言为简体中文" class="header_2">设置语言为简体中文</a><br><a href="/blog/87aa90c2/#修改站点配置文件的编码为UTF-8" class="header_2">修改站点配置文件的编码为UTF-8</a><br><a href="/blog/87aa90c2/#重新启动" class="header_2">重新启动</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 设置语言为简体中文 ##
首先在站点配置文件中,把语言设置成中文。
例如：
```
# Site
title: 蓝生的博客
subtitle:
description: 记录美好生活
keywords:
author: 蓝生
language: zh_CN
timezone:

```
## 修改站点配置文件的编码为UTF-8 ##
然后按下`ctrl+a`复制所有的配置项,然后修改站点配置文件的编码格式为`UTF-8`.然后再按下`Ctrl+V`,粘贴回去,保存。
## 重新启动 ##
然后重新启动即可：
```
hexo clean && hexo g && hexo s
```
