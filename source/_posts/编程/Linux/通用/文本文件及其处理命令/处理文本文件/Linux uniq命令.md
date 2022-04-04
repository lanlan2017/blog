---
title: Linux uniq命令
categories: 
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 处理文本文件
abbrlink: 29005fc5
date: 2021-05-01 14:44:03
updated: 2022-04-04 00:51:45
---
# Linux uniq命令：筛选文件中的重复行
Linux的uniq 命令用于检查及删除文本文件中重复出现的行列，一般与 sort 命令结合使用。

## uniq --help
```
[root@localhost Linux_Test]# uniq --help
用法：uniq [选项]... [文件]
Filter adjacent matching lines from INPUT (or standard input),
writing to OUTPUT (or standard output).

With no options, matching lines are merged to the first occurrence.

Mandatory arguments to long options are mandatory for short options too.
  -c, --count           prefix lines by the number of occurrences
  -d, --repeated        only print duplicate lines, one for each group
  -D, --all-repeated[=METHOD]  print all duplicate lines
                          groups can be delimited with an empty line
                          METHOD={none(default),prepend,separate}
  -f, --skip-fields=N   avoid comparing the first N fields
      --group[=METHOD]  show all items, separating groups with an empty line
                          METHOD={separate(default),prepend,append,both}
  -i, --ignore-case     ignore differences in case when comparing
  -s, --skip-chars=N    avoid comparing the first N characters
  -u, --unique          only print unique lines
  -z, --zero-terminated  end lines with 0 byte, not newline
  -w, --check-chars=N    对每行第N 个字符以后的内容不作对照
      --help        显示此帮助信息并退出
      --version        显示版本信息并退出

若域中为先空字符(通常包括空格以及制表符)，然后非空字符，域中字符前的空字符将被跳过。

Note: 'uniq' does not detect repeated lines unless they are adjacent.
You may want to sort the input first, or use 'sort -u' without 'uniq'.
Also, comparisons honor the rules specified by 'LC_COLLATE'.

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告uniq 的翻译错误
要获取完整文档，请运行：info coreutils 'uniq invocation'
[root@localhost Linux_Test]# 
```
## man uniq
```
UNIQ(1)                                                              FSF                                                              UNIQ(1)

NAME
       uniq - 删除排序文件中的重复行

总览 (SYNOPSIS)
       ../src/uniq [OPTION]... [INPUT [OUTPUT]]

描述 (DESCRIPTION)
       从 INPUT (或 标准输入) 数据 中 忽略 (但是 保留 一行) 连续的 相似行, 结果 送入 OUTPUT (或 标准输出).

       -c, --count
              在 行首 显示 出现 的 数目

       -d, --repeated
              仅显示 重复行

       -D, --all-repeated
              显示 全部 重复行

       -f, --skip-fields=N
              不比较 起初的 N 栏

       -i, --ignore-case
              比较时 忽略 大小写

       -s, --skip-chars=N
              不比较 起初的 N 个 字符

       -u, --unique
              仅显示 无重复行

       -w, --check-chars=N
              每行中 比较 不超过 N 个 字符

       -N     同 -f N

       +N     同 -s N

       --help 显示 帮助信息, 然后 结束

       --version
              显示 版本信息, 然后 结束

       栏(field) 指 一段 空白符(whitespace), 接下来 一段 非空白符.  字符前 的 栏 被 忽略 (Fields are skipped before chars).
```
# uniq命令示例
## uniq：删除文件中的重复行
```
[root@localhost uniq]# cat uniq_1.txt 
1
2
3
3
3
3
4
4
4
5
5
5
8
20
```
使用uniq 命令删除重复行后，有如下输出结果：
```
[root@localhost uniq]# uniq uniq_1.txt 
1
2
3
4
5
8
20
[root@localhost uniq]# 
```
## uniq -c：删除文件重复行并显示重复行次数
检查文件并删除文件中重复出现的行，并在行首显示该行重复出现的次数。使用如下命令：
```
[root@localhost uniq]# uniq -c uniq_1.txt 
      1 1
      1 2
      4 3
      3 4
      3 5
      1 8
      1 20
[root@localhost uniq]# 
```
输出的第1列表示重复次数，第2列表示该行的内容。
## uniq -d：只打印一次文件中的重复行
```
[root@localhost uniq]# cat uniq_1.txt 
1
2
3
3
3
3
4
4
4
5
5
5
8
20
[root@localhost uniq]# uniq -d uniq_1.txt 
3
4
5
[root@localhost uniq]# 
```
## uniq -D：打印文件中所有重复行
```
[root@localhost uniq]# cat uniq_1.txt 
1
2
3
3
3
3
4
4
4
5
5
5
8
20
[root@localhost uniq]# uniq -d uniq_1.txt 
3
4
5
[root@localhost uniq]# uniq -D uniq_1.txt 
3
3
3
3
4
4
4
5
5
5
[root@localhost uniq]# 
```
## uniq -f N：行比较的时候忽略前面的N个字段
例如我现在有如下的文件
```
[root@localhost uniq]# cat uniq_4.txt 
0 0 0 a
0 1 0 a
1 0 0 a
0 0 0 A
0 1 0 A
1 0 0 A
[root@localhost uniq]#
```
如果比较整行的话，所有的行都不相同：
```
[root@localhost uniq]# uniq uniq_4.txt 
0 0 0 a
0 1 0 a
1 0 0 a
0 0 0 A
0 1 0 A
1 0 0 A
[root@localhost uniq]#
```
但是，如果忽略前面两个字段的影响的话，则文件中两行：
```
[root@localhost uniq]# uniq -f 2 uniq_4.txt 
0 0 0 a
0 0 0 A
[root@localhost uniq]#
```

```
[root@localhost uniq]# uniq -c -f 2 uniq_4.txt 
      3 0 0 0 a
      3 0 0 0 A
[root@localhost uniq]# 
```
## uniq -s N：行比较时忽略行首之后的N个字符
```
[root@localhost uniq]# cat uniq_5.txt 
0_0_0_a
0_1_0_a
1_0_0_a
0_0_0_A
0_1_0_A
1_0_0_A
[root@localhost uniq]#
```
比较时忽略行首之后的4个字符：
<pre>
<mark>0_0_</mark>0_a
<mark>0_1_</mark>0_a
<mark>1_0_</mark>0_a
<mark>0_0_</mark>0_A
<mark>0_1_</mark>0_A
<mark>1_0_</mark>0_A
</pre>

运行结果：
<pre>
[root@localhost uniq]&#35; uniq -c -s 4 uniq_5.txt 
      3 0_0_0<mark>_a</mark>
      3 0_0_0<mark>_A</mark>
[root@localhost uniq]&#35; 
</pre>

忽略前三个字符：
<pre>
<mark>0_0</mark>_0_a
<mark>0_1</mark>_0_a
<mark>1_0</mark>_0_a
<mark>0_0</mark>_0_A
<mark>0_1</mark>_0_A
<mark>1_0</mark>_0_A
</pre>

运行结果：
<pre>
[root@localhost uniq]&#35; uniq -c -s 3 uniq_5.txt 
      3 0_0<mark>_0_a</mark>
      3 0_0<mark>_0_A</mark>
[root@localhost uniq]&#35;
</pre>

忽略前2个字符：
<pre>
<mark>0_</mark>0_0_a
<mark>0_</mark>1_0_a
<mark>1_</mark>0_0_a
<mark>0_</mark>0_0_A
<mark>0_</mark>1_0_A
<mark>1_</mark>0_0_A
</pre>

结果：
<pre>
[root@localhost uniq]&#35; uniq -c -s 2 uniq_5.txt 
      1 0_<mark>0_0_a</mark>
      1 0_<mark>1_0_a</mark>
      1 1_<mark>0_0_a</mark>
      1 0_<mark>0_0_A</mark>
      1 0_<mark>1_0_A</mark>
      1 1_<mark>0_0_A</mark>
[root@localhost uniq]&#35; 
</pre>



## uniq -i：忽略大小写比较
```
[root@localhost uniq]# cat uniq_3.txt 
a
A
a
b
B
b
B
c
c
c
C
[root@localhost uniq]# uniq -c uniq_3.txt 
      1 a
      1 A
      1 a
      1 b
      1 B
      1 b
      1 B
      3 c
      1 C
[root@localhost uniq]# uniq -ci uniq_3.txt 
      3 a
      4 b
      4 c
[root@localhost uniq]# 
```
## uniq -u：只显示没有重复的行
```
[root@localhost uniq]# cat uniq_1.txt 
1
2
3
3
3
3
4
4
4
5
5
5
8
20
[root@localhost uniq]# uniq -c uniq_1.txt 
      1 1
      1 2
      4 3
      3 4
      3 5
      1 8
      1 20
[root@localhost uniq]# uniq -uc uniq_1.txt 
      1 1
      1 2
      1 8
      1 20
[root@localhost uniq]# 
```
## uniq对不相邻的重复行不起作用
当重复的行并不相邻时，uniq 命令是不起作用的，即若文件内容为以下时，uniq 命令不起作用：
```
[root@localhost uniq]# cat uniq_2.txt 
1
2
1
2
1
2
1
2
1
2
[root@localhost uniq]#
```
运行效果如下：
```
[root@localhost uniq]# cat -n uniq_2.txt 
     1	1
     2	2
     3	1
     4	2
     5	1
     6	2
     7	1
     8	2
     9	1
    10	2
[root@localhost uniq]# uniq uniq_2.txt |cat -n
     1	1
     2	2
     3	1
     4	2
     5	1
     6	2
     7	1
     8	2
     9	1
    10	2
[root@localhost uniq]# 
```
## uniq与sort搭配使用
### sort|uniq -c：统计各行在文件中出现的次数
```
[root@localhost uniq]# cat uniq_2.txt 
1
2
1
2
1
2
1
2
1
2
[root@localhost uniq]# sort uniq_2.txt |uniq -c
      5 1
      5 2
[root@localhost uniq]# 
```
### sort|uniq -d：在文件中找出重复的行
```
[root@localhost uniq]# uniq uniq_2.txt 
1
2
1
2
1
2
1
2
1
2
[root@localhost uniq]# uniq -d uniq_2.txt 
[root@localhost uniq]# sort uniq_2.txt|uniq -d
1
2
[root@localhost uniq]# 
```
### sort|uniq -u：在文件中找出没有重复的行
```
[root@localhost uniq]# cat uniq_1.txt 
1
2
3
3
3
3
4
4
4
5
5
5
8
20
[root@localhost uniq]# sort uniq_1.txt 
1
2
20
3
3
3
3
4
4
4
5
5
5
8
[root@localhost uniq]# sort uniq_1.txt |uniq -u
1
2
20
8
[root@localhost uniq]# 
```

# 参考资料
[https://www.runoob.com/linux/linux-comm-uniq.html](https://www.runoob.com/linux/linux-comm-uniq.html)
[https://wangchujiang.com/linux-command/c/uniq.html](https://wangchujiang.com/linux-command/c/uniq.html)
[https://www.linuxidc.com/Linux/2018-12/155980.htm](https://www.linuxidc.com/Linux/2018-12/155980.htm)
