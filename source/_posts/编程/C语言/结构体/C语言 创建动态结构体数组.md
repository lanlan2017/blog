---
title: C语言 创建动态结构体数组
categories:
  - 编程
  - C语言
  - 结构体
abbrlink: 80deef00
date: 2019-02-13 00:31:18
updated: 2019-12-17 05:18:51
---
<div id='my_toc'><a href="/blog/80deef00/#前言" class="header_2">前言</a>&nbsp;<br><a href="/blog/80deef00/#基本类型数组动态分配大小" class="header_2">基本类型数组动态分配大小</a>&nbsp;<br><a href="/blog/80deef00/#结构体类型数组分配大小" class="header_2">结构体类型数组分配大小</a>&nbsp;<br><a href="/blog/80deef00/#参考链接" class="header_2">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 前言 ##
结构体类型数据组就和我们平常定义的基本类型的数组一样，只不过是类型变了。
## 基本类型数组动态分配大小 ##
```c
int* a = (int*)malloc(sizeof(int)*10) ; //动态分配10个大小的int类型的内存空间
```
## 结构体类型数组分配大小 ##
```c
struct DIYDEFINE
{
    int a;
    char ch;
    long lnum;
};
//动态分配10个大小的结构体类型DIYDEFINE的内存空间。 
DIYDEFINE* pDiy = (DIYDEFINE*)malloc(sizeof(DIYDEFINE)*10); 
//最后不要忘了释放动态申请的内存空间
free(pDiy)；
```
## 参考链接 ##
[C语言中结构体数组的大小如何动态分配](https://zhidao.baidu.com/question/1882917470304248548.html?qbl=relate_question_0&word=C%D3%EF%D1%D4%B6%AF%CC%AC%BD%E1%B9%B9%CC%E5%CA%FD%D7%E9)
