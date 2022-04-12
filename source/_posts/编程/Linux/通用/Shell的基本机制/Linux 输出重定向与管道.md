---
title: Linux 输出重定向与管道
categories: 
  - Linux
  - 通用
  - Shell的基本机制
abbrlink: f6ac4b15
date: 2021-06-26 21:49:08
updated: 2022-04-04 00:51:45
---
# Linux 输出重定向与管道
程序的标准输入/输出
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/SHELLBasicMechanism/LinuxOutputRedirectionAndPipeline/1.png)


# 程序示例
## 使用系统调用（原始I/O）
### stda.c
```c stda.c
#include <string.h>
#include <unistd.h>
int main(void) /* 使用原始I/O */
{
    static char *str1 = "string1\n";
    static char *str2 = "string2\n";
    int i;
    for (i = 0; i < 10; i++) {
        // 写入1号文件，也就是标准输出
        write(1, str1, strlen(str1));
        // 写入2号文件，也就是标准错误输出
        write(2, str2, strlen(str2));
    }
}
```
## 使用C语言库函数（缓冲I/O）
```c
#include <stdio.h>
/* FILE*类型的变量stdin，stdout和stderr */
int main(void) /* 使用缓冲I/O */
{
    static char *str1 = "string1\n";
    static char *str2 = "string2\n";
    int i;
    for (i = 0; i < 10; i++) {
        // 打印到标准输出
        printf("%s", str1); /*或:fprintf(stdout, "%s", str1);*/
        // 打印到标准错误输出
        fprintf(stderr, "%s", str2);
    }
}
```


# stdout输出重定向
## 重定向覆盖文件
```
> filename
```
将stdout重定向到文件filename，文件已存在则先清空（覆盖方式）
## 重定向追加到文件
```
>> filename
```
将stdout重定向追加到文件filename尾

# stderr输出重定向
## 标准错误输出重定向到文件
将文件句柄2重定向到文件filename
```
2> filename
```
分离stdout与stderr的意义：有时候会把stdout作为程序的运行结果重定向到文件中，如果不分离的话，文件中会夹杂有错误输出，干扰我们想要的结果。

## 标准错误输出与标准输出相同
将文件句柄2重定向到文件描述符1指向的文件：
```
2>&1
```
## 使用其他文件句柄
允许对除0，1，2外其它文件句柄输入或输出重定向,例如：
```
./myap 5< a.txt 6> b.dat
```
那么，在运行myap这个程序的时候，
- 5号文件则不需要打开，可以直接从5号文件中读取。也就是直接从a.txt中读取。
- 可以直接往6号文件中输出，也就是会直接写到b.dat文件中。

虽然这种用法不常见，但是也是可以这样使用的。
# 输出重定向示例
## 重定向stdout到文件
将命令ls标准输出stdout定向到文件file.list中：
```
ls -l > file.list
```
## 重定向stderr到文件
将gcc命令的stderr重定向到文件try.err中
```
gcc try.c -o try 2> try.err
```
## 重定向stdout和strerr到不同文件
将try程序执行后的stdout和stderr分别重定向到不同的文件：
```
try > try.out 2>try.err
```
或者：
```
try 1> try.out 2>try.err
```

```
./stda 1> try.out 2>/dev/null
```
stdout和stderr均存入文件rpt：
```
./stda >rpt 2>&1
```
## 程序示例
```c stda.c
#include <string.h>
#include <unistd.h>
int main(void) /* 使用原始I/O */
{
    static char *str1 = "string1\n";
    static char *str2 = "string2\n";
    int i;
    for (i = 0; i < 10; i++) {
        //写入1号文件，也就是标准输出
        write(1, str1, strlen(str1));
        //写入2号文件，也就是标准错误输出
        write(2, str2, strlen(str2));
    }
}
```
编译，运行该程序：
```
[root@localhost shell的基本机制]# gcc stda.c -o stda
[root@localhost shell的基本机制]# ls |grep 'stda'
stda
stda.c
[root@localhost shell的基本机制]# ./stda 
string1
string2
string1
string2
string1
string2
string1
string2
string1
string2
string1
string2
string1
string2
string1
string2
string1
string2
string1
string2
[root@localhost shell的基本机制]# 
```
可以看到标准输出和标准错误输出交替输出到屏幕上。光从打印的结果是无法看出那条是标准输出，那条是标准错误输出。
### 重定向标准输出到文件
运行该程序，把标准输出重定向到文件中：
```
[root@localhost shell的基本机制]# ./stda >stda.out
string2
string2
string2
string2
string2
string2
string2
string2
string2
string2
[root@localhost shell的基本机制]# 
```
此时，屏幕上输出的就只剩下标准错误输出。
### 标准输出和标准错误输出都重定向到文件中
```
[root@localhost shell的基本机制]# ./stda >stda.out 2>stda.err
[root@localhost shell的基本机制]# cat stda.out 
string1
string1
string1
string1
string1
string1
string1
string1
string1
string1
[root@localhost shell的基本机制]# cat stda.err 
string2
string2
string2
string2
string2
string2
string2
string2
string2
string2
[root@localhost shell的基本机制]# 
```
或者，不省略标准输出的文件描述符：
```
[root@localhost shell的基本机制]# rm *.out *.err
rm：是否删除普通文件 "stda.out"？y
rm：是否删除普通文件 "stda.err"？y
[root@localhost shell的基本机制]# ./stda 1>stda.out 2>stda.err
[root@localhost shell的基本机制]# cat stda.out 
string1
string1
string1
string1
string1
string1
string1
string1
string1
string1
[root@localhost shell的基本机制]# cat stda.err 
string2
string2
string2
string2
string2
string2
string2
string2
string2
string2
[root@localhost shell的基本机制]# 
```
# 输出重定向顺序不要颠倒
正确写法
```
./stda >rpt 2>&1
```
命令执行时，各文件句柄的指向过程：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/SHELLBasicMechanism/LinuxOutputRedirectionAndPipeline/2.png)

错误写法：
```
./stda 2>&1 >rpt
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/SHELLBasicMechanism/LinuxOutputRedirectionAndPipeline/3.png)

# 管道
## 传递前一个命令的标准输出给后一个命令作为标准输出
前一命令的stdout作后一命令的stdin
```
ls -l | grep '^d'
```
## 管道如何传递前一个命令的标准错误输出给后一个命令
前一命令的stdout+stderr作为下一命令的stdin：
```
gcc try.c -o try 2>&1 | more
```
这样才能实现使用more逐屏查看。因为编译是输出的错误信息，很多都是标准错误输出，但是呢，管道是把前面的标准输出传递给后面的命令作为标准输入。对于前一个命令的标准错误输出，管道是不会传递的。
所以为了使得后面的命令能看到前一个命令的标准错误输出，可以把标准错误输出合并到标准输出。这样才会通过管道传递给后面的命令。


<!-- Blog/Programming/Linux/General/SHELLBasicMechanism/LinuxOutputRedirectionAndPipeline -->
