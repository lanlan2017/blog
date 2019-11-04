---
title: Java doc 中文版教程
categories: 
  - Java
  - API整理
date: 2019-10-06 20:42:50
updated: 2019-10-30 13:53:55
abbrlink: 921dcf6b
---
- [Java API "中文版"教程](/blog/html/921dcf6b/#Java-API-"中文版"教程)
    - [为什么之前使用CHM格式的Java Doc](/blog/html/921dcf6b/#为什么之前使用CHM格式的Java-Doc)
    - [为什么现在推荐使用在线的Java doc](/blog/html/921dcf6b/#为什么现在推荐使用在线的Java-doc)
    - [java9之前版本的在线的java doc中如何快速查找类](/blog/html/921dcf6b/#java9之前版本的在线的java-doc中如何快速查找类)
    - [总结](/blog/html/921dcf6b/#总结)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# Java API "中文版"教程 #
## 为什么之前使用CHM格式的Java Doc ##
以前读的`Java doc`文档都是`CHM`格式的,主要是`CHM`格式中有`索引`功能,通过索引可以快速查找需要的类,在线的`API`没有这个功能,还要打开浏览器根据包名查找,包名我不一定记得住,所以在线的不方便.
所以我都是用的`CHM`格式的`java doc`文档,但是奈何英文不好,阅读起来比较繁琐.
## 为什么现在推荐使用在线的Java doc ##
不过,最近我无意中发现,`java9`之后`Oracle`提供的[在线的](https://docs.oracle.com/javase/9/docs/api/overview-summary.html)`java doc`文档提供了`搜索`功能,这样使用在线的`java doc`就很完美了,因为:
- 你可以快速搜索到想要的类,然后就`可以使用浏览器的翻译插件进行翻译`.

## java9之前版本的在线的java doc中如何快速查找类 ##
先在`java9`或者高级版本的`java doc`中查找到想要的类,然后修改浏览器地址栏上的版本号即可:
例如:先在`java9` 的`doc`中找到`System`类,浏览器地址栏中的地址如下:
```
https://docs.oracle.com/javase/9/docs/api/java/lang/System.html
```
如果此时想看java8中的System类,这只需要把地址栏中的`9`改成`8`即可:
```
https://docs.oracle.com/javase/8/docs/api/java/lang/System.html
```
## 总结 ##
1. 使用`java9`或者更高版本的在线`java doc`的搜索功能
2. 使用浏览器翻译插件翻译

>原文链接: [Java doc 中文版教程](https://lanlan2017.github.io/blog/921dcf6b/)
