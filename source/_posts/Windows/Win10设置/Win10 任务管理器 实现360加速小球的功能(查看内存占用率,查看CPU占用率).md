---
title: Win10 任务管理器 实现360加速小球的功能(查看内存占用率,查看CPU占用率)
categories: 
  - Windows
  - Win10设置
date: 2020-02-26 04:58:53
updated: 2020-02-26 05:27:21
abbrlink: f5e533e0
---
<div id='my_toc'><a href="/blog/f5e533e0/#win10-使用任务管理器来-显示CPU占用-内存占用弹窗" class="header_1">win10 使用任务管理器来 显示CPU占用 内存占用弹窗</a>&nbsp;<br><a href="/blog/f5e533e0/#前言" class="header_2">前言</a>&nbsp;<br><a href="/blog/f5e533e0/#任务管理器-选项-置于顶层" class="header_2">任务管理器 选项 置于顶层</a>&nbsp;<br><a href="/blog/f5e533e0/#任务管理器-性能-隐藏图形" class="header_2">任务管理器 性能 隐藏图形</a>&nbsp;<br><a href="/blog/f5e533e0/#任务管理器-性能-摘要图形" class="header_2">任务管理器 性能 摘要图形</a>&nbsp;<br><a href="/blog/f5e533e0/#进一步缩小任务管理器窗口大小" class="header_2">进一步缩小任务管理器窗口大小</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# win10 使用任务管理器来 显示CPU占用 内存占用弹窗
## 前言
电脑中的软件如果打开的太多的话,经常会耗尽内存,然后就莫名其妙的蓝屏。
以前使用360的时候,会有各个360加速球,可以看到CPU占用,内存占用的比例。这样当发现内存用尽时,可以点击加速器,关掉一些程序,进而避免系统崩溃。
但是360这种东西广告太多,卸载掉了.
但是为了避免系统经常崩溃,我还是想知道CPU占用,内存占用情况,这样一旦占用过高,我就可以关掉一些软件以减少占用。

## 任务管理器 选项 置于顶层
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Windows/Win10/TaskManager/MemoryUsage/1.png)
这一步设置让任务管理器永远显示在其他程序上面,这样切换程序后还是可以看到任务管理器
## 任务管理器 性能 隐藏图形
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Windows/Win10/TaskManager/MemoryUsage/2.png)
这一步是为了缩小不必要的图形,减小任务管理器的大小
## 任务管理器 性能 摘要图形
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Windows/Win10/TaskManager/MemoryUsage/3.png)
这一步之后就可以看到CPU,内存,磁盘,以太网,WiFi，GPU等的占用大小,并且一直最顶层
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Windows/Win10/TaskManager/MemoryUsage/4.png)
## 进一步缩小任务管理器窗口大小
缩小任务管理器窗口大小,只显示CPU和内存的视图就行了.CPU和内存占用过高引起系统崩溃的概率比较大
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Windows/Win10/TaskManager/MemoryUsage/5.png)
<!-- Blog/Windows/Win10/TaskManager/MemoryUsage/5 -->
