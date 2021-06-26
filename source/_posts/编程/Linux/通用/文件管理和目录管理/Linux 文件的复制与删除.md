---
title: Linux 文件的复制与删除
categories:
  - 编程
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: d794a6a2
date: 2021-06-02 16:15:15
updated: 2021-06-02 16:15:15
---
# cp: 拷贝文件
## 格式1：cp file1 file2
第一种格式中：
- file2不存在，则创建file2；
- file2存在且是文件，则覆盖file2；
- file2存在且是目录，则按格式二处理

### 示例
#### file2不存在
```
[root@localhost 文件管理和目录管理]# ls
p1.c
[root@localhost 文件管理和目录管理]# cat p1.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# cp p1.c p2.c
[root@localhost 文件管理和目录管理]# ls
p1.c  p2.c
[root@localhost 文件管理和目录管理]# cat p2.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]#
```
#### file2存在
```
[root@localhost 文件管理和目录管理]# ls
p1.c  p2.c
[root@localhost 文件管理和目录管理]# echo line 1 in p2.c >p2.c 
[root@localhost 文件管理和目录管理]# cat p2.c 
line 1 in p2.c
[root@localhost 文件管理和目录管理]# cat p1.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# cp p1.c p2.c 
cp：是否覆盖"p2.c"？ y
[root@localhost 文件管理和目录管理]# cat p2.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# 
```

## 格式2：cp file1 file2 ... filen dir
其中file1，...，filen为文件名，dir为已有目录名

第二种格式中：dir必须已经存在并且是一个目录

### 示例
```
cp a.c a.bak
cp a.c b.c backup.d

[root@localhost 文件管理和目录管理]# ls
p1.c  p2.c
[root@localhost 文件管理和目录管理]# cp p*.c backup.d
cp: 目标"backup.d" 不是目录
[root@localhost 文件管理和目录管理]# mkdir backup.d
[root@localhost 文件管理和目录管理]# cp p*.c backup.d
[root@localhost 文件管理和目录管理]# ls *
p1.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]# 
```


## 带文件通配符星号*的情况
例: 
cp *.c backup.d
- 与Windows命令COPY *.C BAK.D执行结果相同，过程不同
- UNIX中实际执行cp a1.c a2.c b1.c b2.c backup.d

### 从备份目录拷贝回当前目录
#### 当前目录和备份目录结构
```
[root@localhost 文件管理和目录管理]# ls *
p1.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]#
```
#### 备份目录下的文件的内容
```
[root@localhost 文件管理和目录管理]# cat backup.d/p1.c
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# cat backup.d/p2.c
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]#
```
#### 当前目录下的文件内容
```
[root@localhost 文件管理和目录管理]# cat p1.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# cat p2.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# 
```
#### 修改当前目录下的p2.c文件的内容
```
[root@localhost 文件管理和目录管理]# echo this is line 1 in p2.c >p2.c 
[root@localhost 文件管理和目录管理]# cat p2.c
this is line 1 in p2.c
[root@localhost 文件管理和目录管理]# 
```
#### 使用备份目录下的文件覆盖当前目录下的同名文件
##### 错误做法 
```
cp backup.d/p*.c
```
使用通配符*的时候需要注意，命令执行的是经过shell替换之后的命令，也就是实际执行的是
```
cp backup.d/p1.c backup.d/p2.c
```
结果：backup.d目录下文件p1.c将覆盖掉p2.c
运行过程：
```
[root@localhost 文件管理和目录管理]# ls *
p1.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]# cat p2.c 
this is line 1 in p2.c
[root@localhost 文件管理和目录管理]# cat backup.d/p2.c 
#include <stdio.h>

void main(){
    printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# cp backup.d/p*.c 
cp：是否覆盖"backup.d/p2.c"？ n
[root@localhost 文件管理和目录管理]#
```
##### 正确做法
将这两个文件拷贝回当前目录下的正确用法：
```
cp backup.d/p*.c  .
```
运行过程：
```
[root@localhost 文件管理和目录管理]# ls *
p1.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]# cat p2.c 
this is line 1 in p2.c
[root@localhost 文件管理和目录管理]# cat backup.d/p2.c 
#include <stdio.h>

void main(){
	printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# cp backup.d/p*.c .
cp：是否覆盖"./p1.c"？ y
cp：是否覆盖"./p2.c"？ y
[root@localhost 文件管理和目录管理]# cat p2.c 
#include <stdio.h>

void main(){
	printf("%s\n","HelloWolrd!");
}
[root@localhost 文件管理和目录管理]# 
```

# mv: 移动文件
## 格式
```
mv file1 file2
mv file1 file2 ... filen dir
mv dir1 dir2
```
## 功能
### 重命名文件或目录
使用mv命令可以将文件和目录改名
#### 重命名文件
```
[root@localhost 文件管理和目录管理]# ls *
p1.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]# mv p1.c HelloWorld.c
[root@localhost 文件管理和目录管理]# ls *
HelloWorld.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]#
```
#### 重命名目录
```
[root@localhost 文件管理和目录管理]# ls *
HelloWorld.c  p2.c

backup.d:
p1.c  p2.c
[root@localhost 文件管理和目录管理]# mv backup.d/ 备份
[root@localhost 文件管理和目录管理]# ls *
HelloWorld.c  p2.c

备份:
p1.c  p2.c
[root@localhost 文件管理和目录管理]# 
```
### 将一个目录下的文件和子目录移动到另一个目录下
#### 一个目录的结构
```
[root@localhost Linux_Test]# ls
a.txt  b.txt  cat  cmp  c.txt  date  d.txt  less  ls  more  ps  sed  sort  tr  uniq  vi  wc  文件管理和目录管理  文件名和文件通配符  正则表达式
[root@localhost Linux_Test]# ls 文件管理和目录管理/*
文件管理和目录管理/HelloWorld2.c  文件管理和目录管理/HelloWorld.c

文件管理和目录管理/备份:
p1.c  p2.c
[root@localhost Linux_Test]#
```
#### 创建一个新目录
```
[root@localhost Linux_Test]# mkdir 文件管理和目录管理2
[root@localhost Linux_Test]# ls
a.txt  cat  c.txt  d.txt  ls    ps   sort  uniq  wc                  文件管理和目录管理2  正则表达式
b.txt  cmp  date   less   more  sed  tr    vi    文件管理和目录管理  文件名和文件通配符
[root@localhost Linux_Test]#
```
#### 移动一个目录下的所有文件以及子目录 到 另一个目录
```
[root@localhost Linux_Test]# mv 文件管理和目录管理/* 文件管理和目录管理2
[root@localhost Linux_Test]# ls 文件管理和目录管理/
[root@localhost Linux_Test]# ls 文件管理和目录管理2/*
文件管理和目录管理2/HelloWorld2.c  文件管理和目录管理2/HelloWorld.c

文件管理和目录管理2/备份:
p1.c  p2.c
[root@localhost Linux_Test]# 
```
### 移动一个目录到另一个目录之中
当前目录结构
```
[root@localhost Linux_Test]# ls
a.txt  cat  c.txt  d.txt  ls    ps   sort  uniq  wc                  文件管理和目录管理2  正则表达式
b.txt  cmp  date   less   more  sed  tr    vi    文件管理和目录管理  文件名和文件通配符
[root@localhost Linux_Test]# tree -N 文件管理和目录管理
文件管理和目录管理

0 directories, 0 files
[root@localhost Linux_Test]# tree -N 文件管理和目录管理2/
文件管理和目录管理2/
├── HelloWorld2.c
├── HelloWorld.c
└── 备份
    ├── p1.c
    └── p2.c

1 directory, 4 files
[root@localhost Linux_Test]# 
```
#### 移动一个目录到另一个目录之中
```
[root@localhost Linux_Test]# mv 文件管理和目录管理2/ 文件管理和目录管理/
[root@localhost Linux_Test]# ls
a.txt  b.txt  cat  cmp  c.txt  date  d.txt  less  ls  more  ps  sed  sort  tr  uniq  vi  wc  文件管理和目录管理  文件名和文件通配符  正则表达式
[root@localhost Linux_Test]# tree -N 文件管理和目录管理/
文件管理和目录管理/
└── 文件管理和目录管理2
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

2 directories, 4 files
[root@localhost Linux_Test]# 
```
mv dir1 dir2 两种执行情况（同文件系统，不同文件系统）

# rm: 删除文件
## 命令格式
```
rm file1 file2 ... filen
```
## 例
```
rm core a.out
rm *.o *.tmp
```
错误写法：
```
rm * .bak
```
会删除当前目录下的所有的文件，最后尝试删除.bak文件，如果有.bak这个文件的话，已经包含在通配符*里面了，也就是被删掉了，此时再想删除.bak，系统会报错，说.bak文件不存在。
## 选项

|选项|功能|
|:---|:---|
|-r|递归地(Recursive)删除实参表中的目录，也就是**删除一整棵目录树**。|
|-i|每删除一个文件前需要操作员确认(Inform)|
|-f|强迫删除(Force)。只读文件也被删除并且无提示|

## 其它问题
在运行的可执行程序文件不能被删除

# 显式区分命令选项和处理对象
## 问题
设当前目录下只有a，b，c三个文件
执行
```
rm -i
```
只提供选项，未指定任何文件，命令格式错
执行
```
ls>-i
```
生成文件-i(符合文件的命名规则)
执行
```
rm -i
```
不能删除文件-i
执行：
```
rm *
```
shell会替换成：
```
rm -i a b c
```
这里的-i会解释成选项，而不是文件，rm会按选项-i的方式处理，而不会删除文件-i。
执行：
```
cat *
```
shell会替换成：
```
cat -i a b c
```
执行：
```
ls *
```
shell会替换成：
```
ls -i a b c
```
## 解决方法
许多Linux命令(如cp，ls，mv，rm，cat，grep，set等)用`--`显式地标志命令行选项的结束，识别以-开头的处理对象。如:
执行：
```
rm -- -i
```
即可删除文件-i
例如，我们想在文件ht.c中查找`-1`这个字符串，你可能输入如下命令：
```
grep -1 ht.c
```
这种情况下，grep可能认为-1，是个选项。
此时你可以使用`--`区分选项和参数：
```
[root@localhost 文件管理和目录管理]# cat ht.c 
56
35
-1
-4
-5
8
[root@localhost 文件管理和目录管理]# grep -1 ht.c 
^C
[root@localhost 文件管理和目录管理]# grep -- -1 ht.c 
-1
[root@localhost 文件管理和目录管理]# 
```
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/programming/Linux/general/FileManagementAndDirectoryManagementFile/CopyAndDeletion/1.png)

如果你想在文件中查找`--help`这个字符串,你输入如下命令：
```
grep --help *.c
```
grep会吧--help解释为选项。而达不到效果。
```
[root@localhost 文件管理和目录管理]# cat ht.c 
56
-1
-4
8
--help
--hello
--world
[root@localhost 文件管理和目录管理]# grep --help *.c
用法: grep [选项]... PATTERN [FILE]...
在每个 FILE 或是标准输入中查找 PATTERN。
默认的 PATTERN 是一个基本正则表达式(缩写为 BRE)。
......
如果有任意行被匹配，那退出状态为 0，否则为 1；
如果有错误产生，且未指定 -q 参数，那退出状态为 2。

请将错误报告给: bug-grep@gnu.org
GNU Grep 主页: <http://www.gnu.org/software/grep/>
GNU 软件的通用帮助: <http://www.gnu.org/gethelp/>
[root@localhost 文件管理和目录管理]# 
```
此时输入
```
grep -- --help *.c
```
可以达到效果：
```
[root@localhost 文件管理和目录管理]# ls
ht.c  文件管理和目录管理2
[root@localhost 文件管理和目录管理]# cat ht.c 
56
-1
-4
8
--help
--hello
--world
[root@localhost 文件管理和目录管理]# grep -- --help *.c
--help
[root@localhost 文件管理和目录管理]# 
```


<!-- Blog/programming/Linux/general/FileManagementAndDirectoryManagementFile/CopyAndDeletion -->