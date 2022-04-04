---
title: Linux 目录管理
categories: 
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: 8cd20aa2
date: 2021-06-03 17:41:46
updated: 2022-04-04 00:51:45
---
# 路径名
## 文件.与..
在目录表中确实有`.`和`..`这两个文件，这两个目录项由系统创建和删除。
```
[root@localhost 文件管理和目录管理]# ls -a
.  ..  ht.c  文件管理和目录管理2
[root@localhost 文件管理和目录管理]#
```

## 主目录(Home Directory)
- 每个用户都有自己独立的主目录
- 用env命令查环境变量HOME的值

```
[root@localhost 文件管理和目录管理]# env|grep 'HOME'
JRE_HOME=/opt/java/jdk1.8.0_281/jre
JAVA_HOME=/opt/java/jdk1.8.0_281
HOME=/root
CLASSPATH=.:JAVA_HOME/lib:JRE_HOME/lib:
[root@localhost 文件管理和目录管理]# 
```
## 绝对路径名与相对路径名
linux的路径分量分隔符用斜线/，而不是反斜线\
以斜线开头的是绝对路径，例如
```
/home/stud/liu
```
没有斜线开头的则是从当前目录开始的相对路径：
```
test/case1/conf
```


## 当前工作目录
当前工作目录是**进程属性**的一部分，每进程一个。

# 打印/改变当前目录
## pwd命令：打印当前工作目录
print working directory
## cd命令：改变当前工作目录
(Change Directory)

```
cd /usr/include
```
斜线前必须有空格：
```
cd /
```
```
cd ..
```
cd命令无实参，直接输入cd回车:
```
cd
```
- 在Windows中，打印当前工作目录
- 
```
G:\Desktop\test\CMD>cd
G:\Desktop\test\CMD
G:\Desktop\test\CMD>
```
- 在UNIX中，回到用户的主目录(Home Directory)
- 
```
[root@localhost 文件管理和目录管理]# cd
[root@localhost ~]# 
```

### 注意
**cd是shell的一个内部命令**

# 创建/删除目录
## 创建目录mkdir
例：
```
mkdir sun/work.d
```
mkdir除创建目录外，系统自动建立文件.与..
### 选项-p
自动创建路径中不存在的目录。
例如：
```
mkdir database/2019/09/04/log
```
#### 示例
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

2 directories, 5 files
[root@localhost 文件管理和目录管理]# mkdir hello/world/HelloWorld
mkdir: 无法创建目录"hello/world/HelloWorld": 没有那个文件或目录
[root@localhost 文件管理和目录管理]# mkdir -p hello/world/HelloWorld
[root@localhost 文件管理和目录管理]# tree -N
.
├── hello
│   └── world
│       └── HelloWorld
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

5 directories, 5 files
[root@localhost 文件管理和目录管理]# 
```
## 删除目录rmdir
例：
```
rmdir sun/work.d
```
要求被删除的目录除.与..外无其它文件或目录
其他命令：
```
rm -r sun/work.d
```
# cp: 复制目录
## cp命令选项–r，递归地复制一个目录
```
cp -r dir1 dir2
```
根据dir2是否存在，执行结果有差异：
- 若dir2不存在，则新建子目录dir2，把dir1下内容拷入dir2下
- 若dir2已存在，则dir2下新建子目录dir1，把dir1下内容拷入dir2/dir1下

### cp -r目标目录不存在的情况
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
└── 文件管理
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

2 directories, 5 files
[root@localhost 文件管理和目录管理]# cp -r 文件管理/ 文件管理2
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理2
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

4 directories, 9 files
[root@localhost 文件管理和目录管理]# 
```
### cp -r目标目录已存在的情况
```
[root@localhost 文件管理和目录管理]# rm -rf 文件管理2/
[root@localhost 文件管理和目录管理]# mkdir 文件管理3
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3

3 directories, 5 files
[root@localhost 文件管理和目录管理]# cp -r 文件管理/ 文件管理3
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        ├── HelloWorld.c
        └── 备份
            ├── p1.c
            └── p2.c

5 directories, 9 files
[root@localhost 文件管理和目录管理]# 
```
## cp –v：冗长(verbose)方式
复制目录时实时列出正在复制的文件的名字
## cp -u: 增量拷贝
选项–u，增量拷贝(update)，便于备份目录
- 根据文件的时戳，不拷贝相同的或者过时的版本的文件，以提高速度
- dir1和dir2不慎颠倒位置，不会出现灾难性后果
- Windows中类似功能的命令`XCOPY`，选项`/D`可以用来实现增量拷贝(Date)

### 示例
当前目录结构
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        ├── HelloWorld.c
        └── 备份
            ├── p1.c
            └── p2.c

5 directories, 9 files
[root@localhost 文件管理和目录管理]#
```
删除子目录文件管理3上的部分目录：
```
[root@localhost 文件管理和目录管理]# rm -rf 文件管理3/文件管理/备份/
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        └── HelloWorld.c

4 directories, 7 files
[root@localhost 文件管理和目录管理]#
```
递归增量复制：
```
[root@localhost 文件管理和目录管理]# cp -r -u 文件管理/ 文件管理3
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        ├── HelloWorld.c
        └── 备份
            ├── p1.c
            └── p2.c

5 directories, 9 files
[root@localhost 文件管理和目录管理]#
```
需要注意的是-u只会比较一级子目录下的不同，不会递归子目录树上的不同，如果没有搭配-r参数一起使用的话，可能会达不到效果：
```
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        ├── HelloWorld.c
        └── 备份
            ├── p1.c
            └── p2.c

5 directories, 9 files
[root@localhost 文件管理和目录管理]# rm -rf 文件管理3/文件管理/备份/
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        └── HelloWorld.c

4 directories, 7 files
[root@localhost 文件管理和目录管理]# cp -u 文件管理/ 文件管理3
cp: 略过目录"文件管理/"
[root@localhost 文件管理和目录管理]# tree -N
.
├── ht.c
├── 文件管理
│   ├── HelloWorld2.c
│   ├── HelloWorld.c
│   └── 备份
│       ├── p1.c
│       └── p2.c
└── 文件管理3
    └── 文件管理
        ├── HelloWorld2.c
        └── HelloWorld.c

4 directories, 7 files
[root@localhost 文件管理和目录管理]#
```

## 复制目录示例
将目录work.d复制为bak.d
若bak.d不存在，执行：
```
cp -r work.d bak.d
```
若bak.d已存在，执行：
```
cp -r work.d/* bak.d
```
### 增量拷贝
将work.d中的内容增量拷贝到备份目录bak.d中
```
cp -ruv work.d/* bak.d
```
# 命令touch
将文件的最后一次修改时间设置为当前时间，但不修改文件内容。例如：
```
touch *.[ch]
```
# rsync:数据备份工具（增量拷贝工具）
## rsync功能
远程同步`remote sync`，可以镜像整个目录树
- 问题
  - 网络中两个主机A和B，都有同一个二进制的大型数据文件big.dat，文件在A上做了改变成为了新版本的big.dat，需要让B也得到新文件
- 优化的流程，增量文件传输，效率高
  - rsync用一精巧的算法，将文件分块，在两主机间传播数据块的hash值，据此推出两版本文件之间区别，使得网络只传输文件的增、删、改部分
- Windows下的也有类似工具
