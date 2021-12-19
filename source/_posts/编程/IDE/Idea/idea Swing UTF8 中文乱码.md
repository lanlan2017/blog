---
title: idea Swing UTF8 中文乱码
categories: 
  - 编程
  - IDE
  - Idea
date: 2020-01-02 11:55:04
updated: 2020-04-11 09:21:19
abbrlink: eb997f87
---
# 问题描述
今天将一个Swing项目,迁移到Idea中,但是很奇怪,运行后,标签中和按钮中的中文都乱码了,之前在Eclipse中用的编码是gbk,idea中的我改成了UTF-8

# 解决方案 修改主类的编码为utf-8
虽然我文件的编码已经设置为utf-8了,但是不知道怎么回事,经过如下操作后正常了,我打开的时候这个主类原本是gbk编码了(虽然我文件的编码已经改为utf-8,但是这里依然显示为gbk),我将这里的编码也改成utf-8后就正常了.
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Java/IDE/Idea/SwingGarbledSolution/1.png)
<!-- Blog/Java/IDE/Idea/SwingGarbledSolution/ -->
