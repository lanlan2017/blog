---
title: Linux 系统调用
categories: 
  - Linux
  - 通用
  - 文件系统
abbrlink: a1e4649b
date: 2021-06-20 18:12:46
updated: 2022-04-04 00:51:45
---
# 系统调用(System call)
- 系统调用以C语言函数调用的方式提供
- 操作系统内核提供的编程界面
  - 应用程序(ap)和操作系统(kernel)进行交互的**唯一手段**
  - 例如：文件操作的open，read，write，close
- 种类
  - 早期UNIX有50多个，后来扩充到120个，Linux有300个左右

## 系统调用与库函数在执行方式上的区别
例如：获取进程ID的getpid()与字符串拷贝函数strcpy()
CPU的INT指令（软中断）与CALL指令（子程序调用）

## 库函数对系统调用的封装（API）
目的：执行效率更高或者调用界面更方便。例如：
库函数printf对**系统调用write的封装**
库函数malloc/free对**系统调用sbrk的封装**

## 可移植性
系统调用和相关API函数以及库函数的名称、参数排列顺序、参数类型，返回值的类型，以及实现的功能，都属于类似POSIX标准规范的内容，便于不同Unix系统之间的移植。

# 系统调用函数的返回值
## 返回值
一般返回一个整数值
- 返回值大于或等于零：成功
- 返回值为-1：失败

## 整型变量errno
标准库为errno保留存储空间，系统调用失败后填写错误代码，记录失败原因
`#include <errno.h>`之后，就可以直接使用变量errno.

errno.h头文件定义了许多有E前缀的宏，例如
```
EACCESS，EIO，ENOMEM，EINTR
```
相关系统调用的手册页中有出错说明
在man命令给出的手册页中有ERRORS一节介绍出错原因，如man recv

## 库函数strerror与printf的格式符%m 打印错误返回值

### strerror
```c
char *strerror(int errno);
```
errno是个整数，便于程序识别错误原因，不便于操作员理解失败原因。
库函数strerror将数字形式的错误代码转换成一个可阅读的字符串

### printf的%m
printf类函数格式字符串中的%m会被替换成上次系统调用失败的错误代码对应的消息（message）

```c openfile.c
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
int main(char argc, char *argv[])
{
    int fd;
    fd = open(argv[1], O_WRONLY);
    if (fd == -1) {
        printf("ERROR %d: %m\n", errno);
        printf("ERROR [%s]\n", strerror(errno));
    }
    //......
}
```
创建openfile.c并编编译成可执行文件openfile：
```
[root@localhost Linux命令风格；文件系统]# vim openfile.c
[root@localhost Linux命令风格；文件系统]# ls
openfile.c  useEnv  useEnvC
[root@localhost Linux命令风格；文件系统]# gcc openfile.c -o openfile
[root@localhost Linux命令风格；文件系统]# ls
openfile  openfile.c  useEnv  useEnvC
[root@localhost Linux命令风格；文件系统]# 
```

输入一个存在的文件，运行效果如下：
```
[root@localhost Linux命令风格；文件系统]# ./openfile useEnvC 
[root@localhost Linux命令风格；文件系统]# 
```
可以看到没有错误输出。
```
故意输入一个不存在的文件，运行效果如下：
```
[root@localhost Linux命令风格；文件系统]# ./openfile useEnv.c
ERROR 2: No such file or directory
ERROR [No such file or directory]
[root@localhost Linux命令风格；文件系统]# 
```
