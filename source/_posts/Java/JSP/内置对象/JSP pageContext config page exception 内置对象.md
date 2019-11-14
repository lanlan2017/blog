---
title: JSP pageContext config page exception 内置对象
categories: 
  - Java
  - JSP
  - 内置对象
date: 2018-12-19 15:14:31
updated: 2019-11-05 10:32:11
abbrlink: ee24a152
---
- [pageContext内置对象](/blog/ee24a152/#pageContext内置对象)
    - [获取其他对象的方法](/blog/ee24a152/#获取其他对象的方法)
    - [设置属性方法](/blog/ee24a152/#设置属性方法)
    - [实例](/blog/ee24a152/#实例)
- [page内置对象](/blog/ee24a152/#page内置对象)
    - [常用方法](/blog/ee24a152/#常用方法)
    - [实例](/blog/ee24a152/#实例)
- [Config内置对象](/blog/ee24a152/#Config内置对象)
    - [常用方法](/blog/ee24a152/#常用方法)
- [Exception内置对象](/blog/ee24a152/#Exception内置对象)
    - [exception对象的常用方法](/blog/ee24a152/#exception对象的常用方法)
        - [实例](/blog/ee24a152/#实例)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# pageContext内置对象 #
获取页面上下文的 pageContext对象是一个比较特殊的对象,通过它可以获取JSP页面的 request、response、 session、 application、 exception等对象。 pageContext对象的创建和初始化都是由容器来完成的,JP页面中可以直接使用 pageContext对象。 page Context对象的常用方法如下表所示。
- pageContext对象提供了对JSP页面内所有的对象及名字空间的访问
- pageContext对象可以访问到本页所在的 session,也可以读取本页面所在的application的某一属性值
- pageContext对象相当于页面中所有功能的集大成者
- pageContext对象的本类名也叫 pageContext

## 获取其他对象的方法 ##

|方法|描述|
|:--|:--|
|JspWriter getOut()|返回当前客户端响应被使用的JspWriter流(out内置对象)|
|ServletRequest getRequest()|返回当前页的ServletReques对象 (request内置对象)|
|ServletResponse getResponse()|返回当前页的ServletResponse对象(response内置对象)|
|Http Session getsession()|返回当前页中的Httpsession对象(session内置对象)|
|Object getPage()|返回当前页的Object对象(page内置对象)|

## 设置属性方法 ##
|方法|描述|
|:--|:--|
|void setAttribute(String name, Object attribute)|设置属性|
|Object getAttribute(String name, int scope)|在指定范围内取属性的值|
|nt getAttributeScope(String name)|返回某属性的作用范围|
|void forward(String relativeUrlPath)|把页面转发到另一个页面|
|void include( String relativeUrlPath)|在当前位置包含另一文件|

pageContext对象在实际JSP开发过程中很少使用,因为 request和 response等对象均为内置对象,如果通过 pageContext来调用这些对象比较麻烦,都可以直接调用其相关方法实现具体的功能。
## 实例 ##
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext内置对象</title>
</head>
<body>
	<%
		out.println("<hr>");
		out.println("取出的是 out 内置对象："+(out==pageContext.getOut())+"<br>");
		out.println("取出的是 request 内置对象："+(request==pageContext.getRequest())+"<br>");
		out.println("取出的是 response 内置对象："+(response==pageContext.getResponse())+"<br>");
		out.println("取出的是 session 内置对象："+(session==pageContext.getSession())+"<br>");
		out.println("取出的是 page 内置对象："+(page==pageContext.getPage())+"<br>");
		out.println("<hr>");
		HttpSession session2 = pageContext.getSession();
		out.println("session 中的user="+session2.getAttribute("user")+"<br>");
		Object page2=pageContext.getPage();
		out.println("page toString():"+page2.toString()+"<br>");
		//跳转到session.jsp页面
// 		pageContext.forward("session.jsp");
		//包含login.jsp页面中的内容
// 		pageContext.include("login.jsp");
	%>
</body>
</html>
```
运行结果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/pageContext/show.png)
可以看到这里`pageContext.getOut()`方法取出的对象就是out内置对象，剩下的几个获取方法也类似。
pageContext.include("login.jsp");方法会把login.jsp页面显示的放到当前页面中，取消前面的注释可以看到效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/pageContext/include.png)
pageContext.forward("session.jsp");方法，会直接跳转到session.jsp页面。显示的内容是session.jsp中的内容。不过`浏览器中地址栏中的地址不会发生改变`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/pageContext/forward.png)
# page内置对象 #
page对象就是指向当前JSP页面本身,有点像类中的this指针,它是 java.lang. Object类的实例。
page对象代表JSP本身,只有在JSP页面内才是合法的。page对象本质上是包含当前 Servlet接口用的变量,可以看作是this关键字的别名。
## 常用方法 ##

|方法|描述|
|:--|:--|
|class getclass()|返回此 Object的类|
|int hashCode()|返回此 Object的hash码|
|boolean equals(Object obj)|判断此 Object是否与指定的 Object对象相等|
|void copy(Object obj)|把此 Object拷贝到指定的Object埘象中|
|Object clone()|克隆此 Objec对象|
|String toString()|把此 Object对象转换成 String类的对象|
|void notify()|唤醒一个等待的线程|
|void notifyAll()|唤醒所有等待的线程|
|void wait(int timeout)|使一个线程处于等待直到 timeout结束或被唤醒|
|void wait()|使一个线程处于等待直到被唤醒|

## 实例 ##
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("当前page页面的字符串描述：" + page.toString());
	%>
</body>
</html>
```
效果如下：
```
当前page页面的字符串描述：org.apache.jsp.page_jsp@3d351d0b 
```
可以查看tomcat中的work目录中找到项目对应的目录：
```
D:\dev\apache-tomcat-8.5.35\work\Catalina\localhost\HelloWorld
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/page/sevlert.png)
这个目录下面的都是jsp页面编译成的java类和字节码文件：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/page/java_class.png)
其中page.jsp页面编译成的类为`page_jsp.java`

# Config内置对象 #
config内置对象用来读取web.xml配置信息。
config对象主要用于取得服务器的配置信息。通过 pageContext对象的 getServletConfig()法可以获取一个 config对象。当一个 Servlet初始化时,容器把某些信息通过 config对象传递给这个 Servlet。开发者可以在 web.xml文件中为应用程序环境中的 Servlet程序和JSP页面提供初始化参数。 config对象的常用方法如下表所示。
config对象用于在一个Servlet初始化时,接收JSP擎向传递的信息,此信息包括Servlet初始化时所要用到的参数(通过属性名/属性值对构成)以及服务器的有关信息(通传递一个 Servletcontext对象)
## 常用方法 ##

|方法|描述|
|:--|:--|
|ServletContext getservletcontext()|返回含有服务器相关信息的 Servletcontext对象|
|String getinitParameter(String name)|返回初始化参数的值|
|Enumeration getinitParameterNames()|返回 Servlet初始化所需所有参数的枚举|

后面再更新
# Exception内置对象 #
exception内置对象是java.lang.Throwable接口的一个实例，用来处理JSP文件执行时发生的所有错误和异常,只有在page指令中设置为 isErrorPage属性值为true的页面中才可以被使用,在一般的JSP页面中使用该对象将无法编译JSP文件。 exception对象几乎定义了所有异常情况,在Java程序中,可以使用try...catch关键字来处理异常情况,如果在JSP页面中出现没有捕捉到的异常,就会生成 exception对象,并把 exception对象传送到在page指令中设定的错误页面中,然后在错误页面中处理相应的 exception对象。

## exception对象的常用方法 ##

|方法|描述|
|:--|:--|
|String getMessage()|返回描述异常的消息|
|String toString()|返回关于异常的简短描述消息|
|void printStackTrace()|显示异常及其栈轨迹|
|Throwable fillInStackTrace()|重写异常的执行栈轨迹|
### 实例 ###
创建生成异常的页面：`exception_test.jsp`，指定异常处理页面为`exception.jsp`，如下所示：
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 	指定异常处理页面为exception.jsp -->
<%@ page errorPage="exception.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>生成异常</title>
</head>
<body>
	<%
		int x = 100 / 0;//抛出算术异常，除数不能为零
	%>
</body>
</html>
```
创建异常处理页面`exception.jsp`，并设置该页面为异常处理页面：
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 定义当前页面为异常处理页面 -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	异常信息为:<%=exception.getMessage()%><br> 
	异常字符串描述为:<%=exception.toString()%><br>
</body>
</html>
```
浏览器访问exception_test.jsp,该页面出现了异常，会自动跳转到异常处理页面：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/exception/exception_test.png)

>原文链接: [JSP pageContext config page exception 内置对象](https://lanlan2017.github.io/blog/ee24a152/)
