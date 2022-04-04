---
title: Java Web简介
categories: 
  - Java
  - Java EE
  - JSP
  - Java Web简介
abbrlink: ec8e0fb7
date: 2018-12-08 21:46:18
updated: 2022-04-04 00:51:44
---
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

# Java Web简介 #
- 什么是Web应用程序
- 静态页面与动态页面
- 搭建 Java Web开发环境
- 手工编写第一个Web应用程序
- MyEclipse配置
- 使用 MyEclipse编写第一个Web应用程序
- 修改 Tomcat默认端口

## 什么是Web应用程序 ##
Web应用程序是一种可以通过web访问的应用程序。Web应用程序的一个最大好处是用户很容易访问应用程序。`用户只需要有浏览器即可`,不需要再安装其他软件.
### 常见web应用程序 ###
- 在线电子商务网站，淘宝，京东等。
- 大型门户站点，新浪，搜狐，网易等。

### 目前软件开发领域的三大方向 ###
- 桌面应用程序,如qq,office等,一般为C/S架构
- Web应用程序,各类网站
- 嵌入式应用程序,安卓，苹果等。

## 静态网页与动态网页 ##
### 静态网页 ###
表现形式:网页中的内容是固定,不会更新。
所需技术: HTML CSS
### 动态网页 ###
表现形式:网页中的内容通过程序动态显示的,自动更新。
所需技术: HTML,CSS,数据库技术,至少一门高级语言(Java,C#,PhP), Javascript, XML等。
主流的动态网页脚本技术:JSP/ASP. net/PHP

## 搭建 Java Web开发环境 ##
主要需要下面这几个东西,需要：
- JDK
- Tomcat服务器
- IDE

### Tomcat安装步骤 ###
### Tomcat版本和JDK版本之间的映射关系 ###
|Apache Tomcat版本|支持的Java版本|
|:--|:--|
|9.0.x|8及以后|
|8.5.x的|7及以后|
|7.0.x|6及更高版本|
### 下载Tomcat ###
到[https://tomcat.apache.org/download-80.cgi](https://tomcat.apache.org/download-80.cgi)去下载tomcat,我这里下载的是8.5版本的:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/download/download64zip.png)
### 安装 ###
解压即可安装。
### 如何启动 ###
进入安装目录下的bin目录，点击`startup.bat`即可启动tomcat服务器:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/startup_shutdown/startup.png)
看到下面信息表示启动成功:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/startup_shutdown/startupYes.png)
然后浏览器打开[http://localhost:8080/](http://localhost:8080/),看到如下页面表示启动就表示启动成功了:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/startup_shutdown/browerYes.png)
### 如何关闭 ###
进入安装目录下的bin目录，点击`shutdown.bat`即可关闭tomcat服务器。也可以直接关闭上面的`startup.bat`窗口来关闭服务器。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/startup_shutdown/shutdown.png)
### 配置Tomcat环境变量 ###
- `CATALINA_HOME`配置为安装目录`D:\dev\apache-tomcat-8.5.35`
- `Path`环境变量中添加`%CATALINA_HOME%\bin`

![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/path/CATALINA_HOME.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/path/path.png)

### Tomcat服务器的目录结构 ###
进入tomcat安装目录，可以看到目录结构如下:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/mulu/mulujiegou.png)
各个目录的说明如下:

|列名|列名|
|:--|:--|
|/bin|存放各种平台下用于启动和停止 Tomcat的命令文件|
|/conf|存放 Tomcat服务器的各种配置文件|
|/lib|存放 Toma服务器所需的各种JAR文件|
|/logs|存放 Tomcat的日志文件|
|/temp|存放Tomcat运行时的临时文件|
|/webapps|当发布Web应用时,默认会将Web应用的文件发布到于此目录中|
|/work|Tomcat把由JSP生成的 Servlet放于此目录下|
## Tomcat中手动创建第一个Java Web项目 ##
写在这里文章就太长了，参见:[Tomcat中手工编写第一个Java Web程序](https://www.lansheng.net.cn/blog/ccc57c12/)
## WEB-INF目录详解 ##
WEB-INF目录结构如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/WEB-INF/jiegou.png)
WEB-INF是Java WEB应用的`安全目录`。**所谓安全就是客户端无法访问,只有服务端可以访问的目录**。
### 验证客户端是否真的无法访问WEB-INF目录 ###
可以在WEB-INF目录中创建一个test.html文件:
```html
<html>
    <head>
        <meta charset="utf-8">
        <title>WEB-INF安全目录(客户端无法访问)</title>
    </head>
    <body>
        <h1>这是WEB-INF目录中test.html文件</h1>
    </body>
</html>
```
然后启动tomcat服务器器，看看浏览器能否打开这个html文件([http://localhost:8080/HelloWorld/WEB-INF/test.html](http://localhost:8080/HelloWorld/WEB-INF/test.html)):
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/WEB-INF/clientcannot.png)
可以看到是客户端(浏览器)是不可以访问到的。
### web.xml配置文件 ###
`web.xml`是Web项目的配置文件,里面存放了项目的许多配置信息。如可以配置项目的欢迎界面。tomcat中会默认`index.jsp`页面当成项目的欢迎界面。所以，现在使用[http://localhost:8080/HelloWorld/](http://localhost:8080/HelloWorld/)来访问服务器，显示的还是index.jsp页面:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/web_xml/root.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/web_xml/index_jsp.png)
如果项目中没有index.jsp文件，如下面吧index.jsp改名为hhh.jsp
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/web_xml/renameindex_jsp.png)
再使用[http://localhost:8080/HelloWorld/](http://localhost:8080/HelloWorld/)，则现在使用项目名来访问就无法看到欢迎界面。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/web_xml/root404.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/web_xml/hhh_jsp.png)
### 修改欢迎界面 ###
打开web.xml文件，然后添加如下的标签:
```xml
<welcome-file-list>
    <welcome-file>/index.jsp<welcome-file>
    <welcome-file>/hhh.jsp<welcome-file>
</welcome-file-list>
```
`</welcome-file-list>`顾名思义，就是欢迎界面列表，这里面可以放多个欢迎界面，服务器会按顺序列表中的欢迎界面是否存在，如果第一个存在就以第一个作为欢迎界面，如果不存在则显示后面的。  
到`<web-app></web-app>`标签之中，如下所示
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
  metadata-complete="true">

    <welcome-file-list>
        <welcome-file>/index.jsp</welcome-file>
        <welcome-file>/hhh.jsp</welcome-file>
    </welcome-file-list>

</web-app>

```
然后重启tomcat服务器，这个时候通过项目名[http://localhost:8080/HelloWorld/](http://localhost:8080/HelloWorld/)就能正常显示欢迎界面了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/web_xml/welcome-file.png)
### classes文件夹 ###
classes文件夹,用以存放项目生成的字节码`.class`文件。
### lib文件夹 ###
lib文件夹,用于存放需要项目中用到的jar包,如连接数据库驱动的jar包等。
## Web项目的虚拟路径 ##
项目URL:`http://localhost:8080/HelloWorld/`中的`HelloWorld`是项目的虚拟路径，它默认和项目的名字HelloWorld一样，不过可以修改这个虚拟路径，让虚拟路径和项目的名字不一样。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/introduce/virtualPath.png)
### eclipse中修改Web项目虚拟路径 ###
#### 修改虚拟路径 ####
选择项目，打开首选项`Properties`：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/jsp/xunipath/properties.png)
找到`Web Proiect Settings`--`Context root:`,修改虚拟路径为`HelloWorld2`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/jsp/xunipath/rename.png)
到这里就修改成功过了，但是`还没有生效`。
#### 重新部署以生效 ####
先移除掉原来的web项目
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/jsp/xunipath/remove.png)
然后，重新部署：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/jsp/xunipath/restart.png)
这样就可以使用新的虚拟路径啦：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/jsp/xunipath/yes.png)
注意一定要先从tomcat中移除原来的项目。

## 参考链接 ##
[tomcat版本与JDK版本的对应关系](http://tomcat.apache.org/whichversion.html)
[tomact首页](http://tomcat.apache.org/)
[tomcat8下载页](https://tomcat.apache.org/download-80.cgi)
[慕课网 Tmcat目录结构](https://www.imooc.com/video/2925)
