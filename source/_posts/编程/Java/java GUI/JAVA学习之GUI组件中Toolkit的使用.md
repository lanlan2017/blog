---
title: JAVA学习之GUI组件中Toolkit的使用
categories: 
  - 编程
  - Java
  - java GUI
date: 2018-09-27 14:44:24
updated: 2020-04-11 09:21:19
abbrlink: 514963fc
---
<div id='my_toc'></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
在使用GUI中的组件进行窗体的设计时，**当需要将窗体始终显示在屏幕的某一位置时**，例如屏幕的中央。由于不同的电脑屏幕分辨率是不同的，所以在进行处理时会有一定的难度，还有就是当我们需要修改窗体的图标时，这些都要用到Tookit工具包。
首先，为了解决窗体的显示问题，进行如下设置：
```java
Toolkit toolkit = getToolkit();// 获得窗体工具包
Dimension screenSize = toolkit.getScreenSize();// 获取屏幕大小
int width = (int) (screenSize.width * 0.8);// 计算窗体新宽度
int height = (int) (screenSize.height * 0.8);// 计算窗体新宽度
setSize(width, height);// 设置窗体大小
```

