---
title: Linux 比较两文件是否相同：通过hash算法值来比较
categories:
  - 编程
  - Linux
  - 通用
  - 文件比较
mathjax: true
abbrlink: d23c9652
date: 2021-05-15 23:54:38
updated: 2021-05-15 23:57:07
---
# md5sum/sha1sum:文件内容比较
- 使用MD5算法（散列函数）根据文件内容生成16字节hash值，比较hash值是否相
同，就可断定两文件内容是否完全相同，（md5sum命令）
- 使用SHA-1算法的命令名为sha1sum (20字节hash值)
- 其他散列函数也可以用来完成这一任务: sha512sum

md5算法常用于数据完整性（Data Integrity）验证和判断位于网络不同机器上的两个文件的内容是否相同。例如网上给出的安装程序经常会给出对应的md5值，我们可以对下载的安装程序计算md5值，如果我们计算的md5值与官网给出的md5值相同，则表示该安装程序没有被第三方篡改过，是安全的。

# md5sum
## 测试文件
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
[root@localhost cmp]# cat -n c.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# 
```
可看到a.txt与c.txt的内容是相同的。
对着三个文件执行md5sum命令：

<pre>
[root@localhost cmp]&#35; md5sum a.txt 
<mark>abd3291ec48e1700a70d39ee5db7fb7d</mark>  a.txt
[root@localhost cmp]&#35; md5sum b.txt 
bf56342c3e159e45ea1e434122410291  b.txt
[root@localhost cmp]&#35; md5sum c.txt 
<mark>abd3291ec48e1700a70d39ee5db7fb7d</mark>  c.txt
[root@localhost cmp]&#35; 
</pre>

可以看到a.txt和c.txt的计算结果都是：<mark>abd3291ec48e1700a70d39ee5db7fb7d</mark>所以，这两个文件是相同的。
## md5sum -c md5文件：读取MD5SUM的文件并验证所有文件是否具有匹配的校验和
测试文件：
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
[root@localhost cmp]#
```
计算这两个文件的md5值，保存到文件中：
```
[root@localhost cmp]# md5sum a.txt b.txt
abd3291ec48e1700a70d39ee5db7fb7d  a.txt
bf56342c3e159e45ea1e434122410291  b.txt
[root@localhost cmp]# md5sum a.txt b.txt >a_b.md5
```
修改a.txt文件，在末尾加入一行：
```
[root@localhost cmp]# vim a.txt 
[root@localhost cmp]# cat a.txt 
this is line a
this is line b
helloworld!
this is line d
this is some new word
[root@localhost cmp]#
```
执行md5校验：
```
[root@localhost cmp]# md5sum -c a_b.md5
a.txt: 失败
b.txt: 确定
md5sum: 警告：1 个校验和不匹配
[root@localhost cmp]# 
```
可以看到我们修改a.txt后，该文件md5校验失败，这表示a.txt文件被篡改了。
## md5sum命令手册
### tldr md5sum
```
[root@localhost cmp]# tldr md5sum

  md5sum

  计算 MD5 加密校验和.
  更多信息： https://www.gnu.org/software/coreutils/md5sum.

  - 计算文件的 MD5 校验和:
    md5sum filename1

  - 计算多个文件的 MD5 校验和:
    md5sum filename1 filename2

  - 读取 MD5SUM 的文件并验证所有文件是否具有匹配的校验和:
    md5sum -c filename.md5

[root@localhost cmp]# 
```
# sha1sum
## sha1sum file：计算文件的SHA1校验和
测试文件：
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
[root@localhost cmp]# cat -n c.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# 
```
计算sha1校验和：

<pre>
[root@localhost cmp]&#35; sha1sum a.txt 
<mark>01c3d325eeca7f806192dddbfa9ce791cb5c6fc7</mark>  a.txt
[root@localhost cmp]&#35; sha1sum b.txt 
1cb5cee11036b493799b8b1b0d6ea9704e84c282  b.txt
[root@localhost cmp]&#35; sha1sum c.txt 
<mark>01c3d325eeca7f806192dddbfa9ce791cb5c6fc7</mark>  c.txt
[root@localhost cmp]&#35; 
</pre>

可以看到a.txt和c.txt的校验和是一样的，所以这两个文件的内容相同。

## sha1sum 多个文件：计算多个文件的SHA1校验和

```
[root@localhost cmp]# sha1sum a.txt b.txt c.txt
01c3d325eeca7f806192dddbfa9ce791cb5c6fc7  a.txt
1cb5cee11036b493799b8b1b0d6ea9704e84c282  b.txt
01c3d325eeca7f806192dddbfa9ce791cb5c6fc7  c.txt
[root@localhost cmp]# 
```
## sha1sum --check file.sha1：检查文件是否被篡改
测试文件：
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
[root@localhost cmp]# sha1sum a.txt b.txt 
01c3d325eeca7f806192dddbfa9ce791cb5c6fc7  a.txt
1cb5cee11036b493799b8b1b0d6ea9704e84c282  b.txt
[root@localhost cmp]# 
```
生成SHA1校验和文件：
```
[root@localhost cmp]# sha1sum a.txt b.txt > a_b.sha1
```
修改文件：
```
[root@localhost cmp]# cat -n a.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
     5    this is a new line
[root@localhost cmp]# cat -n b.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost cmp]#
```
检查所有文件的SHA1校验和：
```
[root@localhost cmp]# sha1sum --check a_b.sha1 
a.txt: 失败
b.txt: 确定
sha1sum: 警告：1 个校验和不匹配
[root@localhost cmp]# 
```
可以看到a.txt校验失败了，这说明a.txt被修改过了。
### sha1sum -c filename.sha1
上面的--check参数可以简写为-c:
```
[root@localhost cmp]# sha1sum -c a_b.sha1 
a.txt: 失败
b.txt: 确定
sha1sum: 警告：1 个校验和不匹配
[root@localhost cmp]# 
```
## sha1sum --check --quiet file.sha1：只显示SHA1校验和失败的文件
```
Try 'sha1sum --help' for more information.
[root@localhost cmp]# sha1sum --check --quiet a_b.sha1 
a.txt: 失败
sha1sum: 警告：1 个校验和不匹配
[root@localhost cmp]#
```
### sha1sum -c --quiet filename.sha1
`--check`可以简写为`-c`,不过需要注意的是`--quiet`参数不能省略:
```
[root@localhost cmp]# sha1sum --check --quiet a_b.sha1 
a.txt: 失败
sha1sum: 警告：1 个校验和不匹配
[root@localhost cmp]# sha1sum -c --quiet a_b.sha1 
a.txt: 失败
sha1sum: 警告：1 个校验和不匹配
[root@localhost cmp]# sha1sum -c -q a_b.sha1 
sha1sum：无效选项 -- q
Try 'sha1sum --help' for more information.
[root@localhost cmp]# 
```

## sha1sum命令手册
### tldr sha1sum
```
[root@localhost cmp]# tldr sha1sum

  sha1sum

  Calculate SHA1 cryptographic checksums.
  More information: https://www.gnu.org/software/coreutils/sha1sum.

  - Calculate the SHA1 checksum for a file:
    sha1sum filename1

  - Calculate SHA1 checksums for multiple files:
    sha1sum filename1 filename2

  - Calculate and save the list of SHA1 checksums to a file:
    sha1sum filename1 filename2 > filename.sha1

  - Read a file of SHA1 sums and verify all files have matching checksums:
    sha1sum --check filename.sha1

  - Only show a message for files for which verification fails:
    sha1sum --check --quiet filename.sha1

[root@localhost cmp]# 
```
### sha1sum --help
```
[root@localhost cmp]# sha1sum --help
用法：sha1sum [选项]... [文件]...
显示或检查 SHA1(160-bit) 校验和。
若没有文件选项，或者文件处为"-"，则从标准输入读取。

  -b, --binary        以二进制模式读取
  -c, --check        从文件中读取SHA1 的校验值并予以检查
      --tag            create a BSD-style checksum
  -t, --text        以纯文本模式读取(默认)
  Note: There is no difference between binary and text mode option on GNU system.

The following four options are useful only when verifying checksums:
      --quiet          don't print OK for each successfully verified file
      --status         don't output anything, status code shows success
      --strict         exit non-zero for improperly formatted checksum lines
  -w, --warn           warn about improperly formatted checksum lines

      --help        显示此帮助信息并退出
      --version        显示版本信息并退出

The sums are computed as described in FIPS-180-1.  When checking, the input
should be a former output of this program.  The default mode is to print
a line with checksum, a character indicating input mode ('*' for binary,
space for text), and name for each FILE.

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告sha1sum 的翻译错误
要获取完整文档，请运行：info coreutils 'sha1sum invocation'
[root@localhost cmp]# 
```
### man sha1sum
```
SHA1SUM(1)                                                            User Commands                                                           SHA1SUM(1)

NAME
       sha1sum - compute and check SHA1 message digest

SYNOPSIS
       sha1sum [OPTION]... [FILE]...

DESCRIPTION
       Print or check SHA1 (160-bit) checksums.  With no FILE, or when FILE is -, read standard input.

       -b, --binary
              read in binary mode

       -c, --check
              read SHA1 sums from the FILEs and check them

       --tag  create a BSD-style checksum

       -t, --text
              read in text mode (default)

              Note: There is no difference between binary and text mode option on GNU system.

   The following four options are useful only when verifying checksums:
       --quiet
              don't print OK for each successfully verified file

       --status
              don't output anything, status code shows success

       --strict
              exit non-zero for improperly formatted checksum lines

       -w, --warn
              warn about improperly formatted checksum lines

       --help display this help and exit

       --version
              output version information and exit

       The  sums  are  computed as described in FIPS-180-1.  When checking, the input should be a former output of this program.  The default mode is to
       print a line with checksum, a character indicating input mode ('*' for binary, space for text), and name for each FILE.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report sha1sum translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Ulrich Drepper, Scott Miller, and David Madore.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for sha1sum is maintained as a Texinfo manual.  If the info and sha1sum programs are properly installed at your site,  the
       command

              info coreutils 'sha1sum invocation'

       should give you access to the complete manual.

GNU coreutils 8.22                                                    November 2020                                                           SHA1SUM(1)
```

# hash算法失误率
MD5: $2^{-128} =3.4×10^{-38}$
SHA-1: $2^{-160} =4.7×10^{-50}$

# 参考资料
