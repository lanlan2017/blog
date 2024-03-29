---
title: 6 Log4j Logger类方法
categories: 
  - Java
  - Log4j教程
  - 简介
abbrlink: 295e501e
date: 2020-08-03 05:44:24
updated: 2022-04-04 00:51:44
---
# Log4j Logger类方法
## 获取Logger类实例
`Logger`类提供了很多方法用来处理日志，`Logger`类不允许初始化一个新的实例，但提供了两个静态方法用来获取`Logger`对象：

|Logger类获取Logger实例的方法|描述|
|:---|:---|
|`public static Logger getRootLogger();`|返回没有名称的根日志记录器|
|`public static Logger getLogger(String name);`|按名称返回记录器。<br>日志的名字是传入的任何字符串，通常为**类名或者包名**。例如:<br>`static Logger log = Logger.getLogger(log4jExample.class.getName());`|

## 打印日志信息的方法
一旦获取一个有名字的`logger`实例，就可以使用多个方法记录日志。`Logger`类拥有如下方法用于打印日志信息。

|方法|描述|
|:---|:---|
|`public void debug(Object message)`|打印`Level.DEBUG`级别的消息。|
|`public void error(Object message)`|打印`Level.ERROR`级别的消息。|
|`public void fatal(Object message)`|打印具有`Level.FATAL`级别的消息。|
|`public void info(Object message)`|打印`Level.INFO`级别的消息。|
|`public void warn(Object message)`|打印`Level.WARN`级别的消息。|
|`public void trace(Object message)`|打印`Level.TRACE`级别的消息|

所有级别均在`org.apache.log4j.Level` 类中定义。

## 示例程序
```java /Log4jDemo/src/demo/method/LoggerMethodTest.java
package demo.method;

import org.apache.log4j.Logger;

public class LogClass
{
    private static Logger log = Logger.getLogger(LogClass.class);

    public static void main(String[] args)
    {

        log.trace("Trace Message!");
        log.debug("Debug Message!");
        log.info("Info Message!");
        log.warn("Warn Message!");
        log.error("Error Message!");
    }

}
```
运行效果如下:
```
2020-08-03 17:55:26 DEBUG LogClass:13 - Debug Message!
2020-08-03 17:55:26 INFO  LogClass:14 - Info Message!
2020-08-03 17:55:26 WARN  LogClass:15 - Warn Message!
2020-08-03 17:55:26 ERROR LogClass:16 - Error Message!

```
可以看到`log.trace("Trace Message!");`这句代码并没有输出,这是因为当前的日志级别是`debug`，`Log4j`只会输出级别为`debug`或者小于`debug`的日志信息.`trace`的级别更高,所以不会输出
