---
title: Linux tr命令
categories: 
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 处理文本文件
abbrlink: 3fd8156d
date: 2021-04-26 21:08:28
updated: 2021-04-26 21:08:28
---
<div id='my_toc'></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Linux tr命令
tr命令 可以对来自标准输入的字符进行替换、压缩和删除。它可以将一组字符变成另一组字符，经常用来编写优美的单行命令，作用很强大。
tr 是 Linux 和 Unix 系统中的命令行实用程序，用于转换，删除和挤压标准输入中的字符，并将结果写入标准输出。
该 tr 命令通常通过管道与其他命令结合使用，可以执行删除重复字符，将大写转换为小写，以及替换和删除基本字符等操作。
tr的英文全称是“ transform ”，即转换的意思。该命令
- 可以将字符进行替换、压缩、删除，
- 也可以将一组字符转换成另一组字符。

**tr只能从标准输入中读取数据，因此，tr要么将输入文件重定向到标准输入，要么从管道读入数据。**
注意：tr类似于sed命令，但是比sed简单，所以tr能实现的功能，sed都能实现。

## tr命令常用参数：

|tr命令参数|含义|
|:---|:---|
|-c|选定字符串1中字符集的补集，即反选字符串1的补集|
|-d|删除字符串1中出现的所有字符|
|-s|删除所有重复出现的字符序列，只保留一个|

## tr --help
```
[root@localhost Linux_Test]# tr --help
用法：tr [选项]... SET1 [SET2]
从标准输入中替换、缩减和/或删除字符，并将结果写到标准输出。

  -c, -C, --complement        首先补足SET1
  -d, --delete            删除匹配SET1 的内容，并不作替换
  -s, --squeeze-repeats    如果匹配于SET1 的字符在输入序列中存在连续的
                重复，在替换时会被统一缩为一个字符的长度
  -t, --truncate-set1        先将SET1 的长度截为和SET2 相等
      --help        显示此帮助信息并退出
      --version        显示版本信息并退出

SET 是一组字符串，一般都可按照字面含义理解。解析序列如下：

  \NNN    八进制值为NNN 的字符(1 至3 个数位)
  \\        反斜杠
  \a        终端鸣响
  \b        退格
  \f        换页
  \n        换行
  \r        回车
  \t        水平制表符
  \v        垂直制表符
  字符1-字符2    从字符1 到字符2 的升序递增过程中经历的所有字符
  [字符*]    在SET2 中适用，指定字符会被连续复制直到吻合设置1 的长度
  [字符*次数]    对字符执行指定次数的复制，若次数以 0 开头则被视为八进制数
  [:alnum:]    所有的字母和数字
  [:alpha:]    所有的字母
  [:blank:]    所有呈水平排列的空白字符
  [:cntrl:]    所有的控制字符
  [:digit:]    所有的数字
  [:graph:]    所有的可打印字符，不包括空格
  [:lower:]    所有的小写字母
  [:print:]    所有的可打印字符，包括空格
  [:punct:]    所有的标点字符
  [:space:]    所有呈水平或垂直排列的空白字符
  [:upper:]    所有的大写字母
  [:xdigit:]    所有的十六进制数
  [=字符=]    所有和指定字符相等的字符

仅在SET1 和SET2 都给出，同时没有-d 选项的时候才会进行替换。
仅在替换时才可能用到-t 选项。如果需要SET2 将被通过在末尾添加原来的末字符的方式
补充到同SET1 等长。SET2 中多余的字符将被省略。只有[:lower:] 和[:upper:]
以升序展开字符；在用于替换时的SET2 中以成对表示大小写转换。-s 作用于SET1，既不
替换也不删除，否则在替换或展开后使用SET2 缩减。

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告tr 的翻译错误
要获取完整文档，请运行：info coreutils 'tr invocation'
[root@localhost Linux_Test]#s
```
## man tr
```
TR(1)                                                           User Commands                                                           TR(1)

NAME
       tr - translate or delete characters

SYNOPSIS
       tr [OPTION]... SET1 [SET2]

DESCRIPTION
       Translate, squeeze, and/or delete characters from standard input, writing to standard output.

       -c, -C, --complement
              use the complement of SET1

       -d, --delete
              delete characters in SET1, do not translate

       -s, --squeeze-repeats
              replace each input sequence of a repeated character that is listed in SET1 with a single occurrence of that character

       -t, --truncate-set1
              first truncate SET1 to length of SET2

       --help display this help and exit

       --version
              output version information and exit

       SETs are specified as strings of characters.  Most represent themselves.  Interpreted sequences are:

       \NNN   character with octal value NNN (1 to 3 octal digits)

       \\     backslash

       \a     audible BEL

       \b     backspace

       \f     form feed

       \n     new line

       \r     return

       \t     horizontal tab

       \v     vertical tab

       CHAR1-CHAR2
              all characters from CHAR1 to CHAR2 in ascending order

       [CHAR*]
              in SET2, copies of CHAR until length of SET1

       [CHAR*REPEAT]
              REPEAT copies of CHAR, REPEAT octal if starting with 0

       [:alnum:]
              all letters and digits

       [:alpha:]
              all letters

       [:blank:]
              all horizontal whitespace

       [:cntrl:]
              all control characters

       [:digit:]
              all digits

       [:graph:]
              all printable characters, not including space

       [:lower:]
              all lower case letters

       [:print:]
              all printable characters, including space

       [:punct:]
              all punctuation characters

       [:space:]
              all horizontal or vertical whitespace

       [:upper:]
              all upper case letters

       [:xdigit:]
              all hexadecimal digits

       [=CHAR=]
              all characters which are equivalent to CHAR

       Translation  occurs  if  -d  is  not  given and both SET1 and SET2 appear.  -t may be used only when translating.  SET2 is extended to
       length of SET1 by repeating its last character as necessary.  Excess characters of SET2 are ignored.  Only [:lower:] and [:upper:] are
       guaranteed  to  expand  in ascending order; used in SET2 while translating, they may only be used in pairs to specify case conversion.
       -s uses SET1 if not translating nor deleting; else squeezing uses SET2 and occurs after translation or deletion.

       GNU  coreutils  online  help:  <http://www.gnu.org/software/coreutils/>  Report  tr  translation   bugs   to   <http://translationpro‐
       ject.org/team/>

AUTHOR
       Written by Jim Meyering.
```
# tr命令示例
## 映射替换
**tr接受两组字符，通常具有相同的长度，并用第二组中的相应字符替换第一组的字符**。
```
[root@localhost Linux_Test]# echo 'aaaaa_bbbbb_cccc' | tr 'abc' 'ABC'
AAAAA_BBBBB_CCCC
[root@localhost Linux_Test]# 
```
将a替换成A,将b替换成B,将c替换成C
### 使用定义字符集
## tr -c SET1 SET2：不再SET1中的字符替换成SET2中的字符

<pre>
[root@localhost Linux_Test]&#35; echo 'aaaaaa_bbbbbbb_cccccc_ddddd'|tr -c 'cdef_\n' '1'
<mark>111111_1111111_cccccc_ddddd</mark>
[root@localhost Linux_Test]&#35; echo 'aaaaaa_bbbbbbb_cccccc_ddddd'|tr -c 'cdef_' '1'
<mark>111111_1111111_cccccc_ddddd1</mark>[root@localhost Linux_Test]&#35; 
[root@localhost Linux_Test]&#35; 
</pre>

您可能已经注意到输出比输入多了一个字符。这是因为该 echo 命令打印了一个不可见换行符 \n 也被替换为 y 。要在没有新行的情况下回显字符串，请使用该 -n 选项。
```
[root@localhost Linux_Test]# echo -n 'aaaaaa_bbbbbbb_cccccc_ddddd'|tr -c 'cdef_' '1'
111111_1111111_cccccc_ddddd[root@localhost Linux_Test]# 
[root@localhost Linux_Test]#
```


## 大小写转换
```
[root@localhost Linux_Test]# cat tr.txt 
abc 012
def 345
ghi 678
jkl 909
[root@localhost Linux_Test]# tr "[a-z]" "[A-Z]" < tr.txt 
ABC 012
DEF 345
GHI 678
JKL 909
[root@localhost Linux_Test]# 
```
## tr -d SET1：删除匹配SET1 的内容，并不作替换
```
[root@localhost Linux_Test]# cat tr.txt 
abc 012
def 345
ghi 678
jkl 909
[root@localhost Linux_Test]# tr -d "[a-z]" < tr.txt 
 012
 345
 678
 909
[root@localhost Linux_Test]# 
```
## tr -s：压缩重复
```
[root@localhost Linux_Test]# cat tr_1.txt 
1
2




7
8
[root@localhost Linux_Test]# tr -s "\n" <tr_1.txt 
1
2
7
8
[root@localhost Linux_Test]#
```
## tr -t SET1 SET2
默认情况下的`tr SET1 SET2`，如果 SET1 大于 SET2   tr 将重用 SET2  的最后一个字符。
```
[root@localhost Linux_Test]# echo 'aaaaaa_bbbbbbb_cccccc_ddddd'|tr 'abcd' '1234'
111111_2222222_333333_44444
[root@localhost Linux_Test]# echo 'aaaaaa_bbbbbbb_cccccc_ddddd'|tr 'abcd' '123'
111111_2222222_333333_33333
```
而使用-t(--truncate-set1) 选项，则会强制 tr 到做进一步处理之前截断 SET1 到 SET2 的长度。
```
[root@localhost Linux_Test]# echo 'aaaaaa_bbbbbbb_cccccc_ddddd'|tr -t 'abcd' '123'
111111_2222222_333333_ddddd
[root@localhost Linux_Test]# 
```
这里的SET1为abcd,SET2为123，SET1比SET2长，加上-t参数后，SET1将被截断到SET2相同的长度，也就是'abc'。
## 删除空行
删除空行
要删除空白行，只需挤压重复的换行符：
```
tr -s '\n' < tr_1.txt > tr_2.txt
```
在上面的命令中，我们使用重定向符号将命令 < 的内容作为输入传递 file.txt 给 tr 命令。重定向 > 将命令的输出写入 new_file.txt 。
运行结果：
```
[root@localhost Linux_Test]# cat tr_1.txt 
1
2




7
8
[root@localhost Linux_Test]# tr -s '\n' < tr_1.txt > tr_2.txt
[root@localhost Linux_Test]# cat tr_2.txt 
1
2
7
8
[root@localhost Linux_Test]# 
```

## 在单独的行上打印 $PATH 目录
```
[root@localhost Linux_Test]# echo $PATH
/opt/java/jdk1.8.0_281/bin:/opt/java/jdk1.8.0_281/jre/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/usr/local/git/bin:/root/bin
[root@localhost Linux_Test]# echo $PATH |tr ':' '\n'
/opt/java/jdk1.8.0_281/bin
/opt/java/jdk1.8.0_281/jre/bin
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/root/bin
/usr/local/git/bin
/root/bin
[root@localhost Linux_Test]# 
```
到目前为止，您应该很好地理解如何使用 Linux   tr 命令。虽然非常有用， tr 但只能使用单个字符。对于更复杂的模式匹配和字符串操作，您应该使用 sed 或 awk 。
## 删除所有非数字字符
```
echo "my phone is 123-456-7890" | tr -cd [:digit:]
```
[:digit:] 代表所有数字字符，通过使用该 -c 选项，该命令将删除所有非数字字符。输出将如下所示：
```
[root@localhost Linux_Test]# echo "my phone is 123-456-7890" | tr -cd [:digit:]
1234567890[root@localhost Linux_Test]# 
```

1234567890
# 参考资料
[https://wangchujiang.com/linux-command/c/tr.html](https://wangchujiang.com/linux-command/c/tr.html)
[https://www.linuxidc.com/Linux/2019-08/159907.htm](https://www.linuxidc.com/Linux/2019-08/159907.htm)
[https://www.cnblogs.com/linyfeng/p/9075062.html](https://www.cnblogs.com/linyfeng/p/9075062.html)
[https://www.linuxcool.com/tr](https://www.linuxcool.com/tr)