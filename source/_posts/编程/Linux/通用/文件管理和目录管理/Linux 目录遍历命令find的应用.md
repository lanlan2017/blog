---
title: Linux 目录遍历命令find的应用
categories: 
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: a84f434c
date: 2021-06-08 01:52:55
updated: 2022-04-04 00:51:45
---
# Linux 目录遍历命令find的应用
## 查找当前目录下的所有目录
从当前目录开始查找，寻找所有目录，打印路径名：
```
find . -type d -print
```
结果：按层次列出当前的目录结构
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld.c
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    ├── p1.c
    └── p2.c

3 directories, 6 files
[root@localhost 文件管理和目录管理]# find . -type d -print
.
./hello
./hello/world
./文件管理
[root@localhost 文件管理和目录管理]# 
```
指定了两个条件：名字与stud*匹配，类型为目录
```
find . -name 'stud*' -type d -print
```
## 使用多个条件选项
两个条件逻辑“与”，必须同时符合这两个条件
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld.c
├── hello2
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   ├── p1.c
│   └── p2.c
└── ht.c

3 directories, 6 files
[root@localhost 文件管理和目录管理]# find . -name 'hello*' -type d -print
./hello
./hello2
[root@localhost 文件管理和目录管理]# 
```
## 检索最近10天内修改过的普通文件
从根目录开始检索最近10天之内曾经修改过的普通磁盘文件（目录不算）
```
find / -type f -mtime -10 -print
```
当前的时间：
```
[root@localhost 文件管理和目录管理]# date
2021年 06月 09日 星期三 13:29:26 CST
[root@localhost 文件管理和目录管理]#
```
当前目录树结构，以及各个文件的最后修改时间：
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── HelloWorld.c
├── hello2
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   ├── p1.c
│   └── p2.c
└── ht.c

2 directories, 6 files
[root@localhost 文件管理和目录管理]# ls -l *
-rw-r--r--. 1 root root   34 6月   3 17:33 ht.c

hello:
总用量 0
-rw-r--r--. 1 root root 0 6月   7 16:49 HelloWorld.c

hello2:
总用量 16
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld2.c
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld.c
-rw-r--r--. 1 root root 66 6月   2 17:00 p1.c
-rw-r--r--. 1 root root 66 6月   2 17:16 p2.c
[root@localhost 文件管理和目录管理]# 
```
查找刚好5天之前更新的文件：
```
[root@localhost 文件管理和目录管理]# find . -type f -mtime 5 -print
./ht.c
[root@localhost 文件管理和目录管理]# 
```
查找刚好6天之前更新的文件：
```
[root@localhost 文件管理和目录管理]# find . -type f -mtime 6 -print
./hello2/HelloWorld2.c
./hello2/HelloWorld.c
./hello2/p1.c
./hello2/p2.c
[root@localhost 文件管理和目录管理]# 
```
查找5天之前更新的文件
```
[root@localhost 文件管理和目录管理]# find . -type f -mtime +4 -print
./hello2/HelloWorld2.c
./hello2/HelloWorld.c
./hello2/p1.c
./hello2/p2.c
./ht.c
[root@localhost 文件管理和目录管理]# 
```
## 使用逻辑运算符非!
```
find . ! -type d -links +2 -print
```
从当前目录开始检索link数大于2的非目录文件
条件“非”用！
注意：!号与-type之间必须保留一空格
```
[root@localhost 文件管理和目录管理]# find . -type f -mtime 6 -print
./hello2/HelloWorld2.c
./hello2/HelloWorld.c
./hello2/p1.c
./hello2/p2.c
[root@localhost 文件管理和目录管理]# find . -type f ! -mtime 6 -print
./hello/HelloWorld.c
./ht.c
[root@localhost 文件管理和目录管理]# 
```
## 使用逻辑运算或-o
寻找当前目录下大于100字节的名叫hello的或.c后缀的文件
```
[root@localhost 文件管理和目录管理]# tree -Nh
.
├── [ 131]  arg.c
├── [4.0K]  hello
│   └── [   0]  HelloWorld.c
├── [4.0K]  hello2
│   ├── [  66]  HelloWorld2.c
│   ├── [  66]  HelloWorld.c
│   ├── [  66]  p1.c
│   └── [  66]  p2.c
├── [ 121]  helloworld.c
└── [  34]  ht.c

2 directories, 8 files
[root@localhost 文件管理和目录管理]# find -size +100c \( -name 'hello' -o -name '*.c' \) -print
./hello
./arg.c
./helloworld.c
[root@localhost 文件管理和目录管理]# 
```
- 使用了两条件“或” (-o)及组合(圆括号)
- 不要遗漏了所必需的引号，反斜线和空格，尤其是圆括号前和圆括号后。圆括号是shell的特殊字符，所以需要写成`\(`或`\)`

其他写法
```
[root@localhost 文件管理和目录管理]# find -size +100c '(' -name 'hello' -o -name '*.c' ')' -print
./hello
./arg.c
./helloworld.c
[root@localhost 文件管理和目录管理]# 
```
```
[root@localhost 文件管理和目录管理]# find -size +100c \( -name 'hello' -o -name '*.c' ')' -print
./hello
./arg.c
./helloworld.c
[root@localhost 文件管理和目录管理]# 
```
## find -exec执行命令
```
find . -type d -print -exec ls -l {} \;
```
- `-exec`及随后的分号`;`之间的内容作为一条命令执行
- `shell`中分号`;`有特殊含义，前面加反斜线\
- `{}`代表遍历时所查到的符合条件的路径名。注意，**两花括号间无空格，之后的空格不可省略**

```
[root@localhost 文件管理和目录管理]# tree -N
.
├── arg.c
├── hello
│   └── HelloWorld.c
├── hello2
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   ├── p1.c
│   └── p2.c
├── helloworld.c
└── ht.c

2 directories, 8 files
[root@localhost 文件管理和目录管理]#
```
查找当前目录下的子目录，并对这些子目录执行`ls -l`命令：
```
[root@localhost 文件管理和目录管理]# find . -type d -print -exec ls -l {} \;
.
总用量 20
-rw-r--r--. 1 root root  131 6月   9 14:12 arg.c
drwxr-xr-x. 2 root root 4096 6月   9 13:28 hello
drwxr-xr-x. 2 root root 4096 6月   8 01:23 hello2
-rw-r--r--. 1 root root  121 6月   9 14:13 helloworld.c
-rw-r--r--. 1 root root   34 6月   3 17:33 ht.c
./hello
总用量 0
-rw-r--r--. 1 root root 0 6月   7 16:49 HelloWorld.c
./hello2
总用量 16
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld2.c
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld.c
-rw-r--r--. 1 root root 66 6月   2 17:00 p1.c
-rw-r--r--. 1 root root 66 6月   2 17:16 p2.c
[root@localhost 文件管理和目录管理]#
```
查找当前目录下的子目录，不包括这个`.`目录，并对这些子目录执行`ls -l`命令。
```
[root@localhost 文件管理和目录管理]# find . -type d ! -name '.'  -print -exec ls -l {} \;
./hello
总用量 0
-rw-r--r--. 1 root root 0 6月   7 16:49 HelloWorld.c
./hello2
总用量 16
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld2.c
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld.c
-rw-r--r--. 1 root root 66 6月   2 17:00 p1.c
-rw-r--r--. 1 root root 66 6月   2 17:16 p2.c
[root@localhost 文件管理和目录管理]# 
```
## find -ok执行命令
-ok选项在执行指定的命令前等待用户确认
```
[root@localhost 文件管理和目录管理]# find . -type d -print -ok ls -l {} \;
.
< ls ... . > ? n
./hello
< ls ... ./hello > ? y
总用量 0
-rw-r--r--. 1 root root 0 6月   7 16:49 HelloWorld.c
./hello2
< ls ... ./hello2 > ? y
总用量 16
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld2.c
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld.c
-rw-r--r--. 1 root root 66 6月   2 17:00 p1.c
-rw-r--r--. 1 root root 66 6月   2 17:16 p2.c
[root@localhost 文件管理和目录管理]# 
```
## 利用find的递归式遍历目录的功能在文件中搜寻字符串
```
find src -name \*.c -exec grep -n -- --help {} /dev/null \;
```
在目录src中所有.c文件中查找--help字符串
grep的-n选项，--选项，/dev/null文件的作用
其他类似做法：将满足条件的文件转码或者对文件进行其他分析处理等

运行效果：
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── arg.c
├── hello
│   └── HelloWorld.c
├── hello2
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   ├── p1.c
│   └── p2.c
├── helloworld.c
└── ht.c

2 directories, 8 files
[root@localhost 文件管理和目录管理]# cat ht.c 
56
-1
-4
8
--help
--hello
--world
[root@localhost 文件管理和目录管理]# find . -name \*.c -exec grep -n -- --help {} /dev/null \;
./ht.c:5:--help
[root@localhost 文件管理和目录管理]# 
```
