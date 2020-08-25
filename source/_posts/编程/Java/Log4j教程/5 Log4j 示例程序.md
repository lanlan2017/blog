---
title: 5 Log4j 示例程序
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-03 05:07:11
updated: 2020-08-18 12:00:17
abbrlink: 37d9cc03
---
<div id='my_toc'><a href="/blog/37d9cc03/#Log4j示例程序" class="header_1">Log4j示例程序</a>&nbsp;<br><a href="/blog/37d9cc03/#项目结构" class="header_2">项目结构</a>&nbsp;<br><a href="/blog/37d9cc03/#源代码" class="header_2">源代码</a>&nbsp;<br><a href="/blog/37d9cc03/#日志输出到文件" class="header_2">日志输出到文件</a>&nbsp;<br><a href="/blog/37d9cc03/#Log4j-properties" class="header_3">Log4j.properties</a>&nbsp;<br><a href="/blog/37d9cc03/#Log4jExample-java" class="header_3">Log4jExample.java</a>&nbsp;<br><a href="/blog/37d9cc03/#运行效果" class="header_3">运行效果</a>&nbsp;<br><a href="/blog/37d9cc03/#日志输出到控制台" class="header_2">日志输出到控制台</a>&nbsp;<br><a href="/blog/37d9cc03/#log4j-properties" class="header_3">log4j.properties</a>&nbsp;<br><a href="/blog/37d9cc03/#替换log4j配置文件-重新运行" class="header_3">替换log4j配置文件 重新运行</a>&nbsp;<br><a href="/blog/37d9cc03/#日志同时输出到文件和控制台" class="header_2">日志同时输出到文件和控制台</a>&nbsp;<br><a href="/blog/37d9cc03/#log4j-properties" class="header_3">log4j.properties</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j示例程序
我们已经学会了如何创建配置文件，本章讲述如何生成调试信息，并将其写入一个简单的文本文件。
## 项目结构
<details><summary>展开/折叠</summary><pre>
E:\workspacne_JDK8Tomcat8.5\Log4jDemo
├─lib\
│ ├─commons-logging-1.2.jar
│ ├─log4j-1.2.17.jar
│ ├─log4j-api-2.13.3.jar
│ ├─log4j-core-2.13.3.jar
│ └─mysql-connector-java-8.0.17.jar
├─log.out
├─Log4jConfig\
│ ├─DailyRollingFileAppender\
│ │ └─log4j.properties
│ ├─file\
│ │ └─log4j.properties
│ ├─FileAppender\
│ │ ├─log4j.properties
│ │ └─log4j.xml
│ ├─file_and_stout\
│ │ └─log4j.properties
│ ├─grammar\
│ │ └─log4j.properties
│ ├─HTMLLayout\
│ │ └─log4j.properties
│ ├─JDBCAppender\
│ │ ├─log4j.properties
│ │ └─log4j.xml
│ ├─Level\
│ │ └─log4j.properties
│ ├─loggerPackage\
│ │ └─log4j.xml
│ ├─PatternLayout\
│ │ └─log4j.properties
│ ├─RollingFileAppender\
│ │ └─log4j.properties
│ ├─stdout\
│ │ └─log4j.properties
│ └─xml_file_stdout\
│   └─log4j.xml
├─README.md
└─src\
  ├─demo\
  │ ├─file\
  │ │ └─appender\
  │ │   └─XMLFileAppenderTest.java
  │ ├─level\
  │ │ ├─SetLevelByMethod.java
  │ │ └─SetLevleByConfig.java
  │ ├─Log4jExample.java
  │ ├─logpackage\
  │ │ └─LoggerPackage.java
  │ └─method\
  │   └─LoggerMethodTest.java
  └─log4j.properties
</pre></details>


## 源代码
[https://github.com/lanlan2017/Log4jDemo](https://github.com/lanlan2017/Log4jDemo) 


## 日志输出到文件
### Log4j.properties
下面是为我们的例子创建的一个简单配置文件，让我们再来复习一遍：
> - 定义根日志级别为`DEBUG`，并将名为`FILE`的`appender`添加其上。
> - `appender FILE`定义为`org.apache.log4j.FileAppender`，它将日志写入`log`目录下一个名为`log.out`的文件中。
> - `layout`被定义为`%m%n`，即先打印日志信息,然后打印换行。

`Log4j.properties`文件的内容如下：
```properties /Log4jDemo/Log4jConfig/file/log4j.properties
## 定义变量,保存日志文件所在的目录
log = E:/workspacne_JDK8Tomcat8.5/Log4jDemo
## Define the root logger with appender file
log4j.rootLogger = DEBUG, FILE

## Define the file appender
log4j.appender.FILE=org.apache.log4j.FileAppender
## 设置日志文件路径
log4j.appender.FILE.File=${log}/log.out

## Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n
```
### Log4jExample.java
```java /Log4jDemo/src/demo/Log4jExample.java
package demo;

import java.io.IOException;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class Log4jExample
{
    /* Get actual class name to be printed on */
    static Logger log = Logger.getLogger(Log4jExample.class.getName());

    public static void main(String[] args) throws IOException, SQLException
    {
        log.debug("Hello this is a debug message");
        log.info("Hello this is an info message");
    }
}
```
### 运行效果
复制文件`Log4jConfig/file/log4j.properties`,粘贴到`src`目录下,然后运行`Log4jExample.java`程序,此时项目根目录下,会生成一个`log.out`文件:
<details><summary>展开/折叠</summary><pre>
E:\workspacne_JDK8Tomcat8.5\Log4jDemo
├─lib\
│ ├─commons-logging-1.2.jar
│ ├─log4j-1.2.17.jar
│ ├─log4j-api-2.13.3.jar
│ └─log4j-core-2.13.3.jar
├─<mark>log.out</mark>
├─Log4jConfig\
│ ├─file\
│ │ └─log4j.properties
│ ├─file_and_stout\
│ │ └─log4j.properties
│ ├─grammar\
│ │ └─log4j.properties
│ ├─Level\
│ │ └─log4j.properties
│ └─stdout\
│   └─log4j.properties
└─src\
  ├─demo\
  │ ├─level\
  │ │ ├─SetLevelByMethod.java
  │ │ └─SetLevleByConfig.java
  │ ├─Log4jExample.java
  │ └─method\
  │   └─LoggerMethodTest.java
  └─<mark>log4j.properties</mark>
</pre></details>

打开这个log.out文件,可以看到如下内容
```txt /Log4jDemo/log.out
Hello this is a debug message
Hello this is an info message

```
## 日志输出到控制台
### log4j.properties
```properties /Log4jDemo/Log4jConfig/stdout/log4j.properties
# Root logger option
#log4j.rootLogger=INFO, STDOUT
log4j.rootLogger=DEBUG, STDOUT

# Direct log messages to STDOUT
log4j.appender.STDOUT=org.apache.log4j.ConsoleAppender
log4j.appender.STDOUT.Target=System.out
log4j.appender.STDOUT.layout=org.apache.log4j.PatternLayout
log4j.appender.STDOUT.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
```
### 替换log4j配置文件 重新运行
复制文件`/Log4jDemo/Log4jConfig/stdout/log4j.properties`,粘贴到`src`目录下,然后运行`Log4jExample.java`.此时日志将会输出在**控制台**.
```
2020-08-03 17:34:14 DEBUG Log4jExample:14 - Hello this is a debug message
2020-08-03 17:34:14 INFO  Log4jExample:15 - Hello this is an info message

```
## 日志同时输出到文件和控制台
### log4j.properties
```properties /Log4jDemo/Log4jConfig/file_and_stout/log4j.properties
# 定义变量,保存日志文件所在的目录
log = E:/workspacne_JDK8Tomcat8.5/Log4jDemo
# Define the root logger with appender file and stdout
log4j.rootLogger = DEBUG, FILE, STDOUT

# Define the FILE appender
log4j.appender.FILE=org.apache.log4j.FileAppender
# 设置日志文件路径
log4j.appender.FILE.File=${log}/log.out
# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n

# Define the STDOUT appender
log4j.appender.STDOUT=org.apache.log4j.ConsoleAppender
log4j.appender.STDOUT.Target=System.out
# Define the layout for STDOUT appender
log4j.appender.STDOUT.layout=org.apache.log4j.PatternLayout
log4j.appender.STDOUT.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
```
复制文件`/Log4jDemo/Log4jConfig/file_and_stout/log4j.properties`,覆盖`src`目录下的`log4j.properties`,删除掉项目根目录下的`log.out`文件,然后运行`Log4jExample.java`。
这样会重新生成log.out,并写一份日志写到该文件中:
```txt /Log4jDemo/log.out
Hello this is a debug message
Hello this is an info message

```
另一份日志打印在控制台中:
```txt 控制台输出
2020-08-03 17:41:36 DEBUG Log4jExample:14 - Hello this is a debug message
2020-08-03 17:41:36 INFO  Log4jExample:15 - Hello this is an info message

```
