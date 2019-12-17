---
title: 安装tomcat windows服务
categories: 
  - Java
  - Java EE
  - JSP
  - Java Web简介
date: 2018-12-08 21:46:18
updated: 2019-12-16 02:39:10
abbrlink: 6d6d5543
---
<div id='my_toc'><a href="/blog/6d6d5543/#什么是Windows服务" class="header_2">什么是Windows服务</a><br><a href="/blog/6d6d5543/#安装tomcat到Windows-服务" class="header_2">安装tomcat到Windows 服务</a><br><a href="/blog/6d6d5543/#启动tomcat服务器" class="header_2">启动tomcat服务器</a><br><a href="/blog/6d6d5543/#关闭tomcat服务器" class="header_2">关闭tomcat服务器</a><br><a href="/blog/6d6d5543/#重启tomcat服务" class="header_2">重启tomcat服务</a><br><a href="/blog/6d6d5543/#重启时删除日志文件" class="header_2">重启时删除日志文件</a><br><a href="/blog/6d6d5543/#删除tomcat-windows服务" class="header_2">删除tomcat windows服务</a><br><a href="/blog/6d6d5543/#比较tomcat-windows服务方式和startup.bat方法" class="header_2">比较tomcat windows服务方式和startup.bat方法</a><br><a href="/blog/6d6d5543/#参考链接" class="header_2">参考链接</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

## 什么是Windows服务 ##
 Windows 服务是操作系统启动时可以自动打开的应用程序。服务可以暂停和重新启动，服务不会显示任何用户界面,因而非常适合在服务器上使用。所以，如果把Tomcat注册为Windows Service服务，Tomcat就可以开机自动启动，一来不用每次手动启动,二来不会弹窗不会有那一大串东西输出到控制台上。

## 安装tomcat到Windows 服务 ##
管理员打开命令cmd,然后`cd` 到tomcat安装目录下的bin目录，然后输入:`service install tomcat8`安装tomcat服务，服务名为`tomcat8`,这个名字可以随意起。
```
D:\dev\apache-tomcat-8.5.35\bin>service install tomcat8
```
## 启动tomcat服务器 ##
输入命令`net start tomcat8`启动服务器，这个时候打开[http://localhost:8080/](http://localhost:8080/)就可以看到服务器正常启动了:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/kaiqitomcatfuwu/yes.png)
```
D:\dev\apache-tomcat-8.5.35\bin>net start tomcat8
Apache Tomcat 8.5 tomcat8 服务正在启动 .
Apache Tomcat 8.5 tomcat8 服务已经启动成功。
D:\dev\apache-tomcat-8.5.35\bin>

```
## 关闭tomcat服务器 ##
```
D:\dev\apache-tomcat-8.5.35\bin>net stop tomcat8
Apache Tomcat 8.5 tomcat8 服务正在停止.
Apache Tomcat 8.5 tomcat8 服务已成功停止。
D:\dev\apache-tomcat-8.5.35\bin>
```
## 重启tomcat服务 ##
```
@echo off 
net stop tomcat8
ping 127.0.0.1 -n 10
net start tomcat8
```
先关闭，延迟10秒,然后再启动
## 重启时删除日志文件 ##
```
再删除work下的文件和logs目录下的log文件，批处理命令:
@echo off
net stop tomcat8
ping 127.0.0.1 -n 10
del /f /s /q "Tomcat安装目录\logs\*"
del /f /s /q "Tomcat安装目录\work\*"
rmdir  /s /q "Tomcat安装目录\work\work1"
rmdir  /s /q "Tomcat安装目录\work\Catalina" 
ping 127.0.0.1 -n 10
net start tomcat8
```

## 删除tomcat windows服务 ##
```
D:\dev\apache-tomcat-8.5.35\bin>service remove tomcat8
Removing the service 'tomcat8' ...
Using CATALINA_BASE:    "D:\dev\apache-tomcat-8.5.35"
The service 'tomcat8' has been removed
D:\dev\apache-tomcat-8.5.35\bin>
```
## 比较tomcat windows服务方式和startup.bat方法 ##
通过这种方式来启动tomcat的好处就是不会弹窗，如果通过点击`startup.bat`来运行的话，会弹窗:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/kaiqitomcatfuwu/startup_mode.png)
这样挡住屏幕，看起来不友好。

## 参考链接 ##
[https://blog.csdn.net/fengyao1995/article/details/52927202](https://blog.csdn.net/fengyao1995/article/details/52927202)
[http://gaoxianwei.iteye.com/blog/1520064](http://gaoxianwei.iteye.com/blog/1520064)
