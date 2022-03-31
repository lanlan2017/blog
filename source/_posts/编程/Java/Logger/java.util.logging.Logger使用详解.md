---
title: java.util.logging.Logger使用详解
categories:
  - 编程
  - Java
  - Logger
abbrlink: ecd04e1e
date: 2022-03-26 17:17:02
updated: 2022-03-26 17:17:02
---
# java.util.logging.Logger使用详解
# 创建Logger对象
|方法|描述|
|:--|:--|
|`static Logger getLogger(String name)`|Find or create a logger for a named subsystem.|
|`static Logger getLogger(String name, String resourceBundleName)`|Find or create a logger for a named subsystem.|

# 日志级别
在进行信息的记录时，依信息程序的不同，会设定不同级别的信息输出。Java log比log4j的级别详细，全部定义在java.util.logging.Level里面。

各级别按降序排列如下：
- SEVERE（最高值）
- WARNING
- INFO
- CONFIG
- FINE
- FINER
- FINEST（最低值）

此外，还有一个级别OFF，可用来关闭日志记录，使用级别ALL启用所有消息的日志记录。

**logger默认的级别是INFO**，比INFO更低的日志将不显示。

可以通过操作Logger上的几个方法来得到不同级别的信息输出。如下列范例：
## 示例 不同级别的日志方法

```java G:\dev2\idea_workspace\MyJavaTools\Demo\src\logger\LoggingDemo.java
package logger;

import java.util.logging.Logger;

public class LoggingDemo {
    public static void main(String[] args) {
        Logger logger = Logger.getLogger("LoggingDemo");
        logger.severe("严重信息");
        logger.warning("警示信息");
        logger.info("一般信息");
        logger.config("设定方面的信息");
        logger.fine("细微的信息");
        logger.finer("更细微的信息");
        logger.finest("最细微的信息");
    }
}
```
运行结果：
```
三月 26, 2022 4:07:30 下午 logger.LoggingDemo main
严重: 严重信息
三月 26, 2022 4:07:30 下午 logger.LoggingDemo main
警告: 警示信息
三月 26, 2022 4:07:30 下午 logger.LoggingDemo main
信息: 一般信息
```
此示例中`config()`方法及以下的信息并没有显示出来，这是因为`Logger`的默认级别是`INFO`，比这个级别更低的信息，`Logger`并不会将信息输出。

`Logger`的默认级别是定义在执行环境的属性文件`logging.properties`中，这个文件位于`JRE`安装目录的`lib`目录下。部分内容如下：
```properties G:\java\java8\jre-8u221\lib\logging.properties
# Limit the message that are printed on the console to INFO and above.
java.util.logging.ConsoleHandler.level = INFO
java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter
```
Logger默认的输出媒介控制器(Handler)是java.util.logging.ConsolerHandler，也就是将信息输出至控制台。一个Logger可以拥有多个handler，每个handler可以有自己的日志级别，在通过Logger的级别限制后，实际上还要再经过handler的级别限制。所以在上面的范例中**如果想要看到所有的信息，则必须同时设定Logger与ConsoleHandler的级别**。下面的范例示范了如何设定：

## 示例 自定义Handler_显示所有的日志
```java G:\dev2\idea_workspace\MyJavaTools\Demo\src\logger\LoggingDemo1.java
package logger;

import java.util.logging.ConsoleHandler;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoggingDemo1 {
    public static void main(String[] args) {
        Logger logger = Logger.getLogger(LoggingDemo1.class.getName());
        //显示所有级别的信息
        logger.setLevel(Level.ALL);

        // 创建Handler
        ConsoleHandler consoleHandler = new ConsoleHandler();
        //显示所有级别的信息
        consoleHandler.setLevel(Level.ALL);
        //设定Logger的Handler为自定义
        logger.addHandler(consoleHandler);

        logger.severe("严重信息");
        logger.warning("警示信息");
        logger.info("一般信息");
        logger.config("设定方面的信息");
        logger.fine("细微的信息");
        logger.finer("更细微的信息");
        logger.finest("最细微的信息");
    }
}
```
运行结果：
```
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
严重: 严重信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
严重: 严重信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
警告: 警示信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
警告: 警示信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
信息: 一般信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
信息: 一般信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
配置: 设定方面的信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
详细: 细微的信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
较详细: 更细微的信息
三月 26, 2022 4:23:47 下午 logger.LoggingDemo1 main
非常详细: 最细微的信息
```
Level.ALL表示显示所有的信息，所以这一次的执行结果可显示所有级别的信息。
如果要关闭所有的信息，可以设定为Level.OFF。
## log方法
Logger的Severe(),warning(),info()等方法，实际上是个便捷的方法。也可以直接使用log()方法并指定级别来执行相同的作用，如：

```java G:\dev2\idea_workspace\MyJavaTools\Demo\src\logger\LoggingDemo2.java
package logger;

import java.util.logging.Level;
import java.util.logging.Logger;

public class LoggingDemo2 {
    public static void main(String[] args) {
        Logger logger = Logger.getLogger("LoggingDemo");
        logger.log(Level.SEVERE, "严重信息test");
    }
}
```
运行结果：
```
三月 26, 2022 4:27:42 下午 logger.LoggingDemo2 main
严重: 严重信息test
```
# Handler
Handler对象从Logger中获取日志信息，并将这些信息导出到其他地方。例如，它可将这些信息写入控制台或文件中，也可以将这些信息发送到网络日志服务中，或将其转发到操作系统日志中。

Logger默认的输出处理者是ConsoleHandler。ConsoleHandler的输出是使用System.err对象，而信息的默认级别是INFO，这可以在JRE安装目录下lib目录的logging.properties中看到：

```properties G:\java\java8\jre-8u221\lib\logging.properties
# Limit the message that are printed on the console to INFO and above.
java.util.logging.ConsoleHandler.level = INFO
java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter
```
## Java SE实现的5个Handler
- (1) java.util.logging.ConsoleHandler：以System.err输出日志。
- (2) java.util.logging.FileHandler：将信息输出到文件。
- (3) java.util.logging.StreamHandler：以指定的!OutputStream实例输出日志。
- (4) java.util.logging.SocketHandler：将信息通过Socket传送至远程主机。
- (5) java.util.logging.MemoryHandler：将信息暂存在内存中。

以下代码将信息输出至文件中：

## 示例 日志写到文件中
```java G:\dev2\idea_workspace\MyJavaTools\Demo\src\logger\LoggingDemo3.java
package logger;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;

public class LoggingDemo3 {
    public static void main(String[] args) {
        Logger logger = Logger.getLogger("LoggingDemo");
        try {
            FileHandler fileHandler = new FileHandler("3.txt");
            logger.addHandler(fileHandler);
            logger.info("测试信息");
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```
运行结果

控制台输出：
```
三月 26, 2022 4:37:52 下午 logger.LoggingDemo3 main
信息: 测试信息
```
日志文件3.txt：
```xml G:\dev2\idea_workspace\MyJavaTools\3.txt
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE log SYSTEM "logger.dtd">
<log>
<record>
  <date>2022-03-26T16:37:52</date>
  <millis>1648283872717</millis>
  <sequence>0</sequence>
  <logger>LoggingDemo</logger>
  <level>INFO</level>
  <class>logger.LoggingDemo3</class>
  <method>main</method>
  <thread>1</thread>
  <message>测试信息</message>
</record>
</log>
```
FileHandler默认的输出格式是XML格式。输出格式由java.util.logging.Formatter来控制.
# Formatter
Formatter为格式化LogRecords提供支持。
一般来说，每个Handler都有关联的Formatter。Formatter接受LogRecord，并将它转换为一个字符串。

默认提供了两种Formatter：
## java.util.logging.SimpleFormatter
1.java.util.logging.SimpleFormatter：标准日志格式，就是我们通常在启动一些诸如 Tomcat、 JBoss之类的服务器的时候经常能在控制台下看到的那种形式，就像这样：
```
26-Mar-2022 16:41:59.142 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Server version:        Apache
 Tomcat/8.5.35
26-Mar-2022 16:41:59.154 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Server built:          Nov 3
2018 17:39:20 UTC
26-Mar-2022 16:41:59.155 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Server number:         8.5.35
.0
26-Mar-2022 16:41:59.156 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log OS Name:               Window
s 10
26-Mar-2022 16:41:59.156 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log OS Version:            10.0
26-Mar-2022 16:41:59.157 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Architecture:          amd64
26-Mar-2022 16:41:59.158 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Java Home:             G:\jav
a\java11\jdk-11.0.4
```
## java.util.logging.XMLFormatter
2.java.util.logging.XMLFormatter：XML形式的日志格式，如果为Logger添加了一个new XMLFormatter()，那么就会以XML形式输出，不过更常用的是使用上面介绍的FileHandler输出到XML文件中。

从上一节的例子可知，FileHandler的默认格式是java.util.logging.XMLFormatter，而ConsolerHandler的默认格式是java.util.logging.SimpleFormatter。
## Handler实例的setFormatter()方法
可以使用Handler实例的setFormatter()方法来设定信息的输出格式。例如：
```java
fileHandler.setFormatter(new SimpleFormatter());
```
这句代码将fileHandler的Formatter设定为SimpleFormatter，则输出的日志文件内容就是简单的文字信息，打开文件后会发现与命令行模式下看到的信息内容相同。

# 自定义
## 自定义Handler
用户可以定制自己输出媒介控制器，继承Handler即可，通常只需要实现Handler中三个未定义的抽象方法：
- publish：主要方法，把日志记录写入你需要的媒介。
- flush：清除缓冲区并保存数据。
- close：关闭控制器。

通过重写以上三个方法可以很容易实现一个新的输出媒介控制器。


## 自定义Formatter

除了XMLFormatter与SimpleFormatter之外，也可以自定义日志的输出格式，只要继承抽象类Formatter，并重新定义其format()方法即可。format()方法会传入一个java.util.logging.LogRecord对象作为参数，可以使用它来取得一些与程序执行有关的信息。

## 自定义日志级别
Java的一个日志级别对应一个整数值，Level有9个内置的级别，分别是：

|类型|对应的整数|
|:---|:---|
|OFF|最大整数（ Integer. MAX_VALUE）|
|SEVERE|1000|
|WARNING|900|
|INFO|800|
|CONFIG|700|
|FINE|500|
|FINER|400|
|FINEST|300|
|ALL|最小整数（Integer. MIN_VALUE）|

### 示例 自定义日志级别
你也可以定义自己的日志级别，通过继承Level的方式，譬如：
```java
package logger;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 自定义日志级别
 */
public class MyLevel extends Level {
    protected MyLevel(String name, int value) {
        super(name, value);
    }

    public static void main(String[] args) {
        Logger logger = Logger.getAnonymousLogger();
        //由于默认级别是INFO,如果你设置的级别低于INFO（800），则显示不出来，
        logger.log(new MyLevel("MyLevel", 950), "自定义 lever!");
    }
}
```
运行结果：
```
三月 26, 2022 4:55:52 下午 logger.MyLevel main
MyLevel: 自定义 lever!
```
# Logger的层次关系
在使用Logger的静态getLogger()方法取得Logger实例时，给getLogger()方法的名称是有意义的。
如果给定a，实际上将从根(Root)logger继承一些特性，像日志级别（Level）以及根logger的输出媒介控制器。
如果再取得一个Logger实例，并给定名称a.b，则这次取得的Logger将继承a这个Logger上的特性。

从以下范例可以看出Logger在名称上的继承关系：

## 示例：默认使用父Logger的级别
```java
package logger;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Logger的层次关系
 */
public class LoggerHierarchyDemo {
    public static void main(String[] args) {
        Logger a = Logger.getLogger("a");
        Logger b = Logger.getLogger("a.b");
        System.out.println("root logger:" + a.getParent());
        System.out.println("a logger:"+a.getName());
        System.out.println("b Parent logger:" + b.getParent().getName());
        System.out.println("b Logger:" + b.getName() + "\n");

        a.setLevel(Level.WARNING);
        // b还没有设置级别，默认使用父Logger的级别，也就是WARNING，
        // 则info方法的输出讲不显示
        b.info("b ' info 1");

        b.setLevel(Level.INFO);
        b.info("b ' info 2");
    }
}
```
运行结果：
```
root logger:java.util.logging.LogManager$RootLogger@135fbaa4
a logger:a
b Parent logger:a
b Logger:a.b

三月 26, 2022 5:12:51 下午 logger.LoggerHierarchyDemo main
信息: b ' info 2
```

getParent()方法可以取得Logger上的上层父Logger，根Logger并没有名称，所以直接调用它的toString()以取得字符串描述。

## Logger没有设定级别时默认使用父Logger的级别

所以在上面的范例中，a设定级别为WARNING时，b调用info()方法时并不会有信息显示(因为WARNING级别比INFO高)。

# 示例
## 自定义控制台输出格式

### 自定义Formatter
```java G:\dev2\idea_workspace\MyJavaTools\Demo\src\robot\MyFormatter.java
package robot;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;

public class MyFormatter extends Formatter {
    @Override
    public String format(LogRecord record) {
        Date date = new Date(record.getMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(date) + " " + record.getMessage()+"\n";
    }
}
```
### 主类
```java G:\dev2\idea_workspace\MyJavaTools\Demo\src\logger\LoggingDemo5.java
package logger;

import robot.MyFormatter;

import java.util.logging.ConsoleHandler;
import java.util.logging.Logger;

/**
 * 自定义控制台输出
 */
public class LoggingDemo5 {
    public static void main(String[] args) {
        Logger logger = Logger.getLogger("logger.my");
        // // 不向上递归发送输出
        // logger.setUseParentHandlers(false);
        // 创建Handler
        ConsoleHandler consoleHandler = new ConsoleHandler();
        // 给Handler的设置 输出格式
        consoleHandler.setFormatter(new MyFormatter());
        // 添加一个Handler
        logger.addHandler(consoleHandler);

        logger.severe("严重信息");
        logger.warning("警示信息");
        logger.info("一般信息");
        logger.config("设定方面的信息");
        logger.fine("细微的信息");
        logger.finer("更细微的信息");
        logger.finest("最细微的信息");
    }
}
```
运行结果：
```
2022-03-26 20:44:17 严重信息
三月 26, 2022 8:44:17 下午 logger.LoggingDemo5 main
严重: 严重信息
2022-03-26 20:44:17 警示信息
三月 26, 2022 8:44:17 下午 logger.LoggingDemo5 main
警告: 警示信息
2022-03-26 20:44:17 一般信息
三月 26, 2022 8:44:17 下午 logger.LoggingDemo5 main
信息: 一般信息
```
### 不向上递归发送输出 不向上级Logger发送输出 setUseParentHandlers方法logger
默认情况下，只有级别大于等于INFO的会输出。其他的不会。也就是只会有如下三行输出：
```
2022-03-26 20:44:17 严重信息
2022-03-26 20:44:17 警示信息
2022-03-26 20:44:17 一般信息
```
但是这里却还有其他的输出。
这些输出不是logger的输出，而是logger的父Logger的输出。
如果只想保留logger的输出。可以调用   方法。
```java
// 不向上递归发送输出
logger.setUseParentHandlers(false);
```
上面的注释取消，如下所示：
```java
        Logger logger = Logger.getLogger("logger.my");
        // 不向上递归发送输出
        logger.setUseParentHandlers(false);
        // 创建Handler
        ConsoleHandler consoleHandler = new ConsoleHandler();
        // 给Handler的设置 输出格式
        consoleHandler.setFormatter(new MyFormatter());
        // 添加一个Handler
        logger.addHandler(consoleHandler);

        logger.severe("严重信息");
        logger.warning("警示信息");
        logger.info("一般信息");
        logger.config("设定方面的信息");
        logger.fine("细微的信息");
        logger.finer("更细微的信息");
        logger.finest("最细微的信息");
```
然后重新运行，运行结果如下：
```
2022-03-26 20:51:28 严重信息
2022-03-26 20:51:28 警示信息
2022-03-26 20:51:28 一般信息
```
这样就只有输出当前的logger信息，不会把输出递归发送给父Logger。

# 参考资料
https://www.cnblogs.com/xingele0917/p/4120320.html
https://docs.oracle.com/en/java/javase/11/docs/api/java.logging/java/util/logging/package-summary.html
https://blog.csdn.net/qq_38628046/article/details/115034732
https://blog.csdn.net/DU87680258/article/details/102723095
