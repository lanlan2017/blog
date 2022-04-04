---
title: JavaIO InputStreamReader和OutputStreamWriter
categories: 
  - Java
  - Java IO流
  - 基础
abbrlink: a5e554af
date: 2018-08-09 19:25:05
updated: 2022-04-04 00:51:44
---
--------读字符：-------------------
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
