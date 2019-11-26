---
title: Linux 执行多个命令
categories: 
  - Linux
  - 通用
date: 2019-11-01 10:24:47
updated: 2019-11-26 13:21:33
abbrlink: 1598bd9
---
<div id='my_toc'>

- [Linux执行多个命令](/blog/1598bd9/#Linux执行多个命令)
    - [全部执行](/blog/1598bd9/#全部执行)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# Linux执行多个命令 #
## 全部执行 ##
使用英文分号将多个命令隔开,这样不管前面的命令执行是否成功,后面的命令都会执行
```bash
echo hello1;echo hello2;echo hello3
```
