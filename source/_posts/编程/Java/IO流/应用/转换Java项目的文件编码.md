---
title: 转换Java项目的文件编码
categories: 
  - Java
  - Java IO流
  - 应用
abbrlink: 16108e1f
date: 2019-08-15 03:00:03
updated: 2022-04-04 00:51:44
---
# 问题描述
今天在`idea`中导入一个项目的时候出现了乱码,乱码的原因时因为这个项目的编码是`GBK`,但是我设置`idea`的编码为`UTF-8`。
我知道怎么在`idea`把一个文件从`gbk`转为`utf-8`.但是我还不知道怎么快速把转换整个项目得我编码。
倒是可以手动一个文件一个文件的该,但是我懒得手动改.所以我决定写个程序来实现。
# 需求分析
- 可以转换一个文件的编码
- 可以转换整个目录(项目)的编码

# 实现思路
- 通过IO流以一种编码方式从源文件中读入,然后以另一种编码写到临时文件中.
- 然后删除源文件,把临时文件重命名为源文件即可。

# 编码实现

```java
package args.java.file;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

/**
 * 项目编码转换器,可以把一个目录下的所有文件从一个编码(如GBK)转换成另一个编码(如UTF-8).<br>
 */
public class ConvertProjectEncode
{
    /**
     * 转换整个目录的编码.
     * @param dirFile 目录对应的File对象.
     * @param fromCharset 原来的文件编码.
     * @param toCharset 要转成的编码.
     */
    public static void convertDirEncode(File dirFile, String fromCharset,
            String toCharset)
    {
        File[] dirFileList = dirFile.listFiles();
        // 遍历整个目录列表
        for (int i = 0; i < dirFileList.length; i++)
        {
            // 如果是目录
            if (dirFileList[i].isDirectory())
            {
                // 递归处理下一级目录
                convertDirEncode(dirFileList[i], fromCharset, toCharset);
            }
            // 如果是文件
            else if (dirFileList[i].isFile())
            {
                // 转换文件的编码
                convertFileEncode(dirFileList[i], fromCharset, toCharset);
            }
        }
    }

    /**
     * 转换一个文件的编码.
     * @param file
     * @param fromCharset
     * @param toCharset
     */
    public static void convertFileEncode(File file, String fromCharset,
            String toCharset)
    {
        // 生成临时文件
        File tempFile = createTempFile(file);
        // 把源文件复制到临时文件
        copyToTempFileByNewEncode(file, fromCharset, tempFile, toCharset);
        // 删除源文件,并把临时文件重名为源文件
        if (file.delete() && tempFile.renameTo(file))
        {
            System.out.println("文件:" + file + "由 " + fromCharset + " 转为 "
                    + toCharset + " 成功!");
        }
    }

    /**
     * 从源文件以fromCharset编码读取,以toCharset编码写入临时文件.
     * @param file
     * @param fromCharset
     * @param toCharset
     * @param tempFile
     */
    public static void copyToTempFileByNewEncode(File file, String fromCharset,
            File tempFile, String toCharset)
    {
        char[] cbuf = new char[1024];
        // 读入文件缓存
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(new FileInputStream(file), fromCharset));

                BufferedWriter writer = new BufferedWriter(
                        new OutputStreamWriter(new FileOutputStream(tempFile),
                                toCharset));)
        {

            int size = -1;
            // 从源文件中读出
            while ((size = reader.read(cbuf)) != -1)
            {
                // 写入临时文件
                writer.write(cbuf, 0, size);
            }

        } catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    /**
     * 创建一个文件的副本.
     * @param file
     */
    private static File createTempFile(File file)
    {
        // 源文件名
        String fileName = file.getName();
        // 临时文件名
        int lastIndexOfDot = fileName.lastIndexOf(".");
        String tempFileName = fileName.substring(0, lastIndexOfDot) + "_Temp"
                + fileName.substring(lastIndexOfDot);
        File tempFile = new File(file.getParent(), tempFileName);
        return tempFile;
    }
    /**
     * 把gbk编码的目录或者文件转换为utf-8编码的.
     * @param file
     */
    public static void gbkToUtf8(File file)
    {
        if (file.isDirectory())
        {
            convertDirEncode(file, "gbk", "utf-8");
        } else if (file.isFile())
        {
            convertFileEncode(file, "gbk", "utf-8");
        }
    }
    /**
     * 把utf-8编码的目录或者文件转换为gbk编码的.
     * @param file
     */
    public static void utf8ToGbk(File file)
    {
        if (file.isDirectory())
        {
            convertDirEncode(file, "utf-8", "gbk");
        } else if (file.isFile())
        {
            convertFileEncode(file, "utf-8", "gbk");
        }
    }
    public static void main(String[] args)
    {
        File file = new File("G:\\Desktop\\测试编码转换\\");
        // gbkToUtf8(file);
        utf8ToGbk(file);
    }

}
```
