---
title: idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题
categories: 
  - Java
  - Java 基础
  - IDE
  - Idea
date: 2019-10-03 12:06:07
updated: 2019-12-17 05:17:09
abbrlink: cbf0ce22
---
<div id='my_toc'><a href="/blog/cbf0ce22/#idea-Shift+Alt+I快捷键是弹出TouchPad-Driver-Diagnostics的问题" class="header_1">idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题</a><br><a href="/blog/cbf0ce22/#原因" class="header_2">原因</a><br><a href="/blog/cbf0ce22/#解决方案-禁用触控板" class="header_2">解决方案:禁用触控板</a><br><a href="/blog/cbf0ce22/#重启电脑后生效" class="header_2">重启电脑后生效</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题 #
## 原因 ##
`Shift+Alt+L`是`Synaptics`(新思)触摸板驱动中用于触摸板测试的快捷键
## 解决方案:禁用触控板 ##
以管理员身份运行`cmd`,输入如下命令:
```cmd
reg add HKEY_LoCAL_MACHINE\sYsTEM\CurrentControlset\services\synTP\Parameters\Debug /v DumpKernel /d 00000000 /t REG_DwoRD /f
```
## 重启电脑后生效 ##
运行后,不会立即生效,需要重启电脑才会生效.
