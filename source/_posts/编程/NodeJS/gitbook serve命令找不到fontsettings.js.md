---
title: gitbook serve命令找不到fontsettings.js
categories: 
  - 编程
  - NodeJS
date: 2020-10-13 12:35:31
updated: 2020-10-13 12:43:15
abbrlink: 2e333fd8
---
<div id='my_toc'><a href="/blog/2e333fd8/#gitbook-serve命令找不到fontsettings-js" class="header_1">gitbook serve命令找不到fontsettings.js</a>&nbsp;<br><a href="/blog/2e333fd8/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/2e333fd8/#解决方案" class="header_2">解决方案</a>&nbsp;<br><a href="/blog/2e333fd8/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# gitbook serve命令找不到fontsettings.js
## 问题描述
今天运行gitbook serve命令,老是报错:
```
$ gitbook serve
Live reload server started on port: 35729
Press CTRL+C to quit ...

info: 7 plugins are installed
info: loading plugin "livereload"... OK
info: loading plugin "highlight"... OK
info: loading plugin "search"... OK
info: loading plugin "lunr"... OK
info: loading plugin "sharing"... OK
info: loading plugin "fontsettings"... OK
info: loading plugin "theme-default"... OK
info: found 1 pages
info: found 0 asset files

Error: ENOENT: no such file or directory, stat 'E:\Blog\MyGitBook\_book\gitbook\gitbook-plugin-fontsettings\fontsettings.js'
```
这个原来是一个Bug（Vesion：3.2.3）
## 解决方案
懒得写,见参考资料
# 参考资料
[https://blog.csdn.net/prufeng/article/details/83301895](https://blog.csdn.net/prufeng/article/details/83301895)
[https://segmentfault.com/q/1010000009569245](https://segmentfault.com/q/1010000009569245)
[https://www.cnblogs.com/wenhui92/p/9482629.html](https://www.cnblogs.com/wenhui92/p/9482629.html)
[https://blog.csdn.net/wltsysterm/article/details/104442439](https://blog.csdn.net/wltsysterm/article/details/104442439)
