---
title: JSP session 内置对象
categories: 
  - Java
  - JSP
  - 内置对象
date: 2018-12-19 15:11:39
updated: 2019-11-14 11:39:30
abbrlink: 240051d
---
<div id='my_toc'>

- [session内置对象简介](/blog/240051d/#session内置对象简介)
- [session对象](/blog/240051d/#session对象)
- [session对象常用方法](/blog/240051d/#session对象常用方法)
    - [属性方法](/blog/240051d/#属性方法)
    - [session有效时间方法](/blog/240051d/#session有效时间方法)
    - [实例](/blog/240051d/#实例)
- [session生命周期](/blog/240051d/#session生命周期)
    - [创建](/blog/240051d/#创建)
    - [活动](/blog/240051d/#活动)
    - [tomcat中查看一个项目的所有session](/blog/240051d/#tomcat中查看一个项目的所有session)
- [销毁](/blog/240051d/#销毁)
    - [使用invalidate方法直接销毁](/blog/240051d/#使用invalidate方法直接销毁)
    - [超时销毁](/blog/240051d/#超时销毁)
- [参考链接](/blog/240051d/#参考链接)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## session内置对象简介 ##
session是较常用的内置对象之一,与 request对象相比其作用范围更大。
session在网络中被称为会话。由于HTTP协议是一种**无状态协议,也就是当一个客户向服务器发出请求,服务器接收请求,并返回响应后,该连接就结束了,而服务器并不保存相关的信息**。为了弥补这一缺点,HTTP协议提供了session。通过session可以在应用程序的Web页面间进行跳转时,保存用户的状态,使整个用户会话一直存在下去,**直到关闭浏览器**。但是,如果在一个会话中,客户端长时间不向服务器发出请求, session对象就会自动消失。这个时间取决于服务器,例如, Tomcat服务器默认为30分钟。不过这个时间可以通过编写程序进行修改。

- session表示客户端与服务器的一次会话
- Web中的 session指的是用户在浏览某个网站时,**从进入网站到`浏览器关闭`所经过的这段`时间`**,也就是`用户浏览这个网站所花费的时间`
- 从上述定义中可以看到, session实际上是一个特定的时间概念
- session保存在服务器的内存中，每一个客户都对应一个session。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/oneUseOneSession.png)

## session对象 ##
session对象是一个JSP内置对象，是 Httpsession类的实例。
session对象在第一次访问JSP页面的时候被自动创建,用来完成客户端与服务器的一次会话管理。
当一个客户访问一个服务器时,可能会在几个页面之间切换,使用session就能知道这几个界面是都是同一个客户访问的。
session会话对象，一般用来保存帐户信息，一般购物车的实现也是用session完成 
## session对象常用方法 ##

|方法|描述|
|:--|:--|
|long getCreation Time()|返回 session的创建时间|
|public String getId()|返回session创建时JSP引擎为它设的唯一ID号|
|String[] getValueNames()|返回一个包含此session中所有可用属性的数组|





### 属性方法 ###
通过session对象可以存储或读取客户相关的信息。例如,用户名或购物信息等。这可以通过 session对象的` setAttribute()`方法和`getAttribute()`方法实现。
对于存储在 session会话中的对象,如果想将其从 session会话中移除,可以使用 session对象的`removeAttributr()`方法,该方法的语法格式如下:

|方法|描述|
|:--|:--|
|`void setAttribute(String name, Object value)`|设置属性|
|`Object getAttribute(String name)`|取得属性名称对应的属性值，没有该属性则返回null|
|`Enumeration<String> getAttributeNames()`|取得session中所有属性名称的枚举|
|`void removeAttribute(String name)`|移除属性名为name的属性|

#### 实例 ####
```jsp
<%@page import="java.util.Enumeration"%>
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
        session.setAttribute("user", "小明");
        session.setAttribute("password", "123456");
        session.setAttribute("sex", "男");
        session.removeAttribute("sex");
        Enumeration<String> attrNames = session.getAttributeNames();
        String name;
        while (attrNames.hasMoreElements())
        {
            name = attrNames.nextElement();
            out.print(name+"="+session.getAttribute(name)+"<br>");
        }
    %>
</body>
</html>
```
### session有效时间方法 ###
在应用 session对象时应该注意 session的生命周期。一般来说, session的生命周期在20~30分钟之间。**当用户首次访问时将产生一个新的会话**,以后服务器就可以记住这个会话状态,当会话生命周期超时时,或者服务器端强制使会话失效时,这个 session就不能使用了。在开发程序时应该考虑到用户访问网站时可能发生的各种情况,例如用户登录网站后在 session的有效期外进行相应操作,用户会看到一张错误页面。这样的现象是不允许发生的。为了避免这种情况的发生,在开发系统时应该对session的有效性进行判断。
在 session对象中提供了设置会话生命周期的方法,分别介绍如下。

|方法|描述|
|:--|:--|
|void setMaxInactiveInterval(int interval)|以秒为单位设置 session的有效时间。|
|int getMaxInactiveInterval()|以秒为单位返回一个会话内两个请求最大时间间隔(session的最大存活时间)。默认是1800秒。如果超过这个时间没有客户没有继续请求服务器，则该session对象被销毁|
|long getLastAccessedTime()|返回客户端最后一次与会话相关联的请求时间,单位毫秒。|
#### 设置session生存时间实例 ####
通过`session.setMaxInactiveInterval(int seconds);`可以设置session的生存时间,当超时候，当前的session会被销毁。如果再新打开一个页面，则此时的session为新建的session对象，与原来旧的session无关。
修改上述的session.jsp如下：
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
        //设置session属性
        session.setAttribute("user", "admin");
        session.setAttribute("password", "123456");
        //设置session生存周期为2秒
        session.setMaxInactiveInterval(2);
    %>
    session对象的创建时间:
    <%=format.format(date)%><br> session对象的ID:<%=session.getId()%><br>
    <a href="http://localhost:8080/HelloWorld/session2.jsp" target="_blank">跳转到session2</a>
</body>
</html>
```
修改session2.jsp如下：
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session2</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
    %>
    session对象的创建时间:
    <%=format.format(date)%><br>
    session对象的ID:<%=session.getId()%><br>
</body>
</html>
```
打开session.jsp,然后稍微等待2秒钟，然后点击超链接，打开session2.jsp。可以看到两者的session id不一样，创建时间也不一样。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/session_1.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/session2_1.png)
这说明之前的session对象已经过期了。session2.jsp中的session对象为新建的session对象。这两个页面不属于同一个会话


### 实例 ###
下面创建两个jsp文件：session.jsp，session2.jsp。session.jsp中设置了两个属性。session2.jsp不设置属性，直接获取属性：
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session2</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
        //设置session属性
        session.setAttribute("user", "admin");
        session.setAttribute("password", "123456");
    %>
    session对象的创建时间:
    <%=format.format(date)%><br>
    session对象的ID:<%=session.getId()%><br>
    <hr>
    遍历session中的属性/属性值对:
    <br>
    <%
        //获取session中的所有属性
        Enumeration<String> enu = session.getAttributeNames();
        String attr = null;
        //判断是否有内容
        while (enu.hasMoreElements())
        {
            //获取一个内容
            attr = enu.nextElement();
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;" + attr + "="
                    + session.getAttribute(attr) + "<br>");
        }
    %>
    <hr>
    session最大存活时间:<%=session.getMaxInactiveInterval() %>秒=<%=session.getMaxInactiveInterval()/60 %>分钟<br>
</body>
</html>
```
session2.jsp:
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session2</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
    %>
    session对象的创建时间:
    <%=format.format(date)%><br>
    session对象的ID:<%=session.getId()%><br>
    <hr>
    遍历session中的属性/属性值对:
    <br>
    <%
        //获取session中的所有属性
        Enumeration<String> enu = session.getAttributeNames();
        String attr = null;
        //判断是否有内容
        while (enu.hasMoreElements())
        {
            //获取一个内容
            attr = enu.nextElement();
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;" + attr + "="
                    + session.getAttribute(attr) + "<br>");
        }
    %>
    <hr>
    session最大存活时间:<%=session.getMaxInactiveInterval() %>秒=<%=session.getMaxInactiveInterval()/60 %>分钟<br>
</body>
</html>
```
运行结果：
session.jsp访问效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/session.png)
session2.jsp访问效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/session2.png)
可以看到这虽然是两个不同的界面，但是他们的输出结果都是一模一样的。这是因为这两个页面除以相同的会话之中。共享一个session对象。这里session对象还是理解的不够通透，后续再深入，我先往前面吃。

## session生命周期 ##
### 创建 ###
当客户端第一次访问某个jsp或者 Servlet时候,服务器会为当前会话创建一个SessionId每次客户端向服务端发送请求时,都会将此 SessionId携带过去,服务端会对此 Session进行校验。
### 活动 ###
- 1 某次会话中通过超链接打开的新页面属于同一次会话。
- 2 只要当前会话页面没有全部关闭,重新打开新的浏览器窗口访问同一项目资源时属于同一次会话。
- 3 除非本次会话的所有页面都关闭(关闭所有相关浏览器窗口)后再重新访问某个JSP或者servlet将会创建新的会话。
    - 注意: `原有会话还存在`,只是这个旧的 Session仍然存在于服务端,`只不过再也没有客户端会携带它然后交予服务端校验`,除非旧的会话超时了，旧的会话才结束。

#### 验证说法1 ####
修改session.jsp,session2.jsp如下：
session.jsp：
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%-- <%@page import="java.util.Enumeration"%> --%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
        //设置session属性
        session.setAttribute("user", "admin");
        session.setAttribute("password", "123456");
    %>
    session对象的创建时间:
    <%=format.format(date)%><br> session对象的ID:<%=session.getId()%><br>
    <hr>
    遍历session中的属性/属性值对:
    <br>
    <%
        //获取session中的所有属性
        Enumeration<String> enu = session.getAttributeNames();
        String attr = null;
        //判断是否有内容
        while (enu.hasMoreElements())
        {
            //获取一个内容
            attr = enu.nextElement();
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;" + attr + "="
                    + session.getAttribute(attr) + "<br>");
        }
    %>
    <hr>
    <a href="http://localhost:8080/HelloWorld/session2.jsp" target="_blank">跳转到session2</a>
</body>
</html>
```
session2.jsp:
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session2</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
    %>
    session对象的创建时间:
    <%=format.format(date)%><br>
    session对象的ID:<%=session.getId()%><br>
    <hr>
    遍历session中的属性/属性值对:
    <br>
    <%
        //获取session中的所有属性
        Enumeration<String> enu = session.getAttributeNames();
        String attr = null;
        //判断是否有内容
        while (enu.hasMoreElements())
        {
            //获取一个内容
            attr = enu.nextElement();
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;" + attr + "="
                    + session.getAttribute(attr) + "<br>");
        }
    %>
    <hr>
</body>
</html>
```
打开ssession.jsp,显示如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/session_2.png)
然后通过下面的超链接打开session2.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/session2_2.png)
可以看到两者的session id一样，所以`某次会话中通过超链接打开的新页面属于同一次会话。`这句话得到验证。
#### 验证说法2 ####
不要关闭当前浏览器窗口，再打开一个浏览器窗口，访问ssession2.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/newsession2InnewWindow.png)
可以看到新浏览器窗口中的session2.jsp中session id(`BE58A27556C3883C7DA49083CDC6D4BD`)依然和旧浏览器窗口中的session2.jsp的session id一样。这说明第二点`只要当前会话页面没有全部关闭,重新打开新的浏览器窗口访问同一项目资源时属于同一次会话。`是正确的。
关闭新的浏览器窗口，旧的浏览器窗口中关闭掉全部Helloworld项目中的页面。

#### 我的观察结果 ####
验证过程中，我发现即使在浏览器中关闭了所有HelloWorld项目打开的标签页。但是只要没有关闭当前浏览器窗口。该session就还是有效的。
例如：在浏览器窗口中打开的session.jsp,session2.jsp和一个无关的页面:其中session.jsp中的session id为：`790B84D02E1ED3D7CB3FBB1910C33343`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/my/session.png)
现在我关闭掉session.jsp,session2.jsp，只留了一个无关的页面：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/my/close-session_session2.png)
然后我输入session.jsp的地址，进行访问,如下图：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/my/open_session.png)
可以发现session id还是`790B84D02E1ED3D7CB3FBB1910C33343`，然后点击超链接打开session2.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/my/open_session2_by_session.png)
打开一个新的浏览器窗口，访问session.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/my/open_session_by_new_window.png)
可以发现session id还是`790B84D02E1ED3D7CB3FBB1910C33343`。所以只要我旧的浏览器窗口没有关闭，这个session就会一直有效(不超时的情况下)。

所以我的结论是：`在不超时的情况下，即使你关闭了在一个Web项目中打开的所有页面，只要不关闭当前的浏览器窗口，等你下次访问该项目的时候，新标签页或者是新窗口中的session对象还是原来的session对象`。

关闭所有的浏览器，然后重新打开浏览器，访问session.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/my/close_all_window_open_new.png)
可以看到这次的sesion id已经变成了：`60F84C6ED79AD13DA8CD8BA12E8D4129`而不是原来的`790B84D02E1ED3D7CB3FBB1910C33343`。这说明原来的session已经不再使用了。
### tomcat中查看一个项目的所有session ###
进入tomcat首页[http://localhost:8080/](http://localhost:8080/),然后点击`Manager App`：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/tomcat/manageapp.png)
输入用户和密码，如果不知道用户和密码的话先设置。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/tomcat/password.png)
进入之后就可以看到tomcat中的项目表：同时在表中的Session列中，可以看到每个项目中有多少个session,例如现在HelloWorld这个项目就有2个session：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/tomcat/applist.png)
点击这个数字可以查看项目中的Session列表：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/tomcat/sesionlist.png)
可以看到这里有两个session:`790B84D02E1ED3D7CB3FBB1910C33343`和`60F84C6ED79AD13DA8CD8BA12E8D4129`,而`790B84D02E1ED3D7CB3FBB1910C33343`这个session已经不再使用了，处于等死状态中，不过还没有被销毁，还在服务器内存中苟活，等到剩余的时间为0后，才会从服务器内存中被销毁。`60F84C6ED79AD13DA8CD8BA12E8D4129`这个session是目前正在使用的session。我们肯继续访问HelloWorld项目，来为当前的session续命:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/tomcat/xuming.png)
而以前的session就只有等死的份了，剩余时间会一直减少，直到为0后被销毁掉：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/tomcat/deal.png)

## 销毁 ##
Session的销毁只有三种方式:
- 调用了 `session.invalidate()`方法
- Session过期(超时)
- 服务器重新启动

虽然当客户端长时间不向服务器发送请求后, session对象会自动消失,但对于某些实时统计在线人数的网站(例如聊天室),每次都等 session过期后,才能统计出准确的人数,这是远远不够的。所以还需要手动销毁 session。通过 session对象的 invalidate方法可以销毁 session,其语法格式如下:
```java
session. invalidate()
```
session对象被销毁后,将不可以再使用该 session对象了。如果在 session被销毁后,再调用 session对象的任何方法,都将报出 `Session already invalidated`异常。



### 使用invalidate方法直接销毁 ###
```jsp
//销毁当前session
session.invalidate();
```
修改session.jsp如下，输出完信息后，就关闭当前的session:
```jsp
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%-- <%@page import="java.util.Enumeration"%> --%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>session</title>
</head>
<body>
    <h2>session内置对象</h2>
    <%
        //获取session的创建时间
        Date date = new Date(session.getCreationTime());
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy年MM月dd日 HH:mm:ss");
        //设置session属性
        session.setAttribute("user", "admin");
        session.setAttribute("password", "123456");
    %>
    session对象的创建时间:
    <%=format.format(date)%><br> session对象的ID:<%=session.getId()%><br>
    <hr>
    遍历session中的属性/属性值对:
    <br>
    <%
        //获取session中的所有属性
        Enumeration<String> enu = session.getAttributeNames();
        String attr = null;
        //判断是否有内容
        while (enu.hasMoreElements())
        {
            //获取一个内容
            attr = enu.nextElement();
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;" + attr + "="
                    + session.getAttribute(attr) + "<br>");
        }
        //销毁当前session
        session.invalidate();
    %>
    <hr>
    <a href="http://localhost:8080/HelloWorld/session2.jsp" target="_blank">跳转到session2</a>
</body>
</html>
```
如下所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/xiaohui/session.png)
访问完毕后，当前session就已经销毁掉了，可以打开管理页面[http://localhost:8080/manager/html](http://localhost:8080/manager/html)查看：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/xiaohui/nosession.png)
可以看到当前没有session，说明上面的session对象确实用完就被销毁掉了。我们每次访问后，都会是一个新的session:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/xiaohui/session_new.png)

### 超时销毁 ###
这里有两种方式：
- 一种是通过`session.setMaxInactiveInterval(int seconds);`方法设置session的生存时间。
- 另一种是在`web.xml`中跟标签<web-app>下进行配置：

```xml
<!-- 设置会话60分钟后过期 -->
<session-config>
    <session-timeout>60</session-timeout>
</session-config>
```
可以进入tomcat后天管理查看当前会话的活动时间已经被设置为60分钟了，而不是默认的30分钟：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/session/setTimeOut/setTimeOut60.png)




## 参考链接 ##
[JSP Session](http://www.runoob.com/jsp/jsp-session.html)
[https://wenku.baidu.com/view/08dd8ef3f90f76c661371a0d.html?sxts=1544369585905](https://wenku.baidu.com/view/08dd8ef3f90f76c661371a0d.html?sxts=1544369585905)
>原文链接: [JSP session 内置对象](https://lanlan2017.github.io/blog/240051d/)
