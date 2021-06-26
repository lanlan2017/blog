---
title: Linux 目录遍历的命令
categories:
  - 编程
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: 691c316
date: 2021-06-07 16:44:13
updated: 2021-06-07 16:44:13
---
# find:遍历目录树
## 功能
find命令从指定的查找范围开始，递归地查找子目录，**凡满足条件的文件或目录，执行规定的动作**
## 举例
```
find verl.d ver2.d -name '*.c' -print
```
范围：当前目录的子目录ver1.d 和ver2.d
条件：与名字*.c匹配。注:*.c应当用引号括起
动作：把查找到的文件的路径名打印出来

```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld
│           └── HelloWorld.c
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

5 directories, 6 files
[root@localhost 文件管理和目录管理]# find hello/ 文件管理/ -name '*.c' -print
hello/world/HelloWorld/HelloWorld.c
文件管理/HelloWorld2.c
文件管理/HelloWorld.c
文件管理/备份/p1.c
文件管理/备份/p2.c
[root@localhost 文件管理和目录管理]#
```

## find命令的特点
命令的特点
- 功能强，选项较多
- 递归式查找，提供了一种遍历目录树的手段
- find命令提供的灵活性：在“动作”中可以指定任何命令（也包括用户自己编写的处理程序），使得find成为一个任意处理命令可以借用来进行目录遍历的壳（类似awk对文本的逐行扫描，find对目录森林中的文件和目录逐个扫描）

# find关于条件的选项
## -name wildcard
wildcard表示**文件名通配符**。
`文件名`与`wildcard`匹配，注意：
- **必需的引号**
  - 这样shell不会对通配符进行替换
- **这里的“文件名”仅指路径名的最后一部分**
- 对通配符的解释由find完成

### 示例
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld
│           └── HelloWorld.c
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

5 directories, 6 files
[root@localhost 文件管理和目录管理]# find -name '*World*.c'
./hello/world/HelloWorld/HelloWorld.c
./文件管理/HelloWorld2.c
./文件管理/HelloWorld.c
[root@localhost 文件管理和目录管理]# 
```

## -regex pattern
整个路径名与正则表达式pattern匹配
### 示例
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld
│           └── HelloWorld.c
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

5 directories, 6 files
[root@localhost 文件管理和目录管理]# find -regex '.*[0-9]\.c'
./文件管理/HelloWorld2.c
./文件管理/备份/p1.c
./文件管理/备份/p2.c
[root@localhost 文件管理和目录管理]# 
```

## -type 文件类型
这里的文件类型使用一个字母来表示，下标是文件类型字母和对应的文件类型。

|find -type的选项|描述|
|:---|:---|
|f|普通文件|
|d|目录|
|l|符号连接文件|
|c|字符设备文件|
|b|块设备文件|
|p|管道文件|

### 示例
当前目录结构：
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld
│           └── HelloWorld.c
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

5 directories, 6 files
[root@localhost 文件管理和目录管理]#
```
#### find找出所有的子目录
遍历当前目录，找出所有的子目录。
```
[root@localhost 文件管理和目录管理]# find -type d
.
./hello
./hello/world
./hello/world/HelloWorld
./文件管理
./文件管理/备份
[root@localhost 文件管理和目录管理]#
```
#### find找出所有的普通文件：
```
[root@localhost 文件管理和目录管理]# find -type f
./hello/world/HelloWorld/HelloWorld.c
./ht.c
./文件管理/HelloWorld2.c
./文件管理/HelloWorld.c
./文件管理/备份/p1.c
./文件管理/备份/p2.c
[root@localhost 文件管理和目录管理]# 
```
## -size ±n单位
### 帮助文档：
```
-size n[cwbkMG]
        File uses n units of space.  The following suffixes can be used:

        `b'    for 512-byte blocks (this is the default if no suffix is used)

        `c'    for bytes

        `w'    for two-byte words

        `k'    for Kilobytes (units of 1024 bytes)

        `M'    for Megabytes (units of 1048576 bytes)

        `G'    for Gigabytes (units of 1073741824 bytes)

        The size does not count indirect blocks, but it does count blocks in sparse files that are not actually allocated.  Bear in mind that  the
        `%k'  and  `%b'  format  specifiers of -printf handle sparse files differently.  The `b' suffix always denotes 512-byte blocks and never 1
        Kilobyte blocks, which is different to the behaviour of -ls.
```
指定文件大小（大于+，等于，小于-）

|find -size单位标识符|大小|
|:---|:---|
|c|字节|
|w|双字节|
|k|千字节|
|M|兆字节|
|G|千兆字节|

### 示例
当前目录下各个文件的大小：
```
[root@localhost 文件管理和目录管理]# tree -Nh
.
├── [4.0K]  hello
│   └── [4.0K]  world
│       └── [4.0K]  HelloWorld
│           └── [   0]  HelloWorld.c
├── [  34]  ht.c
└── [4.0K]  文件管理
    ├── [  66]  HelloWorld2.c
    ├── [  66]  HelloWorld.c
    └── [4.0K]  备份
        ├── [  66]  p1.c
        └── [  66]  p2.c

5 directories, 6 files
[root@localhost 文件管理和目录管理]# 
```
#### 查找大小为66个字节的文件：
```
[root@localhost 文件管理和目录管理]# find -size 66c
./文件管理/HelloWorld2.c
./文件管理/HelloWorld.c
./文件管理/备份/p1.c
./文件管理/备份/p2.c
[root@localhost 文件管理和目录管理]# 
```
使用的单位为`w`,`w`是双字节的意思。33w也就是66字节
```
[root@localhost 文件管理和目录管理]# find -size 33w
./文件管理/HelloWorld2.c
./文件管理/HelloWorld.c
./文件管理/备份/p1.c
./文件管理/备份/p2.c
[root@localhost 文件管理和目录管理]# 
```
#### 查找大小小于66字节的文件
```
[root@localhost 文件管理和目录管理]# find -size -66c
./hello/world/HelloWorld/HelloWorld.c
./ht.c
[root@localhost 文件管理和目录管理]# 
```
#### 查找大于66字节的文件
```
[root@localhost 文件管理和目录管理]# find -size +66c
.
./hello
./hello/world
./hello/world/HelloWorld
./文件管理
./文件管理/备份
[root@localhost 文件管理和目录管理]# 
```

## -mtime ±ndays
文件最近修改时间
### 帮助文档
```
-mmin n
        对文件数据的最近一次修改是在 n 分钟之前。

-mtime n
        对文件数据的最近一次修改是在 n*24 小时之前。
```
### 示例
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld
│           └── HelloWorld.c
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

5 directories, 6 files
[root@localhost 文件管理和目录管理]# ls -l
总用量 12
drwxr-xr-x. 3 root root 4096 6月   7 16:17 hello
-rw-r--r--. 1 root root   34 6月   3 17:33 ht.c
drwxr-xr-x. 3 root root 4096 6月   2 17:28 文件管理
[root@localhost 文件管理和目录管理]# ls -l 文件管理/*
-rw-r--r--. 1 root root   66 6月   2 17:17 文件管理/HelloWorld2.c
-rw-r--r--. 1 root root   66 6月   2 17:17 文件管理/HelloWorld.c

文件管理/备份:
总用量 8
-rw-r--r--. 1 root root 66 6月   2 17:00 p1.c
-rw-r--r--. 1 root root 66 6月   2 17:16 p2.c
[root@localhost 文件管理和目录管理]# ls -l hello/world/*
总用量 0
-rw-r--r--. 1 root root 0 6月   7 16:49 HelloWorld.c
[root@localhost 文件管理和目录管理]# date
2021年 06月 07日 星期一 23:46:44 CST
[root@localhost 文件管理和目录管理]#
```
查找6月3日(4天之前)的文件
```
[root@localhost 文件管理和目录管理]# find -mtime 4
./ht.c
[root@localhost 文件管理和目录管理]# ls -l
总用量 12
drwxr-xr-x. 3 root root 4096 6月   7 16:17 hello
-rw-r--r--. 1 root root   34 6月   3 17:33 ht.c
drwxr-xr-x. 3 root root 4096 6月   2 17:28 文件管理
[root@localhost 文件管理和目录管理]#
```
查找6月2日（5天之前）的文件：
```
[root@localhost 文件管理和目录管理]# find -mtime 5
./文件管理
./文件管理/HelloWorld2.c
./文件管理/HelloWorld.c
./文件管理/备份
./文件管理/备份/p1.c
./文件管理/备份/p2.c
[root@localhost 文件管理和目录管理]# 
```
## -newer file
文件最近修改时间比file的还晚的文件。
当前文件目录下和子目录下的文件的最后修改时间：
```
[root@localhost 文件管理和目录管理]# ls -l *
-rw-r--r--. 1 root root    0 6月   7 16:49 HelloWorld.c
-rw-r--r--. 1 root root   34 6月   3 17:33 ht.c

文件管理:
总用量 16
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld2.c
-rw-r--r--. 1 root root 66 6月   2 17:17 HelloWorld.c
-rw-r--r--. 1 root root 66 6月   2 17:00 p1.c
-rw-r--r--. 1 root root 66 6月   2 17:16 p2.c
[root@localhost 文件管理和目录管理]#
```
查找比p2.c修改时间晚的文件：
```
[root@localhost 文件管理和目录管理]# find -newer 文件管理/p2.c 
.
./HelloWorld.c
./ht.c
./文件管理
./文件管理/HelloWorld2.c
./文件管理/HelloWorld.c
[root@localhost 文件管理和目录管理]# 
```

## 其它条件选项
（文件属性字段可用来对遍历到的目标进行筛选，查阅find手册）
- 指定i节点号`-inum`
- 可指定文件主`-user`，`-nouser`
- 可指定用户组`-group`，`-nogroup`
- 指定link数`-links`
- 指定路径深度`-depth`
- 指定文件的访问权限`-perm`

## 复合条件
可以用`()` `–o` `!`等表示多条件的“与”，“或”，“非”

# find关于动作的选项
## -print
打印查找的文件的路径名
## -exec
- 对查找到的目标执行某一命令
- 在`-exec`及随后的分号之间的内容作为一条命令
在这命令的命令参数中，`{}`代表遍历到的目标文件的路径名

## -ok
- 与`-exec`类似，只是对查找到符合条件的目标执行一个命令前需要经过操作员确认。