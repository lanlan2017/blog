---
title: Hexo博客 网站名中文乱码
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 遇到问题
date: 2018-08-29 19:35:07
updated: 2019-10-30 13:53:55
abbrlink: 87aa90c2
---
- [设置语言为简体中文](/blog/html/87aa90c2/#设置语言为简体中文)
- [Site](/blog/html/87aa90c2/#Site)
- [修改站点配置文件的编码为UTF-8](/blog/html/87aa90c2/#修改站点配置文件的编码为UTF-8)
- [重新启动](/blog/html/87aa90c2/#重新启动)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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

>原文链接: [Hexo博客 网站名中文乱码](https://lanlan2017.github.io/blog/87aa90c2/)
