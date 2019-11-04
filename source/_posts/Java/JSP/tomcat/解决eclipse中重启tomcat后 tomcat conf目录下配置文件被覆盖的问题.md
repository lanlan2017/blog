---
title: 解决eclipse中重启tomcat后 tomcat conf目录下配置文件被覆盖的问题
categories: 
  - Java
  - JSP
  - tomcat
date: 2018-12-11 23:57:25
updated: 2019-10-30 11:55:40
abbrlink: 2f563857
---
- [问题描述](/blog/html/2f563857/#问题描述)
- [问题分析](/blog/html/2f563857/#问题分析)
- [解决方案](/blog/html/2f563857/#解决方案)
- [参考链接](/blog/html/2f563857/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">&nbsp;<input type="button" value="复制链接" onclick="copyPageURL();">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();  
    function copyPageURL() {const input = document.createElement('input');input.setAttribute('readonly', 'readonly');input.setAttribute('value', window.location.href);document.body.appendChild(input); input.select();if (document.execCommand("copy")) {alert("已复制: " + input.value)} document.body.removeChild(input);}
</script>

## 问题描述 ##
tomcat后台管理中需要输入用户和密码，于是我在tomcat安装目录下的conf目录中的tomcat-user.xml中的`<tomcat-users>`标签中加入了以下配置项：
```xml
<role rolename="manager-gui" />
<user username="admin" password="admin" roles="manager-gui" />
```
然后在eclipse中重启了tomcat想让配置生效。神奇的是，tomcat重启后，我刚修改的配置文件被覆盖掉了。
## 问题分析 ##
Ecplise项目中有一个Server项目，有一个`Tomcat v8,5 Server at localhost-config`,里面也有server.xml，content.xml，tomcat-user.xml等配置文件。eclipse中的tomcat重新发布时，eclipse会用这里的配置文件覆盖Tomcat的conf目录。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/tomcat/eclipse_conf/server.png)
## 解决方案 ##
在eclipse中的Server项目中修改对应的配置文件就行了。
## 参考链接 ##
[http://www.cnblogs.com/zuosl/p/4342190.html](http://www.cnblogs.com/zuosl/p/4342190.html)
>原文链接: [解决eclipse中重启tomcat后 tomcat conf目录下配置文件被覆盖的问题](https://lanlan2017.github.io/blog/2f563857/)