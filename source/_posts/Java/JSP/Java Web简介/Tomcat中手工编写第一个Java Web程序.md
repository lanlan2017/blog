---
title: Tomcat中手工编写第一个Java Web程序
categories: 
  - Java
  - JSP
  - Java Web简介
date: 2018-12-01 11:52:15
updated: 2019-11-05 10:32:11
abbrlink: ccc57c12
---
- [步骤](/blog/ccc57c12/#步骤)
- [创建项目目录结构](/blog/ccc57c12/#创建项目目录结构)
    - [创建项目目录](/blog/ccc57c12/#创建项目目录)
    - [创建index.jsp](/blog/ccc57c12/#创建index-jsp)
    - [创建Web_INF文件夹](/blog/ccc57c12/#创建Web-INF文件夹)
        - [创建web.xml文件](/blog/ccc57c12/#创建web-xml文件)
        - [编写web.xml文件](/blog/ccc57c12/#编写web-xml文件)
        - [创建classes目录](/blog/ccc57c12/#创建classes目录)
        - [创建lib目录](/blog/ccc57c12/#创建lib目录)
    - [启动tomcat服务器](/blog/ccc57c12/#启动tomcat服务器)
    - [浏览器查看](/blog/ccc57c12/#浏览器查看)
    - [参考链接](/blog/ccc57c12/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

# 步骤 #
手工创建java web程序步骤如下:
- 创建项目目录结构
	- 在 WebApps创建项目目录，我这里是`D:\dev\apache-tomcat-8.0.33\webapps`
	- 编写 `index. jsp`
	- 创建WEB-INF目录
		- 创建web.xml文件
			- 编写web.xml文件
		- 创建classes目录
		- 创建lib目录
- 测试运行

# 创建项目目录结构 #
## 创建项目目录 ##
在webapps目录下创建一个HelloWorld目录(项目)，如下所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/HelloWorldProject.png)
## 创建index.jsp ##
然后进入HelloWorld目录,创建一个`index.jsp`文件,如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/newIndex_jsp.png)
然后打开`index.jsp`文件，在里面写上基本html代码，如下所示:
```html
<html>
	<head>
		<meta charset="utf-8">
		<title>HelloWorld</title>
	</head>
	<body>
		<h1>欢迎来到HelloWorld</h1>
	</body>
</html>
```
## 创建Web_INF文件夹 ##
这个文件夹，可以参考tomcat自带的样例项目:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/examples.png)
在HellowWorld文件夹下，创建`WEB-INF`目录，如下所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/newWebINF.png)
### 创建web.xml文件 ###
然后进入WEB-INF目录，创建一个web.xml文件,如下所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/newWebXML.png)
### 编写web.xml文件 ###
web.xml里面的东西该写什么，现在还不知道，可以复制样例项目中的web.xml文件粘贴到HelloWorld中的web.xml,然后删除掉注释和其他标签，只保留跟标签即可。如下所示:
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
  metadata-complete="true">


</web-app>
```
### 创建classes目录 ###
接着在WEB-INF目录下，创建classes目录，如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/newclassesMuLu.png)
classes目录用于存放编译生成的`.class`文件
### 创建lib目录 ###
接着在WEB-INF目录下，创建lib目录，如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/newlibMULU.png)
lib目录用于存放项目中用到的`.jar`包。
到这里整个项目的目录结构就创建好了,完整目录结果如下所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/HelloworldMuluShow.png)
## 启动tomcat服务器 ##
进入tomcat安装目录下的bin目录，点击startup.bat启动tomcat服务器。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/startTomcat.png)
然后点击浏览器，输入地址[http://localhost:8080/HelloWorld/index.jsp](http://localhost:8080/HelloWorld/index.jsp)就可以打开网页了：![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/openIndexInFirefox.png)
## 浏览器查看 ##
可以看到这里中文是乱码的，该一下浏览器的编码即可：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/firefoxEncoding.png)
这样就显示正常了:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/newByHand/show.png)
## 参考链接 ##
慕课视频: [https://www.imooc.com/video/2926](https://www.imooc.com/video/2926)
>原文链接: [Tomcat中手工编写第一个Java Web程序](https://lanlan2017.github.io/blog/ccc57c12/)
