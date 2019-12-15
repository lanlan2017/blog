---
title: Java快速读取一个很大的文本文件的最后一行
categories: 
  - Java
  - Java IO流
date: 2018-10-29 23:41:16
updated: 2019-12-09 20:34:58
abbrlink: 487a7f53
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/487a7f53/#返回文本文件最后一行java代码">返回文本文件最后一行java代码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/487a7f53/#读取本文文件最后一行，并记下最后一行的位置">读取本文文件最后一行，并记下最后一行的位置</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 返回文本文件最后一行java代码 ##
```java
public static String readLastLine(File file, String charset)
        throws IOException
{
    if (!file.exists() || file.isDirectory() || !file.canRead())
    {
        return null;
    }
    RandomAccessFile raf = null;
    try
    {
        raf = new RandomAccessFile(file, "r");
        //获取文件占用字节数
        long len = raf.length();
        if (len == 0L)
        {
            return "";
        } else
        {
            //向前走一个字节
            long pos = len - 1;
            while (pos > 0)
            {
                pos--;
                //移动指针
                raf.seek(pos);
                //判断这个字节是不是回车符
                if (raf.readByte() == '\n')
                {
                    break;//前移到会第一个回车符后结束
                }
            }
            if (pos == 0)
            {
                raf.seek(0);
            }
            
            //记录下当前位置
            
            byte[] bytes = new byte[(int) (len - pos)];
            //读取从回车符位置到文件结尾的所有字节
            raf.read(bytes);
            if (charset == null)
            {
                return new String(bytes);
            } else
            {
                return new String(bytes, charset);
            }
        }
    } catch (FileNotFoundException e)
    {
    } finally
    {
        if (raf != null)
        {
            try
            {
                raf.close();
            } catch (Exception e2)
            {
            }
        }
    }
    return null;
}
```
参考：[https://blog.csdn.net/q_linchao/article/details/79630906](https://blog.csdn.net/q_linchao/article/details/79630906)
## 读取本文文件最后一行，并记下最后一行的位置 ##
如果文本文件最后一行也有特殊的意义，需要动态的更新最后一行，单单读取最后一行是远远不够的，所以我在上面代码的基础上进一步封装成一个工具类，**把文本文件的最后一行，以及最后一行的位置。保存在内部成员属性中**，源代码如下：
```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class LastLineInFile
{
    private long lastlinestart;
    private String lastLine;
    public LastLineInFile()
    {
        this.lastlinestart=0;
        this.lastLine=null;
    }
    public long getLastlinestart()
    {
        return lastlinestart;
    }
    public String getLastLine()
    {
        return lastLine;
    }
    private void setLastlinestart(long pos)
    {
        this.lastlinestart = pos;
    }
    private void setLastLine(String lastLine)
    {
        this.lastLine = lastLine;
    }
    public void readLastLine(File file, String charset)
            throws IOException
    {
        RandomAccessFile raf = null;
        try
        {
            raf = new RandomAccessFile(file, "r");
            //获取文件占用字节数
            long len = raf.length();
            if (len == 0L)
            {
                setLastLine("");
            } else
            {
                //向前走一个字节
                long pos = len - 1;
                while (pos > 0)
                {
                    pos--;
                    //移动指针
                    raf.seek(pos);
                    //判断这个字节是不是回车符
                    if (raf.readByte() == '\n')
                    {
                        break;//前移到会第一个回车符后结束
                    }
                }
                if (pos == 0)
                {
                    raf.seek(0);
                }
                
                //记录下当前位置
                setLastlinestart(pos);
                byte[] bytes = new byte[(int) (len - pos)];
                //读取从回车符位置到文件结尾的所有字节
                raf.read(bytes);
                if (charset == null)
                {
                    setLastLine(new String(bytes));
                } else
                {
                    setLastLine(new String(bytes,charset));
                }
            }
        } catch (FileNotFoundException e)
        {
        } finally
        {
            if (raf != null)
            {
                try
                {
                    raf.close();
                } catch (Exception e2)
                {
                }
            }
        }
    }
}

```
这样我记下了最后一行的位置之后，就可以动态的更新最后一行了,使用代码片段如下所示：
```java
LastLineInFile lastLineInFile=new LastLineInFile();
File localFile=new File(localPath);
//读取最后一行，得到最后一行的位置，和最后一行的字符串
lastLineInFile.readLastLine(localFile, "utf-8");
//获取最后一行的字符串
String lastLine=lastLineInFile.getLastLine();

//更新文章最后一行。
//以读写方式打开,同时要求每个更新都写入底层设备
RandomAccessFile rf=new RandomAccessFile(localFile, "rwd");
//获取最后一行的位置
long filelastpos=lastLineInFile.getLastlinestart();
System.out.println("最后一行位置："+filelastpos);
//截取文件，是最后一行被截走，相当于删除掉最后一行
rf.setLength(filelastpos);
//指针移动到文件末尾
rf.seek(filelastpos);
//写入新的信息
rf.write(hyperLinks.getBytes("utf-8"));
//关闭文件
rf.close();

```