---
title: 16 Create the DTD file or configure an XML catalog for this DTD
categories: 
  - 编程
  - Java
  - Log4j教程
  - Debug
date: 2020-09-02 11:57:06
updated: 2020-09-03 01:18:51
abbrlink: e06a014f
---
<div id='my_toc'><a href="/blog/e06a014f/#解决eclipse-<!DOCTYPE-log4j-configuration-SYSTEM"log4j-dtd">代码报错" class="header_1">解决eclipse <!DOCTYPE log4j:configuration SYSTEM"log4j.dtd">代码报错</a>&nbsp;<br><a href="/blog/e06a014f/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/e06a014f/#解决方案1" class="header_2">解决方案1</a>&nbsp;<br><a href="/blog/e06a014f/#通过DTD-file创建log4j2-xml文件" class="header_3">通过DTD file创建log4j2.xml文件</a>&nbsp;<br><a href="/blog/e06a014f/#用log4j2-xml的DOCTYPE替换log4j-xml的DOCTYPE" class="header_3">用log4j2.xml的DOCTYPE替换log4j.xml的DOCTYPE</a>&nbsp;<br><a href="/blog/e06a014f/#解决方案2" class="header_2">解决方案2</a>&nbsp;<br><a href="/blog/e06a014f/#取出log4j-xxx-jar文件中的log4j-dtd文件" class="header_3">取出log4j-xxx.jar文件中的log4j.dtd文件</a>&nbsp;<br><a href="/blog/e06a014f/#创建Catalog-Entry" class="header_3">创建Catalog Entry</a>&nbsp;<br><a href="/blog/e06a014f/#填写Location文本框" class="header_4">填写Location文本框</a>&nbsp;<br><a href="/blog/e06a014f/#填写Key-type选择框" class="header_4">填写Key type选择框</a>&nbsp;<br><a href="/blog/e06a014f/#填写key文本框" class="header_4">填写key文本框</a>&nbsp;<br><a href="/blog/e06a014f/#在Design标签页-修改DOCTYPE" class="header_3">在Design标签页 修改DOCTYPE</a>&nbsp;<br><a href="/blog/e06a014f/#查看修改后的log4j-xml源码" class="header_3">查看修改后的log4j.xml源码</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 解决eclipse <!DOCTYPE log4j:configuration SYSTEM"log4j.dtd">代码报错
## 问题描述
我用eclipse打开书上的随书源码时,`log4j.xml`文件的`<!DOCTYPE>`这行代码有错误:
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE log4j:configuration <mark>SYSTEM</mark> <mark>"log4j.dtd"</mark>&gt;
&lt;log4j:configuration
    xmlns:log4j="http://jakarta.apache.org/log4j/"&gt;
    &lt;appender
        name="STDOUT"
        class="org.apache.log4j.ConsoleAppender"&gt;
        &lt;layout class="org.apache.log4j.PatternLayout"&gt;
            &lt;param
                name="ConversionPattern"
                value="%5p [%t] %m%n"/&gt;
        &lt;/layout&gt;
    &lt;/appender&gt;
    &lt;logger name="mapper.EmployeeMapper"&gt;
        &lt;level value="DEBUG"/&gt;
    &lt;/logger&gt;
    &lt;root&gt;
        &lt;level value="ERROR"/&gt;
        &lt;appender-ref ref="STDOUT"/&gt;
    &lt;/root&gt;
&lt;/log4j:configuration&gt;
</pre>

错误提示信息如下:
```
Cannot find DTD 'file:///E:/workspace_web2/MyDynamicSQLTest/src/log4j.dtd'.
Create the DTD file or configure an XML catalog for this DTD.
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/1.png)

## 解决方案1
创建一个`log4j2.xml`文件,然后复制里面的`!DOCTYPE`元素,替换`log4j.xml`文件中的`!DOCTYPE`元素。
### 通过DTD file创建log4j2.xml文件
在`src`目录上右键,然后选择`New,Others...`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/2.png)
`Wizards`搜索框中输入`xml`,然后选择`XML File`,接着点击`Next`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/3.png)
输入文件名`log4j2.xml`,点击`Next`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/4.png)
选择`Create XML file from a DTD file`,点击`Next`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/5.png)
选择`Select XML Catalog entry`,然后选择`-//LOG4J//DTD LOG4J//EN`，点击`Next`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/6.png)
最后点击`Finish`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/7.png)



创建好的`log4j2.xml`文件源码如下:
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE log4j:configuration PUBLIC "-//LOG4J//DTD LOG4J//EN" "https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd" &gt;
&lt;log4j:configuration&gt;&lt;/log4j:configuration&gt;
</pre>

### 用log4j2.xml的DOCTYPE替换log4j.xml的DOCTYPE
将`log4j2.xml`文件中的
```xml
<!DOCTYPE log4j:configuration PUBLIC "-//LOG4J//DTD LOG4J//EN" "https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd" >
```
这行代码复制,替换`log4j.xml`中的相同语句即可:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE log4j:configuration PUBLIC "-//LOG4J//DTD LOG4J//EN" "https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd" >
<log4j:configuration
    xmlns:log4j="http://jakarta.apache.org/log4j/">
    <appender
        name="STDOUT"
        class="org.apache.log4j.ConsoleAppender">
        <layout class="org.apache.log4j.PatternLayout">
            <param
                name="ConversionPattern"
                value="%5p [%t] %m%n"/>
        </layout>
    </appender>
    <logger name="mapper.EmployeeMapper">
        <level value="DEBUG"/>
    </logger>
    <root>
        <level value="ERROR"/>
        <appender-ref ref="STDOUT"/>
    </root>
</log4j:configuration>
```
然后删除掉无用的`log4j2.xml`

## 解决方案2
### 取出log4j-xxx.jar文件中的log4j.dtd文件
到`eclipse`安装目录下创建一个`myconfig`文件夹

用解压软件,打开`log4j`的`jar`文件,然后依次进入`org\apache\log4j\xml\`目录下,将`log4j.dtd`复制出来
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/9.png)

粘贴到上面创建的`myconfig`文件夹中.
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/8.png)



### 创建Catalog Entry
在`eclipse`中点击`Windows`,`Preferences`,`XML`,`XML Catalog`,`Add`按钮,
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/10.png)

#### 填写Location文本框
点击`Catalog Entry`,然后点击`Location`文本框下面的`File System`按钮,选择刚才保存到`myconfig`文件夹下的`log4j.dtd`文件。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/11.png)


#### 填写Key type选择框
然后在`Key type`选择框中选择`System ID`
#### 填写key文本框
然后在key文本框中填写如下URL:
```
https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/12.png)


### 在Design标签页 修改DOCTYPE
点击`log4j.xml`文件下方的`Design`标签页,然后在表格的`DOCTYPE`这一行上右键,选择`Edit DOCTYPE`:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/13.png)
- 点击`Public ID`右边的`Browse`按钮,然后选择`-//LOG4J//DTD LOG4J//EN`这个选择项
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/14.png)
- 点击`System ID`右边的`Browse`按钮,然后选择`Select XML Catalog entry`这个单选项,然后在下面的选择框选择
```
https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd
```
这个`key`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Java/Log4jTutorial/Debug/16/15.png)


<!-- 
Blog/Programming/Java/Log4jTutorial/Debug/16/15
-->
### 查看修改后的log4j.xml源码
点击文件下方的Source查看修改后的效果
修改后的log4j.xml文件如下所示
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE log4j:configuration <mark>PUBLIC</mark> <mark>"-//LOG4J//DTD LOG4J//EN"</mark> <mark>"https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd"</mark>&gt;
&lt;log4j:configuration
    xmlns:log4j="http://jakarta.apache.org/log4j/"&gt;
    &lt;appender name="STDOUT"
        class="org.apache.log4j.ConsoleAppender"&gt;
        &lt;layout class="org.apache.log4j.PatternLayout"&gt;
            &lt;param name="ConversionPattern" value="%5p [%t] %m%n" /&gt;
        &lt;/layout&gt;
    &lt;/appender&gt;
    &lt;logger name="mapper.EmployeeMapper"&gt;
        &lt;level value="DEBUG" /&gt;
    &lt;/logger&gt;
    &lt;root&gt;
        &lt;level value="ERROR" /&gt;
        &lt;appender-ref ref="STDOUT" /&gt;
    &lt;/root&gt;
&lt;/log4j:configuration&gt;
</pre>
