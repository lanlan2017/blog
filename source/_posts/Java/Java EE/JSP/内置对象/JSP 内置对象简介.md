---
title: JSP 内置对象简介
categories: 
  - Java
  - Java EE
  - JSP
  - 内置对象
date: 2018-12-08 21:46:24
updated: 2019-12-17 05:18:52
abbrlink: 4cc31c44
---
<div id='my_toc'><a href="/blog/4cc31c44/#JSP内置对象概述" class="header_1">JSP内置对象概述</a>&nbsp;<br><a href="/blog/4cc31c44/#JSP九大内置对象" class="header_2">JSP九大内置对象</a>&nbsp;<br><a href="/blog/4cc31c44/#Web程序的请求响应模式" class="header_1">Web程序的请求响应模式</a>&nbsp;<br><a href="/blog/4cc31c44/#表单的提交方式" class="header_1">表单的提交方式</a>&nbsp;<br><a href="/blog/4cc31c44/#get" class="header_2">get</a>&nbsp;<br><a href="/blog/4cc31c44/#post" class="header_2">post</a>&nbsp;<br><a href="/blog/4cc31c44/#实例" class="header_2">实例</a>&nbsp;<br><a href="/blog/4cc31c44/#测试get方法" class="header_3">测试get方法</a>&nbsp;<br><a href="/blog/4cc31c44/#测试post方法" class="header_3">测试post方法</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# JSP内置对象概述 #
由于JSP使用Java作为脚本语言,所以JSP将具有强大的对象处理能力,并且可以动态创建web页面内容。**但Java语法在使用一个对象前,需要先实例化这个对象**,这其实是一件比较繁琐的事情。JSP为了简化开发,提供了一些内置对象,用来实现很多JSP应用。在使用JSP内置对象时,不需要先定义这些对象,直接使用即可。
## JSP九大内置对象 ##
在JSP中一共预先定义了9个这样的对象,分别为：
- [out](/blog/8c60ed62/)
- [request](/blog/d5e5b83f/)
- [response](/blog/ddf72c82/)
- [session](/blog/240051d/)
- [application](/blog/bc7737a8/)
- [page](/blog/ee24a152/#page内置对象)
- [pageContext](/blog/ee24a152/#pageContext内置对象)
- [config](/blog/ee24a152/#Config内置对象)
- [exception](/blog/ee24a152/#Exception内置对象)

下面将分别介绍这些内置对象及其常用方法。
# Web程序的请求响应模式 #
- 用户发送请求( request)
- 服务器给用户响应( response)

![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request_response.png)

# 表单的提交方式 #
```html
< form name="formName" action="动作" method=“提交方式”</form>
```
表单常用的提交方式有两种，分别是get和post
## get ##
get:以明文的方式通过UR提交数据,数据在URL中可以看到。提交的数据最多不超过2KB。安全性较低但效率比post方式高。适合提交数据量不大,安全性不高的数据。比如:搜索、查询等功能。
## post ##
post:将用户提交的信息封装在 HTML HEADER内。适合提交数据量大,安全性高的用户信息。比如:注册、修改、上传等功能
## 实例 ##
在项目WebContent目录下创建一个名为login.jsp的文件，在其中写入如下的登录表单：
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
</head>
<body>
</body>
<form action="dologin.jsp" name="loginForm" method="get">
    <table>
        <tr>
            <td align="right">用户名:</td>
            <td><input type="text" name="userName"></td>
        </tr>
        <tr>
            <td align="right">密码:</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td><input type="reset" value="重置"> </td>
            <td><input type="submit" value="登录"> </td>
        </tr>
    </table>
</form>
</html>
```
然后在创建一个名为dologin.jsp的文件，在该文件中写入登录的提交界面，这里不做什么处理，直接显示登录成功。
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>登录处理</title>
</head>
<body>
    <h2>登录成功</h2>
</body>
</html>
```
### 测试get方法 ###
在login界面中，输入用户名和密码，然后点击登录：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/get_post/login.png)
这时候就跳转到dologin界面了，注意看地址栏：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/get_post/dologin_get.png)
可以看到使用get方法，用户名和密码都会以明文的方式显示在URL中。
### 测试post方法 ###
把login.jsp文件中的提交方法改为`post`:
```html
<form action="dologin.jsp" name="loginForm" method="post">
```
然再重复上面的操作，观察地址栏，可以发现在地址栏是看不到上有用户的信息的：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/get_post/dologin_post.png)
虽然在地址栏看不见，不过表单数据,即用户名和密码还是提交给了服务器的。至于怎么得到这些表单数据往下看request内置对象。
