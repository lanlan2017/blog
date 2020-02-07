---
title: 解决eclipse for JavaEE 配置Tomcat时 The Apache Tomcat installation at this directory is version 8.5.35.  A Tomcat 8.0 installation is expected.
categories: 
  - Java
  - IDE
  - eclipse
date: 2018-12-02 00:24:04
updated: 2019-12-25 01:16:51
abbrlink: b2fd10c5
---
<div id='my_toc'><a href="/blog/b2fd10c5/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/b2fd10c5/#解决方案" class="header_2">解决方案</a>&nbsp;<br><a href="/blog/b2fd10c5/#方案1-下载最新版的eclipse-for-JavaEE" class="header_3">方案1 下载最新版的eclipse for JavaEE</a>&nbsp;<br><a href="/blog/b2fd10c5/#方案-2-修改Apache源代码中的配置文件" class="header_3">方案 2 修改Apache源代码中的配置文件</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

## 问题描述 ##
今天eclipse for JavaEE中配置Tomcat时遇到下面问题:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/tomcat/bug/show.png)
```
The Apache Tomcat installation at this directory is version 8.5.35.  A Tomcat 8.0 installation is expected.
```
这是因为我的Eclipse版本比较老，只支持到tomcat8.0，还不支持tomcat8.5：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/tomcat/bug/notMatcher.png)
## 解决方案 ##
### 方案1 下载最新版的eclipse for JavaEE ###
推荐使用这种方式。截止目前`2018/12/12`最新版的eclipse for JavaEE已经支持到`tomcat v9.0`了,直接下载最新版的就行了。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/show.png)
[[下载eclipse for JavaEE](https://www.lansheng.net.cn/blog/f9c8fc17/)]([下载eclipse for JavaEE](https://www.lansheng.net.cn/blog/f9c8fc17/))
### 方案 2 修改Apache源代码中的配置文件 ###
参见：[https://jingyan.baidu.com/article/48a42057f8dfafa92525044d.html](https://jingyan.baidu.com/article/48a42057f8dfafa92525044d.html)
