---
title: 谷歌浏览器中Java Doc无法弹出新标签页
categories: 
  - Windows
  - 软件设置
date: 2020-01-07 03:18:36
updated: 2020-01-07 03:42:27
abbrlink: bc05cd70
---
<div id='my_toc'><a href="/blog/bc05cd70/#问题描述" class="header_1">问题描述</a><br><a href="/blog/bc05cd70/#谷歌浏览器-设置允许弹窗的网站" class="header_1">谷歌浏览器 设置允许弹窗的网站</a><br><a href="/blog/bc05cd70/#在-设置中-进入-弹出式窗口和重定向" class="header_2">在 设置中 进入 弹出式窗口和重定向</a><br><a href="/blog/bc05cd70/#添加-允许弹窗的网站的-域名" class="header_2">添加 允许弹窗的网站的 域名</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
- JDK9之后[Java DOC](https://docs.oracle.com/en/java/javase/11/docs/api/index.html)支持搜索功能
- 在其他浏览器中点击搜索结果可以弹出新标签页.
- 但是在谷歌浏览器中弹出的新标签页被拦截了

现在来介绍如何设置不拦截java doc中的弹窗
# 谷歌浏览器 设置允许弹窗的网站
## 在 设置中 进入 弹出式窗口和重定向
- 打开设置,在**左侧**进入**高级**,然后进入**隐私设置和安全性**,进入**网站设置**.
- 或者直接搜索:**弹出式窗口和重定向**,然后进入进入**网站设置**.

![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Windows/SoftwareSettings/GoogleChrome/AllowPopups/1.png)
拖动右侧的**滚动条**,找到**弹出式窗口和重定向**
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Windows/SoftwareSettings/GoogleChrome/AllowPopups/2.png)
## 添加 允许弹窗的网站的 域名
然后**添加允许**即可,设置的时候指定网站的域名即可,如:`docs.oracle.com`
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Windows/SoftwareSettings/GoogleChrome/AllowPopups/3.png)

<!-- Windows/SoftwareSettings/GoogleChrome/AllowPopups/ -->
