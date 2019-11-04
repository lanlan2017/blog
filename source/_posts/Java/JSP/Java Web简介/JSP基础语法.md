---
title: JSP基础语法
categories: 
  - Java
  - JSP
  - Java Web简介
date: 2018-12-03 19:28:31
updated: 2019-10-30 13:53:55
abbrlink: ceef3131
---
- [JSP页面元素构成](/blog/html/ceef3131/#JSP页面元素构成)
    - [JSP指令](/blog/html/ceef3131/#JSP指令)
        - [page指令](/blog/html/ceef3131/#page指令)
        - [contentType 和pageEncoding的区别](/blog/html/ceef3131/#contentType-和pageEncoding的区别)
    - [JSP注释](/blog/html/ceef3131/#JSP注释)
        - [实例](/blog/html/ceef3131/#实例)
        - [英文](/blog/html/ceef3131/#英文)
- [JSP页面生命周期](/blog/html/ceef3131/#JSP页面生命周期)
    - [JSP编译](/blog/html/ceef3131/#JSP编译)
    - [JSP初始化](/blog/html/ceef3131/#JSP初始化)
    - [JSP执行](/blog/html/ceef3131/#JSP执行)
    - [JSP清理](/blog/html/ceef3131/#JSP清理)
    - [实例](/blog/html/ceef3131/#实例)
    - [参考链接](/blog/html/ceef3131/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>



# JSP页面元素构成 #
JSP页面组成部分
- [指令](/blog/ceef3131/#JSP指令)
- 注释
- 脚本
- 声明
- 表达式
- 静态内容

## JSP指令 ##
JSP指令元素一共有以下三种：
- page指令--通常位于jsp页面的顶端,同一个页面可以有多个page指令
- include指令--将一个外部文件嵌入到当前JSP文件中,同时解析这个页面中的JSP语句。
- taglib指令--使用taglib指令可以用户自定义标签库,在JSP中使用自定义的标签库。

### page指令 ###
page指令语法
```
<%@ page 属性1="属性值" 属性2="属性值21,属性值22" 属性值n="属性值n1,属性值n2" %>
```
注意`@`和`page`之间有一个空格，属性和属性值之间是键值对的关系，属性值需要包含在双引号之中。page常用属性如下：

|属性|描述|默认值|
|:--|:--|:--|
|language|指定JSP页面使用的脚本语言|java|
|import|通过该属性来引用脚本语言中使用到的类文件|无|
|contentType|用来指定JSP页面所采用的文件类型以及编码方式|text/html,ISO-8859-1|

新建一个项目，可以看到默认的page指令如下：
```jsp
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
```
这里的` pageEncoding="lSO-8859-1"`的表示页面的字符编码为`ISO-8859-1`,这个编码不支持中文，使用中文会乱码。

![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/pageCMD/charSet.png)
这里推荐使用`contentType`属性，修改page指令如下：
```
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
```
现在就显示正常了:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/pageCMD/utf-8.png)

### contentType 和pageEncoding的区别 ###
 在JSP标准的语法中，如果pageEncoding属性存在，那么`JSP页面`的字符编码方式就由pageEncoding决定，否则就由contentType属性中的charset决定，如果charset也不存在，JSP页面的字符编码方式就采用默认的ISO-8859-1。

`pageEncoding是jsp文件本身的编码`,发生在由jsp文件编译成java文件的时候，使用pageEncoding指定的编码来读取jsp文件，编译成utf-8格式的java源码（即.java）
contentType的charset设置的编码是指服务器发送给客户端时的内容编码，简单讲就是`ContentType的charset让浏览器知道用什么编码解析`服务器发过去的东西".

----------
客户端访问一个jsp文件要经过如下三个阶段
- 第一次编码发生在web容器将jsp文件编译成java文件(Servlet类)的时候。web容器根据pageEncoding指定的编码来读取jsp文件，编译成utf-8格式的java文件(Servlet类)（.java)
- 第二阶编码发生在由java文件编译成二进制文件(.class)的时候，javac命令使用utf-8编码读取java文件，然后编译成utf-8格式的二进制码（即.class）
- 第三阶段是Tomcat（或其的application container）载入和执行阶段二的来的JAVA二进制码得到输出的结果,输出结果以contentType的charset进行编码。
----------

## JSP注释 ##
JSP页面中共有三种注释
- HTML注释`<!--html注释-->`，HTML注释在客户端(浏览器)是可以看到的。
- JSP注释`<%--JSP注释--%>`，JSP注释在客户端不可见。注意了不要和html注释混淆`<%!--JSP注释--%>`这样写是不对的。
- JSP脚本注释(Java注释)，JSP脚本中写的是Java代码，用到的注释也就是Java的注释，有:
	- 单行注释:`//`,
	- 多行注释:`/**/`,
	- 文档注释`/** */`
	- JSP脚本注释同样在客户端不可见。
- **动态注释:**,在html注释中写入jsp表达式，由于HIML注释对JSP嵌入的代码不起作用,因此可以利用它们的组合构成动态的HTML注释文本，例如：
```html
<!-- <%= new Date0)%> -->
```
### 实例 ###
在index.jsp写输入下面的注释：
```jsp
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%-- <%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HelloWorld</title>
</head>
<body>
	<h2>Hello 这是我的第一个JavaWeb项目</h2>
	<!-- 我是HTML注释 客户端可见 -->
	<%-- 我是JSP注释 客户端不可见--%>
	<% 
	//单行注释 客户端不可见
	/*
	多行注释 客户端不可见
	*/
	%>
</body>
</html>
```
然后打开浏览器查看index.jsp源码：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/annotation/annotations.png)
可以发现我们可以看到HTML注释，但是是看不到JSP注释和JSP脚本注释的.

### 英文 ###
|单词|读音|
|:--|:--|
|<a href="https://fanyi.baidu.com/?#en/zh/annotation">annotation</a>|<img src="/images/play.png" onclick="paly_audioID20181207012922();" class="shake-little" style="border: 0px;" title="点击播放">|

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=annotation&spd=3&source=web" id="audioID20181207012922"></audio>
<script>
    function paly_audioID20181207012922() {var id = document.getElementById("audioID20181207012922");if (id != null) {id.play();}}
</script>




# JSP页面生命周期 #
JSP生命周期就是从创建到销毁的整个过程
- **编译阶段**：
	- servlet容器编译servlet源文件，生成servlet类
- **初始化阶段**：
	- 加载与JSP对应的servlet类，创建其实例，并调用它的初始化方法
- **执行阶段**：
	- 调用与JSP对应的servlet实例的服务方法
- **销毁阶段**：
	- 调用与JSP对应的servlet实例的销毁方法，然后销毁servlet实例

##  JSP编译 ##
当浏览器请求JSP页面时，JSP引擎会首先去检查是否需要编译这个文件。如果这个文件没有被编译过，或者在上次编译后被更改过，则编译这个JSP文件。
编译的过程包括三个步骤：
- 解析JSP文件。
- 将JSP文件转为servlet。
- 编译servlet。

## JSP初始化 ##
容器载入JSP文件后，它会在为请求提供任何服务前调用`jspInit()`方法。如果您需要执行自定义的JSP初始化任务，复写jspInit()方法就行了，就像下面这样： 
```java
public void jspInit(){
  // 初始化代码
}
```
一般来讲程序只初始化一次，通常情况下您可以在jspInit()方法中初始化数据库连接、打开文件和创建查询表。 
## JSP执行 ##
这一阶段描述了JSP生命周期中一切与请求相关的交互行为，直到被销毁。
当JSP网页完成初始化后，JSP引擎将会调用`_jspService()`方法。

`_jspService()`方法需要一个HttpServletRequest对象和一个HttpServletResponse对象作为它的参数，就像下面这样： 
```java
void _jspService(HttpServletRequest request,
                 HttpServletResponse response)
{
   // 服务端处理代码
}
```
`_jspService()`方法在每个request中`被调用一次`，并且负责产生与之相对应的response，并且它还负责产生所有7个HTTP方法的回应，比如GET、POST、DELETE等等。
 
`_jspService()`方法被调用来处理客户端的请求。对每一个请求,JSP引擎创建一个新的线程来处理该请求。如果有多个客户端同时请求该JSP文件,则JSP引擎会创建多个线程。每个客户端请求对应一个线程。以多线程方式执行可以大大降低对系统的资源需求,提高系统的并发量及响应时间。但也要注意多线程的编程带来的同步问题,由于该 Servlet始终驻于内存,所以响应是非常快的。
## JSP清理 ##
JSP生命周期的销毁阶段描述了**当一个JSP网页从容器中被移除时所发生的一切**。

`jspDestroy()`方法在JSP中等价于servlet中的销毁方法。当您需要执行任何清理工作时复写jspDestroy()方法，比如释放数据库连接或者关闭文件夹等等。

jspDestroy()方法的格式如下：
```java
public void jspDestroy()
{
   // 清理代码
}
```
## 实例 ##
## 参考链接 ##
[http://www.runoob.com/jsp/jsp-life-cycle.html](http://www.runoob.com/jsp/jsp-life-cycle.html)
[https://www.cnblogs.com/x_wukong/p/3646848.html](https://www.cnblogs.com/x_wukong/p/3646848.html)
>原文链接: [JSP基础语法](https://lanlan2017.github.io/blog/ceef3131/)
