---
title: Log4j HTMLLayout
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-06 01:04:20
updated: 2020-08-06 03:34:50
abbrlink: 6cc119f
---
<div id='my_toc'><a href="/blog/6cc119f/#Log4j-HTMLLayout" class="header_1">Log4j HTMLLayout</a>&nbsp;<br><a href="/blog/6cc119f/#HTMLLayout方法" class="header_2">HTMLLayout方法</a>&nbsp;<br><a href="/blog/6cc119f/#HTMLLayout示例" class="header_2">HTMLLayout示例</a>&nbsp;<br><a href="/blog/6cc119f/#Log4jExample-java" class="header_2">Log4jExample.java</a>&nbsp;<br><a href="/blog/6cc119f/#运行结果" class="header_2">运行结果</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j HTMLLayout
如果您希望以`HTML`格式输出日志文件，可使用`org.apache.log4j.HTMLLayout`格式化日志信息。

`HTMLLayout`继承自抽象类`org.apache.log4j.Layout`，覆盖了其`format()`方法来提供`HTML`格式。

它提供了如下信息以供显示：
- 从应用启动到日志产生之间经过的时间。
- 发起记录日志请求的线程名字。
- 和记录日志请求关联的级别。
- `logger`的名字和日志信息。
- 程序文件的位置信息和触发日志的行号，该信息是可选的。

## HTMLLayout方法
`HTMLLayout`是一种非常简单的`Layout`对象，它提供了如下方法：

|`HTMLLayout`方法|描述|
|:---|:---|
|`setContentType(String)`|设置`HTML`的内容类型，默认为`text/html`。|
|`setLocationInfo(String)`|设置日志事件的地域信息。|
|`setTitle(String)`|设置`HTML`文件的标题，默认为`Log4j Log Messages`。|

## HTMLLayout示例
下面是为`HTMLLayout`编写的一个简单配置文件：
```properties /Log4jDemo/Log4jConfig/HTMLLayout/log4j.properties
# Define the root logger with appender file
#log = /usr/home/log4j
#log = E:/workspacne_JDK8Tomcat8.5/log4jDemo
log4j.rootLogger = DEBUG, FILE

# Define the file appender
log4j.appender.FILE=org.apache.log4j.FileAppender
#log4j.appender.FILE.File=${log}/htmlLayout.html
log4j.appender.FILE.File=htmlLayout.html

# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.HTMLLayout
log4j.appender.FILE.layout.Title=HTML Layout Example
log4j.appender.FILE.layout.LocationInfo=true
```
## Log4jExample.java
下面的`Java`程序会生成日志信息：
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
## 运行结果
编译和运行上述程序，在项目根路径下，会生成一个名为`htmlLayout.html`的文件，该文件包含如下日志信息：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/HTMLLayout/1.png)
您可以使用浏览器打开`htmlLayout.html`文件。需要注意的是末尾缺失了`</body>`和`</html>`标签。但是并不影响浏览器解析。

将日志格式化为`HTML`的一个优势在于可将其发布成一个`Web`页面，便于远程浏览。

<!-- 
Blog/Programming/Java/Log4jTutorial/HTMLLayout/1
-->
