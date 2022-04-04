---
title: java获取文件大小的方法
categories: 
  - Java
  - Java IO流
  - 基础
abbrlink: aa316c45
date: 2018-07-30 20:05:28
updated: 2022-04-04 00:51:44
---
本文转自：[https://www.cnblogs.com/hellowhy/p/7238570.html](https://www.cnblogs.com/hellowhy/p/7238570.html)
# java获取文件大小的方法 #

**目前Java获取文件大小的方法有两种：**

- 1、通过file的length()方法获取；

- 2、通过流式方法获取；

通过流式方法又有两种，分别是旧的`java.io.*`中`FileInputStream`的`available()`方法和新的`java.nio.*`中的`FileChannel`

下面依次介绍这几种方法：

首先选择一个文件并查看这个文件在windows中显示的大小，为了测试准确性，我这里选取了一个大文件（超过2GB）

查看这个文件在windows中显示的大小：
![图片描述][img_2018/07/30_19:46:37]

可以看出这个文件的实际大小是`2588266496Byte`(`2527604KB`)，下面通过代码来获取文件大小，并进行比较：

## 一、通过File类的length()方法获取文件的大小 ##

1、创建一个文件：

```java
File bigFile=new File("F:\\软件\\安装包_office2016\\Office2016.iso");

```

2、获取文件大小：File.length()方法可以获取文件的大小(占用的字节数)
```java
/**
* 获取文件长度
* @param file
*/
public static void getFileSize1(File file) 
{
    if (file.exists() && file.isFile()) 
    {
      
        System.out.println("文件"+file.getName()+"的大小是："+file.length()\1024+"KB");
    }
}

```
3.运行结果：
```
文件Office2016.iso的大小是：2588266496(Byte)=2527604(KB)
```

**可见，使用length方法获取的文件大小与windows中显示的大小一致！**

## 二、通过file.io.*中的流式方法获取 ##

**使用FileInputStream.available方法获取：**

```java
    /**
     * 根据java.io.*的流获取文件大小
     * @param file
     */
    public static void getFileSize2(File file){
        FileInputStream fis  = null;
        try {
            if(file.exists() && file.isFile()){
                String fileName = file.getName();
                fis = new FileInputStream(file);
                System.out.println("文件"+fileName+"的大小是："+fis.available()+"(Byte)="+fis.available()/1024+"(KB)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(null!=fis){
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
```

3、查看结果：
```java
文件Office2016.iso的大小是：2147483647(Byte)=2097151(KB)
```
通过这种方法获取的文件大小是2147483647(Byte)，很明显，这是int类型所能表示的最大值`(2^31-1)=2147483647`，究其原因是因**为文件的大小超过了int所能表示的最大值！！！**

而上面file.length()方法计算没有问题是因为，**file.length()方法返回的是long,而available()方法返回的类型是int类型。**

## 三、通过file.nio.*中的FileChannel工具来获取文件大小： ##

**使用FileChannel获取文件大小：**

```java
  /**
     * 根据java.nio.*的流获取文件大小
     * @param file
     */
    public static void getFileSize3(File file){
        FileChannel fc = null;
        try {
            if(file.exists() && file.isFile()){
                String fileName = file.getName();
                FileInputStream fis = new FileInputStream(file);
                fc = fis.getChannel();
                System.out.println("文件"+fileName+"的大小是："+fc.size()+"\n");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(null!=fc){
                try {
                    fc.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
```
该方法运行结果。
```java
文件Office2016.iso的大小是：2588266496(Byte)=2527604KB
```
这里的size()方法的返回值类型也是long,通过这种方法获取的文件大小和第一种一样，都能获取文件实际大小。

## 四、使用小文件测试以上三种方法： ##

以上情况中文件大小超过了available()返回类型int的最大值，下面使用一个没有超过int最大值的文件测试，来验证通过这三种方法获取的大小是否和windows中显示的一致：

1、获取文件，查看其在windows中的大小：

![图片描述][img_2018/07/30_19:54:42]

可见该文件总共有`1345`个字节。

3、查看通过三种方法获取的结果：
```java
文件CodeFormat.jar的大小是：1345(Byte)=1(KB)
文件CodeFormat.jar的大小是：1345(Byte)=1(KB)
最大的int值=2147483647
文件CodeFormat.jar的大小是：1345(Byte)=1KB
```

## java获取文件大小总结 ##

1、三种方法获取小文件(小于int能表示的最大范围:2147483647(Byte)=2097151(KB))时结果一样。
2、获取大文件时，为避免文件长度大于方法返回值类型的最大值，**尽量使用File.length()或FileChannel.size()方法获取；**
最大的long值=9223372036854775807，9223372036854775807(Byte)转换为`TB`大小如下图，我想没有这么大的文件吧。使用long表示绝对是够了。
![图片描述][img_2018/07/30_20:01:38]
## 完整的代码
```java
package lan.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class GetFileLength
{
    public static void getFileSize1(File file) 
    {
        if (file.exists() && file.isFile()) 
        {
          
            System.out.println("文件"+file.getName()+"的大小是："+file.length()+"(Byte)="+file.length()/1024+"(KB)");
        }
    }
    /**
     * 根据java.io.*的流获取文件大小
     * @param file
     */
    public static void getFileSize2(File file){
        FileInputStream fis  = null;
        try {
            if(file.exists() && file.isFile()){
                String fileName = file.getName();
                fis = new FileInputStream(file);
                System.out.println("文件"+fileName+"的大小是："+fis.available()+"(Byte)="+fis.available()/1024+"(KB)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(null!=fis){
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    /**
     * 根据java.nio.*的流获取文件大小
     * @param file
     */
    public static void getFileSize3(File file){
        FileChannel fc = null;
        try {
            if(file.exists() && file.isFile()){
                String fileName = file.getName();
                FileInputStream fis = new FileInputStream(file);
                fc = fis.getChannel();
                System.out.println("文件"+fileName+"的大小是："+fc.size()+"(Byte)="+fc.size()/1024+"KB");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(null!=fc){
                try {
                    fc.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public static void main(String[] args)
    {
        File bigFile=new File("F:\\软件\\安装包_office2016\\Office2016.iso");
//        File smallFile=new File("D:\\dev\\java\\my\\tools\\CodeFormat.jar");
        getFileSize1(bigFile);
        getFileSize2(bigFile);
        System.out.println("最大的int值="+Integer.MAX_VALUE);
        getFileSize3(bigFile);
    }
}

```
