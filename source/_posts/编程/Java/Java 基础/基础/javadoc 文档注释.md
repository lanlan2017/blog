---
title: javadoc 文档注释
categories: 
  - 编程
  - Java
  - Java 基础
  - 基础
date: 2019-01-30 21:28:29
updated: 2021-03-20 08:13:52
abbrlink: 4b9baef8
---
<div id='my_toc'><a href="/blog/4b9baef8/#文档注释写法" class="header_1">文档注释写法</a>&nbsp;<br><a href="/blog/4b9baef8/#api文档生成" class="header_1">api文档生成</a>&nbsp;<br><a href="/blog/4b9baef8/#javadoc作用命令处理范文" class="header_2">javadoc作用命令处理范文</a>&nbsp;<br><a href="/blog/4b9baef8/#提取private的内容" class="header_2">提取private的内容</a>&nbsp;<br><a href="/blog/4b9baef8/#javadoc命令格式" class="header_2">javadoc命令格式</a>&nbsp;<br><a href="/blog/4b9baef8/#实例" class="header_2">实例</a>&nbsp;<br><a href="/blog/4b9baef8/#javadoc标记" class="header_1">javadoc标记</a>&nbsp;<br><a href="/blog/4b9baef8/#javadoc标记" class="header_1">javadoc标记</a>&nbsp;<br><a href="/blog/4b9baef8/#-see的运用" class="header_2">@see的运用</a>&nbsp;<br><a href="/blog/4b9baef8/#参考链接" class="header_1">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 文档注释写法
文档注释:`/**...*/`则是为支持jdk 工具javadoc.exe而特有的注释语句。javadoc 工具能从java 源文件中读取第三种注释， 并能识别注释中用`@标识`的一些特殊变量,制作成HTML 格式的类说明文档。javadoc不但能对一个 java 源文件生成注释文档，而且能对`目录`和`包`生成`交叉链接`的 html 格式的类说明文档
@author        作者名  
@version       版本标识  
@parameter     参数名及其意义  @since         最早出现的JDK 版本  
@return        返回值  
@throws        异常类及抛出条件  
@deprecated    引起不推荐使用的警告  
@see           交叉参考     


# api文档生成
## javadoc作用命令处理范文
javadoc工具默认只处理以`public`或 `protected`修饰的
1. 类、
2. 接口、
3. 方法、
4. 成员变量、
5. 构造器，
6. 内部类`之前`的文档注释。

其他地方，如方法中,构造函数中,......的文档注释,javadoc工具不会处理。
## 提取private的内容
如果开发者确实希望 javadoc工具可以提取 private修饰的内容,则可以在使用 javadoc工具时增加 `-private`选项
## javadoc命令格式
javadoc命令的基本用法如下:
```
javadoc 选项 Java源文件|包
```
 javadoc的常用选项有如下几个。
- -d <directory>:该选项指定一个路径,用于`将生成的API文档放到指定目录下`,如果不指定则放在当前目录下
- -windowtitle <text>:该选项指定一个字符串,用于设置API文档的`浏览器窗口标题`。
- -doctite <html-code>:该选项指定一个HTML格式的文本,用于`指定概述页面的标题`。
- -header <html-code>:该选项指定一个HTML格式的文本,包含`每个页面的页眉`。

除此之外, javadoc命令还包含了大量其他选项,读者可以通过在命令行窗口执行` javadoc-help`来查看 javadoc命令的所有选项。
javadoc命令可对`源文件`、`包`生成API文档,在上面的语法格式中,`Java源文件`可以支持通配符,例如,使用`*.java`来代表当前路径下所有的Java源文件。
## 实例
**JavadocTagTest.java:**
```java
package myjavadoc.test;
/**
 * Description:
 * 这是当前类的简介
 * @author Silly blue
 * @version 1.0
 */
public class JavadocTagTest
{
        /**
         * 一个得到打招呼字符串的方法。
         * @param name 该参数指定向谁打招呼。
         * @return 返回打招呼的字符串。
         */
        public String hello(String name)
        {
                return name + "，你好！";
        }
}
```
**Test.java:**
```java
package my.test;

/**
 * Description:
 * 这是一个测试类.
 * 哈哈哈哈哈哈.
 */
public class Test
{
    /**
     * 简单测试成员变量
     */
    public int age;
    /**
     * Test类的测试构造器
     */
    public Test()
    {
    }
}


```
测试:
```java
javadoc -d C:\Users\lan\Desktop\TestJavaDoc -windowtitle 测试windowtitle -doctitle 测试doctile -header 测试header Test.java Javad JavadocTest.java
```
到路径`C:\Users\lan\Desktop\TestJavaDoc`下，可以看到有一堆html,css,js等文件：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/api_shows.png)
浏览器打开index.html,这个是我们生成的api的入口,各个选项对应的位置:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/windowtitle_header_doctitle.png)
**不指定`-windowtitle`，`-doctitle`，`-header`的效果如下:**
```cmd
javadoc -d C:\Users\lan\Desktop\TestJavaDoc Test.java JavadocTagTest.java
```
显示效果:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/no_windowtitle_header_doctitle.png)
# javadoc标记
标记的使用是有位置限制的
可以出现在类或者接口文档注释中的有@see、`@deprecated`、 `@author`、 `@version`等;

|序号|英文|读音|
|:--|:--|:--|
|1|<a href="https://fanyi.baidu.com/?#en/zh/deprecated">deprecated</a>|<img src="/images/play.png" onclick="paly_audioID20190131222419();" class="shake-little" style="border: 0px;" title="点击播放">|
|2|<a href="https://fanyi.baidu.com/?#en/zh/author">author</a>|<img src="/images/play.png" onclick="paly_audioID20190131222552();" class="shake-little" style="border: 0px;" title="点击播放">|




<audio src="http://fanyi.baidu.com/gettts?lan=en&text=author&spd=3&source=web" id="audioID20190131222552"></audio>
<script>
    function paly_audioID20190131222552() {var id = document.getElementById("audioID20190131222552");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=deprecated&spd=3&source=web" id="audioID20190131222419"></audio>
<script>
    function paly_audioID20190131222419() {var id = document.getElementById("audioID20190131222419");if (id != null) {id.play();}}
</script>

# javadoc标记
## @see的运用
see的句法有三种：

# 参考链接
[Javadoc 使用详解](https://blog.csdn.net/vbirdbest/article/details/80296136)
