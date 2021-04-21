---
title: Linux uptime命令
categories: 
  - 编程
  - Linux
  - 通用
  - 系统状态
abbrlink: 7733f673
date: 2021-04-21 14:25:39
updated: 2021-04-21 23:33:39
---
<div id='my_toc'><a href="/blog/7733f673/#uptime命令" class="header_1">uptime命令</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# uptime命令
uptime：已开机时间(年龄)
```
[root@localhost ~]# uptime
 14:18:18 up 2 days,  6:47,  1 user,  load average: 5.87, 6.13, 6.52
[root@localhost ~]# 
```

|uptime输出字段|描述|
|:---|:---|
|14:18:18|表示当前的时间|
|up 2 days, 6:47|表示系统自启动后到现在的运行时间|
|1 user|表示当前登录入系统的用户数|
|load average: 5.87, 6.13, 6.52|表示近期1分钟,5分钟,15分钟内系统CPU的负载平均调度队列长度|
