---
title: 解决JSP中include指令导入的tag HTML文件出现乱码问题
categories: 
  - Java
  - Java EE
  - 标签文件
date: 2019-04-12 15:16:17
updated: 2019-11-25 13:24:47
abbrlink: ae393936
---
<div id='my_toc'>

- [问题描述](/blog/ae393936/#问题描述)
- [详细代码](/blog/ae393936/#详细代码)
- [浏览器显示效果](/blog/ae393936/#浏览器显示效果)
- [解决乱码](/blog/ae393936/#解决乱码)
    - [解决jsp文件乱码](/blog/ae393936/#解决jsp文件乱码)
    - [解决jsp中引入的tag文件出现的乱码](/blog/ae393936/#解决jsp中引入的tag文件出现的乱码)
    - [解决tag文件中引入的tagf文件出现的乱码](/blog/ae393936/#解决tag文件中引入的tagf文件出现的乱码)
    - [解决tag文件中引入的html文件中出现的乱码](/blog/ae393936/#解决tag文件中引入的html文件中出现的乱码)
- [修改后的代码](/blog/ae393936/#修改后的代码)
    - [includeDemoTagTest.jsp](/blog/ae393936/#includeDemoTagTest-jsp)
    - [includeDemoTag.tag](/blog/ae393936/#includeDemoTag-tag)
    - [included.tagf](/blog/ae393936/#included-tagf)
    - [included2.tagf](/blog/ae393936/#included2-tagf)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 问题描述 ##
在JSP页面中导入了自定义的标签文件出现乱码,这里涉及到四个文件分别是:
- `/app07a/WebContent/includeDemoTagTest.jsp`这个`jsp`是入口页面
- `/app07a/WebContent/WEB-INF/tags/includeDemoTag.tag`,`includeDemoTagTest.jsp`中引用这个个标签文件。
- `/app07a/WebContent/WEB-INF/tags/included.html`,`includeDemoTag.tag`中引用这个`html`文件。
- `/app07a/WebContent/WEB-INF/tags/included.tagf`,`includeDemoTag.tag`中引用引入这个`tagf`文件。`

## 详细代码 ##
`/app07a/WebContent/includeDemoTagTest.jsp`:
```jsp
<html>
<body>
    <h2>下面是标签文件includeDemoTag.tag中的内容</h2>
    <hr color="green">
    <!-- 引入自定义标签目录,取个别名为前缀`easy` -->
    <%@ taglib prefix="easy" tagdir="/WEB-INF/tags"%>
    <!-- 引入前缀`easy`所表示的标签目录中的`includeDemoTag.tag`文件 -->
    <easy:includeDemoTag />
    <hr color="green">
</body>
</html>
```
`/app07a/WebContent/WEB-INF/tags/includeDemoTag.tag`:
```jsp
<strong>以下是included.html的内容：</strong>
<hr color="red">
<%@ include file="included2.tagf"%>
<hr color="red">
<hr color="blue">
<strong>下面是included.tagf文件中的内容:</strong>
<%@ include file="included.tagf"%>

<hr color="blue">
```
`/app07a/WebContent/WEB-INF/tags/included.tagf`:
```jsp
<%
    out.print("<strong>included.tagf文件中的内容</strong>");
%>
```
`/app07a/WebContent/WEB-INF/tags/included.html`:
```html
<table>
    <tr>
        <th>水果</th>
        <th>单价(斤)</th>
    </tr>
    <tr>
        <td>苹果</td>
        <td>4.8</td>
    </tr>
    <tr>
        <td>香蕉</td>
        <td>3.6</td>
    </tr>
    <tr>
        <td>草莓</td>
        <td>12.5</td>
    </tr>
</table>
```
## 浏览器显示效果 ##
通过URL:
[http://localhost:8080/app07a/includeDemoTagTest.jsp](http://localhost:8080/app07a/includeDemoTagTest.jsp)访问,浏览器将显示乱码,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/tag%20file/encoding/1.png)
## 解决乱码 ##
### 解决jsp文件乱码 ###
在JSP文件第一行加入如下page指令:
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
```
可以解决JSP文件中的乱码.现在浏览器显示效果如下:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/tag%20file/encoding/2.png)
### 解决jsp中引入的tag文件出现的乱码 ###
在tag文件第一行中加入如下tag指令:
```jsp
<%@ tag pageEncoding="utf-8"%>
```
即可解决乱码,浏览器显示效果:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/tag%20file/encoding/3.png)
### 解决tag文件中引入的tagf文件出现的乱码 ###
类似tag文件,在tagf文件中的第一行加入如下tag指令,可以解决乱码:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/tag%20file/encoding/4.png)
### 解决tag文件中引入的html文件中出现的乱码 ###
我试了好多办法,都无法修改html文件的乱码,我的做法是:不使用html文件,也就是把`included.html`这个html文件改成`included2.tagf`tagf文件,然后利用tag指令来设置编码.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/tag%20file/encoding/5.png)
## 修改后的代码 ##
### includeDemoTagTest.jsp ###
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
    <h2>下面是标签文件includeDemoTag.tag中的内容</h2>
    <hr color="green">
    <!-- 引入自定义标签目录,取个别名为前缀`easy` -->
    <%@ taglib prefix="easy" tagdir="/WEB-INF/tags"%>
    <!-- 引入前缀`easy`所表示的标签目录中的`includeDemoTag.tag`文件 -->
    <easy:includeDemoTag />
    <hr color="green">
</body>
</html>
```
### includeDemoTag.tag ###
```jsp
<!-- 设置tag文件的编码 -->
<%@ tag pageEncoding="utf-8"%>
<strong>以下是included.html的内容：</strong>
<hr color="red">
<%@ include file="included2.tagf"%>
<hr color="red">
<hr color="blue">
<strong>下面是included.tagf文件中的内容:</strong>
<%@ include file="included.tagf"%>
<hr color="blue">
```
### included.tagf ###
```jsp
<%@ tag pageEncoding="utf-8"%>
<%
    out.print("<strong>included.tagf文件中的内容</strong>");
%>
```
### included2.tagf ###
```jsp
<%@ tag pageEncoding="utf-8"%>
<%
    out.print("<strong>included.tagf文件中的内容</strong>");
%>
```
>原文链接: [解决JSP中include指令导入的tag HTML文件出现乱码问题](https://lanlan2017.github.io/blog/ae393936/)
