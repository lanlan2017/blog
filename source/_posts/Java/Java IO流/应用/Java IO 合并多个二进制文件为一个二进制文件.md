---
title: Java IO 合并多个二进制文件为一个二进制文件
categories: 
  - Java
  - Java IO流
  - 应用
date: 2019-06-27 17:54:33
updated: 2019-10-30 13:53:55
abbrlink: e4a1ea9f
---
- [Java IO 合并多个二进制文件为一个二进制文件](/blog/html/e4a1ea9f/#Java-IO-合并多个二进制文件为一个二进制文件)
    - [背景](/blog/html/e4a1ea9f/#背景)
    - [算法描述](/blog/html/e4a1ea9f/#算法描述)
    - [关键代码](/blog/html/e4a1ea9f/#关键代码)
    - [合并多个源文件到目标文件并删除源文件](/blog/html/e4a1ea9f/#合并多个源文件到目标文件并删除源文件)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
<iframe height="36" width="260" src="https://www.ximalaya.com/thirdparty/player/sound/player.html?id=193870569&type=red" frameborder=0 allowfullscreen></iframe>
# Java IO 合并多个二进制文件为一个二进制文件 #
## 背景 ##
- 我最近在调用讯飞语音的`API`来把我的博客中的文字转成音频,
- 讯飞语音合成有数字限制,如果超过字数限制,会合成失败.
- 为了不超过字数限制,我把文章分割成好几部分,分别合成,
- 然后再把这些部分合并为一个文件.
- 讯飞合成的音频文件是`.pcm`文件,这是个二进制文件,

好了,废话就说到这,下面介绍**如何把多个二进制文件合并为一个二进制文件**.
## 算法描述 ##
复制文件的算法如下:
- 从源文件中读入一些字节到内存(字节数组)中
- 把内存中的这些字节写到目标文件中.

多个源文件合并成一个目标文件,算法跟复制文件差不多,算法描述如下:
- 读取第一个源文件中的内容,输出到目标文件中.
- 然后读取第二个源文件中的内容,然后输出到目标文件中.
- 然后读取第三个源文件中的内容,然后输出到目标文件中.
- 依次类推,直到处理所有的源文件完成。

## 关键代码 ##
```java
// 缓存数组
byte[] buffer = new byte[2048];
// 每次读入的字节数量
int inSize = -1;
// 批量读入字节到buffer缓存中,并返回读入的自己数量给inSize
// 这里的in为输入流对象
while ((inSize = in.read(buffer)) != -1)
{
	// 把buffer缓存中的字节写入输出流(也就是目标文件)
      // 这里的out为输出流对象  
	out.write(buffer, 0, inSize);
}
```
## 合并多个源文件到目标文件并删除源文件 ##
```java
/**
 * 合并文件ArrayList中的多个源文件为一个文件.
 * 
 * @param targetFilePath
 *            目标文件路径名称字符串.
 * @param sourceFilePathList
 *            存放源文件的路径名称字符串的ArrayList集合.
 */
public static void merge2TargetFileDeleteSourceFile(String targetFilePath,
		ArrayList<String> sourceFilePathList)
{
	// 如果ArrayList中有东西
	if (sourceFilePathList.size() > 0)
	{
		BufferedInputStream in;
		try (BufferedOutputStream out = new BufferedOutputStream(
				new FileOutputStream(new File(targetFilePath)));)
		{
			System.out.println("源文件列表:");
			for (Iterator<String> iterator = sourceFilePathList
					.iterator(); iterator.hasNext();)
			{
				String sourceFilePath = iterator.next();
				System.out.println("    " + sourceFilePath);
				File sourceFile = new File(sourceFilePath);
				in = new BufferedInputStream(
						new FileInputStream(sourceFile));
				// 缓存数组
				byte[] buffer = new byte[2048];
				// 每次读入的字节数量
				int inSize = -1;
				// 批量读入字节到buffer缓存中,并返回读入的自己数量给inSize
				while ((inSize = in.read(buffer)) != -1)
				{
					// 把buffer缓存中的字节写入输出流(也就是目标文件)
					out.write(buffer, 0, inSize);
				}
				// 关闭源文件
				in.close();
				// 删除这个源文件
				sourceFile.delete();
			}
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}
```
>原文链接: [Java IO 合并多个二进制文件为一个二进制文件](https://lanlan2017.github.io/blog/e4a1ea9f/)
