---
title: Linux more命令详解
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: 65cb3430
date: 2021-03-24 11:10:08
updated: 2021-04-03 18:15:30
---
<div id='my_toc'><a href="/blog/65cb3430/#more命令" class="header_1">more命令</a>&nbsp;<br><a href="/blog/65cb3430/#more内置快捷键" class="header_2">more内置快捷键</a>&nbsp;<br><a href="/blog/65cb3430/#格式" class="header_2">格式</a>&nbsp;<br><a href="/blog/65cb3430/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# more命令
more命令是一个基于vi编辑器文本过滤器，它以全屏幕的方式按页显示文本文件的内容，支持vi中的关键字定位操作。
## more内置快捷键
more名单中内置了若干快捷键，常用的有
- H（获得帮助信息），
- Enter（向下翻滚一行），
- 空格（向下滚动一屏），
- Q（退出命令）。

该命令一次显示一屏文本，满屏后停下来，并且在屏幕的底部出现一个提示信息，给出至今己显示的该文件的百分比：--More--（XX%）可以用下列不同的方法对提示做出回答：
- 按Space键：显示文本的下一屏内容。
- 按Enter键：只显示文本的下一行内容。
- 按斜线符`/`：接着输入一个模式，可以在文本中寻找下一个相匹配的模式。
- 按H键：显示帮助屏，该屏上有相关的帮助信息。
- 按B键：显示上一屏内容。
- 按Q键：退出rnore命令。

## 格式

# 参考资料
[https://www.cnblogs.com/peida/archive/2012/11/02/2750588.html](https://www.cnblogs.com/peida/archive/2012/11/02/2750588.html)
[https://www.yiibai.com/linux/more.html](https://www.yiibai.com/linux/more.html)
[https://man.linuxde.net/more](https://man.linuxde.net/more)
[https://www.runoob.com/linux/linux-comm-more.html](https://www.runoob.com/linux/linux-comm-more.html)
