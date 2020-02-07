---
title: git 强制推送到远程仓库
categories: 
  - Git
date: 2019-12-01 15:16:23
updated: 2019-12-17 05:18:52
abbrlink: 3f12657a
---
<div id='my_toc'><a href="/blog/3f12657a/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/3f12657a/#解决方案" class="header_1">解决方案</a>&nbsp;<br><a href="/blog/3f12657a/#格式1" class="header_1">格式1</a>&nbsp;<br><a href="/blog/3f12657a/#格式2" class="header_1">格式2</a>&nbsp;<br><a href="/blog/3f12657a/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
今天我使用自动部署`Travis CI`自动部署的Hexo博客的时候,仓库名称不小心填错了,导致我的Github上的其他仓库被覆盖了.
# 解决方案
进入本地仓库,然后`强制推送`到被错误覆盖的仓库上.
# 格式1
```shell
git push 远程仓库名 分支名 --force
```
例如:
```shell
git push origin master --force
```
# 格式2
```shell
git push -f 远程仓库名 分支名
```
例如:
```shell
git push -f origin master
```
# 参考资料
[https://blog.csdn.net/WangJQ12/article/details/80974031](https://blog.csdn.net/WangJQ12/article/details/80974031)
