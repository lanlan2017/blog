---
title: C语言 判断文件是否为空文件
categories:
  - 编程
  - C语言
  - 文件
abbrlink: a579418
date: 2018-11-16 23:11:18
updated: 2019-12-17 05:18:51
---
<div id='my_toc'><a href="/blog/a579418/#代码" class="header_2">代码</a>&nbsp;<br><a href="/blog/a579418/#参考链接" class="header_2">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 代码 ##
```c
FILE* movieFile=fopen("movie.txt","r");
//如果文件打开失败
if(movieFile==0)
{
    printf("文件打开失败！\n");
    system("pause");
    exit(0);
}
//判断是否是空文件
if(fgetc(movieFile)==EOF)
{
    printf("   文件 movie.txt 为空 请先录入\n");    
}
else
{
    rewind(movieFile);//文件指针移动会首部
}
//其他操作...

fclose(movieFile);//关闭文件
```
## 参考链接 ##
[C语言怎么判断文件是否为空](https://blog.csdn.net/lwpping/article/details/7441950)
