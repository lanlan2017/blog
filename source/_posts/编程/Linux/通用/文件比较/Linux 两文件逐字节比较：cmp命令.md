---
title: Linux 两文件逐字节比较：cmp命令
categories: 
  - Linux
  - 通用
  - 文件比较
abbrlink: 99e4a22d
date: 2021-05-15 22:36:07
updated: 2022-04-04 00:51:45
---
# cmp命令
## 用法
```
cmp file1 file2
```
## 功能
- 逐字节比较两个文件是否完全相同
- 两个文件完全相同时，不给出任何提示
- 两个文件不同时，打印出第一个不同之处
- 在Windows中有类似的命令COMP

cmp命令用来比较两个文件是否有差异。
- 当相互比较的两个文件完全一样时，则该指令不会显示任何信息。
- 若发现有差异，预设会标示出第一个不通之处的字符和列数编号。
- 若不指定任何文件名称或是所给予的文件名为“-”，则cmp指令会从标准输入设备读取数据。

# cmp命令示例
## 查找两个文件之间的第一个差异的字节和行号
```
[root@localhost cmp]# cat -n a.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# cat -n b.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost cmp]# cmp a.txt b.txt 
a.txt b.txt 不同：第 31 字节，第 3 行
[root@localhost cmp]# 
```
## cmp -b：显示差异处的十进制字码和对应字符

<pre>
[root@localhostf cmp]&#35; cat -n a.txt 
     1	this is line a
     2	this is line b
     3	<mark>h</mark>elloworld!
     4	this is line d
[root@localhost cmp]&#35; cat -n b.txt 
     1	this is line a
     2	this is line b
     3	<mark>t</mark>his is line c
     4	this is line d
[root@localhost cmp]&#35; cmp -b a.txt b.txt 
a.txt b.txt 不同：第 3 行，第 31 字节为 150 <mark>h</mark> 164 <mark>t</mark>
[root@localhost cmp]&#35; 
</pre>

## cmp -l：显示出所有不一样的字节

<pre>
[root@localhost cmp]&#35; cat -n a.txt 
     1	this is line a
     2	this is line b
     3	helloworld!
     4	this is line d
[root@localhost cmp]&#35; cat -n b.txt 
     1	this is line a
     2	this is line b
     3	this is line c
     4	this is line d
[root@localhost cmp]&#35; cmp -l a.txt b.txt 
31 150 164
32 145 150
33 154 151
34 154 163
35 157  40
36 167 151
37 157 163
38 162  40
40 144 151
41  41 156
42  12 145
43 164  40
44 150 143
45 151  12
46 163 164
47  40 150
51 154 151
52 151 163
53 156  40
54 145 154
55  40 151
56 144 156
57  12 145
cmp：a.txt 已结束
</pre>

### cmp -l输出详解
cmp -l的输出有3列，
- 第1列表示两个文件开始不同的字节序号，也就是具体从第几个字节开始不同。
- 第2列表示文件a.txt当前的字节
- 第3行表示文件b.txt当前的字节

当然光看字节，我们难以理解，可以加上`-b`选项同时显示对应的字符：

<pre>
[root@localhost cmp]&#35; cmp -bl a.txt b.txt 
31 150 h    164 t
32 145 e    150 h
33 154 l    151 i
34 154 l    163 s
35 157 o     40  
36 167 w    151 i
37 157 o    163 s
38 162 r     40  
40 144 d    151 i
41  41 !    156 n
42  12 ^J   145 e
43 164 t     40  
44 150 h    143 c
45 151 i     12 ^J
46 163 s    164 t
47  40      150 h
51 154 l    151 i
52 151 i    163 s
53 156 n     40  
54 145 e    154 l
55  40      151 i
56 144 d    156 n
57  12 ^J   145 e
cmp：a.txt 已结束
[root@localhost cmp]&#35; 
</pre>

可以看到a.txt和b.txt这两个文件从第31个字节处开始不同：
- a.txt的第31个字节是150，对应的是字符h。
- b.txt的第31个字节是164，对应的是字符t。

## cmp -s：只比较不显示消息，以命令返回值表示
这样，如果文件相同，则给出值 0，如果不同，则给出值 1，或者如果发生错误，则给出值 2。该命令形式通常用在 shell 步骤中。例如：
```shell
if cmp  -s prog.c.bak prog.c
then
    echo 没有改变
fi
```
如果两个文件相同，则该部分的shell步骤显示 没有改变

### cmp -s用在shell编程中
测试文件：
```
[root@localhost cmp]# ls
a.txt  b.txt  c.txt  isSame.sh
[root@localhost cmp]# cat -n a.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# cat -n b.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost cmp]# cat -n c.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]#
```
shell程序：
```
[root@localhost cmp]# cat isSame.sh 
if cmp -s a.txt b.txt
then
    echo a.txt与b.txt相同
else
    echo a.txt与b.txt不同
fi

if cmp -s a.txt c.txt
then
        echo a.txt与c.txt相同
else
        echo a.txt与c.txt不同
fi

[root@localhost cmp]#
```

运行结果：
```
[root@localhost cmp]# ./isSame.sh 
a.txt与b.txt不同
a.txt与c.txt相同
[root@localhost cmp]# 
```


# windows的comp命令示例
```
G:\Desktop\test\CMD>dir
 驱动器 G 中的卷是 原来的C盘
 卷的序列号是 0C02-061D

 G:\Desktop\test\CMD 的目录

2021/05/15  22:50    <DIR>          .
2021/05/15  22:50    <DIR>          ..
2021/05/15  22:50                57 a.txt
2021/05/15  22:50                60 b.txt
               2 个文件            117 字节
               2 个目录 102,362,640,384 可用字节

G:\Desktop\test\CMD>comp a.txt b.txt
比较 a.txt 和 b.txt...
文件的大小不同。

是否要比较更多文件 (Y/N)? y
第一个比较文件的名称:b.txt
第二个比较文件的名称:a.txt
选项:
比较 b.txt 和 a.txt...
文件的大小不同。

是否要比较更多文件 (Y/N)? N

G:\Desktop\test\CMD>
```

# cmp参考手册
## tldr cmp
```
[root@localhost cmp]# tldr cmp

  cmp

  Compare two files byte by byte.
  More information: https://www.gnu.org/software/diffutils/manual/html_node/Invoking-cmp.html.

  - Find the byte and line number of the first difference between two files:
    cmp path/to/file1 path/to/file2

  - Find the byte number and differing bytes of every difference:
    cmp -l path/to/file1 path/to/file2

[root@localhost cmp]# 
```
## cmp --help
```
[root@localhost cmp]# cmp --help
用法: cmp [选项]... 文件1 [文件2 [SKIP1 [SKIP2]]]
逐字节比较两个文件。

The optional SKIP1 and SKIP2 specify the number of bytes to skip
at the beginning of each file (zero by default).

Mandatory arguments to long options are mandatory for short options too.
  -b, --print-bytes          print differing bytes
  -i, --ignore-initial=SKIP         skip first SKIP bytes of both inputs
  -i, --ignore-initial=SKIP1:SKIP2  skip first SKIP1 bytes of FILE1 and
                                      first SKIP2 bytes of FILE2
  -l, --verbose              output byte numbers and differing byte values
  -n, --bytes=LIMIT          compare at most LIMIT bytes
  -s, --quiet, --silent      suppress all normal output
      --help                 display this help and exit
  -v, --version              output version information and exit

SKIP 值可以加上以下的单位：
kB=1000、K=1024、MB=1000000、M=1048576、GB=1000000000、G=1073741824，
还有 T、P、E、Z、Y 如此类推。

If a FILE is '-' or missing, read standard input.
如果输入相同，则退出状态为 0；1 表示输入不同；2 表示有错误产生。

Report bugs to: bug-diffutils@gnu.org
GNU diffutils home page: <http://www.gnu.org/software/diffutils/>
General help using GNU software: <http://www.gnu.org/gethelp/>
[root@localhost cmp]# 
```
## man cmp
```
CMP(1)                                                                User Commands                                                               CMP(1)

NAME
       cmp - compare two files byte by byte

SYNOPSIS
       cmp [OPTION]... FILE1 [FILE2 [SKIP1 [SKIP2]]]

DESCRIPTION
       Compare two files byte by byte.

       The optional SKIP1 and SKIP2 specify the number of bytes to skip at the beginning of each file (zero by default).

       Mandatory arguments to long options are mandatory for short options too.

       -b, --print-bytes
              print differing bytes

       -i, --ignore-initial=SKIP
              skip first SKIP bytes of both inputs

       -i, --ignore-initial=SKIP1:SKIP2
              skip first SKIP1 bytes of FILE1 and first SKIP2 bytes of FILE2

       -l, --verbose
              output byte numbers and differing byte values

       -n, --bytes=LIMIT
              compare at most LIMIT bytes

       -s, --quiet, --silent
              suppress all normal output

       --help display this help and exit

       -v, --version
              output version information and exit

       SKIP  values  may  be  followed  by  the  following  multiplicative  suffixes:  kB  1000,  K 1024, MB 1,000,000, M 1,048,576, GB 1,000,000,000, G
       1,073,741,824, and so on for T, P, E, Z, Y.

       If a FILE is '-' or missing, read standard input.  Exit status is 0 if inputs are the same, 1 if different, 2 if trouble.

AUTHOR
       Written by Torbjorn Granlund and David MacKenzie.

REPORTING BUGS
       Report bugs to: bug-diffutils@gnu.org
       GNU diffutils home page: <http://www.gnu.org/software/diffutils/>
       General help using GNU software: <http://www.gnu.org/gethelp/>

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       diff(1), diff3(1), sdiff(1)

       The full documentation for cmp is maintained as a Texinfo manual.  If the info and cmp programs are properly installed at your site, the command

              info cmp

       should give you access to the complete manual.

diffutils 3.3                                                          August 2019                                                                CMP(1)
```
# 参考资料
<http://www.linuxso.com/command/cmp.html>
<https://www.runoob.com/linux/linux-comm-cmp.html>
<https://man.linuxde.net/cmp>
