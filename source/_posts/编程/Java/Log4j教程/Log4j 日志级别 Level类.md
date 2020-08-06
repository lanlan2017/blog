---
title: Log4j 日志级别 Level类
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-03 06:03:06
updated: 2020-08-03 11:21:24
abbrlink: 9f922eef
---
<div id='my_toc'><a href="/blog/9f922eef/#Log4j-日志级别Level类" class="header_1">Log4j 日志级别Level类</a>&nbsp;<br><a href="/blog/9f922eef/#日志级别是如何工作的" class="header_2">日志级别是如何工作的</a>&nbsp;<br><a href="/blog/9f922eef/#在程序中设置日志级别" class="header_2">在程序中设置日志级别</a>&nbsp;<br><a href="/blog/9f922eef/#示例程序" class="header_3">示例程序</a>&nbsp;<br><a href="/blog/9f922eef/#使用配置文件设置日志级别" class="header_2">使用配置文件设置日志级别</a>&nbsp;<br><a href="/blog/9f922eef/#log4j-properties" class="header_3">log4j.properties</a>&nbsp;<br><a href="/blog/9f922eef/#SetLevleByConfig-java" class="header_3">SetLevleByConfig.java</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j 日志级别Level类
`org.apache.Log4j.Level`类定义了日志级别，您可通过继承`Level`类定制自己的级别。

|级别|描述|
|:---|:---|
|`OFF`|最高级别，用于关闭日志。|
|`FATAL`|指明非常严重的错误事件，可能会导致应用终止执行。|
|`ERROR`|指明错误事件，但应用可能还能继续运行。|
|`WARN`|指明潜在的有害状况。|
|`INFO`|指明描述信息，从粗粒度上描述了应用运行过程。|
|`DEBUG`|指明细致的事件信息，对调试应用最有用。|
|`TRACE`|比`DEBUG`级别的粒度更细。|
|`ALL`|所有级别，包括定制级别。|

## 日志级别是如何工作的
在一个级别为q的`logger`对象中，一个级别为p的日志请求在`p >= q`的情况下是开启的。该规则是`Log4j`的核心，它假设级别是有序的。
对于标准级别，其顺序为：`ALL`<`TRACE`<`DEBUG`<`INFO`<`WARN`<`ERROR`<`FATAL`<`OFF`。
例如设置级别为`DEBUG`这更高的`INFO`,`WARN`,`ERROR`,`FATAL`都是开启的.
## 在程序中设置日志级别
使用`logger`对象的`setLevel(Level.级别)`方法可以设置期望的日志级别：
### 示例程序
```java /Log4jDemo/src/demo/level/SetLevelByMethod.java
package demo.level;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class SetLevelByMethod
{
    private static Logger log = Logger.getLogger(SetLevelByMethod.class);

    public static void main(String[] args)
    {
        // 使用方法设置日志级别
        log.setLevel(Level.WARN);
        log.trace("Trace Message!");
        log.debug("Debug Message!");
        log.info("Info Message!");
        log.warn("Warn Message!");
        log.error("Error Message!");
        log.fatal("Fatal Message!");
    }
}
```
运行效果
```
2020-08-03 18:32:58 WARN  SetLevelByMethod:17 - Warn Message!
2020-08-03 18:32:58 ERROR SetLevelByMethod:18 - Error Message!
2020-08-03 18:32:58 FATAL SetLevelByMethod:19 - Fatal Message!
```
可以看到,程序只输出`WARM`级别和比`WARN`更高的级别

## 使用配置文件设置日志级别
`Log4j`提供了基于配置文件设置日志级别的功能.当您需要改变调试级别时，只需要修改配置文件即可,不用再去修改代码。
### log4j.properties
下面这个例子和上面那个例子功能一样，不过不用使用`setLevel(Level.WARN)`方法，只需修改配置文件：
```properties /Log4jDemo/Log4jConfig/Level/log4j.properties
# 输出到控制台
# Root logger option
#ALL<TRACE<DEBUG<INFO< WARN< ERROR< FATAL< OFF
#log4j.rootLogger=OFF, STDOUT
#log4j.rootLogger=FATAL, STDOUT
#log4j.rootLogger=ERROR, STDOUT
#log4j.rootLogger=WARN, STDOUT
log4j.rootLogger=INFO, STDOUT
#log4j.rootLogger=DEBUG, STDOUT
#log4j.rootLogger=TRACE, STDOUT
#log4j.rootLogger=ALL, STDOUT

# Direct log messages to STDOUT
log4j.appender.STDOUT=org.apache.log4j.ConsoleAppender
log4j.appender.STDOUT.Target=System.out
log4j.appender.STDOUT.layout=org.apache.log4j.PatternLayout
log4j.appender.STDOUT.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
```
### SetLevleByConfig.java
```java /Log4jDemo/src/demo/level/SetLevleByConfig.java
package demo.level;

import org.apache.log4j.Logger;

public class SetLevleByConfig
{
    private static Logger log = Logger.getLogger(SetLevleByConfig.class);

    public static void main(String[] args)
    {

        log.trace("Trace Message!");
        log.debug("Debug Message!");
        log.info("Info Message!");
        log.warn("Warn Message!");
        log.error("Error Message!");
        log.fatal("Fatal Message!");
    }
}
```
运行结果:
```
2020-08-03 18:49:27 INFO  SetLevleByConfig:14 - Info Message!
2020-08-03 18:49:27 WARN  SetLevleByConfig:15 - Warn Message!
2020-08-03 18:49:27 ERROR SetLevleByConfig:16 - Error Message!
2020-08-03 18:49:27 FATAL SetLevleByConfig:17 - Fatal Message!
```
