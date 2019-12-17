---
title: JSP 指令
categories: 
  - Java
  - Java EE
  - JSP
  - 基础语法
date: 2018-12-20 23:51:51
updated: 2019-12-16 02:39:28
abbrlink: 7b20b86
---
<div id='my_toc'><a href="/blog/7b20b86/#page指令" class="header_1">page指令</a><br><a href="/blog/7b20b86/#language属性" class="header_2">language属性</a><br><a href="/blog/7b20b86/#extends属性" class="header_2">extends属性</a><br><a href="/blog/7b20b86/#import属性" class="header_2">import属性</a><br><a href="/blog/7b20b86/#pageEccoding属性" class="header_2">pageEccoding属性</a><br><a href="/blog/7b20b86/#contentType属性" class="header_2">contentType属性</a><br><a href="/blog/7b20b86/#session属性" class="header_2">session属性</a><br><a href="/blog/7b20b86/#buffer属性" class="header_2">buffer属性</a><br><a href="/blog/7b20b86/#autoFlush属性" class="header_2">autoFlush属性</a><br><a href="/blog/7b20b86/#isErrorPage属性" class="header_2">isErrorPage属性</a><br><a href="/blog/7b20b86/#errorPage属性" class="header_2">errorPage属性</a><br><a href="/blog/7b20b86/#inc|ude指令" class="header_1">inc|ude指令</a><br><a href="/blog/7b20b86/#实例" class="header_2">实例</a><br><a href="/blog/7b20b86/#taglib指令" class="header_1">taglib指令</a><br></div>
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
# page指令 #
page是JSP页面最常用的指令,用于定义整个JSP页面的相关属性,这些属性在JSP被服务器解析成 Servlet时会转换为相应的Java程序代码。page指令的语法格式如下:
```jsp
<%@ page attr1="value1"attr2="value2"%>
```
page指令包含的属性有15个,下面对一些常用的属性进行介绍。
## language属性 ##
该属性用于设置JSP页面使用的语言,目前只支持Java语言,默认值为Java。
```jsp
<%@ page language="java" %>
```
## extends属性 ##
该属性用于设置JSP页面继承的Java类,所有JSP页面在执行之前都会被服务器解析成 Servlet,而 Servlet是由Java类定义的,所以JSP和 Servlet都可以继承指定的父类。该属性并不常用,而且有可能影响服务器的性能优化。
## import属性 ##
该属性用于设置JSP导入的类包。JSP页面可以嵌入Java代码片段,这些Java代码在调用API需要导入相应的类包。
```jsp
<%@ page import="java.util.Enumeration"%>
```
## pageEccoding属性 ##
该属性用于**定义JSP页面的编码格式,也就是指定文件编码**。JSP页面中的所有代码都使用该属性指定的字符集,如果该属性值设置为ISO-8859-1,那么这个JSP页面就不支持中文字符。通常设置编码格式为UTF-8.
```jsp
<%@ page pageEncoding="UTF-8"%>
```
## contentType属性 ##
该属性用于设置JSP页面的MIME类型和字符编码,浏览器会据此显示网页内容。
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
```
## session属性 ##
该属性指定JSP页面是否使用HTP的 session会话对象。其属性值是 boolean类型,可选值为true和 false**。默认值为true,表示可以使用 session会话对象**;如果设置为 false,则当前JSP页面将无法使用 session会话对象。
```jsp
<%@page session="false"%>
```
## buffer属性 ##
该属性用于设置JSP的out输出对象使用的缓冲区大小,默认大小为8KB,且单位只能使用KB。建议程序开发人员使用8的倍数16、32、64、128等作为该属性的属性值。
## autoFlush属性 ##
该属性用于设置JsP页面缓存满时,是否自动刷新缓存。默认值为tue;如果设置为 false,则缓存被填满时将抛出异常。
## isErrorPage属性 ##
通过该属性可以将当前JSP页面设置成错误处理页面来处理另一个JSP页面的错误,也就是异常处理。这意味着当前JSP页面业务的改变。
## errorPage属性 ##
该属性用于指定处理当前JSP页面异常错误的另一个JSP页面,指定的JSP错误处理页面必须设置 isErrorPage属性为true。 errorPage属性的属性值是一个url字符串。
# inc|ude指令 #
文件包含指令 include是JSP的另一条指令标识。通过该指令可以在一个JSP页面中包含另一个JSP页面。不过该指令是静态包含,也就是说被包含文件中所有内容会被原样包含到该JSP页面中,即使被包含文件中有JSP代码,在包含时也不会被编译执行。使用 include指令,最终将生成一个文件,**所以在被包含和包含的文件中,不能有相同名称的变量**。 include指令包含文件的过程如图下图所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/CMD/include/include.png)
include指令的语法格式如下:
```jsp
<% include file="path"%>
```
该指令只有一个file属性,用于指定要包含文件的路径。该路径可以是相对路径,也可以是绝对路径。但是不可以是通过`<%=%>`表达式所代表的文件。
使用 include指令包含文件可以大大提高代码的重用性,而且也便于以后的维护和升级

在应用include指令进行文件包含时,为了使整个页面的层次结构不发生冲突,建议在被包含页面中将`<htm>`、`<body>`等标记删除.因为在包含该页面的文件中巳经指定这些标记
## 实例 ##
后面再更新。。。。
# taglib指令 #
在JSP文件中,可以通过taglib指令标识声明该页面中所使用的标签库,同时引用标签库,并指定标签的前缀。在页面中引用标签库后,就可以通过前缀来引用标签库中的标签。 taglib指令的语法格式如下:
```
<% taglib prefix="tagPrefix uri="tagURI"%>
```
- prefix:用于指定标签的前缀。该前缀不能命名为jsp、jspx、java、 Javax、sun、 servlet和sunw。
- uri:用于指定标签库文件的存放位置

