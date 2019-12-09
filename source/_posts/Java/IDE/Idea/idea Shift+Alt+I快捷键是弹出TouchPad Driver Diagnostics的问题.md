---
title: idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题
categories: 
  - Java
  - IDE
  - Idea
date: 2019-10-03 12:06:07
updated: 2019-12-09 20:34:55
abbrlink: cbf0ce22
---
<div id='my_toc'><a href="/blog/cbf0ce22/#idea-Shift-Alt-I快捷键是弹出TouchPad-Driver-Diagnostics的问题">idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/cbf0ce22/#原因">原因</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/cbf0ce22/#解决方案-禁用触控板">解决方案:禁用触控板</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/cbf0ce22/#重启电脑后生效">重启电脑后生效</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

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

>原文链接: [idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题](https://lanlan2017.github.io/blog/cbf0ce22/)
