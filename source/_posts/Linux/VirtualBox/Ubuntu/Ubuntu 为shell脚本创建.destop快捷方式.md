---
title: Ubuntu 为shell脚本创建.destop快捷方式
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-26 00:48:27
updated: 2019-11-26 00:55:28
abbrlink: cc785ddc
---
<div id='my_toc'>

- [Ubuntu 为shell脚本创建.destop快捷方式](/blog/cc785ddc/#Ubuntu-为shell脚本创建-destop快捷方式)
    - [HexoS.sh](/blog/cc785ddc/#HexoS-sh)
- [杀死占用端口的所有进程](/blog/cc785ddc/#杀死占用端口的所有进程)
    - [启动博客.desktop](/blog/cc785ddc/#启动博客-desktop)
    - [.desktop 配置详解](/blog/cc785ddc/#-desktop-配置详解)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# Ubuntu 为shell脚本创建.destop快捷方式 #
## HexoS.sh ##
```shell
#! /bin/bash
# 杀死占用端口的所有进程
kill -s 9 $(lsof -i:4007 -t)
cd /home/blue/桌面/Blog/blog9/
hexo s -p 4007

```
## 启动博客.desktop ##
```shell
[Desktop Entry]
Encoding=UTF-8
Name=启动博客
Type=Application
Categories=Application;
StartupNotify=true
Terminal=true
Exec=sh /home/blue/桌面/Blog/blog9/HexoS.sh
```

## .desktop 配置详解 ##
