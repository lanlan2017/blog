---
title: Linux 文件通配符处理过程
categories: 
  - Linux
  - 通用
  - 文件名和文件通配符
abbrlink: 36f9715c
date: 2021-05-31 14:48:40
updated: 2022-04-04 00:51:45
---
# shell与kernel
## shell
- shell是一个用户态进程，如/bin/bash
- 对用户提供命令行界面
- 启动其他应用程序（ap）使用操作系统核心提供的功能:包括系统命令和用户编写的程序

## kernel：操作系统核心
- 管理系统资源(包括内存，磁盘等)运行在核心态
- 通过软中断方式对用户态进程提供系统调用接口

# 程序获取命令行参数的方式
从main函数的两个参数，可获得命令行参数的内容
演示程序arg.c

```c arg.c
#include <stdio.h>
void main(int argc, char *argv[])
{  
    int i;
    for (i = 0; i < argc; i++)
        printf("%d:[%s]\n", i, argv[i]);
}
```

编译，链接：
```
gcc arg.c -o arg
```
运行
```
./arg abc ABCDEF
```
运行结果：
```
[root@localhost 文件名和文件通配符]# ./arg abc ABCDEF
0:[./arg]
1:[abc]
2:[ABCDEF]
[root@localhost 文件名和文件通配符]# 
```

# shell文件名通配符处理
## 文件名通配符的处理由shell完成，分以下三步
- 在shell提示符下，从键盘输入命令，被shell接受
- shell对所键入内容作若干加工处理，其中含有对文件通配符的展开工作(文件名生成)，生成结果命令
- 执行前面生成的结果命令

# 文件名通配符举例（1）
设当前目录下只有`try.c`，`zap.c`，`arc.c`三文件
- 键入内容`cat *.c`
  - 实际执行`cat arc.c try.c zap.c` (按字典序)
  - 对命令`cat`来说,指定了3个文件

设当前目录下有`a1.c`和`a2.c`
- `grep a*.c try.c`与`grep 'a*.c' try.c`的区别
  - 前者实际执行`grep a1.c a2.c try.c`
    - 在`a2.c`和`try.c`中查找正则表达式`a1.c`
  - 后者在`try.c`文件中查找正则表达式`a*.c`

# 文件名通配符举例(2)
键入命令时的简化输入
手工键入`vi m*e`
实际执行`vi makefile`
手工键入`cd *sna*` 
实际执行`cd configure-IBM-sna-network.d`

# 验证文件通配符处理方式
执行
```
./arg *
```
```
./arg  /usr/include/*
```
```
./arg  */*  /usr/*
```
## Linux下的运行结果
`./arg *`运行结果：
```
[root@localhost 文件名和文件通配符]# ./arg *
0:[./arg]
1:[arg]
2:[arg.c]
[root@localhost 文件名和文件通配符]# 
```
`./arg  /usr/include/*`运行结果：
```
[root@localhost 文件名和文件通配符]# ./arg  /usr/include/*
0:[./arg]
1:[/usr/include/aio.h]
2:[/usr/include/aliases.h]
......
14:[/usr/include/c++]
15:[/usr/include/com_err.h]
16:[/usr/include/complex.h]
17:[/usr/include/cpio.h]
......
```
`./arg */* /usr/*`运行结果：
```
[root@localhost 文件名和文件通配符]# ./arg */* /usr/*
0:[./arg]
1:[*/*]
2:[/usr/bin]
3:[/usr/etc]
4:[/usr/games]
5:[/usr/include]
6:[/usr/lib]
7:[/usr/lib64]
8:[/usr/libexec]
9:[/usr/local]
10:[/usr/sbin]
11:[/usr/share]
12:[/usr/src]
13:[/usr/tmp]
[root@localhost 文件名和文件通配符]# 
```
## Windows下运行结果
`arg.exe *`运行结果：
```
G:\Desktop\test\Linux\Debug>arg.exe *
0:[arg.exe]
1:[*]

G:\Desktop\test\Linux\Debug>
```
`arg.exe /usr/include/*`运行结果：
```
G:\Desktop\test\Linux\Debug>arg.exe /usr/include/*
0:[arg.exe]
1:[/usr/include/*]

G:\Desktop\test\Linux\Debug>
```
`arg.exe */* /usr/*`运行结果：
```
G:\Desktop\test\Linux\Debug>arg.exe */* /usr/*
0:[arg.exe]
1:[*/*]
2:[/usr/*]

G:\Desktop\test\Linux\Debug>
```
执行结果与同样arg.c在Windows下运行的比较
- **UNIX由shell完成对文件通配符的展开**
- Windows由命令自身来解释文件通配符
