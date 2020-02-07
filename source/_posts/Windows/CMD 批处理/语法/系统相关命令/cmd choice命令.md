---
title: cmd choice命令
categories: 
  - Windows
  - CMD 批处理
  - 语法
  - 系统相关命令
date: 2019-12-22 11:20:19
updated: 2019-12-22 11:41:22
abbrlink: bb8611bd
---
<div id='my_toc'><a href="/blog/bb8611bd/#cmd-choice命令" class="header_1">cmd choice命令</a>&nbsp;<br><a href="/blog/bb8611bd/#延时" class="header_2">延时</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# cmd choice命令

## 延时
```cmd
choice /t 秒数 /d y /n >nul
```
例如延时5秒:
```cmd
choice /t 5 /d y /n >nul
```
