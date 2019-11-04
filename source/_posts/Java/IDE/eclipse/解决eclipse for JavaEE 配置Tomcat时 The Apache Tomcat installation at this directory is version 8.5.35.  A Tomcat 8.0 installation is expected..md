---
title: 解决eclipse for JavaEE 配置Tomcat时 The Apache Tomcat installation at this directory is version 8.5.35.  A Tomcat 8.0 installation is expected.
categories: 
  - Java
  - IDE
  - eclipse
date: 2018-12-02 00:24:04
updated: 2019-10-30 11:55:39
abbrlink: b2fd10c5
---
- [问题描述](/blog/html/b2fd10c5/#问题描述)
- [解决方案](/blog/html/b2fd10c5/#解决方案)
    - [方案1 下载最新版的eclipse for JavaEE](/blog/html/b2fd10c5/#方案1-下载最新版的eclipse-for-JavaEE)
    - [方案 2 修改Apache源代码中的配置文件](/blog/html/b2fd10c5/#方案-2-修改Apache源代码中的配置文件)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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
>原文链接: [解决eclipse for JavaEE 配置Tomcat时 The Apache Tomcat installation at this directory is version 8.5.35.  A Tomcat 8.0 installation is expected.](https://lanlan2017.github.io/blog/b2fd10c5/)