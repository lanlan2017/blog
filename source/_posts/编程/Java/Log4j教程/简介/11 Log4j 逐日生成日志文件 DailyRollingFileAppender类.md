---
title: 11 Log4j 逐日生成日志文件 DailyRollingFileAppender类
categories: 
  - 编程
  - Java
  - Log4j教程
  - 简介
date: 2020-08-03 11:20:11
updated: 2021-03-20 09:38:13
abbrlink: 7cb1400
---
# 逐日生成日志文件
您也许需要逐日生成日志文件，以此更加整洁的记录日志信息。

为了逐日生成日志文件，需要使用`org.apache.log4j.DailyRollingFileAppender`，该类继承了`FileAppender`类，继承了它的所有属性。

除了上述提到的`FileAppender`类的属性，该类多包含了一个重要属性：

|属性|描述|
|:---|:---|
|`DatePattern`|该属性表明什么时间回滚文件，以及文件的命名约定。缺省情况下，在每天午夜回滚文件。|

DatePattern使用如下规则控制回滚计划：

|`DatePattern`|描述|
|:---|:---|
|`'.'yyyy-MM`|在本月末，下月初回滚文件。|
|`'\.'yyyy-MM-dd`|在每天午夜回滚文件，这是缺省值。|
|`'\.'yyyy-MM-dd-a`|在每天中午和午夜回滚文件。|
|`'\.'yyyy-MM-dd-HH`|在每个整点回滚文件。|
|`'\.'yyyy-MM-dd-HH-mm`|每分钟回滚文件。|
|`'\.'yyyy-ww`|根据地域，在每周的第一天回滚。|

## log4j.properties
下述`Log4j.properties`示例文件产生的日志文件在每天中午和午夜回滚：
```properties /Log4jDemo/Log4jConfig/DailyRollingFileAppender/log4j.properties
# Define the root logger with appender file
log4j.rootLogger = DEBUG, FILE

# Define the file appender
log4j.appender.FILE=org.apache.log4j.DailyRollingFileAppender

# Set the name of the file
#log4j.appender.FILE.File=${log}/log.out
log4j.appender.FILE.File=log.out

# Set the immediate flush to true (default)
log4j.appender.FILE.ImmediateFlush=true

# Set the threshold to debug mode
log4j.appender.FILE.Threshold=debug

# Set the append to false, should not overwrite
log4j.appender.FILE.Append=true

# Set the DatePattern
log4j.appender.FILE.DatePattern='.' yyyy-MM-dd-a

# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n
```
如果您想使用`XML`配置文件，可以像上一节一样生成`XML`配置文件，只需添加和`DailyRollingFileAppender`相关的配置即可。
