---
title: Log4j 使用多个文件记录日志 RollingFileAppender类
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-03 09:56:40
updated: 2020-08-03 11:21:29
abbrlink: cbcda66c
---
<div id='my_toc'><a href="/blog/cbcda66c/#Log4j-使用多个文件记录日志-RollingFileAppender类" class="header_1">Log4j 使用多个文件记录日志 RollingFileAppender类</a>&nbsp;<br><a href="/blog/cbcda66c/#log4j-properties" class="header_2">log4j.properties</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j 使用多个文件记录日志 RollingFileAppender类
您可能因为某些原因，需要将日志写入多个文件，比如当文件大小达到一定阀值时。

为了将日志写入多个文件，您需要使用`org.apache.Log4j.RollingFileAppender`，该类继承了`FileAppender`类，继承了它的所有属性。
除了上述提到的`FileAppender`类的属性，该类还包括如下可配置的属性：


|RollingFileAppender新增属性|描述|
|:---|:---|
|`maxFileSize`|这是文件大小的关键值，大于该值时，文件会回滚。该值默认为`10MB`。|
|`maxBackupIndex`|该值表示备份文件的个数，默认为1。|

## log4j.properties
下面是为`RollingFileAppender`定义的示例配置文件`Log4j.properties`：
```properties /Log4jDemo/Log4jConfig/RollingFileAppender/Log4j.properties
# Define the root logger with appender file
log4j.rootLogger = DEBUG, FILE

# Define the file appender
log4j.appender.FILE=org.apache.log4j.RollingFileAppender

# Set the name of the file
log4j.appender.FILE.File=log.out

# Set the immediate flush to true (default)
log4j.appender.FILE.ImmediateFlush=true

# Set the threshold to debug mode
log4j.appender.FILE.Threshold=debug

# Set the append to false, should not overwrite
log4j.appender.FILE.Append=true

# Set the maximum file size before rollover
log4j.appender.FILE.MaxFileSize=5KB

# Set the the backup index
log4j.appender.FILE.MaxBackupIndex=2

# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n
```
如果您想使用`XML`配置文件，可以像上一节一样生成`XML`配置文件，只需添加和`RollingFileAppender`相关的配置即可。
该示例配置文件展示了每个日志文件最大为`5MB`，如果超过该最大值，则会生成一个新的日志文件。由于`maxBackupIndex`的值为2，当第二个文件的大小超过最大值时，会擦去第一个日志文件的内容，所有的日志都回滚至第一个日志文件。 
