---
title: Java使用BOM判断一个文件是不是UTF-8文件
categories: 
  - Java
  - Java IO流
date: 2018-08-29 19:35:07
updated: 2019-11-14 11:39:28
abbrlink: 2fe8061d
---
例如test_utf8.py这个文件用的是utf-8+BOM编码的.
![](https://i.imgur.com/vtWvrjD.png)
现在打开这个文件，然后以16进制的方式查看该文件。
![](https://i.imgur.com/nLTgZnD.png)
可以看到该文件以`EF BB BF`这三个字节开头，这三个字节表示该文件是UTF-8编码的。
`EF BB BF`转成字节表示就是`-17,-69,-65`.不信来看下面的代码：
```java
public static void main(String[] args)
{
    System.out.print((byte)Integer.parseInt("EF", 16)+",");
    System.out.print((byte)Integer.parseInt("BB", 16)+",");
    System.out.print((byte)Integer.parseInt("BF", 16));
}

```
运行结果：`-17,-69,-65`
利用BOM判断一个文件是不是utf-8文件：
```java
/**
* 判断是不是utf8编码
* @param file 文件名
* @return 根据文件字节序列的头部的编码信息判断是不是utf8编码
*/
public static boolean isUTF8File(File file)
{
    InputStream in = null;
    byte[] b = new byte[3];
    try
    {
        in = new java.io.FileInputStream(file);
//      读取3个字节
        in.read(b);
    } catch (FileNotFoundException e)
    {
        e.printStackTrace();
    } catch (IOException e)
    {
        e.printStackTrace();
    } finally
    {
        if (in != null)
        {
            try
            {
                in.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
    if (b[0] == -17 && b[1] == -69 && b[2] == -65)
        return true;
    return false;
}
```
测试：
```java
public static void main(String[] args) throws IOException
{
    String path = "D:\\学习\\python\\test_utf8.py";
    File file = new File(path);
    System.out.println(file.getAbsolutePath()+"是utf-8编码的文件:"+isUTF8File(file));
}

```
运行结果：
```
D:\学习\python\test_utf8.py是utf-8编码的文件:true

```
这么做的问题是只能判断带BOM的文件，如果不带BOM那就不好判断了。例如把上面的文件从utf-8+BOM改成utf-8格式，然后保存。
![](https://i.imgur.com/Nj4BWk9.png)
再切换到16进制视图查看：
![](https://i.imgur.com/giSWXga.png)
可以看到不带BOM的utf-8格式的文件不以`EF BB BF`这三个字节开头，这样来上述的方法就不好使了。
运行结果：
```
D:\学习\python\test_utf8.py是utf-8编码的文件:false
```
可以看到我明明是utf-8的文件，但是判断的结果却是false。

>原文链接: [Java使用BOM判断一个文件是不是UTF-8文件](https://lanlan2017.github.io/blog/2fe8061d/)
