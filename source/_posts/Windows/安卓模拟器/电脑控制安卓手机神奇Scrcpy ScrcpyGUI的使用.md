---
title: 电脑控制安卓手机神奇Scrcpy ScrcpyGUI的使用
categories: 
  - Windows
  - 安卓模拟器
date: 2019-12-03 21:30:26
updated: 2019-12-09 19:45:23
abbrlink: c57ac4f
---
<div id='my_toc'><a href="/blog/c57ac4f/#简介">简介</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/c57ac4f/#Scrcpy">Scrcpy</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/c57ac4f/#Scrcpy-GUI">Scrcpy GUI</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/c57ac4f/#Scrcpy-GUI">Scrcpy GUI</a><br/><a href="/blog/c57ac4f/#配置scrcpy">配置scrcpy</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/c57ac4f/#下载-解压scrcpy">下载 解压scrcpy</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/c57ac4f/#配置scrcpy到Path环境变量">配置scrcpy到Path环境变量</a><br/><a href="/blog/c57ac4f/#下载Scrcpy-GUI">下载Scrcpy GUI</a><br/><a href="/blog/c57ac4f/#使用">使用</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/c57ac4f/#前提">前提</a><br/><a href="/blog/c57ac4f/#参考资料">参考资料</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 简介
## Scrcpy
Scrcpy是Genymobile开发的一个手机远程控制工具,使用的是命令行模式.
项目地址:[https://github.com/Genymobile/scrcpy](https://github.com/Genymobile/scrcpy)
## Scrcpy GUI
原生的Scrcpy没有提供图形界面,Scrcpy GUI是Github用户`Simon Ma`开发的基于Scrcpy的图形工具.
项目地址:[https://github.com/Tomotoes/scrcpy-gui/](https://github.com/Tomotoes/scrcpy-gui/)
## Scrcpy GUI
参考[Scrcpy GUI项目中文文档](https://github.com/Tomotoes/scrcpy-gui/blob/master/README.zh_CN.md)
# 配置scrcpy
## 下载 解压scrcpy
下载scrcpy:[https://github.com/Genymobile/scrcpy/releases/download/v1.10/scrcpy-win64-v1.10.zip](https://github.com/Genymobile/scrcpy/releases/download/v1.10/scrcpy-win64-v1.10.zip)
然后找个解压到一个目录中.
## 配置scrcpy到Path环境变量
将压缩包解压后得到的目录添加大Path环境变量中即可.

# 下载Scrcpy GUI
下载路径:[https://github.com/Tomotoes/scrcpy-gui/releases](https://github.com/Tomotoes/scrcpy-gui/releases)
windows的话下载`ScrcpyGui-1.0.0.exe`
然后点击安装即可。
# 使用
## 前提
手机用数据先连接到电脑上,然后开启`USB调试`功能。
直接使用scrcpy也是也可以的.

# 参考资料
[https://www.zhyong.cn/posts/99d/](https://www.zhyong.cn/posts/99d/)
