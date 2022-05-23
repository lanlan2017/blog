---
title: Java 网络编程3---URLEncoder与URLDecoder
categories:
  - 编程
  - Java
  - 网络编程
abbrlink: e311d3b4
date: 2019-05-30 17:00:00
updated: 2022-05-13 21:22:15
---
在`Java`中如果要完成`URL`的编码和解码操作，可以使用`URLEncoder`和`URLDecoder`两个类，`URLEncoder`可以为传递的内容进行编码，而`URLDecoder`可以为传递的内容进行解码。这两个类常用的方法如下。
|序号|URLEncoder类常用方法|描述|
|-|-|-|
|1|`public static String encode(String s, String enc)`|使用指定的编码机制将字符串转换为 application/x-www-form-urlencoded 格式。|

|序号|URLDecoder类常用方法|描述|
|-|-|-|
|1|`public static String decode(String s, String enc)`|使用指定的编码机制对 application/x-www-form-urlencoded 字符串解码。|
**实例：编码和解码操作**

```java
package my.net.encoder_decoder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class Encode_Decode
{
	public static void main(String[] args) throws UnsupportedEncodingException
	{
		String urlStr = "file:///D:/dev/workspace/Net/%E4%B8%8A%E4%B8%80%E7%AF%87%E5%8D%9A%E5%AE%A2.html";
		String urlDecoder = URLDecoder.decode(urlStr, "utf-8");
		// 把解码的好的字符串在编程成utf-8编码
		String urlEncoderutf8 = URLEncoder.encode(urlDecoder, "utf-8");
		System.out.println("原字符串                :"+urlStr);
		System.out.println("解码后的字符串     :"+urlDecoder);
		System.out.println("重新编码为utf-8:"+urlEncoderutf8);
		System.out.println("再次解码                :"+URLDecoder.decode(urlEncoderutf8, "utf8"));
		System.out.println();
	}
}
```
**运行结果：**

```
原字符串       :file:///D:/dev/workspace/Net/%E4%B8%8A%E4%B8%80%E7%AF%87%E5%8D%9A%E5%AE%A2.html
解码后的字符串  :file:///D:/dev/workspace/Net/上一篇博客.html
重新编码为utf-8:file%3A%2F%2F%2FD%3A%2Fdev%2Fworkspace%2FNet%2F%E4%B8%8A%E4%B8%80%E7%AF%87%E5%8D%9A%E5%AE%A2.html
再次解码       :file:///D:/dev/workspace/Net/上一篇博客.html

```
## 中文转为Unicode字符
```java
String str = "中文";
try
{
	String encodeStr = URLEncoder.encode(str, "utf-16be");
	encodeStr = encodeStr.replaceAll("%(.{2})%(.{2})", "\\\\u$1$2");
	System.out.println(encodeStr);
} catch (UnsupportedEncodingException e)
{
	// TODO Auto-generated catch block
	e.printStackTrace();
}
```
运行结果:
```
\u4E2D\u6587
```
