---
title: Linux tldr命令
categories: 
  - Linux
  - 通用
  - 帮助文档
abbrlink: 42d91331
date: 2021-05-08 22:22:58
updated: 2022-04-04 00:51:45
---
# tldr命令介绍
该命令可以显示一些命令的常见用法
tldr全称Too long, Don’t read，翻译成中文就是[太长不读]。tldr根据二八原则将命令的常用场景给出示例，让人一看就懂。
tldr是简化版的使用手册，并不会像man一样把所有的使用参数和说明都列出来，而是只显示常用的几个使用Sample和说明。

## 相关网址
官网：[https://tldr.sh/](https://tldr.sh/)
在线查询网站：[https://tldr.ostera.io/](https://tldr.ostera.io/)
在线查询网站源码：[https://github.com/ostera/tldr.jsx](https://github.com/ostera/tldr.jsx)
github:[https://github.com/tldr-pages/tldr](https://github.com/tldr-pages/tldr)
安卓客户端：
[https://play.google.com/store/apps/details?id=io.github.hidroh.tldroid](https://play.google.com/store/apps/details?id=io.github.hidroh.tldroid)
[https://play.google.com/store/apps/details?id=wtf.technodisaster.tldr](https://play.google.com/store/apps/details?id=wtf.technodisaster.tldr)
电脑客户端：[https://github.com/terenceng2010/tldr-electron](https://github.com/terenceng2010/tldr-electron)
# tldr安装
```
npm install -g tldr
```
# tldr使用示例
## tldr man
```
[root@localhost sed]# tldr man

  man

  Format and display manual pages.
  More information: https://www.man7.org/linux/man-pages/man1/man.1.html.

  - Display the man page for a command:
    man command

  - Display the man page for a command from section 7:
    man command.7

  - Display the path searched for manpages:
    man --path

  - Display the location of a manpage rather than the manpage itself:
    man -w command

  - Display the man page using a specific locale:
    man command --locale=locale

  - Search for manpages containing a search string:
    man -k "search_string"


[root@localhost sed]# 
```
## tldr ls
```
[root@localhost sed]# tldr ls

  ls

  List directory contents.
  More information: https://www.gnu.org/software/coreutils/ls.

  - List files one per line:
    ls -1

  - List all files, including hidden files:
    ls -a

  - List all files, with trailing / added to directory names:
    ls -F

  - Long format list (permissions, ownership, size, and modification date) of all files:
    ls -la

  - Long format list with size displayed using human readable units (KiB, MiB, GiB):
    ls -lh

  - Long format list sorted by size (descending):
    ls -lS

  - Long format list of all files, sorted by modification date (oldest first):
    ls -ltr


[root@localhost sed]# 
```
## tldr tar
```
[root@localhost sed]# tldr tar

  tar

  Archiving utility.
  Often combined with a compression method, such as gzip or bzip2.
  More information: https://www.gnu.org/software/tar.

  - [c]reate an archive and write it to a [f]ile:
    tar cf target.tar file1 file2 file3

  - [c]reate a g[z]ipped archive and write it to a [f]ile:
    tar czf target.tar.gz file1 file2 file3

  - [c]reate a g[z]ipped archive from a directory using relative paths:
    tar czf target.tar.gz --directory=path/to/directory .

  - E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:
    tar xvf source.tar[.gz|.bz2|.xz]

  - E[x]tract a (compressed) archive [f]ile into the target directory:
    tar xf source.tar[.gz|.bz2|.xz] --directory=directory

  - [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:
    tar caf target.tar.xz file1 file2 file3

  - Lis[t] the contents of a tar [f]ile [v]erbosely:
    tar tvf source.tar

  - E[x]tract files matching a pattern from an archive [f]ile:
    tar xf source.tar --wildcards "*.html"

[root@localhost sed]# 
```
# 参考资料
[https://www.hi-linux.com/posts/16098.html](https://www.hi-linux.com/posts/16098.html)
[https://blog.csdn.net/xingchenxuanfeng/article/details/89398327](https://blog.csdn.net/xingchenxuanfeng/article/details/89398327)
