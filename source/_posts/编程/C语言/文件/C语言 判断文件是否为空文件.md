---
title: C语言 判断文件是否为空文件
categories: 
  - C语言
  - 文件
abbrlink: a579418
date: 2018-11-16 23:11:18
updated: 2022-04-04 15:13:01
---
# 代码
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
# 参考链接
[C语言怎么判断文件是否为空](https://blog.csdn.net/lwpping/article/details/7441950)
