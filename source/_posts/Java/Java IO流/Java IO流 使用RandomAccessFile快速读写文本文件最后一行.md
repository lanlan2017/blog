---
title: Java IO流 使用RandomAccessFile快速读写文本文件最后一行
categories: 
  - Java
  - Java IO流
date: 2018-10-30 18:36:12
updated: 2019-12-17 05:18:52
abbrlink: 4cd2c62c
---
<div id='my_toc'><a href="/blog/4cd2c62c/#返回文本文件中最后一行的起始位置" class="header_2">返回文本文件中最后一行的起始位置</a>&nbsp;<br><a href="/blog/4cd2c62c/#重载方法1-使用File参数表示的文件" class="header_3">重载方法1 使用File参数表示的文件</a>&nbsp;<br><a href="/blog/4cd2c62c/#重载方法2-使用RandomAccessFile参数表示的文件" class="header_3">重载方法2 使用RandomAccessFile参数表示的文件</a>&nbsp;<br><a href="/blog/4cd2c62c/#获取文本文件中最后一行文本" class="header_2">获取文本文件中最后一行文本</a>&nbsp;<br><a href="/blog/4cd2c62c/#在文本文件最后一行追加文本" class="header_2">在文本文件最后一行追加文本</a>&nbsp;<br><a href="/blog/4cd2c62c/#重载方法1-使用File参数表示的文件" class="header_3">重载方法1 使用File参数表示的文件</a>&nbsp;<br><a href="/blog/4cd2c62c/#重载方法2-使用RandomAccessFile参数表示的文件" class="header_3">重载方法2 使用RandomAccessFile参数表示的文件</a>&nbsp;<br><a href="/blog/4cd2c62c/#在文本文件最后一行后插入另一行文本" class="header_2">在文本文件最后一行后插入另一行文本</a>&nbsp;<br><a href="/blog/4cd2c62c/#删除文本文件最后一行" class="header_2">删除文本文件最后一行</a>&nbsp;<br><a href="/blog/4cd2c62c/#重载方法1-使用File参数表示的文件" class="header_3">重载方法1 使用File参数表示的文件</a>&nbsp;<br><a href="/blog/4cd2c62c/#重载方法2-使用RandomAccessFile参数表示的文件" class="header_3">重载方法2 使用RandomAccessFile参数表示的文件</a>&nbsp;<br><a href="/blog/4cd2c62c/#更新文本文件最后一行" class="header_2">更新文本文件最后一行</a>&nbsp;<br><a href="/blog/4cd2c62c/#整个类的代码" class="header_2">整个类的代码</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 返回文本文件中最后一行的起始位置 ##
### 重载方法1 使用File参数表示的文件 ###
```java
/**
 * 返回文本文件的最后一行的起始位置。
 * @param file 文本文件
 * @return 最后一行的下标
 */
public static long getLastLinePos(File file)
{
    long lastLinePos = 0L;
    RandomAccessFile raf;
    try
    {
        raf = new RandomAccessFile(file, "r");

        // 获取文件占用字节数
        long len = raf.length();
        if (len > 0L)
        {
            // 向前走一个字节
            long pos = len - 1;
            while (pos > 0)
            {
                pos--;
                // 移动指针
                raf.seek(pos);
                // 判断这个字节是不是回车符
                if (raf.readByte() == '\n')
                {
                    lastLinePos = pos;// 记录下位置
                    break;// 前移到会第一个回车符后结束
                    // return pos;
                }
            }
        }
    } catch (IOException e)
    {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

    return lastLinePos;
}
```
### 重载方法2 使用RandomAccessFile参数表示的文件 ###
返回最后一行的起始位置，并移动文件指针到最后一行的起始位置，这个方法适合于其他方法一起使用，以重用RandomAccessFile对象。
```java
/**
 * 返回最后一行的起始位置,并移动文件指针到最后一行的起始位置。
 * @param raf RandomAccessFile对象
 * @return 最后一行的起始位置
 * @throws IOException
 */
private static long getLastLinePos(RandomAccessFile raf) throws IOException
{
    long lastLinePos = 0L;
    // 获取文件占用字节数
    long len = raf.length();
    if (len > 0L)
    {
        // 向前走一个字节
        long pos = len - 1;
        while (pos > 0)
        {
            pos--;
            // 移动指针
            raf.seek(pos);
            // 判断这个字节是不是回车符
            if (raf.readByte() == '\n')
            {
                // lastLinePos = pos;// 记录下位置
                // break;// 前移到会第一个回车符后结束
                return pos;
            }

        }
    }
    return lastLinePos;
}
```
获取到最后一行的位置后就可以获取最后一行的文本了。如下所示：
## 获取文本文件中最后一行文本 ##
```java
/**
 * 获取文本文件最后一行中的字符串。
 * @param file
 *            目标文件
 * @param charset
 *            字符编码
 * @return 文本文件中最后一行中的字符串。
 */
public static String getLastLineStr(File file, String charset)
{
    String lastLine = null;
    RandomAccessFile raf = null;
    try
    {
        raf = new RandomAccessFile(file, "rwd");
        //获取最后一行的起始位置，并移动指针到指定位置。
        long lastLinePos = getLastLinePos(raf);
        //获取文件的大小：也就是占用的字节数
        long length = raf.length();
        byte[] bytes = new byte[(int) ((length - 1) - lastLinePos)];
        //上面的getLastLinePos(raf);方法已经移动文件指针到最后一行的起始位置了，所以这里只需要读取即可。
        raf.read(bytes);

        if (charset == null)
        {
            lastLine = (new String(bytes));
        } else
        {
            lastLine = (new String(bytes, charset));
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
    return lastLine;
}
```
## 在文本文件最后一行追加文本 ##
### 重载方法1 使用File参数表示的文件 ###
这个方法在最后一行后面追加文本，不会另起一行。
```java
/**
 * 在文本文件最后一行末尾插入文本。
 * 
 * @param file
 *            目标文件
 * @param newLastLine
 *            要插入的文本
 * @param charset
 *            字符编码名称
 */
public static void insertInLastLine(File file, String newLastLine,
        String charset)
{
    RandomAccessFile raf = null;
    try
    {
        raf = new RandomAccessFile(file, "rwd");
        // 移动指针到最后一行
        raf.seek(raf.length());
        raf.write(newLastLine.getBytes(charset));
    } catch (IOException e)
    {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally
    {
        if (raf != null)
        {
            try
            {
                raf.close();
            } catch (IOException e)
            {
            }
        }
    }
}
```
### 重载方法2 使用RandomAccessFile参数表示的文件 ###
这个方法适合于其他方法一起使用，以重用RandomAccessFile对象。
```java
/**
 * 在文本文件最后一行末尾追加文本。
 * 
 * @param newLastLine 要追加的文本
 * @param charset 字符编码名称
 * @param raf RandomAccessFile表示的文件
 * @throws IOException
 * @throws UnsupportedEncodingException
 */
private static void insertInLastLine(String newLastLine, String charset,
        RandomAccessFile raf)
        throws IOException, UnsupportedEncodingException
{
    // 移动指针到最后一行
    raf.seek(raf.length());
    raf.write(newLastLine.getBytes(charset));
}
```
## 在文本文件最后一行后插入另一行文本 ##
那么怎么在最后一行后面插入另一行文本呢，只需要在前面添加一个换行符就行了。
```java
/**
 * 在最后一行中末尾中插入文本。
 * 
 * @param file
 *            目标文件
 * @param newLastLine
 *            即将插入的文本
 * @param charset
 *            字符编码名称
 */
public static void insertAfterLastLine(File file, String newLastLine,
        String charset)
{
    newLastLine = "\n" + newLastLine;
    insertInLastLine(file, newLastLine, charset);
}
```

## 删除文本文件最后一行 ##
### 重载方法1 使用File参数表示的文件 ###
```java
/**
 * 删除本文文件最后一行。
 * @param file
 */
public static void deleteLastLine(File file)
{
    RandomAccessFile raf = null;
    try
    {
        raf = new RandomAccessFile(file, "rwd");
        // 获取最后一行的位置
        long lastLinePos = getLastLinePos(raf);
        // 删除最后一行
        raf.setLength(lastLinePos);
    } catch (IOException e)
    {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally
    {
        if (raf != null)
        {
            try
            {
                raf.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }

}
```
### 重载方法2 使用RandomAccessFile参数表示的文件 ###
这个方法适合于其他方法一起使用，以重用RandomAccessFile对象。
```java
/**
 * 删除本文文件最后一行。
 * @param raf
 * @throws IOException
 */
private static void deleteLastLine(RandomAccessFile raf) throws IOException
{
    // 获取最后一行的位置
    long lastLinePos = getLastLinePos(raf);
    // 删除最后一行
    raf.setLength(lastLinePos);
}
```
## 更新文本文件最后一行 ##
更新的思想是：先删除最后一行，然后再在文件后面追加就行了。
```java
/**
 * 更新最后一行文本。
 * 
 * @param file
 *            目标文件
 * @param newLastLine
 *            替换文本
 * @param charset
 *            字符编码名称
 */
public static void updateLastLine(File file, String newLastLine,
        String charset)
{
    RandomAccessFile raf = null;
    try
    {
        raf = new RandomAccessFile(file, "rwd");
        // 删除最后一行文本
        deleteLastLine(raf);
        // 在最后一行插入新的一行文本
        insertInLastLine(newLastLine, charset, raf);
    } catch (IOException e)
    {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally
    {
        if (raf != null)
        {
            try
            {
                raf.close();
            } catch (IOException e)
            {
            }
        }
    }
}
```
## 整个类的代码 ##
```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;

public class LastLineInFileTools
{
    /**
     * 获取文本文件最后一行中的字符串。
     * 
     * @param file
     *            目标文件
     * @param charset
     *            字符编码
     * @return 文本文件中最后一行中的字符串。
     */
    public static String getLastLineStr(File file, String charset)
    {
        String lastLine = null;
        RandomAccessFile raf = null;
        try
        {
            raf = new RandomAccessFile(file, "rwd");
            long lastLinePos = getLastLinePos(raf);
            long length = raf.length();
            byte[] bytes = new byte[(int) ((length - 1) - lastLinePos)];
            raf.read(bytes);

            if (charset == null)
            {
                // return new String(bytes);
                lastLine = (new String(bytes));
            } else
            {
                // return new String(bytes, charset);
                lastLine = (new String(bytes, charset));
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
        return lastLine;
    }
    /**
     * 在最后一行中末尾中插入文本。
     * 
     * @param file
     *            目标文件
     * @param newLastLine
     *            即将插入的文本
     * @param charset
     *            字符编码名称
     */
    public static void insertAfterLastLine(File file, String newLastLine,
            String charset)
    {
        newLastLine = "\n" + newLastLine;
        insertInLastLine(file, newLastLine, charset);
    }
    /**
     * 更新最后一行文本。
     * 
     * @param file
     *            目标文件
     * @param newLastLine
     *            替换文本
     * @param charset
     *            字符编码名称
     */
    public static void updateLastLine(File file, String newLastLine,
            String charset)
    {
        RandomAccessFile raf = null;
        try
        {
            raf = new RandomAccessFile(file, "rwd");
            // 删除最后一行文本
            deleteLastLine(raf);
            // 在最后一行插入新的一行文本
            insertInLastLine(newLastLine, charset, raf);
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally
        {
            if (raf != null)
            {
                try
                {
                    raf.close();
                } catch (IOException e)
                {
                }
            }
        }
    }
    /**
     * 在文本文件最后一行末尾追加文本。
     * 
     * @param newLastLine 要追加的文本
     * @param charset 字符编码名称
     * @param raf RandomAccessFile表示的文件
     * @throws IOException
     * @throws UnsupportedEncodingException
     */
    private static void insertInLastLine(String newLastLine, String charset,
            RandomAccessFile raf)
            throws IOException, UnsupportedEncodingException
    {
        // 移动指针到最后一行
        raf.seek(raf.length());
        raf.write(newLastLine.getBytes(charset));
    }
    /**
     * 在文本文件最后一行末尾插入文本。
     * 
     * @param file
     *            目标文件
     * @param newLastLine
     *            要插入的文本
     * @param charset
     *            字符编码名称
     */
    public static void insertInLastLine(File file, String newLastLine,
            String charset)
    {
        RandomAccessFile raf = null;
        try
        {
            raf = new RandomAccessFile(file, "rwd");
            // 移动指针到最后一行
            raf.seek(raf.length());
            raf.write(newLastLine.getBytes(charset));
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally
        {
            if (raf != null)
            {
                try
                {
                    raf.close();
                } catch (IOException e)
                {
                }
            }
        }
    }
    /**
     * 删除本文文件最后一行。
     * @param raf
     * @throws IOException
     */
    private static void deleteLastLine(RandomAccessFile raf) throws IOException
    {
        // 获取最后一行的位置
        long lastLinePos = getLastLinePos(raf);
        // 删除最后一行
        raf.setLength(lastLinePos);
    }

    /**
     * 删除本文文件最后一行。
     * @param file
     */
    public static void deleteLastLine(File file)
    {
        RandomAccessFile raf = null;
        try
        {
            raf = new RandomAccessFile(file, "rwd");
            // 获取最后一行的位置
            long lastLinePos = getLastLinePos(raf);
            // 删除最后一行
            raf.setLength(lastLinePos);
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally
        {
            if (raf != null)
            {
                try
                {
                    raf.close();
                } catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        }

    }
    /**
     * 返回最后一行的起始位置,并移动文件指针到最后一行的起始位置。
     * @param raf RandomAccessFile对象
     * @return 最后一行的起始位置
     * @throws IOException
     */
    private static long getLastLinePos(RandomAccessFile raf) throws IOException
    {
        long lastLinePos = 0L;
        // 获取文件占用字节数
        long len = raf.length();
        if (len > 0L)
        {
            // 向前走一个字节
            long pos = len - 1;
            while (pos > 0)
            {
                pos--;
                // 移动指针
                raf.seek(pos);
                // 判断这个字节是不是回车符
                if (raf.readByte() == '\n')
                {
                    // lastLinePos = pos;// 记录下位置
                    // break;// 前移到会第一个回车符后结束
                    return pos;
                }

            }
        }
        return lastLinePos;
    }
    /**
     * 返回文本文件的最后一行的起始位置。
     * @param file 文本文件
     * @return 最后一行的下标
     */
    public static long getLastLinePos(File file)
    {
        long lastLinePos = 0L;
        RandomAccessFile raf;
        try
        {
            raf = new RandomAccessFile(file, "r");

            // 获取文件占用字节数
            long len = raf.length();
            if (len > 0L)
            {
                // 向前走一个字节
                long pos = len - 1;
                while (pos > 0)
                {
                    pos--;
                    // 移动指针
                    raf.seek(pos);
                    // 判断这个字节是不是回车符
                    if (raf.readByte() == '\n')
                    {
                        lastLinePos = pos;// 记录下位置
                        break;// 前移到会第一个回车符后结束
                        // return pos;
                    }
                }
            }
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return lastLinePos;
    }
}

```

