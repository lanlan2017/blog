---
title: Linux sort命令
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 处理文本文件
abbrlink: 408c391b
date: 2021-04-24 19:30:50
updated: 2021-04-24 19:30:50
---
# Linux sort命令：对文本文件的行排序
sort 是 Linux 的排序命令，而且可以依据不同的数据类型来进行排序。sort 将文件的每一行作为一个单位，相互比较。比较原则是**从首字符向后，依次按 ASCII 码值进行比较**，最后将它们按**升序**输出。

Sort是用于对单个或多个文本文件内容进行排序的Linux程序。Sort命令以空格作为字段分隔符，将一行分割为多个关键字对文件进行排序。需要注意的是除非你将输出重定向到文件中，否则Sort命令并不对文件内容进行实际的排序(即文件内容没有修改)，只是将文件内容按有序输出。

## sort选项:
-f：忽略大小写；
-b：忽略每行前面的空白部分；
-n：以数值型进行排序，默认使用字符串排序；
-r：反向排序；
-u：删除重复行。就是 uniq 命令；
-t：指定分隔符，默认分隔符是制表符；
-k [n,m]：按照指定的字段范围排序。从第 n 个字段开始，到第 m 个字（默认到行尾）；

sort 命令默认是用每行开头的第一个字符来进行排序的，比如：

## sort --help
```
[root@localhost Linux_Test]# sort --help
用法：sort [选项]... [文件]...
　或：sort [选项]... --files0-from=F
Write sorted concatenation of all FILE(s) to standard output.

Mandatory arguments to long options are mandatory for short options too.
排序选项：

  -b, --ignore-leading-blanks    忽略前导的空白区域
  -d, --dictionary-order    只考虑空白区域和字母字符
  -f, --ignore-case        忽略字母大小写
  -g, --general-numeric-sort  compare according to general numerical value
  -i, --ignore-nonprinting    consider only printable characters
  -M, --month-sort            compare (unknown) < 'JAN' < ... < 'DEC'
  -h, --human-numeric-sort    使用易读性数字(例如： 2K 1G)
  -n, --numeric-sort        根据字符串数值比较
  -R, --random-sort        根据随机hash 排序
      --random-source=文件    从指定文件中获得随机字节
  -r, --reverse            逆序输出排序结果
      --sort=WORD        按照WORD 指定的格式排序：
                    一般数字-g，高可读性-h，月份-M，数字-n，
                    随机-R，版本-V
  -V, --version-sort        在文本内进行自然版本排序

其他选项：

      --batch-size=NMERGE    一次最多合并NMERGE 个输入；如果输入更多
                    则使用临时文件
  -c, --check, --check=diagnose-first    检查输入是否已排序，若已有序则不进行操作
  -C, --check=quiet, --check=silent    类似-c，但不报告第一个无序行
      --compress-program=程序    使用指定程序压缩临时文件；使用该程序
                    的-d 参数解压缩文件
      --debug            为用于排序的行添加注释，并将有可能有问题的
                    用法输出到标准错误输出
      --files0-from=文件    从指定文件读取以NUL 终止的名称，如果该文件被
                    指定为"-"则从标准输入读文件名
  -k, --key=KEYDEF          sort via a key; KEYDEF gives location and type
  -m, --merge               merge already sorted files; do not sort
  -o, --output=文件        将结果写入到文件而非标准输出
  -s, --stable            禁用last-resort 比较以稳定比较算法
  -S, --buffer-size=大小    指定主内存缓存大小
  -t, --field-separator=分隔符    使用指定的分隔符代替非空格到空格的转换
  -T, --temporary-directory=目录    使用指定目录而非$TMPDIR 或/tmp 作为
                    临时目录，可用多个选项指定多个目录
      --parallel=N        将同时运行的排序数改变为N
  -u, --unique        配合-c，严格校验排序；不配合-c，则只输出一次排序结果
  -z, --zero-terminated    以0 字节而非新行作为行尾标志
      --help        显示此帮助信息并退出
      --version        显示版本信息并退出

KEYDEF is F[.C][OPTS][,F[.C][OPTS]] for start and stop position, where F is a
field number and C a character position in the field; both are origin 1, and
the stop position defaults to the line's end.  If neither -t nor -b is in
effect, characters in a field are counted from the beginning of the preceding
whitespace.  OPTS is one or more single-letter ordering options [bdfgiMhnRrV],
which override global ordering options for that key.  If no key is given, use
the entire line as the key.

SIZE may be followed by the following multiplicative suffixes:
内存使用率% 1%，b 1、K 1024 (默认)，M、G、T、P、E、Z、Y 等依此类推。

如果不指定文件，或者文件为"-"，则从标准输入读取数据。

*** 警告 ***
本地环境变量会影响排序结果。
如果希望以字节的自然值获得最传统的排序结果，请设置LC_ALL=C。

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告sort 的翻译错误
要获取完整文档，请运行：info coreutils 'sort invocation'
[root@localhost Linux_Test]# 
```
## man sort
```
SORT(1)                                                                   FSF                                                                  SORT(1)

NAME(名称)
       sort - 对文本文件的行排序

SYNOPSIS(总览)
       ../src/sort [OPTION]... [FILE]...

DESCRIPTION(描述)
       在这儿添加任何附加的描述信息

       将排序好的所有文件串写到标准输出上.

       +POS1 [-POS2]
              从关键字POS1开始,到POS2*之前*结束(快过时了) 字段数和字符偏移量都从零开始计数(与-k选项比较)

       -b     忽略排序字段或关键字中开头的空格

       -c     检查是否指定文件已经排序好了,不排序.

       -d     在关键字中只考虑[a-zA-Z0-9]字符.

       -f     将关键字中的小写字母折合成大写字母.

       -g     按照通常的数字值顺序作比较,暗含-b

       -i     在关键字中只考虑[\040-\0176]字符.

       -k POS1[,POS2]
              从关键字POS1开始,*到*POS2结束.  字段数和字符偏移量都从1开始计数(与基于零的+POS格式作比较)

       -l     按照当前环境排序.

       -m     合并已经排序好的文件,不排序.

       -M     按(未知的)<`JAN'<...<`DEC'的顺序比较,暗含-b

       -n     按照字符串的数值顺序比较,暗含-b

       -o FILE
              将结果写入FILE而不是标准输出.

       -r     颠倒比较的结果.

       -s     通过屏蔽最后的再分类比较来稳定排序.

       -t SEP 使用SEP来替代空格的转换non-.

       -T DIRECTORY
              使用DIRECTORY作为临时文件,而不是$TMPDIR或者/tmp

       -u     如果有-c,则按严格的顺序进行检查; 如果有-m,则只输出相等顺序的第一个.

       -z     以0字节结束行,而不是使用换行符,这是为了找到-print0

       --help 显示帮助并退出.

       --version
              输出版本信息并退出.

       -t SEP 使用SEP来替代空格的转换non-.

       -T DIRECTORY
              使用DIRECTORY作为临时文件,而不是$TMPDIR或者/tmp

       -u     如果有-c,则按严格的顺序进行检查; 如果有-m,则只输出相等顺序的第一个.

       -z     以0字节结束行,而不是使用换行符,这是为了找到-print0

       --help 显示帮助并退出.

       --version
              输出版本信息并退出.

       POS为F[.C][OPTS],这里的F指的是字段数,而C为字段中的字符位置,这在-k中是从开
       始计数的,而在过时的格式中是从零开始的.OPTS可由一个或多个Mbdfinr组成;这有效地屏蔽了
       对于那个关键字的全局-Mbdfinr设置.如果没有指定关键字,则使用整行作为关键字.如 果没有FILE,或者FILE是-,则从标准输入读取.
```
# sort排序示例
## sort 文件：默认排序( 整行进行ASCII字符升序)
```
[root@localhost Linux_Test]# cat sortFile.txt 
211
121
54
65
87
98
[root@localhost Linux_Test]# sort sortFile.txt 
121
211
54
65
87
98
[root@localhost Linux_Test]#
```
## sort -c：检查是否已经排好序
```
[root@localhost Linux_Test]# cat sortFile.txt 
211.123
121.321
54.9
54
65
65
65
87
98
1.234E10
[root@localhost Linux_Test]# sort -c sortFile.txt 
sort：sortFile.txt:2：无序： 121.321
[root@localhost Linux_Test]# 
```

## sort -n：数字按照算术值大小排序
-n 选项 Numberic 对于 数字按照算术值大小排序，而不是按照字符串比较
规则，例如 123 与 67
按算术值排序的话123比67大，如果按照字符串排序的话67比123大。
### 按字符串排序
```
[root@localhost Linux_Test]# vim sortFile.txt 
[root@localhost Linux_Test]# cat sortFile.txt 
211
121
54
65
87
98
[root@localhost Linux_Test]# sort sortFile.txt 
121
211
54
65
87
98
[root@localhost Linux_Test]#
```
## sort -g：浮点数排序
```
[root@localhost Linux_Test]# sort -n sortFile.txt 
1.234E10
54
54.9
65
65
65
87
98
121.321
211.123
[root@localhost Linux_Test]# sort -g sortFile.txt 
54
54.9
65
65
65
87
98
121.321
211.123
1.234E10
[root@localhost Linux_Test]# 
```
## sort -n和sort -g的区别
```
-g, --general-numeric-sort
      compare according to general numerical value
-n, --numeric-sort
      compare according to string numerical value
```

> [https://stackoverflow.com/questions/1255782/whats-the-difference-between-general-numeric-sort-and-numeric-sort-options](https://stackoverflow.com/questions/1255782/whats-the-difference-between-general-numeric-sort-and-numeric-sort-options)
> - 通用数字排序（-g）将数字比较为浮点数，这可以采用科学记数法，例如1.234E10，但速度较慢并且容易出现舍入错误（1.2345678可能在1.2345679之后）.
> - 数字排序（-n）只是一种常规的字母排序，知道10在9之后。


### 按数值排序
```
[root@localhost Linux_Test]# sort -n sortFile.txt 
54
65
87
98
121
211
[root@localhost Linux_Test]# 
```
## sort -u：去除排序结果中的重复行
它的作用很简单，就是在输出行中去除重复行。
```
[root@localhost Linux_Test]# cat sortFile.txt 
211
121
54
54
65
65
65
87
98
[root@localhost Linux_Test]# sort -n sortFile.txt 
54
54
65
65
65
87
98
121
211
[root@localhost Linux_Test]# sort -n -u sortFile.txt 
54
65
87
98
121
211
[root@localhost Linux_Test]# 
```
## sort -r：降序排序
sort默认的排序方式是升序，如果想改成降序，就加个-r就搞定了。
```
[root@localhost Linux_Test]# cat sortFile.txt 
211
121
54
54
65
65
65
87
98
[root@localhost Linux_Test]# sort -n sortFile.txt 
54
54
65
65
65
87
98
121
211
[root@localhost Linux_Test]# sort -n -r sortFile.txt 
211
121
98
87
65
65
65
54
54
[root@localhost Linux_Test]# 
```
## sort -o 文件：将结果写入到文件而非标准输出
由于sort默认是把结果输出到标准输出，所以需要用重定向才能将结果写入文件，形如
```
sort filename > newfile
```
但是，如果你想把排序结果输出到原文件中，用重定向可就不行了。
```
[root@localhost Linux_Test]# cat sortFile.txt 
98
87
65
54
32
21
[root@localhost Linux_Test]# sort sortFile.txt >sortFile.txt 
[root@localhost Linux_Test]# cat sortFile.txt 
[root@localhost Linux_Test]# 
```
可以看到，将文件排序后再重定向到该文件后，该文件的内容会被清空。
就在这个时候，-o选项出现了，它成功的解决了这个问题，让你放心的将结果写入原文件。这或许也是-o比重定向的唯一优势所在。
### 将原文件的内容排序后覆盖原文件
```
[root@localhost Linux_Test]# vim sortFile.txt 
[root@localhost Linux_Test]# cat sortFile.txt 
98
87
65
54
32
21
[root@localhost Linux_Test]# sort sortFile.txt -o sortFile.txt 
[root@localhost Linux_Test]# cat sortFile.txt 
21
32
54
65
87
98
[root@localhost Linux_Test]# 
```
如果想要指定排序的字段，则需要使用"-t"选项指定分隔符，并使用"-k"选项指定字段号。
## sort -t：指定分隔符
默认分隔符是制表符；
对于特殊符号(如制表符)，可使用类似于-t$'\t'或-t'ctrl+v,tab'(先按ctrl+v，然后按tab键)的方法实现。

## sort -k [n,m]：按照指定的字段范围排序。
从第 n 个字段开始，到第 m 个字（默认到行尾）；
测试文件：
```
[root@localhost Linux_Test]# cat ls_l_out.txt 
总用量 120
-rw-r--r--. 1 root root    36 4月  24 13:44 cat_test.txt
-rw-r--r--. 1 root root    30 4月  20 18:21 date_test.txt
-rw-r--r--. 1 root root   592 4月  24 13:19 info_a.log
-rw-r--r--. 1 root root   294 4月  23 14:14 less_test.txt
-rw-r--r--. 1 root root     0 4月  26 15:44 ls_l_out.txt
-rw-r--r--. 1 root root 75517 4月  23 14:21 man_less.txt
-rw-r--r--. 1 root root     9 4月  22 16:47 more_test2.txt
-rw-r--r--. 1 root root    23 4月  22 17:04 more_test3.txt
-rw-r--r--. 1 root root    83 4月  22 17:19 more_test4.txt
-rw-r--r--. 1 root root   294 4月  22 16:22 more_test.txt
-rw-r--r--. 1 root root    48 4月  26 15:38 sortFile.txt
-rw-r--r--. 1 root root    27 4月  14 01:48 vi_replaceAllTest.txt
-rw-r--r--. 1 root root    36 4月  24 14:00 wc_test.txt
[root@localhost Linux_Test]# 
```
按第5个字段进行排序：

<pre>
[root@localhost Linux_Test]&#35; sort -k 5,5 ls_l_out.txt 
总用量 120
-rw-r--r--. 1 root root     <mark>0</mark> 4月  26 15:44 ls_l_out.txt
-rw-r--r--. 1 root root    <mark>23</mark> 4月  22 17:04 more_test3.txt
-rw-r--r--. 1 root root    <mark>27</mark> 4月  14 01:48 vi_replaceAllTest.txt
-rw-r--r--. 1 root root   <mark>294</mark> 4月  22 16:22 more_test.txt
-rw-r--r--. 1 root root   <mark>294</mark> 4月  23 14:14 less_test.txt
-rw-r--r--. 1 root root    <mark>30</mark> 4月  20 18:21 date_test.txt
-rw-r--r--. 1 root root    <mark>36</mark> 4月  24 13:44 cat_test.txt
-rw-r--r--. 1 root root    <mark>36</mark> 4月  24 14:00 wc_test.txt
-rw-r--r--. 1 root root    <mark>48</mark> 4月  26 15:38 sortFile.txt
-rw-r--r--. 1 root root   <mark>592</mark> 4月  24 13:19 info_a.log
-rw-r--r--. 1 root root <mark>75517</mark> 4月  23 14:21 man_less.txt
-rw-r--r--. 1 root root    <mark>83</mark> 4月  22 17:19 more_test4.txt
-rw-r--r--. 1 root root     <mark>9</mark> 4月  22 16:47 more_test2.txt
[root@localhost Linux_Test]&#35; 
</pre>


按第9个字段排序：

<pre>
[root@localhost Linux_Test]&#35; sort -k 9,9 ls_l_out.txt 
总用量 120
-rw-r--r--. 1 root root    36 4月  24 13:44 <mark>cat_test.txt</mark>
-rw-r--r--. 1 root root    30 4月  20 18:21 <mark>date_test.txt</mark>
-rw-r--r--. 1 root root   592 4月  24 13:19 <mark>info_a.log</mark>
-rw-r--r--. 1 root root   294 4月  23 14:14 <mark>less_test.txt</mark>
-rw-r--r--. 1 root root     0 4月  26 15:44 <mark>ls_l_out.txt</mark>
-rw-r--r--. 1 root root 75517 4月  23 14:21 <mark>man_less.txt</mark>
-rw-r--r--. 1 root root     9 4月  22 16:47 <mark>more_test2.txt</mark>
-rw-r--r--. 1 root root    23 4月  22 17:04 <mark>more_test3.txt</mark>
-rw-r--r--. 1 root root    83 4月  22 17:19 <mark>more_test4.txt</mark>
-rw-r--r--. 1 root root   294 4月  22 16:22 <mark>more_test.txt</mark>
-rw-r--r--. 1 root root    48 4月  26 15:38 <mark>sortFile.txt</mark>
-rw-r--r--. 1 root root    27 4月  14 01:48 <mark>vi_replaceAllTest.txt</mark>
-rw-r--r--. 1 root root    36 4月  24 14:00 <mark>wc_test.txt</mark>
[root@localhost Linux_Test]&#35;
</pre>

当然，"-k"选项可以直接使用"-k 9"，代表从第三个字段到行尾都排序（第一个字段先排序，如果一致，则第二个字段再排序，直到行尾）。
## sort -t '分隔符' -k 开始字段,结束字段

测试文件：
```
[root@localhost Linux_Test]# cat sort_t_k.txt 
bnana:30:5.5
bnana:12:9.8
apple:10:2.5
pear:90:2.3
orange:20:3.4
[root@localhost Linux_Test]#
```
这个文件有三列，列与列之间用冒号隔开了，第一列表示水果类型，第二列表示水果数量，第三列表示水果价格。

那么我想以水果价格来排序，也就是以第3列来排序，如何利用sort实现？
幸好，sort提供了-t选项，后面可以设定间隔符。
指定了间隔符之后，就可以用-k来指定列数了。

<pre>
[root@localhost Linux_Test]&#35; sort -t ':' -k 3,3 sort_t_k.txt 
pear:90:<mark>2.3</mark>
apple:10:<mark>2.5</mark>
orange:20:<mark>3.4</mark>
bnana:30:<mark>5.5</mark>
bnana:12:<mark>9.8</mark>
[root@localhost Linux_Test]&#35;
</pre>

按第2列进行排序：
<pre>
[root@localhost Linux_Test]&#35; sort -t ':' -k 2,2 sort_t_k.txt 
apple:<mark>10</mark>:2.5
bnana:<mark>12</mark>:9.8
orange:<mark>20</mark>:3.4
bnana:<mark>30</mark>:5.5
pear:<mark>90</mark>:2.3
[root@localhost Linux_Test]&#35; 
</pre>
按第1列到第2列进行排序
<pre>
[root@localhost Linux_Test]&#35; sort -t ':' -k 1,2 sort_t_k.txt 
<mark>apple:10</mark>:2.5
<mark>bnana:12</mark>:9.8
<mark>bnana:30</mark>:5.5
<mark>orange:20</mark>:3.4
<mark>pear:90</mark>:2.3
[root@localhost Linux_Test]&#35;
</pre>

# 参考资料
[http://c.biancheng.net/view/996.html](http://c.biancheng.net/view/996.html)
[https://www.cnblogs.com/51linux/archive/2012/05/23/2515299.html](https://www.cnblogs.com/51linux/archive/2012/05/23/2515299.html)
[https://man.linuxde.net/sort](https://man.linuxde.net/sort)
[http://fancyerii.github.io/2019/06/15/sort/](http://fancyerii.github.io/2019/06/15/sort/)
[https://www.linuxidc.com/Linux/2017-08/146605.htm](https://www.linuxidc.com/Linux/2017-08/146605.htm)