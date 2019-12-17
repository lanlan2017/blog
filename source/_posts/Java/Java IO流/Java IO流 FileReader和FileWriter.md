---
title: Java IO流 FileReader和FileWriter
categories: 
  - Java
  - Java IO流
date: 2018-08-10 14:57:46
updated: 2019-12-16 02:40:02
abbrlink: f1ceb471
---
<div id='my_toc'></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
------------------------
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
