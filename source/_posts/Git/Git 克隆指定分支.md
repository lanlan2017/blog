---
title: Git 克隆指定分支
categories: 
  - Git
date: 2019-12-01 15:37:28
updated: 2019-12-09 19:55:22
abbrlink: 7aaab990
---
<div id='my_toc'><a href="/blog/7aaab990/#命令格式">命令格式</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 命令格式
```shell
git clone -b 分支名 git仓库地址 本地路径
```
例如:
```shell
git clone -b src git@github.com:lanlan2017/lanlan2017.github.io.git blogRoot
```
