---
title: Log4j 日志格式 Layout类
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-03 06:52:28
updated: 2020-08-06 01:06:42
abbrlink: 6356f492
---
<div id='my_toc'><a href="/blog/6356f492/#Log4j-日志格式-Layout类" class="header_1">Log4j 日志格式 Layout类</a>&nbsp;<br><a href="/blog/6356f492/#Layout类型" class="header_2">Layout类型</a>&nbsp;<br><a href="/blog/6356f492/#Layout方法" class="header_2">Layout方法</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
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
