---
title: Java 网络编程2---URL与URLConnection
categories:
  - 编程
  - Java
  - 网络编程
abbrlink: 8a2c8182
date: 2019-05-30 16:59:50
updated: 2022-05-13 21:24:08
---
## URL
`URL`(`Uniform Resource Locator`)统一资源定位符，可以直接使用此类找到互联网上的资源(如一个简单的网页)，`URL`类的常用方法如下表所示。
|序号|方法|描述|
|-|-|-|
|1|public URL(String spec) throws MalformedURLException|根据 String 表示形式的地址创建 URL 对象。|
|2|public URL(String protocol,String host,int port,String file) throws MalformedURLException|创建URL对象，并指定协议protocol，主机host，端口名称port，资源文件名file|
|3|public URLConnection openConnection() throws IOException|返回一个 URLConnection 对象，它表示**到** `URL 所引用的远程对象`**的连接。**|
|4|public final InputStream openStream() throws IOException|打开到此 URL 的连接并返回一个用于从该连接读入的 InputStream|
**实例：读取的上一篇博客URL地址，下载该博客的源码。**
地址：[https://blog.csdn.net/qq_21808961/article/details/80848662](https://blog.csdn.net/qq_21808961/article/details/80848662)

```
package java1.net.url;

import java.net.URL;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.Scanner;
public class URLDemo
{
	public static void main(String args[]) throws Exception
	{
		// 保存原来的标准输出流，这步很重要，不然就恢复不回来
		PrintStream out = System.out;
		// 新建打印流
		PrintStream ps = new PrintStream("上一篇博客.html");
		// 输出重定向
		System.out.println("开始下载博客...");
		System.setOut(ps); 
		URL url = new URL(
				"https://blog.csdn.net/qq_21808961/article/details/80848662");
		InputStream input = url.openStream(); // 打开输入流
		Scanner scan = new Scanner(input); // 实例化Scanner类
		scan.useDelimiter("\n"); // 设置读取分隔符
		while (scan.hasNext())
		{
			System.out.println(scan.next());
		}
		//恢复标准输出流
		System.setOut(out); 
		System.out.println("...博客下载完毕");
	}
}
```
控制台输出：

```
开始下载博客...
...博客下载完毕
```
下载的路基：当前工程路径下
![下载的路径](https://img-blog.csdn.net/2018062911041428?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
打开下载的html文件
![打开下载的文件源码](https://img-blog.csdn.net/20180629110619829?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
&emsp;&emsp;以上程序运行时，使用URL找到上一篇博客的页面资源，并使用输出重定向把页面中的内容下载下来到本地中。
在以上程序中下载下来的内容全部是页面的`HTML`代码,`HTML`(`HyperText Mark-up Language`)，超文本标记语言，是构成网页文档的语言。
## URLConnection 
`URLConnection`是封装访问远程网络资源一般方法的类，通过它可以建立与远程服务器的连接，检查远程资源的一些属性，`URLConnection`的常用方法如下表所示。
|序号|方法|描述|
|-|-|-|
|1|`public int getContentLength()`|取得内容的长度|
|2|`public String getContentType()`|取得内容的类型|
|3|`public InputStream getInputStream()`|获取连接的输入流|
&emsp;&emsp;`URLConnection`对象可以同拖`URL`类的`openConnection()`方法取得，下面通过`URLConnection`对象去的一个`URL`的基本信息。
**实例：取得URL的基本信息**

```java
package java1.net.url;

import java.net.URL;
import java.net.URLConnection;
public class URLConnectionDemo
{
	public static void main(String args[]) throws Exception
	{
		URL url = new URL("file:///D:/dev/workspace/Net/%E4%B8%8A%E4%B8%80%E7%AF%87%E5%8D%9A%E5%AE%A2.html");
		URLConnection urlCon = url.openConnection(); // 建立连接
		System.out.println("内容大小：" + urlCon.getContentLength());
		System.out.println("内容类型：" + urlCon.getContentType());
	}
}
```
**运行结果：**

```java
内容大小：57283
内容类型：text/html
```
上面连接的是上面我们下载到本地的html文件：`上一篇博客.html`。如果是使用网络上的其他路径获取的长度可能不正确(urlCon.getContentLength()返回-1)，所以为了演示方便就以本地的html文件作为例子。
可以在该`上一篇博客.html`文件上右键选择属性查看该文件的大小：
![上一篇博客.html文件大小](https://img-blog.csdn.net/20180712170900960?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
可以看到我们获取的长度是对的。
