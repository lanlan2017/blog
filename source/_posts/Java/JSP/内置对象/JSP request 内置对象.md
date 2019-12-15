---
title: JSP request 内置对象
categories: 
  - Java
  - JSP
  - 内置对象
date: 2018-12-13 12:31:03
updated: 2019-12-09 19:45:22
abbrlink: d5e5b83f
---
<div id='my_toc'><a href="/blog/d5e5b83f/#JSP-request内置对象">JSP request内置对象</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#request对象常用方法">request对象常用方法</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#获取请求体信息">获取请求体信息</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#获取表单提交的参数">获取表单提交的参数</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#枚举方式-遍历表单提交的数据">枚举方式 遍历表单提交的数据</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#枚举方式-遍历表单提交的数据">枚举方式 遍历表单提交的数据</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#Map方式-遍历表单提交的数据">Map方式 遍历表单提交的数据</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#Map方式-遍历表单提交的数据">Map方式 遍历表单提交的数据</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#操作request对象属性">操作request对象属性</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#操作编码">操作编码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#服务器信息">服务器信息</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#客户端信息">客户端信息</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#获取请求头信息">获取请求头信息</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#路径">路径</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#其他信息">其他信息</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#实例">实例</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#表单输入中文乱码问题">表单输入中文乱码问题</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#post方法乱码解决">post方法乱码解决</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#超链接请求传参">超链接请求传参</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#超链接传参语法">超链接传参语法</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#实例">实例</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#解决get方法提交-URL传参-中文乱码">解决get方法提交(URL传参)中文乱码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#requset对象其他方法实例">requset对象其他方法实例</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#post提交方式">post提交方式</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d5e5b83f/#参考链接">参考链接</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# JSP request内置对象 #
- request内置对象是 `HttpServletRequest` 类的实例。
- request对象封装了由客户端生成的HTTP请求的所有细节,主要包括HTTP头信息、系统信息、请求方式和请求参数等。通过request对象提供的相应方法可以处理客户端浏览器提交的HTTP请求中的各项参数。
- request对象具有`请求域`，即完成客户端的请求之前该对象一直有效。

## request对象常用方法 ##

### 获取请求体信息 ###

|方法|描述|
|:--|:--|
|String getContentType()|得到请求体的MIME类型|
|int getContentLength()|返回请求体的长度(以字节数)|
#### 实例 ####
想要获取请求信息，得先有请求吧。下面先创建请求页面：
login.jsp:
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
</head>
<body>
<form action="request.jsp" name="loginForm" method="post">
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
            <td><input type="reset" value="重置"></td>
            <td><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</body>
</html>
```
然后创建request.jsp：
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="utf-8">
<title>request内置对象测试</title>
</head>
<body>
    <%
        out.println("<table border=\"1\">");
        out.println("<tr><td align=\"right\">请求体的MIME类型：</td><td>"
                + request.getContentType() + "</td>");
        out.println("<tr><td align=\"right\">请求体的长度：</td><td>"
                + request.getContentLength() + " 字节</td>");
        out.println("</table>");
    %>
</body>
</html>
```
先在login.jsp中填写表单，点击登录。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/ContentMethods/login.png)
会跳转到request.jsp页面，request.jsp显示效果如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/ContentMethods/requset.png)
需要注意的是，[post方式才有请求体，get方式没有请求体](https://blog.csdn.net/zifengye520/article/details/53241272),参数通过url传递，所以这两个方法将无法获取：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/ContentMethods/get.png)

### 获取表单提交的参数 ###

|方法|描述|
|:--|:--|
|`Enumeration<String> getParameterNames()`|返回表单里所有name属性的 属性/属性值枚举|
|`String getParameter(String name)`|返回表单name属性对应的属性值|
|`String[] getParameterValues(String name)`|根据表单name属性获取多个值，如复选框中的值|
|`Map<String, String[]> getParameterMap()`|该返回所提交请求中的请求参数和请求参数值的映射关系|

 对request.getParameterMap()的返回值使用泛型时应该是Map<String,String[]>形式，因为有时像checkbox这样的组件会有一个name对应对个value的情况。
#### 实例 ####
为了演示效果，修改login.jsp，在其中添加一个复选框，如下：
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
</head>
<body>
</body>
<form action="request.jsp" name="loginForm" method="post">
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
            <td align="right">爱好:</td>
            <td>读书<input type="checkbox" name="hobby" value="book">游戏<input
                type="checkbox" name="hobby" value="game">音乐<input
                type="checkbox" name="hobby" value="music"></td>
        </tr>
        <tr>
            <td><input type="reset" value="重置"></td>
            <td><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</html>
```
##### 枚举方式 遍历表单提交的数据 #####
- 使用request.getParameterNames();方法获取所有name属性的名称的枚举
- 有了属性名称之后，我们就可以根据属性名称来获取对应的值了，这里有两种方式
    - 如果该属性名称只有一个值,则使用request.getParameter(name)方法获取对应的属性值
    - 如果该属性名称有多个值(如 复选框),则可以使用request.getParameterValues(name);方法获取属性值数组，然后我们在遍历数组即可。

```jsp
out.println("<table border=\"1\">");
Enumeration<String> names = request.getParameterNames();
String name;
while (names.hasMoreElements())
{
    name = names.nextElement();
    out.println("<tr><td align=\"right\">" + name + "</td><td>");
    //如果是name属性为hobby的情况
    if ("hobby".equals(name))
    {
        //获取hobby多选框中的内容
        String[] hobbys = request.getParameterValues(name);
        for (int i = 0; i < hobbys.length; i++)
        {
            //输出分隔符
            if (i > 0)
                out.print(",");
            out.print(hobbys[i]);
        }
        out.println("</td></tr>");
    } else
    {
        out.println(request.getParameter(name) + "</td></tr>");
    }
}
out.println("</table>");
```
##### Map方式 遍历表单提交的数据 #####
`Map<String, String[]> getParameterMap()`这个方法会把表单提交的name属性名称和值封装成一个Map集合返回。可以通过[遍历Map集合](/blog/ef2dac38/#more)的方式来遍历表单提交的数据。
```jsp
//获取参数的Map集合
Map<String, String[]> parmMap = request.getParameterMap();
//获取键值对Set集合
Set<Entry<String, String[]>> parmEntrySet = parmMap.entrySet();
//键值对Set集合的迭代器
Iterator<Entry<String, String[]>> parmIt = parmEntrySet.iterator();
String key;
String[] values;
out.println("<table border=\"1\">");
while (parmIt.hasNext())
{
    //取得一个键值对
    Entry<String, String[]> entry = parmIt.next();
    //取出键和值
    key = entry.getKey();
    out.print("<tr><td align=\"right\">" + key + "</td><td>");
    values = entry.getValue();
    for (int i = 0; i < values.length; i++)
    {
        if (i > 0)
            out.print(",");
        out.print(values[i]);
    }
    out.print("</td><tr>");
}
out.print("</table>");
```
完整的request代码如下：
```jsp
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration,java.util.Map,java.util.Set"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="utf-8">
<title>request内置对象测试</title>
</head>
<body>
    <%
        out.println("<table border=\"1\">");
        Enumeration<String> names = request.getParameterNames();
        String name;
        while (names.hasMoreElements())
        {
            name = names.nextElement();
            out.println("<tr><td align=\"right\">" + name + "</td><td>");
            //如果是name属性为hobby的情况
            if ("hobby".equals(name))
            {
                //获取hobby多选框中的内容
                String[] hobbys = request.getParameterValues(name);
                for (int i = 0; i < hobbys.length; i++)
                {
                    //输出分隔符
                    if (i > 0)
                        out.print(",");
                    out.print(hobbys[i]);
                }
                out.println("</td></tr>");
            } else
            {
                out.println(request.getParameter(name) + "</td></tr>");
            }
        }
        out.println("</table>");
        out.println("<hr>");
        //获取参数的Map集合
        Map<String, String[]> parmMap = request.getParameterMap();
        //获取键值对Set集合
        Set<Entry<String, String[]>> parmEntrySet = parmMap.entrySet();
        //键值对Set集合的迭代器
        Iterator<Entry<String, String[]>> parmIt = parmEntrySet.iterator();
        String key;
        String[] values;
        out.println("<table border=\"1\">");
        while (parmIt.hasNext())
        {
            //取得一个键值对
            Entry<String, String[]> entry = parmIt.next();
            //取出键和值
            key = entry.getKey();
            out.print("<tr><td align=\"right\">" + key + "</td><td>");
            values = entry.getValue();
            for (int i = 0; i < values.length; i++)
            {
                if (i > 0)
                    out.print(",");
                out.print(values[i]);
            }
            out.print("</td><tr>");
        }
        out.print("</table>");
        //         request.getParameterNames();
    %>
</body>
</html>
```
运行结果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/ParameterMethods/show.png)

### 操作request对象属性 ###

|方法|描述|
|:--|:--|
|void setAttribute(String name, object object)|设置属性/属性值到当前请求中。|
|Object getAttribute(String name)|返回当前请求中设置的属性值|
|Enumeration getAttributeNames()|返回所有可用属性名的枚举|
 
在进行请求转发时,需要把一些数据传递到转发后的页面进行处理。这时,就需要使用 request对象的 `setAttribute()`方法将数据保存到 request范围内的变量中。
在将数据保存到 request范围内的变量中后,可以通过 request对象的 `getAttribute()`方法获取该变量的值.由于`getAttribute()`方法的返回值为Object类型,所以需要调用其 toString方法

### 操作编码 ###

|方法|描述|
|:--|:--|
|String getCharacterEncoding()|返回请求中的字符编码方式|
|void setCharacterEncoding()|设置请求的字符编码方式|

当请求参数的文字编码方式与页面中的文字编码方式不一致会造成中文乱码问题，出现中文乱码时,可以通过`setCharacterEncoding()`方法把请求参数的编码改成页面的编码。

### 服务器信息 ###

|方法|描述|
|:--|:--|
|String getServerName()|返回接受请求的服务器主机名|
|int getServerPort()|返回服务器接受此请求所用的端口号|

![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/server/server.png)
### 客户端信息 ###

|方法|描述|
|:--|:--|
|String getRemoteHost()|返回客户端的主机名|
|int getRemotePort()|返回客户端的端口号|
|String getRemoteAddr()(|返回客户端的IP地址|
|String getRemoteUser()|返回客户端通过登录认证的用户，若用户未认证则返回null|

![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/Remote/Remote.png)

### 获取请求头信息 ###

|方法|描述|
|:--|:--|
|String getHeader(String name)|返回name指定的信息头|
|Enumeration getHeaderNames()|返回所有HTTP头的名称枚举|
|Enumeration getHeaders(String name) |返回指定名字的 request Header 的所有值,其结果是一个枚举型的实例|

#### 遍历所有HTTP头部信息 ####
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestSever相关</title>
</head>
<body>
    <%
        out.println("<table border=\"1\">");
        Enumeration<String> headernames = request.getHeaderNames();
        String name;
        while (headernames.hasMoreElements())
        {
            //获取头部名称
            name = headernames.nextElement();
            //获取名称对应的值
            out.println("<tr><td align=\"right\">" + name + ":</td><td>"
                    + request.getHeader(name) + "</td></tr>");
        }
        out.println("</table>");
    %>
    <%
        out.println("<table border=\"1\">");
        Enumeration<String> accept = request.getHeaders("user-agent");
        String acceptName;
        while (accept.hasMoreElements())
        {
            //获取头部名称
            acceptName = (String) accept.nextElement();
            //获取名称对应的值
            out.println("<tr><td align=\"right\">" + acceptName
                    + ":</td></tr>");
        }
        out.println("</table>");
    %>
</body>
</html>
```
运行效果如下图：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/headers/headers.png)

### 路径 ###
|方法|描述|
|:--|:--|
|String getContextPath()|返回请求文件的项目路径|
|String getRealPath(String)|返回当前请求文件的绝对路径,这个方法不推荐使用|
```jsp
<table border="1">
    <tr>
        <td align="right">返回请求文件的项目路径：</td>
        <td><%=request.getContextPath()%></td>
    </tr>
    <tr>
        <td align="right">返回当前请求文件的绝对路径：</td>
        <td><%=request.getRealPath("requestPath.jsp")%></td>
    </tr>
</table>
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/path/path.png)

参考：[https://blog.csdn.net/handsome_boy_wsq/article/details/82822186](https://blog.csdn.net/handsome_boy_wsq/article/details/82822186)
### 其他信息 ###
|方法|描述|
|:--|:--|
|getMethod()|获得客户端向服务器端传送数据的方法,如get、post、 header、 trace等|
|getRequestURL()|获得发出请求字符串的客户端地址,不包括请求的参数|
|String getQueryString()|返回此请求的参数|
|String getProtocol()|返回请求用的协议类型及版本号|





## 实例 ##
创建一个request.jsp的页面,写入如下信息：
```jsp
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>request内置对象测试</title>
</head>
<body>
<%--     
    <%
        //解决post提交的数据中的。中文乱码问题.无法解决URL传参方式的中文乱码问题
        request.setCharacterEncoding("utf-8");
        //解决get提交的数据乱码,可以通过tomcat的config目录下的server.xml配置文件来设置。
    %>
 --%>
    <h2>request内置对象</h2>
    获取到用户名:<%=request.getParameter("userName")%>
    爱好:<%
        String[] hobbys = request.getParameterValues("hobbys");
        if (hobbys != null)
        {
            for (int i = 0; i < hobbys.length; i++)
            {
                out.println(hobbys[i] + ",");
            }
        }
    %>
    密码:<%=request.getParameter("password")%>
</body>
</html>
```
然后，修改login.jsp。在其中加入一个复选框，并把表单的提交地址改为request.jsp如下所示:
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
<form action="request.jsp" name="loginForm" method="post">
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
</form>
</html>
```
进入登入界面,输入信息，然后点击登录按钮：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/login.png)
此时跳转到request.jsp页面，页面中得到了刚才的输入信息：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/show.png)
当然这种方式，不限于post方法，get方法也可以通过这种方式获取表单提交的数据。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/show_get.png)
## 表单输入中文乱码问题 ##
在上面的例子中，如果在login.jsp界面文本框中输入了中文：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/login_ch.png)
request.jsp页面会显示乱码：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/encoding/luanma.png)
### post方法乱码解决 ###
对应post方法提交出现的中文乱码，可以通过，`request.setCharacterEncoding("请求页面编码");`来设置，这里login.jsp页面用的是utf-8编码，所以在`request.jsp`页面中，在输出文本框的数据之前，设置编码即可：
```jsp
<body>
    <h2>request内置对象</h2>
    <%
        //解决post提交的数据中的。中文乱码问题.无法解决URL传参方式的中文乱码问题
//         request.setCharacterEncoding("ISO-8859-1");
        request.setCharacterEncoding("utf-8");
        //解决get提交的数据乱码,可以通过tomcat的config目录下的server.xml配置文件来设置。
    %>
    获取到用户名:<%=request.getParameter("userName")%><br>
    爱好:<%
        String[] hobbys = request.getParameterValues("hobbys");
        if (hobbys != null)
        {

            for (int i = 0; i < hobbys.length; i++)
            {
                out.println(hobbys[i] + ",");
            }
        }
    %>
    密码:<%=request.getParameter("password")%>
</body>
```
然后重新输入中文用户名，进行登录就可以看到不会有乱码了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/encoding/no_luanma.png)
注意：但是这种方式，只对post方法提交的表单数据有效。
## 超链接请求传参 ##
我们知道get方法会把参数放在URL里面提交，实际上我们也可以通过超链接的形式来传参。
### 超链接传参语法 ###
- 在超链接的后面加上英文半角问号`?`分割地址与参数。
- 多个参数(键值对)用单与符号`&`隔开，
- 键值对之间用等号`=`连接。

### 实例 ###
下面，直接把get方法生成的URL参数直接写到超链接里。这样点击超链接就相当于填写了表单。这便于跳过表单的填写，直接对request.jsp进行测试：
```html
<a href="http://localhost:8080/HelloWorld/request.jsp?userName=%E5%B0%8F%E6%98%8E&hobbys=book&password=123">直接提交</a>
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/urlparameter/a_get_test.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/urlparameter/result.png)
需要注意的是，我在上面的超链接中，使用的中文用户名是utf-8编码的：
```html
userName=%E5%B0%8F%E6%98%8E
```
那么如果在上面超链接中使用中文会怎样呢，也就是写成下面的形式：
```html
<a href="http://localhost:8080/HelloWorld/request.jsp?userName=小明&hobbys=book&password=123">直接提交</a>
```
可能会出现中文乱码问题，我这儿里测试没有发现又中文乱码，先记录以备后面查用。
## 解决get方法提交(URL传参)中文乱码 ##
对于get方法，如果获取到的表达数据乱码，则需要修改Tomcat的`conf`目录下的配置`server.xml`配置文件来实现：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/encoding/conf_server_xml.png)
找到其中的`Connector`标签，如下所示：
```xml
<Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443"/>
```
在最后添加`URIEcoding="utf-8"`指定URL的编码为utf-8,如下所示：
```xml
<Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443" URIEcoding="utf-8"/>
```
然后记得重启tomcat服务器，这样才会生效。
说个无关的：修改Connector标签的port属性可以修改tomcat的默认端口号。

## requset对象其他方法实例 ##
修改requset.jsp如下：
```jsp
<body>
    <h2>request内置对象</h2>
    <%
        //解决post提交的数据中的。中文乱码问题.无法解决URL传参方式的中文乱码问题
        //         request.setCharacterEncoding("ISO-8859-1");
        request.setCharacterEncoding("utf-8");
        //解决get提交的数据乱码,可以通过tomcat的config目录下的server.xml配置文件来设置。
        request.setAttribute("something", "属性值");
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
    属性值:<%=request.getAttribute("something")%><br>
    请求体的MME类型:<%=request.getContentType()%><br> 
    请求体的长度:<%=request.getContentLength()%>字节<br>
    请求用的协议类型及版本号:<%=request.getProtocol()%><br>
    请求的服务器主机名:<%=request.getServerName()%><br> 
    服务器接受此请求所用的端口号:<%=request.getServerPort()%><br>
    请求的客户端IP地址:<%=request.getRemoteAddr()%><br>
    请求的物理路径:<%=request.getRealPath("request.jsp") %><br>
    请求的上下文路径:<%=request.getContextPath() %><br>
</body>
```
### post提交方式 ###
在login.jsp中设置表单提交方式为post,点击登录后requset.jsp页面如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/otherMethods/post.png)
#### get方式提交的 ####
修改login.jsp中表单的提交方式为get,登录后request.jsp界面如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/request/otherMethods/get.png)
可以看到**通过get方式传递的参数，`request.getContentType()`返回null，`request.getContentLength()`返回`-1`**,这是因为这两个方法都是跟请求体相关的，get方法通过url传参，不存在请求体。
## 参考链接 ##
[http://www.runoob.com/jsp/jsp-client-request.html](http://www.runoob.com/jsp/jsp-client-request.html)
[GET和POST两种基本请求方法的区别](http://www.cnblogs.com/logsharing/p/8448446.html)