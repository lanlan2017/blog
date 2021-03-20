---
title: 9 Log4j 使用文件记录日志 FileAppender类
categories:
  - 编程
  - Java
  - Log4j教程
  - 简介
abbrlink: 6296507b
date: 2020-08-03 07:03:03
updated: 2020-08-18 12:01:55
---
<div id='my_toc'><a href="/blog/6296507b/#Log4j-使用文件记录日志-FileAppender类" class="header_1">Log4j 使用文件记录日志 FileAppender类</a>&nbsp;<br><a href="/blog/6296507b/#FileAppender配置参数" class="header_2">FileAppender配置参数</a>&nbsp;<br><a href="/blog/6296507b/#示例代码" class="header_2">示例代码</a>&nbsp;<br><a href="/blog/6296507b/#log4j-xml中如何使用变量替换" class="header_3">log4j.xml中如何使用变量替换</a>&nbsp;<br><a href="/blog/6296507b/#运行Java时给定参数" class="header_4">运行Java时给定参数</a>&nbsp;<br><a href="/blog/6296507b/#编程方式指定" class="header_4">编程方式指定</a>&nbsp;<br><a href="/blog/6296507b/#示例" class="header_4">示例</a>&nbsp;<br><a href="/blog/6296507b/#使用绝对路径不使用变量替换" class="header_4">使用绝对路径不使用变量替换</a>&nbsp;<br><a href="/blog/6296507b/#使用相对路径" class="header_4">使用相对路径</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j 使用文件记录日志 FileAppender类
使用`org.apache.log4j.FileAppender`将日志记录到文件。
## FileAppender配置参数
`FileAppender`拥有如下配置参数：

|属性|描述|
|:---|:---|
|`immediateFlush`|该标志位默认为`true`，意味着每次日志追加操作都将输出流刷新至文件。|
|`encoding`|可以使用任何编码，默认情况下使用平台相关的编码。|
|`threshold`|`appender`对象的阀值。|
|`Filename`|日志文件名。|
|`fileAppend`|该值默认为`true`，其含义是让日志追加至文件末尾。|
|`bufferedIO`|该标志位表示是否打开缓冲区写，缺省为`false`。|
|`bufferSize`|如果开启缓冲区`I/O`，该属性指示缓冲区大小，缺省为`8kb`。|

## 示例代码
以下是`FileAppender`的配置文件示例`log4j.properties`。
```properties
# 设置日志文件存放的路径
log=E:\workspacne_JDK8Tomcat8.5\Log4jDemo
# Define the root logger with appender file
log4j.rootLogger = DEBUG, FILE

# Define the file appender
log4j.appender.FILE=org.apache.log4j.FileAppender
# file name
log4j.appender.FILE.File=${log}/log.out 

# Set the flush to true
log4j.appender.FILE.ImmediateFlush=true

# Set the threshold to debug mode
log4j.appender.FILE.Threshold=debug

# Set the append to true, overwrite
log4j.appender.FILE.Append=true

# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n
```
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE log4j:configuration
    PUBLIC "-//LOG4J//DTD LOG4J//EN"
    "https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd" >
<log4j:configuration
    xmlns:log4j="http://jakarta.apache.org/log4j/">
    <appender name="STDOUT"
        class="org.apache.log4j.ConsoleAppender">
        <layout class="org.apache.log4j.PatternLayout">
            <param name="ConversionPattern" value="%5p [%t] %m%n" />
        </layout>
    </appender>
    <appender name="FILE" class="org.apache.log4j.FileAppender">
        <param name="File" value="${log}/log.out" />
        <param name="ImmediateFlush" value="true" />
        <param name="Threshold" value="debug" />
        <param name="Append" value="true" />

        <layout class="org.apache.log4j.PatternLayout">
            <param name="conversionPattern" value="%m%n" />
        </layout>
    </appender>
    <root>
        <level value="DEBUG" />
        <appender-ref ref="STDOUT"/>
        <appender-ref ref="FILE"/>
    </root>
</log4j:configuration>

```
### log4j.xml中如何使用变量替换
注意,这里的XML文件中使用了变量替换`${log}`,在使用这个log变量之前需要创建这个变量,但是在XML中好像没有创建变量的方法.
[解决方案](https://www.coder.work/article/402468):
使用log4j.xml时实现类似功能的唯一方法是在启动时设置系统属性，然后从log4j.xml中引用该属性。
#### 运行Java时给定参数
启动时，设置系统属性：
```cmd
java -Dlog=E:\workspacne_JDK8Tomcat8.5\Log4jDemo com.yourorg.yourapp.Main
```
#### 编程方式指定
或在运行时以编程方式设置（在初始化log4j之前）：
```java
System.setProperty("log", "E:\workspacne_JDK8Tomcat8.5\Log4jDemo")
```
然后您可以这样引用它：
```xml
<appender name="FILE" class="org.apache.log4j.FileAppender">
    ...
    <param name="file" value="${log}/log.out"/>
    ...
</appender>
```
#### 示例
```java /Log4jDemo/src/demo/file/appender/XMLFileAppenderTest.java
package demo.file.appender;

import java.io.IOException;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import demo.Log4jExample;

public class XMLFileAppenderTest
{

    static
    {
        System.setProperty("log", "E:/workspacne_JDK8Tomcat8.5/Log4jDemo");
    }
    /* Get actual class name to be printed on */
    static Logger log = Logger.getLogger(Log4jExample.class.getName());

    public static void main(String[] args) throws IOException, SQLException
    {
        log.debug("Hello this is a debug message");
        log.info("Hello this is an info message");
    }
}
```
删除项目目录下的log.out文件,运行上述代码后,项目目录下的会重新生成log.out日志文件
#### 使用绝对路径不使用变量替换
```xml
<appender name="FILE" class="org.apache.log4j.FileAppender">
    <!-- <param name="File" value="${log}/log.out" /> -->
    <param name="File" value="E:/workspacne_JDK8Tomcat8.5/Log4jDemo/log.out" />
    <!-- <param name="File" value="log.out" /> -->
    <param name="ImmediateFlush" value="true" />
    <param name="Threshold" value="debug" />
    <param name="Append" value="true" />

    <layout class="org.apache.log4j.PatternLayout">
        <param name="conversionPattern" value="%m%n" />
    </layout>
</appender>
```
#### 使用相对路径
```xml
<appender name="FILE" class="org.apache.log4j.FileAppender">
    <!-- <param name="File" value="${log}/log.out" /> -->
    <!-- <param name="File" value="E:/workspacne_JDK8Tomcat8.5/Log4jDemo/log.out" /> -->
    <param name="File" value="log.out" />
    <param name="ImmediateFlush" value="true" />
    <param name="Threshold" value="debug" />
    <param name="Append" value="true" />

    <layout class="org.apache.log4j.PatternLayout">
        <param name="conversionPattern" value="%m%n" />
    </layout>
</appender>
```
