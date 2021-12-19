---
title: 15 No appenders could be found for logger Please initialize the log4j system properly
categories: 
  - 编程
  - Java
  - Log4j教程
  - Debug
date: 2020-08-06 11:57:02
updated: 2020-09-03 01:18:26
abbrlink: 2efc4260
---
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
&#35; Define the root logger with appender file
<mark>log4j</mark>.rootLogger = DEBUG, FILE

&#35; Define the file appender
<mark>log4j</mark>.appender.FILE=org.apache.<mark>log4j</mark>.FileAppender
<mark>log4j</mark>.appender.FILE.File=htmlLayout.html

&#35; Define the layout for file appender
<mark>log4j</mark>.appender.FILE.layout=org.apache.<mark>log4j</mark>.HTMLLayout
<mark>log4j</mark>.appender.FILE.layout.Title=HTML Layout Example
<mark>log4j</mark>.appender.FILE.layout.LocationInfo=true
</pre>
