---
title: Java截图文字识别升级
categories: 
  - 编程
  - Java
  - java GUI
date: 2018-09-16 13:07:25
updated: 2020-04-11 09:21:19
abbrlink: 77feedee
---
<div id='my_toc'><a href="/blog/77feedee/#需求" class="header_2">需求</a>&nbsp;<br><a href="/blog/77feedee/#升级2" class="header_2">升级2</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
之前已经完成了程序的开发，也加入了热键，不过每次截图(ctrl+alt+w)都要手动的去点击文字识别按钮，显然有点浪费时间。
需求，添加文字识别快捷键(alt+B(BaiduOCR的简称))

实现，支持快捷键即可。

## 需求 ##
让工具栏在截图窗口消失的时候，显示在屏幕左上角，避免挡住屏幕影响阅读。
在构造函数中传入工具栏窗口的引用tools，然后嗲用tools.setLocation(0,0)。即可，本来我想着放在右边的，但是放右边的话不好计算坐标，索性就放右上角。
添加构造函数:
```java
    public BaiduOCR(String path, ScreenShotWindow screenShotWindow,
            JButton baiduOCRButton, ToolsWindow tools)
    {
        this.path = path;
        this.screenShotWindow = screenShotWindow;
        this.baiduOCRButton = baiduOCRButton;
        this.tools = tools;
    }
```
run()方法中加入：
```java
if (tools != null)
    tools.setLocation(0, 0);
```
## 升级2 ##
有时候误操作的时候，我必须得截图一下才能进行其他操作。
我希望在误操作的时候可以退出截图。比如按下esc按键。
按下alt+e让截图窗口隐藏


修改好了，我现在该代码都没注意改
