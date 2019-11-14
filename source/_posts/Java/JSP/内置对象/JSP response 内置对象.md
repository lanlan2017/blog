---
title: JSP response 内置对象
categories: 
  - Java
  - JSP
  - 内置对象
date: 2018-12-19 15:11:39
updated: 2019-11-05 10:32:11
abbrlink: ddf72c82
---
- [response内置对象简介](/blog/ddf72c82/#response内置对象简介)
- [常用方法](/blog/ddf72c82/#常用方法)
- [请求重定向和请求转发的区别](/blog/ddf72c82/#请求重定向和请求转发的区别)
    - [请求重定向](/blog/ddf72c82/#请求重定向)
    - [请求转发](/blog/ddf72c82/#请求转发)
    - [生活中的例子](/blog/ddf72c82/#生活中的例子)
- [设置HTP响应报头](/blog/ddf72c82/#设置HTP响应报头)
    - [禁用缓存](/blog/ddf72c82/#禁用缓存)
    - [设置过期的时间期限](/blog/ddf72c82/#设置过期的时间期限)
    - [定时刷新页面](/blog/ddf72c82/#定时刷新页面)
    - [定时跳转页面](/blog/ddf72c82/#定时跳转页面)
- [设置输出缓冲](/blog/ddf72c82/#设置输出缓冲)
    - [缓冲相关方法](/blog/ddf72c82/#缓冲相关方法)
- [参考链接](/blog/ddf72c82/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## response内置对象简介 ##

- 是HttpServletrResponse类的实例
- response对象用于响应客户请求,向客户端输出信息。它封装了JSP产生的响应,并发送到客户端以响应客户端的请求。请求的数据可以是各种数据类型,甚至是文件。
- response对象具有`页面作用域`,**即访问一个页面时,该页面内的 response对象只`能对这次访问`有效,其它页面的 response对象对当前页面无效**

## 常用方法 ##

|序号|方法|描述|
|:--|:--|:--|
|1|String getCharacterEncoding()|返回响应用的是何种字符编码|
|2|void setContentType(String type)|设置响应的MIME类型|
|3|PrintWriter getwriter()|返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)|

## 请求重定向和请求转发的区别 ##

### 请求重定向 ###

|方法|描述|
|:--|:--|
|sendRedirect(String path)|重新定向客户端的请求,path:用于指定目标路径,可以是相对路径,也可以是不同主机的其他URL地址。|

使用 response对象提供的 `sendRedirect(String path);`方法可以将网页重定向到另一个页面。重定向操作支持将地址重定向到不同的主机上。重定向时,在客户端浏览器上将会得到跳转的地址显示在浏览器的地址栏,并重新发送请求链接。因为重发了请求,所以此时的request对象是新的request对象，原先resquest对象中的属性也就全部失效。

**注意**:在JSP页面中使用该方法时,不要再用JSP脚本代码(包括 retun语句),因为**重定向之后的JSP脚本代码已经没有意义了,并且还可能产生错误**。
**总结**：请求重定向,是客户端行为,从本质上讲**等同于两次请求,前一次的请求对象不会保存,同时地址栏的URL地址`会改变`。**

### 请求转发 ###

请求转发是服务器行为,`request.getRequestDispatcher("转发的页面").forward(request,response);`是一次请求,转发后请求对象会保存,地址栏的URL地址`不会改变`。

### 生活中的例子 ###

假设你去办理某个护照
重定向:你先去了A局,A局的人说:“这个事不归我们管,去B局”,然后,你就从A退了出来,自己乘车去了B局。
转发:你去了A局,A局看了以后,知道这个事情其实应该B局来管,但是他没有把你退回来,而是让你坐一会儿,自己到后面办公室联系了B的人,让他们办好后,送了过来

#### 实例 ####

修改login.jsp,requset.jsp，response.jsp如下所示：
login.jsp:
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
<!-- <form action="request.jsp" name="loginForm" method="get"> -->
<form action="response.jsp" name="loginForm" method="post">
	<table>
		<tr>
			<td align="right">用户名:</td>
			<td><input type="text" name="userName"></td>
		</tr>
		<tr>
			<td align="right">爱好:</td>
			<td>
			<input type="checkbox" name="hobbys" value="book">读书
			<input type="checkbox" name="hobbys" value="music">音乐
			<input type="checkbox" name="hobbys" value="sports">运动
			<input type="checkbox" name="hobbys" value="movie">电影
			</td>
		</tr>
		<tr>
			<td align="right">密码:</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td><input type="reset" value="重置"></td>
			<td><input type="submit" value="登录"></td>
		</tr>
	</table>
	<a href="http://localhost:8080/HelloWorld/request.jsp?userName=%E5%B0%8F%E6%98%8E&hobbys=book&password=123">直接提交</a>
</form>
</html>
```
response.jsp:
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	// 	//暂停五秒，以查看跳转的效果
	Thread.sleep(5 * 1000);
	//请求重定向到requset.jsp
	response.sendRedirect("request.jsp");
	//请求转发
	// request.getRequestDispatcher("requset.jsp").forward(request,response);
%>
```
request.jsp:
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>request内置对象测试</title>
</head>
<body>
	<h2>request内置对象</h2>
	<%
		//解决post提交的数据中的。中文乱码问题.无法解决URL传参方式的中文乱码问题
		request.setCharacterEncoding("utf-8");
	%>
	获取到用户名:<%=request.getParameter("userName")%><br> 爱好:<%
		String[] hobbys = request.getParameterValues("hobbys");
		if (hobbys != null)
		{
			for (int i = 0; i < hobbys.length; i++)
			{
				out.println(hobbys[i] + ",");
			}
		}
	%><br> 密码:<%=request.getParameter("password")%><br> 
	请求体的MME类型:<%=request.getContentType()%><br> 
	请求体的长度:<%=request.getContentLength()%>字节<br>
	请求用的协议类型及版本号:<%=request.getProtocol()%><br>
	请求的服务器主机名:<%=request.getServerName()%><br> 
	服务器接受此请求所用的端口号:<%=request.getServerPort()%><br>
	请求的客户端IP地址:<%=request.getRemoteAddr()%><br>
	请求的物理路径:<%=request.getRealPath("request.jsp") %><br>
	请求的上下文路径:<%=request.getContextPath() %><br>
</body>
</html>
```
#### 请求重定向 ####
浏览器打开login.jsp,填写表单，登录：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/chongdingxiang_zhuanfa/login.png)
虽然我们请求的是response.jsp页面，但是5秒钟后，浏览器却跳转到requset.jsp页面：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/chongdingxiang_zhuanfa/chongdingxiang.png)
可以看到页面中的表单信息(用户名，爱好，密码)为空。这是因为请求中定向不保存第一次请求，第二次请求是新的请求，新的请求中不带有用户登录信息，所以requset.jsp页面中获取不到。

#### 请求转发 ####

修改上述的response.jsp，把请求重定向注释，取消强求转发的注释：
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	// 	//暂停五秒，以查看跳转的效果
	Thread.sleep(5 * 1000);
	//请求重定向到requset.jsp
// 	response.sendRedirect("request.jsp");
	//请求转发
	request.getRequestDispatcher("requset.jsp").forward(request,response);
%>
```
重复上面的步骤：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/chongdingxiang_zhuanfa/qingqiuzhuanfa.png)
我们可以发现，地址栏上的地址没有改变，还是我们请求的response.jsp，而内容是requset.jsp的内容，并且用户信息也能正常显示。
## 设置HTP响应报头 ##
通过 response对象可以设置HTP响应报头,其中,最常用的是`禁用缓存`、`设置页面自动刷新`和`定时跳转网页`。下面分别进行介绍。
`response.setHeader()`方法 是用来设置返回页面的头 meta 信息

### 禁用缓存 ###
在默认的情况下,浏览器将会对显示的网页内容进行缓存。这样,当用户再次访问相关网页时,浏览器会判断网页是否有变化,如果没有变化则直接显示缓存中的内容,这样可以提高网页的显示速度。对于一些安全性要求较高的网站,通常需要禁用缓存。
```jsp
<%
response. setHeader("Cache-Control", "no-store");
response. setDateHeader("Expires",0);
%>
```
### 设置过期的时间期限 ###
```jsp
response.setDateHeader("Expires", System.currentTimeMillis()+自己设置的时间期限);
```
### 定时刷新页面 ###
通过设置HTTP头还可以实现页面的自动刷新。使网页每隔10秒自动刷新一次。示例代码如下:
```jsp
response.setHeader("refresh", "10");
```
### 定时跳转页面 ###
通过设置HTTP头还可以实现定时跳转网页的功能,使网页20秒钟后自动跳转到指定的网页(login.jsp)。示例代码如下:
```jsp
response.setHeader("refresh", "10;URL=login.jsp");
```
## 设置输出缓冲 ##
通常情况下,服务器要输出到客户端的内容不会直接写到客户端,而是先写到一个输出缓冲区,在计算机术语中,**缓冲区被定义为暂时放置输入或输出资料的内存**。实际上,缓冲区也可以这样理解在一个粮库中,由于装卸车队的速度要快于传送带的传输速度,为了不造成装卸车队的浪费,粮库设计了一个站台,装卸车队可以先将运送的粮食卸到这个平台上,然后让传送机慢慢传送。粮库的这个站台就起到了缓冲的作用。当满足以下3种情况之一,就会把缓冲区的内容写到客户端。

- JSP页面的输出信息已经全部写入到了缓冲区。
- 缓冲区已满。
- 在JSP页面中,调用了 response对象的 flush Buffer方法或out对象的 flush方法。

### 缓冲相关方法 ###

|方法|描述|
|:--|:--|
|flushBuffer()|强制将缓冲区的内容输出到客户端|
|getBufferSize()|获取响应所使用的缓冲区的实际大小,如果没有使用缓冲区,则返回0|
|setBufferSize(int size)|设置缓冲区的大小为size`KB`,如果size为0则表示不缓冲|
|rese()|清除缓冲区的内容,同时清除状态码和报头|
|isCommitted()|检测服务器端是否已经把数据写入到了客户端|

```jsp
response.setBufferSize(32);//设置缓冲区的大小为32KB
```
#### 实例 ####
创建`response.jsp`,写入如下的代码：
```jsp
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	//设置响应的MIME类型
	response.setContentType("text/html; charset=utf-8");
	out.println("<h2> 测试response内置对象 </h2><br>");
// 	out.flush();//强制清空缓冲区,先写内置的out输出流对象
	//在打印的时候,会提前于内置的out对象
	PrintWriter writer=response.getWriter();
	writer.println("response.getWriter()输出");
%>

```
运行效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/response/getWriter/result.png)
可以看到内置输出流对象out先于writer对象打印，但是浏览器访问的时候，writer对象却先打印，如果想要顺序打印，可以先刷新内置out对象的缓冲区,把缓冲区的内容写到到浏览器上。取消`out.flush();`前面的注释，再次打开response.jsp，这时候就按顺序显示了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/response/getWriter/flush.png)

## 参考链接 ##
[response.setHeader各种用法详解](https://www.jb51.net/article/107218.htm)
[response.setHeader参数、用法的介绍](https://www.jb51.net/article/16437.htm)
>原文链接: [JSP response 内置对象](https://lanlan2017.github.io/blog/ddf72c82/)
