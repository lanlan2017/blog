---
title: JavaIO流 BufferedReader和BufferedWriter
categories: 
  - 编程
  - Java
  - Java IO流
  - 基础
date: 2018-08-10 15:00:32
updated: 2021-03-20 08:29:40
abbrlink: 3f2a064c
---
<div id='my_toc'><a href="/blog/3f2a064c/#部分内容已经丢失" class="header_1">部分内容已经丢失</a>&nbsp;<br><a href="/blog/3f2a064c/#乱码问题" class="header_2">乱码问题</a>&nbsp;<br><a href="/blog/3f2a064c/#BufferedWriter" class="header_1">BufferedWriter</a>&nbsp;<br><a href="/blog/3f2a064c/#继承关系" class="header_2">继承关系</a>&nbsp;<br><a href="/blog/3f2a064c/#构造函数：" class="header_2">构造函数：</a>&nbsp;<br><a href="/blog/3f2a064c/#成员方法" class="header_2">成员方法</a>&nbsp;<br><a href="/blog/3f2a064c/#写文件实例" class="header_2">写文件实例</a>&nbsp;<br><a href="/blog/3f2a064c/#应用：复制文本文件" class="header_1">应用：复制文本文件</a>&nbsp;<br><a href="/blog/3f2a064c/#逐个字符复制文件" class="header_2">逐个字符复制文件</a>&nbsp;<br><a href="/blog/3f2a064c/#逐个字符数组复制文件" class="header_2">逐个字符数组复制文件</a>&nbsp;<br><a href="/blog/3f2a064c/#按行复制文件" class="header_2">按行复制文件</a>&nbsp;<br><a href="/blog/3f2a064c/#测试：" class="header_2">测试：</a>&nbsp;<br><a href="/blog/3f2a064c/#bug-按行复制的时候多写换行符" class="header_2">bug:按行复制的时候多写换行符</a>&nbsp;<br><a href="/blog/3f2a064c/#bug-乱码问题" class="header_2">bug:乱码问题</a>&nbsp;<br><a href="/blog/3f2a064c/#实例：gbk编码的文件复制到utf8编码的文件中：" class="header_3">实例：gbk编码的文件复制到utf8编码的文件中：</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 部分内容已经丢失
可以看到包装`FileReader`的`BufferedReader`在读取文件时候如果文件的编码和项目的编码不一样的时候，会出现乱。

## 乱码问题

使用包装`InputStreamReader`的`BufferedReader`读取文件
```
String file = "utf8.txt";
BufferedReader reader = new BufferedReader(
        new InputStreamReader(new FileInputStream(file), "utf-8"));
char[] cbuf=new char[20];
int size;
while((size=reader.read(cbuf, 0, cbuf.length))!=-1)
{
    System.out.println(new String(cbuf,0,size));
}
```
运行结果：
```
utf-8 file
这里是一句中文
```
这里要弄清楚的是BufferedReader只负责读到它的内部缓冲区中，而解码的工作是InputStreamReader完成的。

# BufferedWriter

BufferedWriter的API：
## 继承关系
```
java.lang.Object
  |----> java.io.Writer
      |----> java.io.BufferedWriter
```
## 构造函数：

|方法|描述|
|:-|:-|
|`BufferedWriter(Writer out)`|创建一个缓冲字符输出流,使用默认大小的输出缓冲区|
|`BufferedWriter(Writer out, int sz)`|创建一个缓冲字符输出流,使用给定大小的输出缓冲区|

## 成员方法

|方法|描述|
|:-|:-|
|`void write(int c)`|写入单个字符。 |
|`void write(char[] cbuf, int off, int len)`|写入字符数组的某一部分。 |
|`void write(String s, int off, int len)`|写入字符串的某一部分。|
|`void newLine()`|写入一个行分隔符。 |
|`void close()`|关闭此流，但要先刷新它。 |
|`void flush()`|刷新该流的缓冲。 |

## 写文件实例
使用上述三个写方法写文件：一个字符一个字符的复制文件
```java
public static void main(String[] args) throws IOException
{
    BufferedWriter writer=new BufferedWriter(new FileWriter("静夜思.txt"));
    char ch='床';
    //写入一个字符
    writer.write(ch);
    String next="前明月光,";
    char[] nexts=next.toCharArray();
    //写入一个字符数组
    writer.write(nexts,0,nexts.length);
    //写入换行符
    writer.newLine();//写入换行符
    String nextLine="疑是地上霜。";
    //写入一个字符串。
    writer.write(nextLine);
    //关闭流
    writer.close();
}
```
运行结果,静夜思.txt：
```
床前明月光,
疑是地上霜。
```
# 应用：复制文本文件

## 逐个字符复制文件

```java
static void copyByChar(String srcFile, String destFile) throws IOException
{
    BufferedReader reader = new BufferedReader(new FileReader(srcFile));
    BufferedWriter writer = new BufferedWriter(new FileWriter(destFile));
    int ch=0;
    //读取一个字符
    while ((ch = reader.read()) != -1)
    {
        //写入一个字符
        writer.write(ch);
    }
    reader.close();
    writer.close();
}
```

## 逐个字符数组复制文件

```java
static void copyByCharArray(String srcFile, String destFile) throws IOException
{
    BufferedReader reader = new BufferedReader(new FileReader(srcFile));
    BufferedWriter writer = new BufferedWriter(new FileWriter(destFile));
    int size=0;
    char[] cbuf=new char[20];
    //读取一个字符数组
    while ((size = reader.read(cbuf)) != -1)
    {
        //读入多少写入多少
        writer.write(cbuf,0,size);
    }
    reader.close();
    writer.close();
}
```
## 按行复制文件
```java
static void copyByLine(String srcFile,String destFile) throws IOException
{
    BufferedReader reader=new BufferedReader(new FileReader(srcFile));
    BufferedWriter writer=new BufferedWriter(new FileWriter(destFile));
    String line;
    //BufferedReader读取一行的时候返回的字符串中不包括换行符
    //如果有一行字符就返回该行字符串，没有就返回null
    while((line=reader.readLine())!=null)
    {
        writer.write(line);
        writer.newLine();//写换行符
    }
    reader.close();
    writer.close();
}
```
需要注意的是,`BufferedReader`的`readLine()`读取一行的时候返回的字符串没有换行符，所以，复制的时候写文件是我们好多写入一个换行符，使用`writer.newLine()`方法即可。

## 测试：
```
public static void main(String[] args) throws IOException
{
    String from = "gbk.txt";
    String to = "gbk_copy.txt";
    String to1 = "gbk_copy1.txt";
    String to2 = "gbk_copy2.txt";
    copyByChar(from, to);
    copyByCharArray(from, to1);
    copyByLine(from, to2);
}
```
源文件gbk.txt:
运行结果：
gbk_copy.txt
```
gbk file
这里是一句中文
```
gbk_copy1.txt
```
gbk file
这里是一句中文
```
gbk_copy2.txt
<pre><code>gbk file
这里是一句中文

</code></pre>

## bug:按行复制的时候多写换行符
细心的朋友可能发现，按行复制的时候，复制的文件会莫名其妙的在文件后面多了一个换行符。这是因为我们每次都在读到的字符串后面写一个换行符。
解决办法：在读到的字符串前面写换行符，这样出现新的问题,就是在文件开头多出了一个空行，所以加入控制语句，在第一行不写入换行符，第二行后再写。
```java
static void copyByLine(String srcFile,String destFile) throws IOException
{
    BufferedReader reader=new BufferedReader(new FileReader(srcFile));
    BufferedWriter writer=new BufferedWriter(new FileWriter(destFile));
    String line;
    //BufferedReader读取一行的时候返回的字符串中不包括换行符
    //如果有一行字符就返回该行字符串，没有就返回null
    boolean flag=false;
    while((line=reader.readLine())!=null)
    {
        if(!flag)
        {
            flag=true;
            writer.write(line);
        }
        else
        {
            writer.newLine();//写换行符
            writer.write(line);
        }
        
    }
    reader.close();
    writer.close();
}
```
这样复制的文件就不会多谢换行符了，保证复制的文件和源文件是一模一样的。

## bug:乱码问题

因为我们使用的是包装`FileReader`的`BufferedReader`，包装`FileWriter`的`BufferedWriter`。所以读字符，写字符的时候使用的是默认的字符编码读写的。所以读写文件的时候会出现乱码，可以使用包装`InputStreamReader`的`BufferedReader`,包装`OutputStreamWriter`的`BufferedWriter`来复制文件，这样就可以支持各种字符编码。
### 实例：gbk编码的文件复制到utf8编码的文件中：
```java
static void copyByLineEncoding(String srcFile, String srcEncoding, String destFile,
        String destEncoding)
{
    BufferedReader reader = null;
    BufferedWriter writer = null;
    try
    {
        reader = new BufferedReader(new InputStreamReader(
                new FileInputStream(srcFile), srcEncoding));
        writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(destFile), destEncoding));
        char[] charArray = new char[512];
        int size;
        while ((size = reader.read(charArray, 0, charArray.length)) != -1)
        {
            writer.write(charArray, 0, size);
        }

    } catch (UnsupportedEncodingException | FileNotFoundException e)
    {
        e.printStackTrace();
    } catch (IOException e)
    {
        e.printStackTrace();
    } finally
    {
        if (writer != null)
        {
            try
            {
                writer.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        if (reader != null)
        {
            try
            {
                reader.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
}
```
main方法：
```java
public static void main(String[] args) throws IOException
{
    String from = "gbk.txt";
    String to = "copyto_utf8.txt";
    copyByLineEncoding(from,"gbk",to,"utf-8");
}
```
源文件gbk.txt(gbk编码)：
```
gbk file
这里是一句中文
```
目标文件copyto_utf8.txt：
```
utf-8 file
杩欓噷鏄竴鍙ヤ腑鏂�
```
乱码是正常的，因为我们的工程目录用的gbk编码，把copyto_utf8.txt编码显示就好了：
```
utf-8 file
这里是一句中文
```
所以使用包装`InputStreamReader`的`BufferedReader`,包装`OutputStreamWriter`的`BufferedWriter`来复制文件的好处就是可以指定复制文件的时候使用的字符编码，例如上面的复制操作，从gbk编码的文件中读取，然后写入到utf8编码的文件中去。
