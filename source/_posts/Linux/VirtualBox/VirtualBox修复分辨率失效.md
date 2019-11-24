---
title: VirtualBox修复分辨率失效
categories: 
  - Linux
  - VirtualBox
date: 2019-11-24 23:19:58
updated: 2019-11-25 00:22:01
abbrlink: 88ff8084
---
<div id='my_toc'>

- [问题描述](/blog/88ff8084/#问题描述)
- [解决方案](/blog/88ff8084/#解决方案)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 问题描述
今天在VirtualBox上安装了Ubuntu,默认的分辨率比较小,所以我Ubuntu上调整好分辨率后,显示虚拟机显示区域变大了。
但是我重启虚拟机后,**虚拟机的显示屏又变小了**。我总不可能每次都调整虚拟机的的分辨率.
# 解决方案
在VirtualBox的安装路径(E:\Program Files\Oracle\VirtualBox)下启动cmd,然后执行如下命令:
```cmd
E:\Program Files\Oracle\VirtualBox>VBoxManage setextradata global GUI/MaxGuestResolution any
```
这样调整虚拟的分辨率后,就可以一致有效了.
