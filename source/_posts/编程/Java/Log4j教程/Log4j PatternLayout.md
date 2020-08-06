---
title: Log4j PatternLayout
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-06 01:38:36
updated: 2020-08-06 03:34:50
abbrlink: 5c0e8258
---
<div id='my_toc'><a href="/blog/5c0e8258/#Log4j-PatternLayout" class="header_1">Log4j PatternLayout</a>&nbsp;<br><a href="/blog/5c0e8258/#模式转换字符" class="header_2">模式转换字符</a>&nbsp;<br><a href="/blog/5c0e8258/#格式修饰符" class="header_2">格式修饰符</a>&nbsp;<br><a href="/blog/5c0e8258/#PatternLayout示例" class="header_2">PatternLayout示例</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j PatternLayout
如果您希望基于某种模式生成特定格式的日志信息，可使用`org.apache.log4j.PatternLayout`格式化您的日志信息。

`PatternLayout`继承自抽象类`org.apache.log4j.Layout`，覆盖了其`format()`方法，通过提供的模式，来格式化日志信息。

`PatternLayout`是一个简单的`Layout`对象，提供了如下属性，该属性可通过配置文件更改：

|`PatternLayout`属性|描述|
|:---|:---|
|`ConversionPattern`|设置转换模式，默认为 `%r [%t] %p %c %x - %m%n`。|


## 模式转换字符
下面的表格解释了上面模式中用到的字符，以及所有定制模式时能用到的字符：


|转换字符|含义|
|:---|:---|
|`c`|使用它为输出的**日志事件分类**，比如对于分类 "a.b.c"，模式 %c{2} 会输出 "b.c" 。|
|`C`|使用它输出**发起记录日志请求的类的全名**。比如对于类 "org.apache.xyz.SomeClass"，模式 %C{1} 会输出 "SomeClass"。|
|`d`|使用它输出**记录日志的日期**，比如 `%d{HH:mm:ss,SSS}` 或 `%d{dd MMM yyyy HH:mm:ss,SSS}`。|
|`F`|在记录日志时，使用它输出文件名。|
|`l`|用它输出**生成日志的调用者的地域信息**。|
|`L`|使用它输出**发起日志请求的行号**。|
|`m`|使用它输出**和日志事件关联的，由应用提供的信息**。|
|`M`|使用它输出**发起日志请求的方法名**。|
|`n`|输出平台**相关的换行符**。|
|`p`|输出**日志事件的优先级**。|
|`r`|使用它输出**从构建布局到生成日志事件所花费的时间，以毫秒为单位**。|
|`t`|输出**生成日志事件的线程名**。|
|`x`|输出和生成日志事件线程相关的 NDC (嵌套诊断上下文)。|
|`X`|该字符后跟 MDC 键，比如 X{clientIP} 会输出保存在 MDC 中键 clientIP 对应的值。|
|`%`|百分号， `%%`会输出一个`%`。|


## 格式修饰符
缺省情况下，信息保持原样输出。但是借助格式修饰符的帮助，就可调整最小列宽、最大列宽以及对齐。

下面的表格涵盖了各种修饰符：

|格式修饰符|左对齐|最小宽度|最大宽度|注释|
|:---|:---|:---|:---|:---|
|`%20c`|否|20|无|如果列名少于 20 个字符，左边使用空格补齐。|
|`%-20c`|是|20|无|如果列名少于 20 个字符，右边使用空格补齐。|
|`%.30c`|不适用|无|30|如果列名长于 30 个字符，从开头剪除。|
|`%20.30c`|否|20|30|如果列名少于 20 个字符，左边使用空格补齐，如果列名长于 30 个字符，从开头剪除。|
|`%-20.30c`|是|20|30|如果列名少于 20 个字符，右边使用空格补齐，如果列名长于 30 个字符，从开头剪除。|

## PatternLayout示例
下面是为`PatternLayout`编写的一个简单配置：
```properties /Log4jDemo/Log4jConfig/PatternLayout/log4j.properties
# Define the root logger with appender file
#log = /usr/home/Log4j
Log4j.rootLogger = DEBUG, FILE

# Define the file appender
Log4j.appender.FILE=org.apache.Log4j.FileAppender
#Log4j.appender.FILE.File=${log}/log.out
Log4j.appender.FILE.File=log.out

# Define the layout for file appender
Log4j.appender.FILE.layout=org.apache.Log4j.PatternLayout
Log4j.appender.FILE.layout.ConversionPattern=%d{yyyy-MM-dd}-%t-%x-%-5p-%-10c:%m%n
```
下面是生成日志信息的`Java`程序：
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
        log.debug("Hello-this-is-a-debug-message");
        log.info("Hello this is an info message");
    }
}
```
编译并运行上述程序，会在项目目录下生成一个名为`log.out`的文件，该文件包含如下日志信息：
```
2020-08-06-main--DEBUG-demo.Log4jExample:Hello-this-is-a-debug-message
2020-08-06-main--INFO -demo.Log4jExample:Hello this is an info message

```
