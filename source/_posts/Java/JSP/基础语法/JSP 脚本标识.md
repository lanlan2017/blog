---
title: JSP 脚本标识
categories: 
  - Java
  - JSP
  - 基础语法
date: 2018-12-20 01:09:14
updated: 2019-10-30 11:55:40
abbrlink: 99c62cee
---
- [脚本标识概述](/blog/html/99c62cee/#脚本标识概述)
- [JSP声明](/blog/html/99c62cee/#JSP声明)
    - [语法](/blog/html/99c62cee/#语法)
    - [实例](/blog/html/99c62cee/#实例)
- [JSP表达式](/blog/html/99c62cee/#JSP表达式)
    - [实例](/blog/html/99c62cee/#实例)
- [代码片段](/blog/html/99c62cee/#代码片段)
    - [语法格式](/blog/html/99c62cee/#语法格式)
    - [代码片段与声明的区别](/blog/html/99c62cee/#代码片段与声明的区别)
    - [实例](/blog/html/99c62cee/#实例)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 脚本标识概述 ##
在JSP页面中,脚本标识使用得最为频繁。因为它们能够很方便、灵活地生成页面中的动态内容特别是 Scriptlet脚本程序。JSP中的脚本标识包括3部分,即：
- JSP表达式( Expression)、
- 声明标识(Declaration)
- 脚本程序(Scriptlet).

通过这些标识,在JSP页面中可以像编写Java程序一样来声明变量、定义函数或进行各种表达式的运算。下面将对这些标识进行详细介绍。
## JSP声明 ##
JSP声明标识用于在JSP页面中**定义`全局`的变量或方法**。通过声明标识定义的变量和方法可以被整个JSP页面访问,所以**通常使用该标识定义整个JSP页面需要引用的变量或方法**。
服务器执行JSP页面时,会将JSP页面转换为 Servlet类,在该Servlet类中会把使用JSP声明标识定义的变量和方法**转换为类的成员变量和方法**。
### 语法 ###
```jsp
<%! Java代码 %>
```
注意这里比JSP脚本`<% Java代码 %>`多了一个感叹号`!`。
### 实例 ###
```jsp
<%!
	//声明一个字符串变量
	String str="Hello World";
	//声明一个方法
	int add(int a,int b)
	{
		return a+b;
	}
%>
```
## JSP表达式 ##
JSP表达式用于向页面中输出信息,其语法格式如下:
```jsp
<%=表达式 %>
```
表达式:可以是任何Java语言的完整表达式。该表达式的最终运算结果将被转换为字符串。
`<%`与`=`之间不可以有空格,但是=与其后面的表达式之间可以有空格。
JSP表达式不仅可以插入到网页的文本中,用于输出文本内容,也可以插入到HTML标记中,用于动态设置属性值。
注意，表达式不以分号结束。不要多打上分号。
### 实例 ###
使用表达式，可以输出上面声明的变量和方法的返回结果：
```jsp
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HelloWorld</title>
</head>
<body>
	<h2>Hello 这是我的第一个JavaWeb项目</h2>
	<%
		out.println("JSP脚本out对象输出");
	%>
	<%!//声明一个字符串变量
	String str = "Hello World";
	//声明一个方法
	int add(int a, int b)
	{
		return a + b;
	}%>
	<br> str=<%=str%><br> 1+2=<%=add(1, 2)%>
</body>
</html>
```
显示效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/jspscript/biaodashi.png)
还有需要注意的是，向页面中输出换行符`\n`是无效的，也就是说浏览器显示的时候不会换行，如果有换行的话，需要使用html换行标签`<br>`,查看源码可以看到有多个换行符:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/jspscript/lnnouse.png)
## 代码片段 ##
JSP脚本就是JSP页面中的一段可执行的java代码
所谓代码片段就是在JSP页面中嵌入的Java代码或是脚本代码。代码片段将在页面请求的处理期间被执行,通过Java代码可以定义变量或是流程控制语句等;而通过脚本代码可以应用JSP的内置对象在页面输出内容、处理请求和响应、访问 session会话等。代码片段的语法格式如下
### 语法格式 ###
```jsp
<% Java代码或是脚本代码 %>
```
代码片段的使用比较灵活,它所实现的功能是JP表达式无法实现的。
### 代码片段与声明的区别 ###
代码片段与声明标识的区别是：
- 通过声明标识创建的变量和方法,在当前JSP页面中有效,它的生命周期是**从创建开始到服务器关闭结束**;
- 而代码片段创建的变量或方法,也是在当前JS页面中有效,但**它的生命周期是页面关闭后,就会被销毁**

### 实例 ###
在index.jsp中写入下面代码：
```jsp
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HelloWorld</title>
</head>
<body>
	<h2>Hello 这是我的第一个JavaWeb项目</h2>
	<%
		out.println("JSP脚本out对象输出");
	%>
</body>
</html>
```
显示效果如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/jspscript/out_println.png)
这里的：
```jsp
<%
	out.println("JSP脚本out对象输出");
%>
```
就叫做JSP脚本。
>原文链接: [JSP 脚本标识](https://lanlan2017.github.io/blog/99c62cee/)