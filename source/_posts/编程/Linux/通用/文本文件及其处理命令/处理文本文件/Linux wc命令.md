---
title: Linux wc命令
categories: 
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 处理文本文件
abbrlink: 3bb57d1c
date: 2021-04-24 13:30:27
updated: 2022-04-04 00:51:45
---
# Linux wc命令
功能
- 列出文件中一共有多少行，有多少个单词，多少字符
- 当指定的文件数大于 1 时，最后还列出一个合计
- 常用选项l：只列出行计数

## man wc
```
WC(1)                                                                           FSF                                                                          WC(1)

NAME
       wc - 输出文件中的行数、单词数、字节数

SYNOPSIS 总览
       wc [选项列表]... [文件名列表]...

SYNOPSIS 总览
       wc [选项列表]... [文件名列表]...

DESCRIPTION 描述
       对每个文件输出行、单词、和字节统计数，如果指定了多于一个文件则还有一 个行数的总计。没有指定文件或指定的文件是 -，则读取标准输入。

       -c, --bytes, --chars
              输出字节统计数。

       -l, --lines
              输出换行符统计数。

       -L, --max-line-length
              输出最长的行的长度。

       -w, --words
              输出单词统计数。

       --help 显示帮助并退出

       --version
              输出版本信息并退出

AUTHOR 著作者
       由 Paul Rubin 和 David MacKenzie 完成。
```
## wc命令参数

|wc命令参数|描述|
|:---|:---|
|-w或--words|统计字数：只显示字数。一个字被定义为由空白、跳格或换行字符分隔的字符串|
|-c或--bytes或--chars|统计字节数：只显示Bytes数|
|-l或--lines|统计行数，只显示列数|
|-m|统计字符数|
|-L|打印最长行的长度|

# wc命令示例
## 测试文件
```
[root@localhost Linux_Test]# cat cat_test.txt 
hello world!
Welcome to learn Linux
```
```
[root@localhost Linux_Test]# cat wc_test.txt 
The current Linux release is CentOS
[root@localhost Linux_Test]# 
```
## wc 文件：统计行数、单词数、字节数
```
[root@localhost Linux_Test]# wc cat_test.txt 
 2  6 36 cat_test.txt
[root@localhost Linux_Test]#
```
直接使用`wc 文件`命令输出的前3个数字分别表示文件的行数、单词数，以及该文件的字节数。
## wc -c 文件：统计文件中的字节数
```
[root@localhost Linux_Test]# wc -c cat_test.txt 
36 cat_test.txt
[root@localhost Linux_Test]#
```
## wc -w 文件：统计文件中的单词数
```
[root@localhost Linux_Test]# wc -w cat_test.txt 
6 cat_test.txt
[root@localhost Linux_Test]# 
```
## wc -l 文件：统计文件行数
```
[root@localhost Linux_Test]# wc -l cat_test.txt 
2 cat_test.txt
[root@localhost Linux_Test]#
```
## wc -L 文件：统计文件中最长的行的长度
```
[root@localhost Linux_Test]# wc -L cat_test.txt 
22 cat_test.txt
[root@localhost Linux_Test]# 
```
## wc 多个文件
```
[root@localhost Linux_Test]# wc cat_test.txt wc_test.txt 
 2  6 36 cat_test.txt
 1  6 36 wc_test.txt
 3 12 72 总用量
[root@localhost Linux_Test]# 
```
## 组合命令
### 只统计文件的行数、字数、字节数不显示文件名
#### cat 文件|wc -l：
```
[root@localhost Linux_Test]# cat cat_test.txt |wc
      2       6      36
[root@localhost Linux_Test]# cat cat_test.txt |wc -l
2
[root@localhost Linux_Test]# cat cat_test.txt |wc -w
6
[root@localhost Linux_Test]# cat cat_test.txt |wc -c
36
[root@localhost Linux_Test]# 
```
#### wc -l < 文件
```
[root@localhost Linux_Test]# wc < cat_test.txt 
 2  6 36
[root@localhost Linux_Test]# wc -l < cat_test.txt 
2
[root@localhost Linux_Test]# wc -w < cat_test.txt 
6
[root@localhost Linux_Test]# wc -c < cat_test.txt 
36
[root@localhost Linux_Test]# 
```
### wc -l *：统计当前目录下的所有文件的行数：
```
[root@localhost Linux_Test]# wc -l *
    2 cat_test.txt
    2 date_test.txt
   10 info_a.log
   36 less_test.txt
    8 ls_out.txt
    5 ls_sort.txt
 1185 man_less.txt
    6 more_test2.txt
   12 more_test3.txt
   36 more_test4.txt
   36 more_test.txt
    6 sortFile.txt
    6 vi_replaceAllTest.txt
    1 wc_test.txt
 1351 总用量
[root@localhost Linux_Test]#
```
### 统计当前系统中有多少账户
```
[root@localhost Linux_Test]# cat /etc/passwd |wc -l
123
[root@localhost Linux_Test]# 
```
### ps ef | wc -l：统计系统当前有多少个进程在运行
```
[root@localhost blog]# ps ef | wc -l
6
[root@localhost blog]# 
```
# 参考资料
[https://www.runoob.com/linux/linux-comm-wc.html](https://www.runoob.com/linux/linux-comm-wc.html)
[https://www.cnblogs.com/peida/archive/2012/12/18/2822758.html](https://www.cnblogs.com/peida/archive/2012/12/18/2822758.html)
[https://wangchujiang.com/linux-command/c/wc.html](https://wangchujiang.com/linux-command/c/wc.html)
[https://blog.csdn.net/Jerry_1126/article/details/52107947](https://blog.csdn.net/Jerry_1126/article/details/52107947)
