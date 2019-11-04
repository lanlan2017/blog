---
title: eclipse创建XML模板
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-05-14 01:06:56
updated: 2019-10-30 13:53:55
abbrlink: bb6759de
---
- [前言](/blog/html/bb6759de/#前言)
- [创建XML模板步骤](/blog/html/bb6759de/#创建XML模板步骤)
- [使用自己创建的XML模板](/blog/html/bb6759de/#使用自己创建的XML模板)
- [参考资料](/blog/html/bb6759de/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 前言 #
web.xml之中好多xml标签都差不多,每次都要抄写一遍就很烦,把这些代码做成XML模板,这样eclipse就会自动提示.
# 创建XML模板步骤 #
windows>preferences>XML>XML Files>Editors>templates,然后点击右边的new按钮,新建一个XML模板,填入名称,描述,模板代码,然后点击OK即可。
```xml
<!--设置文件编码过滤器-->
<filter>
	<filter-name>characterEncodingFilter</filter-name>
	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
	<init-param>
		<param-name>encoding</param-name>
		<param-value>UTF-8</param-value>
	</init-param>
</filter>
<!--匹配文件编码过滤器的URL-->
<filter-mapping>
	<filter-name>characterEncodingFilter</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>
```
如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/XML/AutoXML/1.png)
# 使用自己创建的XML模板 #
在web.xml文件之中,输入刚才设置的名称,就可看到自动提示了.如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/XML/AutoXML/2.png)
选择这个选项即可补全代码
# 参考资料 #
[https://blog.csdn.net/qq_38379632/article/details/81866784](https://blog.csdn.net/qq_38379632/article/details/81866784)

>原文链接: [eclipse创建XML模板](https://lanlan2017.github.io/blog/bb6759de/)
