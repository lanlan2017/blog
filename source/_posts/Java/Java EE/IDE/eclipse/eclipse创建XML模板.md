---
title: eclipse创建XML模板
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-05-14 01:06:56
updated: 2019-12-17 05:18:52
abbrlink: bb6759de
---
<div id='my_toc'><a href="/blog/bb6759de/#前言" class="header_1">前言</a>&nbsp;<br><a href="/blog/bb6759de/#创建XML模板步骤" class="header_1">创建XML模板步骤</a>&nbsp;<br><a href="/blog/bb6759de/#使用自己创建的XML模板" class="header_1">使用自己创建的XML模板</a>&nbsp;<br><a href="/blog/bb6759de/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

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
