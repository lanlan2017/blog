---
title: Termux使用 清华安装源
categories: 
  - Linux
  - Termux
date: 2019-11-30 17:48:40
updated: 2019-12-17 05:17:09
abbrlink: 100bdc9a
---
<div id='my_toc'><a href="/blog/100bdc9a/#更换国内源" class="header_1">更换国内源</a><br><a href="/blog/100bdc9a/#官方方法" class="header_2">官方方法</a><br><a href="/blog/100bdc9a/#直接编辑源文件" class="header_2">直接编辑源文件</a><br><a href="/blog/100bdc9a/#修改效果" class="header_2">修改效果</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 更换国内源 #
更换`Termux`清华大学源,加快软件包下载速度. 
## 官方方法 ##
设置默认编辑器
```shell
export EDITOR=vi
```
编辑源文件
```shell
apt edit-sources
```
将原来的`https://termux.net`官方源替换为`http://mirrors.tuna.tsinghua.edu.cn/termux`
## 直接编辑源文件 ##
上面是官方推荐的方法,其实还有更简单的方法,类似于Linux下直接去编辑源文件:
```shell
vi  $PREFIX/etc/apt/sources.list
```
## 修改效果 ##
```shell
u0_a391@localhost~ cat $PREFIX/etc/apt/sources.list
# The main termux repository:
# deb https://termux.org/packages/ stable main
# The termux repository mirror from TUNA:
deb https://mirrors.tuna.tsinghua.edu.cn/termux stable main

```
