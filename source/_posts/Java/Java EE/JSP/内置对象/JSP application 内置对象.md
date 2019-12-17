---
title: JSP application 内置对象
categories: 
  - Java
  - Java EE
  - JSP
  - 内置对象
date: 2018-12-19 15:11:38
updated: 2019-12-16 02:39:11
abbrlink: bc7737a8
---
<div id='my_toc'><a href="/blog/bc7737a8/#application内置对象" class="header_1">application内置对象</a><br><a href="/blog/bc7737a8/#访问应用程序初始化参数" class="header_2">访问应用程序初始化参数</a><br><a href="/blog/bc7737a8/#设置应用程序初始化参数" class="header_3">设置应用程序初始化参数</a><br><a href="/blog/bc7737a8/#获取初始化参数" class="header_3">获取初始化参数</a><br><a href="/blog/bc7737a8/#管理应用程序环境属性" class="header_2">管理应用程序环境属性</a><br><a href="/blog/bc7737a8/#其他方法" class="header_2">其他方法</a><br><a href="/blog/bc7737a8/#实例" class="header_2">实例</a><br></div>
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
# application内置对象 #
application对象用于保存所有应用程序中的公有数据。**它在服务器启动时自动创建,在服务器停止时销毁**。所有用户都可以共享该 application对象。与 session对象相比, application对象的生命周期更长,类似于系统的“全局变量”。


- application对象是 ServletContext类的实例。
- application开始于服务器的启动,终止于服务器的关闭。在此期间，application对象一直存在。
- 在用户的前后连接或不同用户之间的连接中,可以对 application对象的同一属性进行操作。
    - 类似于java中的静态成员属于整个类而不属于对象一样，applicatioan对象属于整个服务器，而不是属于某一个项目。
- 在任何地方对 application对象属性的操作,都将影响到其他用户对此的访问。
- 服务器的启动和关闭决定了 application对象的生命。


## 访问应用程序初始化参数 ##
### 设置应用程序初始化参数 ###
application对象提供了对应用程序初始化参数进行访问的方法。应用程序初始化参数在 web.xml文件中进行设置, web.xm文件位于Web应用所在目录下的 WEB-INF子目录中。在 web.xm文件中通过`<context-param>`标记配置应用程序初始化参数,如下所示：
```xml
......
    <context-param>
        <param-name>url</param-name>
        <param-value>jdbc:mysql://127.0.0.1:3306/databaseName</param-value>
    </context-param>
</web-app>
```
### 获取初始化参数 ###
在web.xml中设置好初始化参数后，就可以在JSP页面中获取这些初始化参数，
application对象提供了两种访问应用程序初始化参数的方法,下面分别进行介绍。
getlnitParameter()

|列名|列名|
|:--|:--|
|`Enumeration<String> getInitParameterNames()`|获取所有初始化参数名称的枚举|
|`String getInitParameter(String name)`|根据参数名称对应的参数值|

**实例：或是上述web.xml中设置的所有初始化参数**
```jsp
<%
    Enumeration<String> initParameterNames = application
            .getInitParameterNames();
    String name = null;
    while (initParameterNames.hasMoreElements())
    {
        name = initParameterNames.nextElement();
        out.print(name + "=" + application.getInitParameter(name));
    }
%>
```
显示效果：
```
url=jdbc:mysql://127.0.0.1:3306/databaseName 
```
## 管理应用程序环境属性 ##
与 session对象相同,也可以在 application对象中设置属性。与 session对象不同的是, session只是在当前客户的会话范围内有效,当超过保存时间, session对象就被收回;而 application对象在整个应用区域中都有效。 application对象管理应用程序环境属性的方法分别介绍如下

|方法|描述|
|:--|:--|
|`void setAttribute(String name, Object value)`|设置属性|
|`Object getAttribute(String name)`|取得属性名称对应的属性值，没有该属性则返回null|
|`Enumeration<String> getAttributeNames()`|取得session中所有属性名称的枚举|
|`void removeAttribute(String name)`|移除属性名为name的属性|
## 其他方法 ##

|方法|描述|
|:--|:--|
|String getServerInfo()|返回JSP(servlet)引擎名及版本号|
## 实例 ##
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
    <h2>application内置对象</h2>
    <%
        //设置属性
        application.setAttribute("name", "小明");
        application.setAttribute("sex", "男");
        application.setAttribute("age", "18");
        //获取属性名称的枚举
        Enumeration<String> names= application.getAttributeNames();        
        String name=null;
        out.println("JSP(servlet)引擎名及版本号:"+application.getServerInfo());
        //遍历所有的属性
        out.println("<hr>");
        while(names.hasMoreElements())
        {
            name=names.nextElement();
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+name+"="+application.getAttribute(name)+"<br>");
        }
        out.println("<hr>");
    %>
</body>
</html>
```
运行结果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/application/show.png)
可以看到除了我们自己设置的几个属性之外，还有一些内置的属性。
