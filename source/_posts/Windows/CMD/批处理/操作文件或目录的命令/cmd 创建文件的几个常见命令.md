---
title: cmd 创建文件的几个常见命令
categories: 
  - Windows
  - CMD
  - 批处理
  - 操作文件或目录的命令
abbrlink: 6aff1849
date: 2018-08-03 14:03:56
updated: 2022-04-04 16:32:44
---
# 一、建立空文件的几种方法

## 使用cd命令
1、`cd.>a.txt`
cd.表示改变当前目录为当前目录，即等于没改变；而且cd命令不会有输出。
“>”表示把命令输出写入到文件。后面跟着a.txt，就表示写入到a.txt。
而此例中命令不会有输出，所以就创建了没有内容的空文件。
![](https://i.imgur.com/jLjCU4z.png)
当然不用写地址也是可以的，也就是说`cd >1.txt`也是可以的。
![](https://i.imgur.com/s914p7I.png)

## 使用copy命令
2、`copy nul a.txt`
**nul表示空设备**，从概念上讲，它不可见，存在于每个目录中，可以把它看成一个特殊的“文件”，它没有内容；**一般可把输出写入到nul，来达到屏蔽输出的目的**，如pause>nul，此命令执行效果是暂停，并且不会显示“请按任意键继续…”。
此例子表示将空设备复制到a.txt，同样创建了没有内容的空文件。
![](https://i.imgur.com/IMKmwSW.png)

## 使用type命令
3、`type nul>a.txt`
此例子表示显示空设备的内容，并写入到a.txt。空目录没有内容，所以也就是创建了一个空文件。
![](https://i.imgur.com/gvC4DMB.png)

## 使用echo命令
4、`echo a 2>a.txt`
**“`2`”表示错误输出的句柄**，此例中没有错误输出，所以创建了没有内容的空文件。
其实**`>`默认都是重定向了`句柄1`，即标准输出句柄**。比如cd.>a.txt，其实就是cd. 1>a.txt。
同样，句柄3到9也可以使用在本例中，它们是未经定义的句柄，也不会有输出，如
echo a 3>a.txt。
## 使用fsutil命令
5、`fsutil file createnew d:\a.txt 0`
使用fsutil创建了一个空文件。
## 关键点
**只要没有输出，并重定向到文件就可以了**

[百度知道-cmd 如何新建文件](https://zhidao.baidu.com/question/277563240.html)
