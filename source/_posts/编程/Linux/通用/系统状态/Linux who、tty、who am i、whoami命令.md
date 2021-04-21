---
title: Linux who、tty、who am i、whoami命令
categories: 
  - 编程
  - Linux
  - 通用
  - 系统状态
abbrlink: 1b16e212
date: 2021-04-21 13:53:09
updated: 2021-04-21 23:33:39
---
<div id='my_toc'><a href="/blog/1b16e212/#who命令" class="header_1">who命令</a>&nbsp;<br><a href="/blog/1b16e212/#who命令的输出分析" class="header_2">who命令的输出分析</a>&nbsp;<br><a href="/blog/1b16e212/#什么是设备文件" class="header_3">什么是设备文件</a>&nbsp;<br><a href="/blog/1b16e212/#tty命令" class="header_1">tty命令</a>&nbsp;<br><a href="/blog/1b16e212/#who-am-i命令" class="header_1">who am i命令</a>&nbsp;<br><a href="/blog/1b16e212/#whoami命令" class="header_1">whoami命令</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->

who ：确定谁在系统中
uptime ：了解系统启动时间和忙碌程度
top ：列出 资源占用排名靠前的进程
free ：了解内存使用情况
vmstat ：了解系统负载情况
# who命令
命令 who : 列出当前已登录入系统的用户
```
[root@localhost ~]# who
root     pts/5        2021-04-21 13:57 (192.168.1.2)
[root@localhost ~]# 
```
## who命令的输出分析
第一列：用户名；
第二列：终端设备的设备文件名
第三列：该用户登录的时间

### 什么是设备文件
设备在文件系统中有一个文件名，设备文件一般放于目录 /dev下，与普通磁盘文件不同的是设备文件的文件类型属于特殊文件

# tty命令
tty命令可以打印出当前终端的设备文件名
```
[root@localhost ~]# tty
/dev/pts/5
[root@localhost ~]# 
```
# who am i命令
`who am i`命令可以 列出当前终端上的登录用户
```
[root@localhost ~]# who am i
root     pts/5        2021-04-21 13:57 (192.168.1.2)
[root@localhost ~]# 
```
# whoami命令
命令`whoami`仅列出当前终端上的登录用户
```
[root@localhost ~]# whoami
root
[root@localhost ~]# 
```

