---
title: 15 Log4j Debug记录
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-06 11:57:02
updated: 2020-08-18 12:02:48
abbrlink: 2efc4260
---
<div id='my_toc'><a href="/blog/2efc4260/#Log4j-Debug记录" class="header_1">Log4j Debug记录</a>&nbsp;<br><a href="/blog/2efc4260/#log4j-WARN-No-appenders-could-be-found-for-logger" class="header_2">log4j:WARN No appenders could be found for logger</a>&nbsp;<br><a href="/blog/2efc4260/#错误提示信息" class="header_3">错误提示信息</a>&nbsp;<br><a href="/blog/2efc4260/#配置文件内容" class="header_3">配置文件内容</a>&nbsp;<br><a href="/blog/2efc4260/#解决方案" class="header_3">解决方案</a>&nbsp;<br><a href="/blog/2efc4260/#Define-the-root-logger-with-appender-file" class="header_1">Define the root logger with appender file</a>&nbsp;<br><a href="/blog/2efc4260/#Define-the-file-appender" class="header_1">Define the file appender</a>&nbsp;<br><a href="/blog/2efc4260/#Define-the-layout-for-file-appender" class="header_1">Define the layout for file appender</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j Debug记录
## log4j:WARN No appenders could be found for logger
### 错误提示信息
```cmd
log4j:WARN No appenders could be found for logger (demo.Log4jExample).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
```
### 配置文件内容
```properties /Log4jDemo/src/log4j.properties
# Define the root logger with appender file
Log4j.rootLogger = DEBUG, FILE

# Define the file appender
Log4j.appender.FILE=org.apache.Log4j.FileAppender
Log4j.appender.FILE.File=htmlLayout.html

# Define the layout for file appender
Log4j.appender.FILE.layout=org.apache.Log4j.HTMLLayout
Log4j.appender.FILE.layout.Title=HTML Layout Example
Log4j.appender.FILE.layout.LocationInfo=true
```
### 解决方案
配置文件写错了,包名应该小写开头,将上述的`Log4j`改成`log4j`:
<pre>
# Define the root logger with appender file
<mark>log4j</mark>.rootLogger = DEBUG, FILE

# Define the file appender
<mark>log4j</mark>.appender.FILE=org.apache.<mark>log4j</mark>.FileAppender
<mark>log4j</mark>.appender.FILE.File=htmlLayout.html

# Define the layout for file appender
<mark>log4j</mark>.appender.FILE.layout=org.apache.<mark>log4j</mark>.HTMLLayout
<mark>log4j</mark>.appender.FILE.layout.Title=HTML Layout Example
<mark>log4j</mark>.appender.FILE.layout.LocationInfo=true
</pre>

