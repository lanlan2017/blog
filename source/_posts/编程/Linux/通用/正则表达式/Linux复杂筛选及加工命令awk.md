---
title: Linux复杂筛选及加工命令awk
categories:
  - 编程
  - Linux
  - 通用
  - 正则表达式
abbrlink: 21ec0bd3
date: 2021-05-03 15:40:15
updated: 2021-05-03 15:40:15
---
# Linux复杂筛选及加工命令awk
## awk：逐行扫描进行文本处理的一门语言
a.w.k分别为该程序的三位设计者姓氏的第一个字母
## 用法
awk '程序' 文件名列表
awk -f 程序文件名 文件名列表

## awk程序
```
条件{动作}
```
awk自动对每行文本执行条件判断，满足条件则执行动作 （内置循环）
允许多段程序：多段程序间用空格或分号隔开。

## 处理方式
- 输入文件的每行作为一个“记录”，awk内置变量NR就是行号
- 每行用空格分隔开的部分，叫做记录的“域”
  - 内置变量$1是第1域内容，依次，$2是第2域内容，……
  - 特别的，$0指的是整个这一行的内容
- awk的处理为：符合条件的行，执行相应的动作

## awk描述条件的方法
### 关系运算 与C语言类似的

|awk关系运算符|描述|
|:---|:---|
|<|小于|
|<=|小于或等于|
|==|等于|
|!=|不等于|
|>|大于|
|>=|大于或等于|

### 逻辑运算符
使用与C语言类似的逻辑算符

|awk逻辑运算符|描述|
|:---|:---|
|&#124;&#124;|条件或|
|`&&`|条件与|
|`!`|条件非|

### 正则表达式的模式匹配 /regexpr/
包含该模式的行，执行动作

### 特殊的条件
- 不指定任何条件：对所有文本行执行动作
- BEGIN：开始处理所有文本行之前执行动作
- END：处理完所有文本行之后执行动作

## awk描述动作的方法
描述“动作”时，简单的用法有：
- 自定义变量
- 加减乘除等算术逻辑运算
- 正则表达式匹配运算符（用作条件判断） ~    !~
  - 例如： $2 ~  "[1-9][0-9]*"
- 流程控制（与C语言类似）
  - 条件判断 if
  - 循环控制 for
- print 变量1， 变量2，……
- printf(”格式串”，变量1，变量2，……)

# awk示例
## 只显示命令输出的某些列
### 只显示ls -l命令的某些列
```
[root@localhost Linux_Test]# ls -l
总用量 48
-rw-r--r--. 1 root root    0 5月   3 15:27 a.txt
-rw-r--r--. 1 root root    0 5月   3 15:27 b.txt
drwxr-xr-x. 2 root root 4096 5月   1 15:16 cat
-rw-r--r--. 1 root root    0 5月   3 15:27 c.txt
drwxr-xr-x. 2 root root 4096 5月   1 15:18 date
-rw-r--r--. 1 root root    0 5月   3 15:27 d.txt
drwxr-xr-x. 2 root root 4096 5月   1 15:16 less
drwxr-xr-x. 2 root root 4096 5月   1 15:14 ls
drwxr-xr-x. 2 root root 4096 5月   1 15:15 more
drwxr-xr-x. 2 root root 4096 5月   1 15:18 ps
drwxr-xr-x. 2 root root 4096 5月   1 15:15 sort
drwxr-xr-x. 2 root root 4096 5月   1 15:14 tr
drwxr-xr-x. 2 root root 4096 5月   1 18:47 uniq
drwxr-xr-x. 2 root root 4096 5月   1 15:17 vi
drwxr-xr-x. 2 root root 4096 5月   1 15:17 wc
drwxr-xr-x. 4 root root 4096 5月   3 14:36 正则表达式
[root@localhost Linux_Test]# 
```
只打印第1列和第9列（最后一列）：
```
[root@localhost Linux_Test]# ls -l| awk '{ printf("%s %s\n",$1,$9); }'
总用量 
-rw-r--r--. a.txt
-rw-r--r--. b.txt
drwxr-xr-x. cat
-rw-r--r--. c.txt
drwxr-xr-x. date
-rw-r--r--. d.txt
drwxr-xr-x. less
drwxr-xr-x. ls
drwxr-xr-x. more
drwxr-xr-x. ps
drwxr-xr-x. sort
drwxr-xr-x. tr
drwxr-xr-x. uniq
drwxr-xr-x. vi
drwxr-xr-x. wc
drwxr-xr-x. 正则表达式
[root@localhost Linux_Test]# 
```
### 只显示date命令的某些列
```
[root@localhost C_Test]# date
2021年 05月 03日 星期一 16:30:54 CST
[root@localhost C_Test]# date|awk '{printf("%s %s %s\n",$1,$2,$3);}'
2021年 05月 03日
[root@localhost C_Test]# date|awk '{printf("%s\n",$4);}'
星期一
[root@localhost C_Test]# date|awk '{printf("%s\n",$5);}'
16:31:16
[root@localhost C_Test]# 
```
上面这些功能也可以使用print实现：
```
[root@localhost C_Test]# date
2021年 05月 03日 星期一 16:41:03 CST
[root@localhost C_Test]# date|awk '{print $1 $2 $3}'
2021年05月03日
[root@localhost C_Test]# date|awk '{print $4}'
星期一
[root@localhost C_Test]# date|awk '{print $5}'
16:41:17
[root@localhost C_Test]#
```
## 显示文件时显示自定义行号
```
[root@localhost C_Test]# cat helloworld.c
#include <stdio.h>

int main()
{
    printf("%s\n","HelloWorld!");
}
[root@localhost C_Test]# cat helloworld.c|awk '{printf("%d: %s\n",NR,$0);}'
1: #include <stdio.h>
2: 
3: int main()
4: {
5:     printf("%s\n","HelloWorld!");
6: }
[root@localhost C_Test]# cat -n helloworld.c
     1    #include <stdio.h>
     2    
     3    int main()
     4    {
     5        printf("%s\n","HelloWorld!");
     6    }
[root@localhost C_Test]# 
```
## 只显示文件大小大于等于16KB的文件
```
[root@localhost C_Test]# ls -sh
总用量 120K
 16K a.out       4.0K file1.txt  4.0K file3.txt  4.0K forkTest.c  4.0K helloworld.c    4.0K redCharacter.c    4.0K strerror.c        16K terminalColor.out
4.0K command.sh  4.0K file2.txt  4.0K file4.txt   16K forkTest.o   16K helloworld.out   16K redCharacter.out  4.0K terminalColor.c
[root@localhost C_Test]# ls -s
总用量 120
16 a.out        4 file1.txt   4 file3.txt   4 forkTest.c   4 helloworld.c     4 redCharacter.c     4 strerror.c       16 terminalColor.out
 4 command.sh   4 file2.txt   4 file4.txt  16 forkTest.o  16 helloworld.out  16 redCharacter.out   4 terminalColor.c
[root@localhost C_Test]# ls -s|awk '$1>=16{printf("%s\n",$0);}'
总用量 120
16 a.out
16 forkTest.o
16 helloworld.out
16 redCharacter.out
16 terminalColor.out
[root@localhost C_Test]#
```
## 列出当前目录下的所有.c文件
```
[root@localhost C_Test]# ls
a.out       file1.txt  file3.txt  forkTest.c  helloworld.c    redCharacter.c    strerror.c       terminalColor.out
command.sh  file2.txt  file4.txt  forkTest.o  helloworld.out  redCharacter.out  terminalColor.c
[root@localhost C_Test]# ls|awk '/.+\.c/'
forkTest.c
helloworld.c
redCharacter.c
strerror.c
terminalColor.c
[root@localhost C_Test]# ls -l |awk '/.+\.c/'
-rw-r--r--. 1 root root   152 4月  11 17:26 forkTest.c
-rw-r--r--. 1 root root    66 5月   3 16:22 helloworld.c
-rw-r--r--. 1 root root   785 4月   3 22:34 redCharacter.c
-rw-r--r--. 1 root root   496 3月  24 17:53 strerror.c
-rw-r--r--. 1 root root  1623 4月   3 22:48 terminalColor.c
[root@localhost C_Test]# 
```