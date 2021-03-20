---
title: JSP out 内置对象
categories: 
  - 编程
  - Java
  - Java EE
  - JSP
  - 内置对象
date: 2018-12-19 15:11:38
updated: 2020-04-11 09:21:19
abbrlink: 8c60ed62
---
<div id='my_toc'><a href="/blog/8c60ed62/#out内置对象" class="header_1">out内置对象</a>&nbsp;<br><a href="/blog/8c60ed62/#向客户端输出数据" class="header_2">向客户端输出数据</a>&nbsp;<br><a href="/blog/8c60ed62/#管理响应缓冲" class="header_2">管理响应缓冲</a>&nbsp;<br><a href="/blog/8c60ed62/#实例" class="header_3">实例</a>&nbsp;<br><a href="/blog/8c60ed62/#验证flush-方法" class="header_3">验证flush()方法</a>&nbsp;<br><a href="/blog/8c60ed62/#验证clear-方法" class="header_3">验证clear()方法</a>&nbsp;<br><a href="/blog/8c60ed62/#验证clearBuffer-方法" class="header_3">验证clearBuffer()方法</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# out内置对象 #
out对象用于在web浏览器内输出信息,并且管理应用服务器上的输出缓冲区。在使用out对象输出数据时,可以对数据缓冲区进行操作,及时清除缓冲区中的残余数据,为其他的输出让出缓冲空间。待数据输出完毕后,要及时关闭输出流。
**缓冲区**: Buffer,所谓缓冲区就是内存的一块区域用来保存临时数据。

|列名|列名|
|:--|:--|
|void close()|关闭输出流|

## 向客户端输出数据 ##
out对象一个最基本的应用就是向客户端浏览器输出信息。out对象可以输出各种数据类型的数据**,在输出非字符串类型的数据时,会自动转换为字符串进行输出**。out对象提供了print()和 println()两种向页面中输出信息的方法。
- print0方法用于向客户端浏览器输出信息。通过该方法向客户端浏览器输出信息与使用JSP表达式输出信息相同。
- printIn()方法也是用于向客户端浏览器输出信息,与 println()方法不同的是,该方法在输出内容后,还输出一个换行符。

在使用 print0方法和 println()方法在页面中输出信息时,并不能很好地区分出两者的区别,因为在使用 printIn()方法向页面中输出的换行符显示在页面中时,并不能看到其后面的文字真的换行了,如果想让其显示,需要将要输出的文本使用HIML的`<pre>`标记括起来。修改后的代码如下:
```jsp
<%
    out.println("第一句脚本JSP脚本的输出,");
    out.println("第二句是脚本JSP脚本的输出.");
%>
<pre><%
        out.println("第一句脚本JSP脚本的输出,");
        out.println("第二句是脚本JSP脚本的输出.");
%></pre>
```
显示效果：
```
第一句脚本JSP脚本的输出, 第二句是脚本JSP脚本的输出.

第一句脚本JSP脚本的输出,
第二句是脚本JSP脚本的输出.

```
## 管理响应缓冲 ##
out对象的类一个比较重要的功能就是对缓冲区进行管理。通过调用out对象的clear()方法可以清除缓冲区的内容这类似于重置响应流,以便重新开始操作。如果响应已经提交,则会有产生 IOException异常的负作用。out对象还提供了另一种清除缓冲区内容的方法,那就是 clearBuffer()方法,通过该方法可以清除缓冲区的“当前”内容,而且即使内容已经提交给客户端,也能够访问该方法。除了这两个方法外,out对象还提供了其他用于管理缓冲区的方法。out对象用于管理缓冲区的方法如下表所示。

|列名|列名|
|:--|:--|
|void clear()|清除缓冲区的内容,如果在fush之后调用`会`抛出异常|
|void clearBuffer()|清除缓冲区的内容,如果在fush之后调用`不会`抛出异常|
|void flush()|将缓冲区内容输出到客户端|
|boolean isAutoflush()|返回缓冲区满时,是自动清空还是抛出异常|
|int getBufferSize()|返回缓冲区大小(字节数),如不设缓冲区则返回0|
|int getRemaining()|返回缓冲区可用字节数|
### 实例 ###
在HelloWorld项目中的WebContent目录下，创建以out.jsp文件，内容如下：
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%
    out.println("<h2>测试out内置对象</h2>");
    out.println("第一句脚本JSP脚本的输出,哈哈哈哈<br>");
//    out.flush();//清空缓冲区，就是先把上面的第一句先写到浏览器
//     out.clear();//清除缓冲区的内容,在flush之后调用会抛出异常,程序终止
//    out.clearBuffer();//清空缓冲区的内容,在flush之后调用不会抛出异常。
    out.println("第二句是脚本JSP脚本的输出,哈哈哈哈<br>");
    %>
    <table>
    <tr>
        <td align="right">缓冲区大小:</td>
        <td><%=out.getBufferSize() %></td>
    </tr>
    <tr>
        <td align="right">剩余缓冲区大小:</td>
        <td><%=out.getRemaining() %></td>
    </tr>
    <tr>
        <td align="right">是否自动清空缓冲区:</td>
        <td><%=out.isAutoFlush() %></td>
    </tr>
</table>
</html>
```
运行结果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/out/outtest.png)


### 验证flush()方法 ###
取消out.flush()前面的注释，再运行，结果如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/out/flush.png)
可以看到相比上门，flush()之后缓冲区剩余大小变大了，这是因为第一个输出语句的结果先刷新到客户端了，此时缓冲区中只有第二句输出。相比上面少了一句，所以剩余空间变大了。
### 验证clear()方法 ###
取消out.clear()方法的注释，再次访问out.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/out/clear.png)
可以看到浏览器中只显示了第一句，还可以看到eclipse控制台出现了异常：
```
严重: Servlet.service() for servlet [jsp] in context with path [/HelloWorld] threw exception
java.io.IOException: An exception occurred processing JSP page [/out.jsp] at line [14]
11:     out.println("<h2>娴嬭瘯out鍐呯疆瀵硅薄</h2>");
12:     out.println("绗竴鍙ヨ剼鏈琂SP鑴氭湰鐨勮緭鍑?,鍝堝搱鍝堝搱<br>");
13:     out.flush();//娓呯┖缂撳啿鍖猴紝灏辨槸鍏堟妸涓婇潰鐨勭涓?鍙ュ厛鍐欏埌娴忚鍣?
14:     out.clear();//娓呴櫎缂撳啿鍖虹殑鍐呭,鍦╢lush涔嬪悗璋冪敤浼氭姏鍑哄紓甯?,绋嬪簭缁堟
```
所以，调用了flush之后不要再接着调用clear()会报出异常的。
### 验证clearBuffer()方法 ###
现在注释掉out.clear()，取消out.clearBuffer();的注释，再次访问out.jsp:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/out/clearBuffer.png)
同时再eclipse控制台中也看不到有异常的出现。
