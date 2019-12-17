---
title: VirtualBox修复分辨率失效
categories: 
  - Linux
  - VirtualBox
date: 2019-11-24 23:19:58
updated: 2019-12-17 05:17:09
abbrlink: 88ff8084
---
<div id='my_toc'><a href="/blog/88ff8084/#问题描述" class="header_1">问题描述</a><br><a href="/blog/88ff8084/#解决方案" class="header_1">解决方案</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
今天在VirtualBox上安装了Ubuntu,默认的分辨率比较小,所以我Ubuntu上调整好分辨率后,显示虚拟机显示区域变大了。
但是我重启虚拟机后,**虚拟机的显示屏又变小了**。我总不可能每次都调整虚拟机的的分辨率.
# 解决方案
在VirtualBox的安装路径(E:\Program Files\Oracle\VirtualBox)下启动cmd,然后执行如下命令:
```cmd
VBoxManage setextradata global GUI/MaxGuestResolution any
```
```cmd
E:
cd E:\Program Files\Oracle\VirtualBox
VBoxManage setextradata global GUI/MaxGuestResolution any
```
这样调整虚拟的分辨率后,就可以一致有效了.
