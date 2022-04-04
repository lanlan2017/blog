---
title: 8 Log4j 日志格式 Layout类
categories: 
  - Java
  - Log4j教程
  - 简介
abbrlink: 6356f492
date: 2020-08-03 06:52:28
updated: 2022-04-04 00:51:44
---
# Log4j 日志格式 Layout类
`Apache Log4j`提供了多个`Layout`对象，每个根据布局的不同都可格式化日志数据。还可以创建一个`Layout`对象，以应用特有的方式格式化日志。

所有`Layout`对象从`Appender`对象那里接收一个`LoggingEvent`对象，然后从`LoggingEvent`对象那里获取信息，并使用恰当的`ObjectRenderer`对象获取该信息的字符串形式。
## Layout类型
位于继承关系顶层的是抽象类`org.apache.log4j.Layout`，这是所有`Log4j API`中`Layout`类的基类。
`Layout`类是个抽象类，在应用中我们从不直接使用该类，而是使用它的子类，如下所示：
- `DateLayout`、
- `HTMLLayout`、
- `PatternLayout`、
- `SimpleLayout`、
- `XMLLayout`。

## Layout方法
该类对于所有其他`Layout`对象的通用操作提供了框架性的实现，声明了两个抽象方法：

|Layout抽象类的抽象方法|描述|
|:---|:---|
|`public abstract boolean ignoresThrowable()`|该方法指明日志信息是否处理由日志事件传来的`java.lang.Throwable`对象，如果`Layout`对象能处理`Throwable`对象，则`Layout`对象不会忽略它，并且返回`false`。|
|`public abstract String format(LoggingEvent event)`|**各`Layout`子类实现该方法，以定义各自的格式。**|

除了这些抽象方法，Layout 类还提供了如下的具体方法：

|Layout抽象类具体方法|描述|
|:---|:---|
|`public String getContentType()`|返回布局对象使用的内容类型。|
|`public String getFooter()`|记录消息的页脚信息。|
|`public String getHeader()`|日志消息的头信息。|

**每个子类均可覆盖这些方法的实现，返回各自特有的信息。**
