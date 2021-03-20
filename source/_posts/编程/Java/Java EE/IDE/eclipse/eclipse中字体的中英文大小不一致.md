---
title: eclipse中字体的中英文大小不一致
categories: 
  - 编程
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-06-19 01:19:37
updated: 2020-04-11 09:21:19
abbrlink: 511c4c42
---
<div id='my_toc'><a href="/blog/511c4c42/#eclipse中字体的中英文大小不一致" class="header_1">eclipse中字体的中英文大小不一致</a>&nbsp;<br><a href="/blog/511c4c42/#分析原因" class="header_2">分析原因</a>&nbsp;<br><a href="/blog/511c4c42/#解决方案" class="header_2">解决方案</a>&nbsp;<br><a href="/blog/511c4c42/#eclipse中使用" class="header_2">eclipse中使用</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# eclipse中字体的中英文大小不一致 #
## 分析原因 ##
`eclipse`的默认字体好像是`Consolas`,但
> `Consolas`字体原本是微软为 `Visual Studio 2005`和`2008`用户提供的，**原版只是单独的英文字体，不含中文**。因此**在中文环境下显示会是“宋体”+`Consolas` 的组合**。

## 解决方案 ##
使用`Consolas+雅黑混合版`,下载路径[https://www.iplaysoft.com/consolas.html](https://www.iplaysoft.com/consolas.html)
## eclipse中使用 ##
`Window-Preferences-General-Appearance-Colors and fonts-Text Font`,选择`YaHei Consolas Hybrid`,大小选择`小四`或者`五号`之类的带中文的字号.这两种字号比较清晰。
