---
title: JSTL使用步骤
categories: 
  - Java
  - Java EE
  - JSTL
date: 2019-04-22 12:32:02
updated: 2019-11-25 00:23:43
abbrlink: 80d567ab
---
<div id='my_toc'>

- [JSTL 库安装](/blog/80d567ab/#JSTL-库安装)
    - [下载JSTL库](/blog/80d567ab/#下载JSTL库)
    - [复制jar文件到项目中](/blog/80d567ab/#复制jar文件到项目中)
    - [复制tld文件到项目中](/blog/80d567ab/#复制tld文件到项目中)
    - [在JSP页面引入](/blog/80d567ab/#在JSP页面引入)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## JSTL 库安装 ##
Apache Tomcat安装JSTL 库步骤如下：
### 下载JSTL库 ###
从Apache的标准标签库中下载的二进包(jakarta-taglibs-standard-current.zip)。
    官方下载地址：http://archive.apache.org/dist/jakarta/taglibs/standard/binaries/
    本站下载地址：jakarta-taglibs-standard-1.1.2.zip
### 复制jar文件到项目中 ###
下载`jakarta-taglibs-standard-1.1.2.zip`包并解压，将`jakarta-taglibs-standard-1.1.2/lib/`下的两个`jar`文件：`standard.jar`和`jstl.jar`文件拷贝到`/WEB-INF/lib/`下。
### 复制tld文件到项目中 ###
将`jakarta-taglibs-standard-1.1.2/tld/`目录下的需要引入的`tld`文件复制到`WEB-INF/tld/`目录下,
### 在JSP页面引入 ###
接下来我们在 web.xml 文件中添加以下配置：

>原文链接: [JSTL使用步骤](https://lanlan2017.github.io/blog/80d567ab/)
