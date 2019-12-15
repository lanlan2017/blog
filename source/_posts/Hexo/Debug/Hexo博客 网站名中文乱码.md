---
title: Hexo博客 网站名中文乱码
categories: 
  - Hexo
  - Debug
date: 2018-08-29 19:35:07
updated: 2019-12-09 19:55:22
abbrlink: 87aa90c2
---
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
