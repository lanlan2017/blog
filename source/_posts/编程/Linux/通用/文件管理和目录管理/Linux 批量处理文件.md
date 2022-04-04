---
title: Linux 批量处理文件
categories: 
  - Linux
  - 通用
  - 文件管理和目录管理
abbrlink: 8c94a702
date: 2021-06-15 17:07:33
updated: 2022-04-04 00:51:45
---
# 问题
遍历当前目录`.`的所有后缀为.c文件，查找文件中带有--help的内容：
```
find . -name \*.c -exec grep -n -- --help {} /dev/null \;
```
借助find的“壳”功能去遍历目录，对遍历到的每个符合条件的文件执行grep命令。

缺点：效率低，因为每个命中的对象都需要执行grep命令：
对于find命令查找到的文件，创建一个grep进程来处理这个文件，完成任务后grep进程消亡；
然后find命令找到下一个文件，再创建一个grep进程来处理。

也就是说对于find找到n个文件，就需要创建n个grep进程来处理这n个文件。
## 示例
### 项目结构
```
[root@localhost 批量处理文件]# tree -N
.
├── a
│   └── HelloWorld.c
├── b
│   └── WorldHello.c
├── hello.c
├── other.txt
└── world.c

2 directories, 5 files
[root@localhost 批量处理文件]# 
```
#### 各文件内容
```
[root@localhost 批量处理文件]# cat hello.c 
a
b
c
d
--help
-hello
--hello
[root@localhost 批量处理文件]# cat world.c 
1
2
3
-world
--help
--world
[root@localhost 批量处理文件]# cat a/HelloWorld.c 
a
1
b
2
helloworld
-helloworld
--helloworld
helloworld8
[root@localhost 批量处理文件]# cat b/WorldHello.c 
1
a
2
b
WorldHello
--help
--worldhello
[root@localhost 批量处理文件]# cat other.txt 
非.c文件
xxx
yyy
zzz
--help
[root@localhost 批量处理文件]# 

```
在当前目录下的所有.c文件中查找--help字符串：
```
[root@localhost 批量处理文件]# find . -name \*.c -exec grep -n -- --help {} /dev/null \;
./hello.c:5:--help
./world.c:5:--help
./b/WorldHello.c:6:--help
[root@localhost 批量处理文件]# 
```
grep -nr -- --help *.c

## grep -r
grep命令也提供了-r选项，可以递归地搜索子目录下的文件，

但是对于如下命令：
```
grep -nr -- --help *.c 
```
达不到效果，因为这里的子目录的名字为`a/`、`b/`，这些子目录的名字不能被*.c匹配。
```
[root@localhost 批量处理文件]# grep -nr -- --help *.c 
hello.c:5:--help
world.c:5:--help
[root@localhost 批量处理文件]# 
```
而命令：
```
grep -nr -- --help *
```
倒是可以检索出文件中带`--help`的内容，但是这样是检索所有的文件，不是单独的检索`.c`文件，输出结果会被无用的信息干扰，甚至淹没。
```
[root@localhost 批量处理文件]# grep -nr -- --help *
b/WorldHello.c:6:--help
hello.c:5:--help
other.txt:5:--help
world.c:5:--help
[root@localhost 批量处理文件]# 
```
所以还是应该使用find精确筛选的功能。然后再通过grep搜索这些文件的内容。
## 利用find与xargs的组合
对于上述命令：
```
find . -name \*.c -exec grep -n -- --help {} /dev/null \;
```
如果能把
```
find . -name \*.c -print
```
的输出结果，也就是生成的文件名列表追加在下列grep命令后面就可以好了。
```
grep -n -- --help filelist
```
这样我们就只需要执行一次grep命令，处理这些文件列表即可。不需要对一个文件，的执行一次grep命令。

命令xargs可以用来完成这个工作：
```
find . -name \*.c -print | xargs grep -n -- --help
```
xargs命令把标准输入追加到它的参数列表后面，也就是上述`grep -n -- --help`的后面，再作为一个命令来执行。这样利用find精确筛选，利用grep批量处理文件，提高效率。
```
[root@localhost 批量处理文件]# find . -name \*.c -print | xargs grep -n -- --help
./hello.c:5:--help
./world.c:5:--help
./b/WorldHello.c:6:--help
[root@localhost 批量处理文件]# 
```
## 验证使用xargs可以节省时间
执行
```
find . -name \*.c -print | xargs grep -n -- --help
```
需要的时间：
```
[root@localhost 批量处理文件]# time find . -name \*.c -print | xargs grep -n -- --help
./hello.c:5:--help
./world.c:5:--help
./b/WorldHello.c:6:--help

real    0m0.022s
user    0m0.010s
sys    0m0.000s
[root@localhost 批量处理文件]# 
```
执行
```
find . -name \*.c -exec grep -n -- --help {} /dev/null \;
```
需要的时间：
```
[root@localhost 批量处理文件]# time find . -name \*.c -exec grep -n -- --help {} /dev/null \;
./hello.c:5:--help
./world.c:5:--help
./b/WorldHello.c:6:--help

real    0m0.044s
user    0m0.000s
sys    0m0.010s
[root@localhost 批量处理文件]# 
```
可以看到使用xargs确实节省和时间。

# xargs：将标准输入组织成命令执行
- 将标准输入构造为命令的命令行参数
- 如果标准输入的数据量很大，xargs指定的处理程序会启动多个进程运行，每个进程处理一批。
- 可以使用xargs的-n选项指定每批处理多少个
- xargs经常与find配合使用，也可以与其它命令组合使用

# xargs:构造参数列表并运行命令
解决shell文件名生成时，因为文件太多，缓冲区空间受限而文件名展开失败的问题

对于命令：
```
rm -f *.dat
```
如果匹配的文件很多，则文件名*.dat可能会展开失败，
此时可以使用下面的命令
```
ls | grep ".dat$" | xargs rm -f
```
find命中目录名因删除目录导致目录遍历过程遇到麻烦
```
find . -name CVS -exec rm -rf {} \;
```
改为：
```
find . -name CVS -print | xargs rm -rf
```
