---
title: eclipse创建Spring MVC配置文件
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-05-13 22:21:13
updated: 2019-12-17 05:18:52
abbrlink: 874828d8
---
<div id='my_toc'><a href="/blog/874828d8/#Spring-MVC配置文件模版" class="header_1">Spring MVC配置文件模版</a>&nbsp;<br><a href="/blog/874828d8/#安装插件" class="header_1">安装插件</a>&nbsp;<br><a href="/blog/874828d8/#使用Spring-Tools3插件创建配置文件" class="header_1">使用Spring Tools3插件创建配置文件</a>&nbsp;<br><a href="/blog/874828d8/#手动创建web-xml" class="header_1">手动创建web.xml</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Spring MVC配置文件模版 #
Spring MVC配置文件模板如下所示:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
</beans>
```
虽然知道大概是这样,但是我们不可能把上面这些代码背出来,下面介绍在eclipse之中如何创建Spring MVC的配置文件.
# 安装插件 #
使用安装`Spring Tools3`
# 使用Spring Tools3插件创建配置文件 #
在需要创建的目录上右键,选择`new>Other...`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Spring/SpringMVC/NewFile/1.png)
然后在弹出的选择框中下拉,展开Spring目录,选择`Spring Bean Configuration File`,选择`next`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Spring/SpringMVC/NewFile/2.png)
最后填入文件名,然后点击`next`,再次点击`next`即可创建`Spring MVC`配置文件.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Spring/SpringMVC/NewFile/3.png)
效果如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Spring/SpringMVC/NewFile/4.png)
# 手动创建web.xml #
有时候,刚开始创建项目时,并没有创建`web.xml`文件,等到需要用到时,总不能再创建一个一个项目,然后再把`web.xml`复制过来吧。下面来介绍怎么手动创建`web.xml`:
在项目上右键,选择`Java EE tools`,然后选择`Generate Deployment Descriptor Stub`即可创建`web.xml`:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Spring/SpringMVC/NewFile/5.png)
