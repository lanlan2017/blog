---
title: C语言创建 删除 重命名文件
categories: 
  - C语言
  - 文件
date: 2018-11-15 00:44:39
updated: 2019-11-05 10:32:10
abbrlink: 65f494cf
---
- [C语言创建文件](/blog/65f494cf/#C语言创建文件)
- [C语言重命名文件](/blog/65f494cf/#C语言重命名文件)
- [C语言删除文件](/blog/65f494cf/#C语言删除文件)
    - [实例](/blog/65f494cf/#实例)
- [参考链接](/blog/65f494cf/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## C语言创建文件 ##
以`只写方式`打开文件，如果没有改文件的话则会创建该文件
```c
FILE* trainFILETemp=getFILE("trainTemp.txt","w");
fprintf(trainFILETemp,"使用C语言创建文件");
//关闭文件
fclose(trainFILETemp);
```
## C语言重命名文件 ##

```c
	int result;
	char oldname[] ="trainTemp.txt";
	char newname[] ="trainRename.txt";
	result= rename( oldname , newname );
	if ( result == 0 )
		printf( "File successfully renamed" );
	else
		perror( "Error renaming file" );
```
## C语言删除文件 ##
> 在C语言中，有专门的删除文件函数remove。
> 1、头文件：`stdio.h`
> 2、声明：`int remove(const char* filename);`
> 3、功能：删除文件名为filename的文件。 
> 4、返回值：`删除成功，返回0`.`否则返回-1`.
### 实例 ###
```c
	int ret;
	char deleteFile[]="trainRename.txt";
	ret = remove(deleteFile);//删除文件
	if(ret==0)
	    printf("删除文件成功\n");
	else
	    printf("删除文件失败\n");
```
## 参考链接 ##
[详解C语言中的rename()函数和remove()函数的使用方法](https://www.jb51.net/article/71801.htm)
[如何用C语言创建和删除文件](https://zhidao.baidu.com/question/267104376240933125.html)
[c 重命名文件](https://blog.csdn.net/goodboy_wkx/article/details/45561327)
>原文链接: [C语言创建 删除 重命名文件](https://lanlan2017.github.io/blog/65f494cf/)
