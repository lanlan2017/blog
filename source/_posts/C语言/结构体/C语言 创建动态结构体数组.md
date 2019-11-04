---
title: C语言 创建动态结构体数组
categories: 
  - C语言
  - 结构体
date: 2019-02-13 00:31:18
updated: 2019-10-30 13:53:55
abbrlink: 80deef00
---
- [前言](/blog/html/80deef00/#前言)
- [基本类型数组动态分配大小](/blog/html/80deef00/#基本类型数组动态分配大小)
- [结构体类型数组分配大小](/blog/html/80deef00/#结构体类型数组分配大小)
- [参考链接](/blog/html/80deef00/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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
>原文链接: [C语言 创建动态结构体数组](https://lanlan2017.github.io/blog/80deef00/)
