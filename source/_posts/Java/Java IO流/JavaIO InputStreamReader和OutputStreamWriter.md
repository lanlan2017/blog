---
title: JavaIO InputStreamReader和OutputStreamWriter
categories: 
  - Java
  - Java IO流
date: 2018-08-09 19:25:05
updated: 2019-11-05 10:32:10
abbrlink: a5e554af
---
- [前言](/blog/a5e554af/#前言)
    - [InputSteamReader 的方法：](/blog/a5e554af/#InputSteamReader-的方法：)
        - [构造方法](/blog/a5e554af/#构造方法)
        - [其他方法](/blog/a5e554af/#其他方法)
    - [实例](/blog/a5e554af/#实例)
        - [使用read()方法读取文件](/blog/a5e554af/#使用read-方法读取文件)
        - [读字符数组方法](/blog/a5e554af/#读字符数组方法)
- [OutputStreamWriter 类](/blog/a5e554af/#OutputStreamWriter-类)
    - [构造方法](/blog/a5e554af/#构造方法)
    - [其他方法：](/blog/a5e554af/#其他方法：)
    - [对比这两个类](/blog/a5e554af/#对比这两个类)
    - [实例：使用上面三种方法写文件](/blog/a5e554af/#实例：使用上面三种方法写文件)
- [应用：复制字符文件](/blog/a5e554af/#应用：复制字符文件)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 前言 #
`InputStreamReader`将一个`InputStream`转换成`Reader`；`OutputStreamWriter`将一个`OutputStream`转换成`Writer`。

`InputStreamReader`(`Reader` 的子类）和 `OutputStreamWriter`(`Writer` 的子类）是用于处理字符流的最基本的类，用来在字节流和字符流之间的中介。

`InputStream`  此抽象类是表示字节输入流的所有类的超类

`InputStreamReader`能将字节流转换为字符流,是字节流通向字符流的桥梁：它读取字节并将其解码为使用指定的字符集的字符。

`InputStreamReader`封裝了`InputStream`在里头, 它能以较高级的方式,一次读取一个字符

## InputSteamReader 的方法： ##
### 构造方法 ###

|方法|描述|
|:-|:-|
|`InputStreamReader(InputStream in)`|创建一个使用默认字符集的 InputStreamReader。 |
|`InputStreamReader(InputStream in, Charset cs)`|创建使用给定字符集的 InputStreamReader。 |
|`InputStreamReader(InputStream in, CharsetDecoder dec)`|创建使用给定字符集解码器的 InputStreamReader。 |
|`InputStreamReader(InputStream in, String charsetName)`|创建使用指定字符集的 InputStreamReader。|

### 其他方法 ###

|方法|描述|
|:-|:-|
|`int read()`|读取单个字符。 |
|`int read(char[] cbuf, int offset, int length)`|将字符读入字符数组中的某一部分。|
|`boolean ready()`|判断此流是否已经准备好用于读取。 |
|`String getEncoding()`|返回此流使用的字符编码的名称。 |
|`void close()`|关闭该流并释放与之关联的所有资源。|

## 实例 ##

### 使用read()方法读取文件 ###

这个方法每次读取一个字符,并返回读取到的字符(int表示)，如果读取完毕就返回-1.因为返回的是int类型，我们打印字符的时候，要强制类型转换为char类型。
#### 实例：按字符读取文件 ####
```java
public static void main(String[] args) throws IOException
{
    InputStreamReader inReader = new InputStreamReader(
    	new FileInputStream("utf8.txt"), "utf-8");
    //先判断能不能读取
    if (!inReader.ready())
    {
        System.out.println("无法读取此文件！");
        return;
    }
    int read = 0;
    while ((read = inReader.read()) != -1)
    {
        System.out.print((char) read);
    }
}
```
测试文件`utf8.txt`:
```
utf-8 file
这里是一句中文
```
运行结果：
```
utf-8 file
这里是一句中文
```
这里以字节的方式从源文件`utf8.txt`中读取一个个字节。`InputStreamReader`的`read()`方法根据给定的编码将这些读取到的字节解码成一个个的字符返回,不过因为是`int`类型表示的字符，在打印的时候我们需要强制类型转换外`char`类型

###  读字符数组方法  ###
`int read(char[] cbuf, int offset, int length)`这个方法可以把一批字符读取到字符数组中，每次读`length`个字符放到数组`cbuf`中，放的时候从字符数组的`offset`下标开始放。返回读取到的字节数，如果读取完毕后就返回`-1`表示读取结束。
#### 实例：按字符数组读取文件 ####
```java
InputStreamReader inReader = new InputStreamReader(
		new FileInputStream("utf8.txt"), "utf-8");
//先判断能不能读取
if (!inReader.ready())
{
	System.out.println("无法读取此文件！");
	return;
}
int size = 0;
char[] cbuf = new char[10];
// 每次读取一个数组
while ((size = inReader.read(cbuf, 0, cbuf.length)) != -1)
{
	// 错误的写法
	System.out.print(new String(cbuf));
	// 注意读到多少个字符就转换多少个字符,不要转换整个字符
	// System.out.print(new String(cbuf, 0, size));
}
```
这里要注意写法，因为有的时候并不能读慢整个字符数组cbuf，所以我们输出的时候，读取到多少个字符就输出多少个，`System.out.print(new String(cbuf, 0, size));`，而不是输出整个数组 `System.out.print(new String(cbuf));`
**测试文件utf8.txt：**
```
utf-8 file
这里是一句中文
```
运行结果：
```
utf-8 file
这里是一句中文
```
如果使用的是`System.out.print(new String(cbuf));`进行输出，结果如下。
```
utf-8 file
这里是一句中文e
```
可以看到平白无故多输出了一个字符`e`，还是一句话，**读到多少输出多少。**

# OutputStreamWriter 类#

`OutputStreamWriter`能将字符流转换为字节流,是字符流通向字节流的桥梁。

它使用的字符集可以指定，否则将使用平台默认的字符，`wirte()`也就是把代有编码的一个字符，转换成字节序列写流中。

OutputStreamWriter的API：

## 构造方法 ##

|方法|描述|
|:-|:-|
|`OutputStreamWriter(OutputStream out)`|创建使用默认字符编码的 OutputStreamWriter对象。 |
|`OutputStreamWriter(OutputStream out, Charset cs)`|创建使用给定字符集的 OutputStreamWriter对象。 |
|`OutputStreamWriter(OutputStream out, CharsetEncoder enc)`|创建使用给定字符集编码器的 OutputStreamWriter对象。 |
|`OutputStreamWriter(OutputStream out, String charsetName)`|创建使用指定字符集的 OutputStreamWriter对象。 |

## 其他方法： ##

|方法|描述|
|:-|:-|
|`void write(int c)`|写入单个字符。 |
|`void write(char[] cbuf, int off, int len)`|写入字符数组的某一部分。 |
|`void write(String str, int off, int len)`|写入字符串的某一部分。|
|`void close()`|关闭此流，但要先刷新它。 |
|`void flush()`|刷新该流的缓冲。 |
|`String getEncoding()`|返回此流使用的字符编码的名称。 |

## 对比这两个类 ## 

可看到`OutputStreamWriter`和`InputStreamReader`这两个类中的方法并不是对称的。

两个类都有的方法：

- `close()` 关闭流
- `getEncoding()`返回使用的字符编码

对称的读写方法： 

- `int read()/void write(int c)` 读/写一个字节
- `int read(char[] cbuf,int off,int len)/void write(char[] cbuf,int off,int len)` 读/写一个数组

`InputStreamReader`独有的方法：

- `boolean ready()` ,判断此流是否已经准备好用于读取。

`OutputStreamWriter`独有的方法：

- `void write(String str`,`int off`,`int len)`, 从字符串`str`中的`off`位置开始写`len`个字符。
- `void flush()`,刷新该流的缓冲


## 实例：使用上面三种方法写文件 ##

```
public static void writeByOutputStreamWriter(String fileName)
		throws FileNotFoundException, IOException
{
	OutputStreamWriter out = new OutputStreamWriter(
			new FileOutputStream(fileName));
	char c = 'I';
	// 写入单个字符
	out.write(c);
	String str = "am groot\n";
	// 字符串转换为字符数组
	char[] cbuf = str.toCharArray();
	// 写入字符数组
	out.write(cbuf, 0, cbuf.length);
	String str2 = "I am groot!";
	// 写入整个字符串
	out.write(str2, 0, str2.length());// 写入字符串
	out.close();
}
```
运用上面的InputStreamReader的知识,写两个方法来读取写入的内容
按字符读取：
```
public static void readByInputStreamReader(String fileName)
		throws FileNotFoundException, IOException
{
	InputStreamReader in = new InputStreamReader(
			new FileInputStream(fileName));
	int ch;
	while ((ch = in.read()) != -1)
	{
		System.out.print((char) ch);
	}
	in.close();
}
```
按字符数组读取：
```
public static void readByInputStreamReaderCharArr(String fileName)
			throws FileNotFoundException, IOException
	{
		InputStreamReader in = new InputStreamReader(
				new FileInputStream(fileName));
		int size;
		char[] array = new char[10];
		while ((size = in.read(array, 0, array.length)) != -1)
		{
			System.out.print(new String(array, 0, size));
		}
		in.close();
	}
```
main方法：
```
public static void main(String[] args) throws IOException
{
	String fileName = "test.txt";
	System.out.println("写文件结束...");
	writeByOutputStreamWriter(fileName);
	System.out.println("写文件结束...");
	// System.out.println(c+new String(cbuf)+str2);
	System.out.println("--------------读字符：-------------------");
	// readByInputStreamReader(fileName);
	readByInputStreamReaderCharArr(fileName);
}
```
运行结果：
```
写文件结束...
写文件结束...
--------------读字符：-------------------
I am groot
I am groot!
```
`test.txt`文件中的内容：
```
I am groot
I am groot!
```
需要注意的是，写文件的时候`test.txt`文件可以不存在，OutputStreamWriter会自动创建这文件，然后写入该文件中。但前提是可以找到`test.txt`这个文件的父路径。如果父路径不存在，会抛出异常：`FileNotFoundException`。

例如把上面main中的代码改为：
```
String fileName = "\\new1\\test222.txt";
System.out.println("写文件结束...");
writeByOutputStreamWriter(fileName);
System.out.println("写文件结束...");
```
因为当前工作目录下没有`new1`这个文件夹,所以无法在`new1`目录下创建`test222.txt`这个文件。
运行部分结果入下：
```
Exception in thread "main" java.io.FileNotFoundException: \new1\test222.txt (系统找不到指定的路径。)
```
# 应用：复制字符文件#

我们可以从一个文件中读取字符，然后再把这些字符写入到另一个文件中，然后再读，再写，一直循环知道读取结束。从而实现文件的复制操作。

但是只能复制存放字符的文件(.txt,.c,.java等)，不能复制二进制文件(如音频，视屏，音乐)

关键代码：
```
while((size=in.read(cbuf, 0, cbuf.length))!=-1)
{
	//然后把数字中读取到的字符写入到输出流中，注意读多少写多好，不要整个数组都写进去
	out.write(cbuf, 0, size);
}
```
完整的代码：
```
public static void copy(String from, String to)
{
	InputStreamReader in=null;
	OutputStreamWriter out=null;
	try
	{
		in = new InputStreamReader(new FileInputStream(from),"gbk");
		//如果可以读了
		if(in.ready())
		{
			out=new OutputStreamWriter(new FileOutputStream(to), "gbk");
			//缓存字符数组
			char[] cbuf=new char[20];
			int size;
			//从输入流中读取一个数组的字符到数组中
			while((size=in.read(cbuf, 0, cbuf.length))!=-1)
			{
				//然后把数字中读取到的字符写入到输出流中，注意读多少写多好，不要整个数组都写进去
				out.write(cbuf, 0, size);
			}
		}
	} catch (UnsupportedEncodingException | FileNotFoundException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally 
	{
		if(in!=null)
		{
			try{in.close();} 
			catch (IOException e)
			{e.printStackTrace();}
		}
		if(out!=null)
		{
			try{out.close();} 
			catch (IOException e)
			{e.printStackTrace();}
		}
	}
}
```
源文件：
```
I am groot
I am groot!
```
测试：
```
String from = "test.txt";
String to = "copy.txt";
copy(from, to);
```
运行后，当前工程目录下创建了一个`copy.txt`文件，文件中的内容如下：
```
I am groot
I am groot!
```

>原文链接: [JavaIO InputStreamReader和OutputStreamWriter](https://lanlan2017.github.io/blog/a5e554af/)
