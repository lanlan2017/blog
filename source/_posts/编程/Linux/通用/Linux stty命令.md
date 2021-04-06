---
title: Linux stty命令
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: c9a18df0
date: 2021-04-03 21:06:43
updated: 2021-04-03 23:14:48
---
<div id='my_toc'><a href="/blog/c9a18df0/#stty命令示例" class="header_1">stty命令示例</a>&nbsp;<br><a href="/blog/c9a18df0/#stty-size" class="header_2">stty size</a>&nbsp;<br><a href="/blog/c9a18df0/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# stty命令示例
## stty size
打印出终端的行数和列数：
```shell
stty size 
```
运行效果：
```
[root@localhost ~]# stty size 
33 161
[root@localhost ~]# 
```
# 参考资料
[https://commandnotfound.cn/linux/1/515/stty-%E5%91%BD%E4%BB%A4](https://commandnotfound.cn/linux/1/515/stty-%E5%91%BD%E4%BB%A4)
[https://linux265.com/course/linux-command-stty.html](https://linux265.com/course/linux-command-stty.html)
