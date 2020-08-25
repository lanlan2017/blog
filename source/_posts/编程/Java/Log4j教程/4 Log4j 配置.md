---
title: 4 Log4j 配置
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-03 04:04:18
updated: 2020-08-18 12:00:10
abbrlink: 9c30cbde
---
<div id='my_toc'><a href="/blog/9c30cbde/#log4j配置" class="header_1">log4j配置</a>&nbsp;<br><a href="/blog/9c30cbde/#Log4j-properties的语法" class="header_2">Log4j.properties的语法</a>&nbsp;<br><a href="/blog/9c30cbde/#Define-the-root-logger-with-appender-XXX" class="header_1">Define the root logger with appender XXX</a>&nbsp;<br><a href="/blog/9c30cbde/#Set-the-appender-named-XXX-to-be-a-File-appender" class="header_1">Set the appender named XXX to be a File appender</a>&nbsp;<br><a href="/blog/9c30cbde/#Define-the-layout-for-XXX-appender" class="header_1">Define the layout for XXX appender</a>&nbsp;<br><a href="/blog/9c30cbde/#Log4j-properties示例" class="header_2">Log4j.properties示例</a>&nbsp;<br><a href="/blog/9c30cbde/#变量替换" class="header_3">变量替换</a>&nbsp;<br><a href="/blog/9c30cbde/#级别" class="header_3">级别</a>&nbsp;<br><a href="/blog/9c30cbde/#Appender对象" class="header_2">Appender对象</a>&nbsp;<br><a href="/blog/9c30cbde/#Appender对象属性" class="header_3">Appender对象属性</a>&nbsp;<br><a href="/blog/9c30cbde/#将Appender添加到Logger对象" class="header_3">将Appender添加到Logger对象</a>&nbsp;<br><a href="/blog/9c30cbde/#在程序中为Logger对象添加Appender对象" class="header_3">在程序中为Logger对象添加Appender对象</a>&nbsp;<br><a href="/blog/9c30cbde/#所有可用的Appender" class="header_3">所有可用的Appender</a>&nbsp;<br><a href="/blog/9c30cbde/#Layout对象" class="header_2">Layout对象</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# log4j配置
`Log4j`的配置包括在配置文件中:
1. 指定`Level`、
2. 定义`Appender`、
3. 指明`Layout`。


`Log4j.properties`文件是`Log4j`的配置文件，属性以**键值对**的形式定义。默认情况下，`LogManager`会在`CLASSPATH`中寻找`Log4j.properties`文件。

- 根日志的级别定义为`DEBUG`，并将名为`XXX`的`appender`添加其上。
- 将名为`XXX`的`appender`设置为合法的`appender`。
- 设置`XXX`这个`appender`的`layout`。

## Log4j.properties的语法
为`appender XXXXX`定义的`Log4j.properties`的语法如下：
<pre>
# Define the root logger with appender XXX
log4j.rootLogger = DEBUG, <mark>XXX</mark>

# Set the appender named XXX to be a File appender
<strong>log4j.appender.<mark>XXX</mark></strong>=org.apache.log4j.FileAppender

# Define the layout for XXX appender
<strong>log4j.appender.<mark>XXX</mark>.layout</strong>=org.apache.log4j.PatternLayout
<strong>log4j.appender.<mark>XXX</mark>.layout.conversionPattern</strong>=%m%n
</pre>

## Log4j.properties示例
使用上述语法，我们在`Log4j.properties`定义如下属性：
- 定义根日志级别为`DEBUG`，并将名为`FILE`的`appender`添加在其上。
- `appender FILE`定义为`org.apache.log4j.FileAppender`，它将日志写入`log`目录下一个名为`log.out`的文件中。
- `layout`被定义为`%m%n`，其中`%m`表示日志信息,`%n`表示换行符,则`%m%n`表示打印出日志信息并在末尾加入换行。

```properties Log4j.properties
# 定义变量,该变量表示日志文件所在的目录
log = E:/workspacne_JDK8Tomcat8.5/Log4jDemo
# Define the root logger with appender file
log4j.rootLogger = DEBUG, FILE

# Define the file appender
log4j.appender.FILE=org.apache.log4j.FileAppender
log4j.appender.FILE.File=${log}/log.out

# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n
```
### 变量替换
值得注意的是，`Log4j`支持`Unix`风格的变量替换，比如`${variableName}`。

### 级别
所有可能的选项如下：
- `TRACE`、
- `DEBUG`、
- `INFO`、
- `WARN`、
- `ERROR`、
- `FATAL`、
- `ALL`。

这些级别会在本教程的后续部分讲解。

## Appender对象
**`Apache Log4j`提供的`Appender`对象主要负责将日志信息打印至不同目的地**，比如控制台、文件、网络套接字、`NT`事件日志等。
### Appender对象属性
每个`Appender`对象都有不同的属性，这些属性决定了该对象的行为。

|属性|描述|
|:---|:---|
|`layout`|`Appender`使用`Layout`对象和与之关联的模式来格式化日志信息。|
|`target`|目的地可以是控制台、文件，或依赖于`appender`的对象。|
|`level`|级别用来控制过滤日志信息。|
|`threshold`|`Appender`可脱离于日志级别定义一个阀值级别，`Appender`对象会忽略所有级别低于阀值级别的日志。|
|`filter`|`Filter`对象可在级别基础之上分析日志信息，来决定`Appender`对象是否处理或忽略一条日志记录。|

### 将Appender添加到Logger对象
通过在配置文件中使用如下方法，将`Appender`对象添加至`Logger`对象：
```properties
log4j.logger.[logger-name]=level, appender1,appender2...appendern
```
也可以在`XML`中定义同样的配置：
```xml
<logger name="com.apress.logging.Log4j" additivity="false">
   <appender-ref ref="appender1"/>
   <appender-ref ref="appender2"/>
</logger>
```
### 在程序中为Logger对象添加Appender对象
如果想在程序中添加`Appender`对象，可使用如下方法：
```java
public void addAppender(Appender appender);
```
`addAppender()`方法为`Logger`对象增加一个`Appender`。如示例配置展示的那样，可以通过逗号分隔的列表，为`logger`添加多个`Appender`，将日志信息打印到不同的目的地。
### 所有可用的Appender
在上面的例子中，我们只用到了`FileAppender`，所有可用的`appender`包括：
- `AppenderSkeleton`、
- `AsyncAppender`、
- `ConsoleAppender`、
- `DailyRollingFileAppender`、
- `ExternallyRolledFileAppender`、
- `FileAppender`、
- `JDBCAppender`、
- `JMSAppender`、
- `LF5Appender`、
- `NTEventLogAppender`、
- `NullAppender`、
- `RollingFileAppender`、
- `SMTPAppender`、
- `SocketAppender`、
- `SocketHubAppender`、
- `SyslogAppender`、
- `TelnetAppender`、
- `WriterAppender`。

我们将在[使用文件记录日志](https://lanlan2017.github.io/blog/6296507b/)一章讲解`FileAppender`，在[使用数据库记录日志](https://lanlan2017.github.io/blog/17eaff0a/)一章讲解`JDBCAppender`。


## Layout对象
我们已经在`appender`中使用了`PatternLayout`，`layout`对象的所有选项包括：
- `DateLayout`、
- `HTMLLayout`、
- `PatternLayout`、
- `SimpleLayout`、
- `XMLLayout`。

使用`HTMLLayout`和`XMLLayout`，可以生成`HTML`和`XML`格式的日志。

日志格式化
您将在**日志格式**一章学习如何格式化日志信息。
