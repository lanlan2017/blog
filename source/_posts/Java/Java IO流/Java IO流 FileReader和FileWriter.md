---
title: Java IO流 FileReader和FileWriter
categories: 
  - Java
  - Java IO流
date: 2018-08-10 14:57:46
updated: 2019-10-30 13:53:55
abbrlink: f1ceb471
---
- [FileReader类](/blog/html/f1ceb471/#FileReader类)
    - [继承关系](/blog/html/f1ceb471/#继承关系)
    - [构造方法：](/blog/html/f1ceb471/#构造方法：)
    - [读操作方法](/blog/html/f1ceb471/#读操作方法)
    - [FileReader和InputStreamReader的区别](/blog/html/f1ceb471/#FileReader和InputStreamReader的区别)
    - [读文件实例](/blog/html/f1ceb471/#读文件实例)
        - [逐个字符读取](/blog/html/f1ceb471/#逐个字符读取)
        - [按数组读取](/blog/html/f1ceb471/#按数组读取)
        - [main方法中调用](/blog/html/f1ceb471/#main方法中调用)
- [FileWriter类](/blog/html/f1ceb471/#FileWriter类)
    - [继承关系](/blog/html/f1ceb471/#继承关系)
    - [构造方法：](/blog/html/f1ceb471/#构造方法：)
    - [读操作方法](/blog/html/f1ceb471/#读操作方法)
    - [FileWriter类和OutputStreamWriter类的区别](/blog/html/f1ceb471/#FileWriter类和OutputStreamWriter类的区别)
- [读写实例:复制文件](/blog/html/f1ceb471/#读写实例-复制文件)
    - [使用FileReader和FileWriter复制文件](/blog/html/f1ceb471/#使用FileReader和FileWriter复制文件)
    - [编码问题](/blog/html/f1ceb471/#编码问题)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# FileReader类 #

FileReader类能按字符读取流中数据
## 继承关系 ##

```
Object--->Reader--->InputSteamReader--->FileReader
```
## 构造方法： ##
|方法|描述|
|:-|:-|
|`FileReader(File file)`|使用`File`对象创建一个新 `FileReader`。 |
|`FileReader(FileDescriptor fd)`|使用`FileDescriptor`对象创建一个新 `FileReader`。 |
|`FileReader(String fileName)`|使用文件名创建一个新 `FileReader`。 |

## 读操作方法 ##

`FileReader`操作文件的方法全部都是从它的父类`InputStreamReader`继承的来的。

从`InputStreamReader`类继承的方法：

|方法|描述|
|:-|:-|
|`boolean ready()`|判断此流是否已经准备好用于读取。 |
|`int read()`|读取单个字符。 |
|`int read(char[] cbuf, int offset, int length)`|将字符读入数组中的某一部分。 |
|`String getEncoding()`|返回此流使用的字符编码的名称。 |
|`void close()`|关闭该流并释放与之关联的所有资源。 |

## FileReader和InputStreamReader的区别 ##
参考：[https://www.jb51.net/article/76773.htm](https://www.jb51.net/article/76773.htm)
`FileReader`与它的父类`InputStreamReader`的主要区别在于`构造函数`。

`InputStreamReader`的构造函数：

|方法|描述|
|:-|:-|
|`InputStreamReader(InputStream in)`|创建一个使用默认字符集的 InputStreamReader。 |
|`InputStreamReader(InputStream in, Charset cs)`|创建使用给定字符集的 InputStreamReader。 |
|`InputStreamReader(InputStream in, CharsetDecoder dec)`|创建使用给定字符集解码器的 InputStreamReader。 |
|`InputStreamReader(InputStream in, String charsetName)`|创建使用指定字符集的 InputStreamReader。 |

从`InputStreamReader`的构造函数中看到，第一个参数统一为`InputStream`，第二个参数可以是`编码方式`或`解码器`，所以，**当要指定编码方式时，必须使用`InputStreamReader`类；**

而`FileReader`构造函数的参数是`File`,`String`,`FileDescriptor`类型的,不是`InputStream`，在读操作的使用FileReader会使用默认的编码进行读取。所以，**在使用默认编码的情况下，当要根据`File`对象或者`String 文件名`来读取一个文件时，用`FileReader`；**
## 读文件实例 ##
### 逐个字符读取 ###
```
/**   
 * 打印文件中的内容.
 * @param fileName  文件路径
 */  
public static void readByChar(String fileName)
{
	FileReader reader=null;
	try
	{
		reader = new FileReader(fileName);
		int ch;
		while((ch=reader.read())!=-1)
		{
			System.out.print((char)ch);
		}
	} catch (FileNotFoundException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		if(reader!=null)
			try
			{
				reader.close();
			} catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
```
### 按数组读取 ###
```java
/**   
 * @param fileName  
 */  
public static void readByCharArray(String fileName)
{
	FileReader reader=null;
	try
	{
		reader=new FileReader(fileName);
		int size;
		char[] cbuf=new char[128];
		while((size=reader.read(cbuf, 0, cbuf.length))!=-1)
		{
			System.out.print(new String(cbuf,0,size));
		}
	} catch (FileNotFoundException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		if(reader!=null)
			try
			{
				reader.close();
			} catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
```
### main方法中调用 ###
```java
public static void main(String[] args)
{
	String fileName="gbk.txt";
	readByChar(fileName);
	System.out.println("\n------------------------------");
	readByCharArray(fileName);
}
```
测试文件：
```
gbk file
这里是一句中文
```
运行结果：
```
gbk file
这里是一句中文
------------------------------
gbk file
这里是一句中文
```
# FileWriter类 #

`FileWriter`类可以把字符直接写入流中,`FileWriter`继承与`OutputStreamWriter`,它的所有方法也都继承于`OutputStreamWriter`。
## 继承关系 ##

```
java.lang.Object
  |----> java.io.Writer
      |----> java.io.OutputStreamWriter
          |----> java.io.FileWriter

```

## 构造方法： ##

|方法|描述|
|:-|:-|
|`FileWriter(File file)`|根据给定的 File 对象构造一个 FileWriter 对象。 |
|`FileWriter(File file, boolean append)`|根据给定的 File 对象构造一个 FileWriter 对象。是否追加写入|
|`FileWriter(FileDescriptor fd)`|构造与某个文件描述符相关联的 FileWriter 对象。 |
|`FileWriter(String fileName)`|根据给定的文件名构造一个 FileWriter 对象。 |
|`FileWriter(String fileName, boolean append)`|根据给定的文件名以及指示是否追加加写入数据的 boolean 值来构造 FileWriter 对象。 |

## 读操作方法 ##
从`OutputStreamWriter`继承的方法：

|方法|描述|
|:-|:-|
|`void write(int c)`|写入单个字符。 |
|`void write(char[] cbuf, int off, int len)`|写入字符数组的某一部分。 |
|`void write(String str, int off, int len)`|写入字符串的某一部分。|
|`String getEncoding()`|返回此流使用的字符编码的名称。 |
|`void flush()`|刷新该流的缓冲。 |
|`void close()`|关闭此流，但要先刷新它。 |

## FileWriter类和OutputStreamWriter类的区别 ##
还是和上面的一样，区别主要在构造方法上。
OutputStream类的构造方法：

|方法|描述|
|:-|:-|
|`OutputStreamWriter(OutputStream out)`|创建使用默认字符编码的 OutputStreamWriter。 |
|`OutputStreamWriter(OutputStream out, Charset cs)`|创建使用给定字符集的 OutputStreamWriter。 |
|`OutputStreamWriter(OutputStream out, CharsetEncoder enc)`|创建使用给定字符集编码器的 OutputStreamWriter。 |
|`OutputStreamWriter(OutputStream out, String charsetName)`|创建使用指定字符集的 OutputStreamWriter。 |
从OutputStreamWriter的构造方法中可看出，第一个参数为OutputStream，第二个参数可以是字符编码或者编码器。所以**写操作时`需要指定字符编码`的时候必须使用`OutputStreamWriter`**

而 `FileWriter`的构造方法中第一个参数为`File`,`String`,`FileDescriptor`对象，第二个参数表示可以是否追加写入。FileWriter会使用默认的编码来进行写操作。所以**使用`File`类或`String`文件名来进行写操作是使用`FileWriter`,`要求追加写入文件时`也要使用`FileWriter`。**

# 读写实例:复制文件 #

## 使用FileReader和FileWriter复制文件 ##

```java
/**   
 * 从名字为from的源文件复制到名字为to的目的文件中。
 * @param from 源文件
 * @param to  目的文件
 */  
public static void copyByFileReader_Writer(String from, String to)
{
	FileReader reader = null;
	FileWriter writer = null;
	try
	{
		reader = new FileReader(from);
		writer = new FileWriter(to);
		char[] cbuf = new char[128];
		int size = 0;
		while ((size = reader.read(cbuf, 0, cbuf.length)) != -1)
		{
			writer.write(cbuf, 0, size);
		}
	} catch (FileNotFoundException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally
	{
		if (reader != null)
			try
			{
				reader.close();
			} catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (writer != null)
			try
			{
				writer.close();
			} catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
```
main方法中调用：
```java
public static void main(String[] args)
{
	String from = "gbk.txt";
	String to = "gbk_copy.txt";
	copyByFileReader_Writer(from, to);
}
```
源文件`gbk.txt`:
```
gbk file
这里是一句中文
```
复制要的目的文件`gbk_copy.txt`：
```
gbk file
这里是一句中文
```
## 编码问题 ##
使用FileReader和FileWriter使用默认的编码来读文件，写文件。这样容易出现问题。现在项目的编码是gbk的，但是此时用来复制utf-8编码的文件就会出现问题。
源文件utf8.txt(utf-8编码)：
```
utf-8 file
这里是一句中文
```
main方法：
```java
public static void main(String[] args)
{
	String from = "utf8.txt";
	String to = "utf8_copy.txt";
	copyByFileReader_Writer(from, to);
}
```
运行结果，复制好的`utf8_copy.txt`中的内容:
```
utf-8 file
杩欓噷鏄竴鍙ヤ腑鏂�
```
出现这样的乱码是因为，我们现在是以默认的编码(gbk)打开的，现在改成以utf-8编码打开看看：
```
utf-8 file
这里是一句中�?
```
可以看到虽然已经以`utf-8`编码打开了，但是还是显示乱码。

**所以遇到需要处理字符编码的时候要使用`InputStreamReader`和`OutputStreamWriter`来操作。**

>原文链接: [Java IO流 FileReader和FileWriter](https://lanlan2017.github.io/blog/f1ceb471/)
