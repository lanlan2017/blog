---
title: Linux od命令详解
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: 879659f3
date: 2021-04-24 10:53:19
updated: 2021-04-24 10:53:19
---
# Linux字节打印命令od
od octal dump 逐字节打印（ c, t c, t x1 t d1, t u1 选项）
## od --help
```
[root@localhost Linux_Test]# od --help
用法：od [选项]... [文件]...
　或：od [-abcdfilosx]... [文件] [[+]偏移量[.][b]]
　或：od --traditional [选项]... [文件] [[+]偏移量[.][b] [+][标签][.][b]]

将指定文件以八进制形式(默认)转储到标准输出。如果指定了多于一个的文件
参数，程序会自动将输入的内容整合为列表并以同样的形式输出。
如果没有指定文件，或指定文件为"-"，程序从标准输入读取数据。

If first and second call formats both apply, the second format is assumed
if the last operand begins with + or (if there are 2 operands) a digit.
An OFFSET operand means -j OFFSET.  LABEL is the pseudo-address
at first byte printed, incremented when dump is progressing.
For OFFSET and LABEL, a 0x or 0X prefix indicates hexadecimal;
suffixes may be . for octal and b for multiply by 512.

Mandatory arguments to long options are mandatory for short options too.
  -A, --address-radix=RADIX   output format for file offsets; RADIX is one
                                of [doxn], for Decimal, Octal, Hex or None
  -j, --skip-bytes=BYTES      skip BYTES input bytes first
  -N, --read-bytes=BYTES      limit dump to BYTES input bytes
  -S BYTES, --strings[=BYTES]  output strings of at least BYTES graphic chars;
                                3 is implied when BYTES is not specified
  -t, --format=TYPE           select output format or formats
  -v, --output-duplicates     do not use * to mark line suppression
  -w[BYTES], --width[=BYTES]  output BYTES bytes per output line;
                                32 is implied when BYTES is not specified
      --traditional           accept arguments in third form above
      --help        显示此帮助信息并退出
      --version        显示版本信息并退出


Traditional format specifications may be intermixed; they accumulate:
  -a   same as -t a,  select named characters, ignoring high-order bit
  -b   same as -t o1, select octal bytes
  -c   same as -t c,  select printable characters or backslash escapes
  -d   same as -t u2, select unsigned decimal 2-byte units
  -f    即 -t fF，指定浮点数对照输出格式
  -i    即 -t dl，指定十进制整数对照输出格式
  -l    即 -t dL，指定十进制长整数对照输出格式
  -o    即 -t o2，指定双字节单位八进制数的对照输出格式
  -s    即 -t d2，指定双字节单位十进制数的对照输出格式
  -x    即 -t x2，指定双字节单位十六进制数的对照输出格式


TYPE is made up of one or more of these specifications:
  a          named character, ignoring high-order bit
  c          printable character or backslash escape
  d[尺寸]    有符号十进制数，每个整形数占指定尺寸的字节
  f[尺寸]    浮点数，每个整形数占指定尺寸的字节
  o[尺寸]    八进制数，每个整形数占指定尺寸的字节
  u[尺寸]    无符号十进制数，每个整形数占指定尺寸的字节
  x[尺寸]    十六进制数，每个整形数占指定尺寸的字节

SIZE is a number.  For TYPE in [doux], SIZE may also be C for
sizeof(char), S for sizeof(short), I for sizeof(int) or L for
sizeof(long).  If TYPE is f, SIZE may also be F for sizeof(float), D
for sizeof(double) or L for sizeof(long double).

Adding a z suffix to any type displays printable characters at the end of
each output line.


BYTES is hex with 0x or 0X prefix, and may have a multiplier suffix:
  b    512
  KB   1000
  K    1024
  MB   1000*1000
  M    1024*1024
and so on for G, T, P, E, Z, Y.

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告od 的翻译错误
要获取完整文档，请运行：info coreutils 'od invocation'
[root@localhost Linux_Test]# 
```
# 示例
## od：八进制打印
```
[root@localhost Linux_Test]# od date_test.txt 
0000000 030062 030062 030055 026461 032062 030040 035064 032460
0000020 030072 005066 030062 030462 032057 031057 005065
0000036
[root@localhost Linux_Test]# cat date_test.txt 
2020-01-24 04:05:06
2021/4/25
[root@localhost Linux_Test]# 
```
## od -c：按字符打印
```
[root@localhost Linux_Test]# od -c date_test.txt 
0000000   2   0   2   0   -   0   1   -   2   4       0   4   :   0   5
0000020   :   0   6  \n   2   0   2   1   /   4   /   2   5  \n
0000036
[root@localhost Linux_Test]# 
```
## od -t x：单字节十六进制打印
```
[root@localhost Linux_Test]# od -x date_test.txt 
0000000 3032 3032 302d 2d31 3432 3020 3a34 3530
0000020 303a 0a36 3032 3132 342f 322f 0a35
0000036
[root@localhost Linux_Test]#
```
### od -t x1：单字节十六进制打印
```
[root@localhost Linux_Test]# od -t x1 date_test.txt 
0000000 32 30 32 30 2d 30 31 2d 32 34 20 30 34 3a 30 35
0000020 3a 30 36 0a 32 30 32 31 2f 34 2f 32 35 0a
0000036
[root@localhost Linux_Test]#
```
### od -t x2或者od -x：双字节十六进制打印
```
[root@localhost Linux_Test]# od -x date_test.txt 
0000000 3032 3032 302d 2d31 3432 3020 3a34 3530
0000020 303a 0a36 3032 3132 342f 322f 0a35
0000036
[root@localhost Linux_Test]#
```
## od -t d[尺寸]：有符号十进制数
这里的尺寸是一个整型数，每个整型数占指定尺寸的字节。
### od -t d1
```
[root@localhost Linux_Test]# od -t d1 date_test.txt |less
```
输出结果：
```
0000000   50   48   50   48   45   48   49   45   50   52   32   48   52   58   48   53
0000020   58   48   54   10   50   48   50   49   47   52   47   50   53   10
0000036
(END)
```
## od -t u[尺寸]：无符号十进制整数打印
```
[root@localhost Linux_Test]# od -t u1 date_test.txt |less
```
输出结果：
```
0000000  50  48  50  48  45  48  49  45  50  52  32  48  52  58  48  53
0000020  58  48  54  10  50  48  50  49  47  52  47  50  53  10
0000036
(END)
```
## echo 字符|od t x1：使用od命令查看字符的ASCII编码
### echo a|od -t o1：显示字符a的八进制ASCII编码
```
[root@localhost Linux_Test]# echo a|od -t o1
0000000 141 012
0000002
```
注意，第一个数141才是字符a的八进制ASCII编码，后面的012是换行符的ASCII编码。
### echo a|od -t d1：显示字符a的十进制ASCII编码
```
[root@localhost Linux_Test]# echo a|od -t d1
0000000   97   10
0000002
```
### echo a|od -t x1：显示字符a的十六进制ASCII编码
```
[root@localhost Linux_Test]# echo a|od -t x1
0000000 61 0a
0000002
[root@localhost Linux_Test]# 
```

## od结合more、less使用
