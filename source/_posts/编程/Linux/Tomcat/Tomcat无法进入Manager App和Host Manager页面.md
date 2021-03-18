---
title: Tomcat无法进入Manager App和Host Manager页面
categories:
  - 编程
  - Linux
  - Tomcat
abbrlink: 5d0a8795
date: 2021-03-12 09:55:01
updated: 2021-03-12 10:29:43
---
<div id='my_toc'><a href="/blog/null/#Tomcat无法进入Manager-App和Host-Manager页面" class="header_1">Tomcat无法进入Manager App和Host Manager页面</a>&nbsp;<br><a href="/blog/null/#解决无法进入Manager-App页面" class="header_2">解决无法进入Manager App页面</a>&nbsp;<br><a href="/blog/null/#取消访问IP限制" class="header_3">取消访问IP限制</a>&nbsp;<br><a href="/blog/null/#添加manager-gui角色以及tomcat用户名以及密码" class="header_3">添加manager-gui角色以及tomcat用户名以及密码</a>&nbsp;<br><a href="/blog/null/#解决无法进入Host-Manager页面的问题" class="header_2">解决无法进入Host Manager页面的问题</a>&nbsp;<br><a href="/blog/null/#取消访问IP限制" class="header_3">取消访问IP限制</a>&nbsp;<br><a href="/blog/null/#添加admin-gui角色，并将该角色授予上面创建的tomcat用户" class="header_3">添加admin-gui角色，并将该角色授予上面创建的tomcat用户</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Tomcat无法进入Manager App和Host Manager页面
## 解决无法进入Manager App页面
进入tomcat安装目录：
```shell
cd /opt/tomcat/apache-tomcat-8.5.63/
```
### 取消访问IP限制
进入manager页面的META-INF目录:
```shell
cd webapps/manager/META-INF
```
打开context.xml文件
```shell
vim context.xml
```
将最后一个标签中的Value标签注释掉，如下所示：
```xml
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
  <!--  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
```
### 添加manager-gui角色以及tomcat用户名以及密码
进入tomcat安装目录下的conf目录:
```shell
cd /opt/tomcat/apache-tomcat-8.5.63/
```
进入conf目录：
```shell
cd conf
```
打开tomcat-user.xml：
```shell
vim tomcat-users.xml 
```
在最后一行的`<tomcat-users>`标签之中，，添加如下以下两行代码：
```xml
  <role rolename="manager-gui"/>
  <user username="tomcat" password="tomcat" roles="manager-gui"/>
```
添加后的效果如下所示：
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- ... -->
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
 <!-- ...  -->
  <role rolename="manager-gui"/>
  <user username="tomcat" password="tomcat" roles="manager-gui"/>
</tomcat-users>
```
## 解决无法进入Host Manager页面的问题
### 取消访问IP限制
打开webapps/host-manager/META-INF/context.xml文件：
```shell
cd /opt/tomcat/apache-tomcat-8.5.63/webapps/host-manager/META-INF
vim context.xml
```
同样注释掉其中的Value标签：
```xml
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
  <!--  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />  -->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
```
### 添加admin-gui角色，并将该角色授予上面创建的tomcat用户
进入Tomcat安装目录下的conf目录，打开tomcat-users.xml文件：
```shell
cd opt/tomcat/apache-tomcat-8.5.63/conf
vim tomcat-users.xml
```
添加一个角色admin-gui,然后将该角色授予上面创建好的tomcat用户：
```xml
<!-- ...... -->
  <role rolename="manager-gui"/>
  <role rolename="admin-gui"/>
  <user username="tomcat" password="tomcat" roles="manager-gui,admin-gui"/>
</tomcat-users>
```
这样该tomcat用户既可以访问Manager App页面，也可以访问Host Manager页面。
或者为Host Manager重新指定一个用户也可以：
```xml
<!-- ...... -->
  <role rolename="manager-gui"/>
  <role rolename="admin-gui"/>
  <user username="tomcat" password="tomcat" roles="manager-gui"/>
  <user username="tomcat_host" password="tomcat_host" roles="admin-gui"/>
</tomcat-users>
```
