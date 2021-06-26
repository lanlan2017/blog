---
title: Linux 命令行参数的三种风格
categories:
  - 编程
  - Linux
  - 通用
  - Linux命令风格；文件系统
abbrlink: ca8995d9
date: 2021-06-18 22:42:51
updated: 2021-06-18 22:42:51
---
# 命令行参数的三种风格
## 类似dd命令的风格
特点：**命令行参数采用param=value的风格**
```
dd if=sysdisk.img of=/dev/sdb
```
用dd命令将硬盘映像拷贝到硬盘：
- if指定输入文件，
- of指定输出文件

<pre>
dd <mark>if=/dev/urandom</mark> <mark>of=test.dat</mark> <mark>bs=1024</mark> <mark>count=512</mark>
</pre>

用dd命令，生成512KB测试数据文件test.dat。
命令行参数中：if，of，bs，count分别指定输入文件，输出文件，块大小(block size)，以及块计数.

## 类似find和gcc的风格
特点：**以减号打头的一个由多个字符构成的单词用作选项**

<pre>
find src <mark>-name '*.c'</mark> <mark>-type f</mark> <mark>-exec dos2unix --keepdate {} \;</mark>
</pre>

将所有扩展名.c的普通文件由Windows文本格式转为Linux格式
```
gcc -O0 -Wall -g -masm=intel -Wa,-ahl -c shudu.c
```
编译C语言源程序文件mytest.c并生成C程序与汇编代码对比的列表信息

## 类似ls和grep的风格：现今流行的格式
特点：长选项与短选项，有的选项同时有两种格式，也有的选项仅有长格式或仅有短格式
例如：ls（其中-w选项指定一个整数参数值告知ls排版时屏幕的列宽度）

### ls长选项
```
ls --classify --all --size --human-readable --width=80 /home/jiang
```
### ls短选项
ls多个选项挤在一起：
```
ls -Fashw80 /home/jiang
```
多个选项分开：
```
ls -F -a -s -h -w 80 /home/jiang
```
还可以把选项放到后面，这种情况便于在上一个命令后面追加选项：
```
ls -F -w80 /home/jiang -has
```
用独立的命令行参数`--`显式地标识选项结束

选项的处理统一由C语言标准动态链接库libc.so中库函数getopt_long()完成

我们在设置命令的选项的时候，尽量使用类似ls这种的具有长短选项的风格。
### 示例
```
LS(1)                                                                 User Commands                                                                LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List information about the FILEs (the current directory by default).  Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author
              with -l, print the author of each file

       -b, --escape
              print C-style escapes for nongraphic characters

       --block-size=SIZE
              scale sizes by SIZE before printing them; e.g., '--block-size=M' prints sizes in units of 1,048,576 bytes; see SIZE format below

       -B, --ignore-backups
              do not list implied entries ending with ~

       -c     with  -lt:  sort  by, and show, ctime (time of last modification of file status information); with -l: show ctime and sort by name; other‐
              wise: sort by ctime, newest first

       -C     list entries by columns

       --color[=WHEN]
              colorize the output; WHEN can be 'never', 'auto', or 'always' (the default); more info below

       -d, --directory
              list directories themselves, not their contents

       -D, --dired
              generate output designed for Emacs' dired mode

       -f     do not sort, enable -aU, disable -ls --color

       -F, --classify
              append indicator (one of */=>@|) to entries

       --file-type
              likewise, except do not append '*'

       --format=WORD
              across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C

       --full-time
              like -l --time-style=full-iso

       -g     like -l, but do not list owner

       --group-directories-first
              group directories before files;

              can be augmented with a --sort option, but any use of --sort=none (-U) disables grouping

       -G, --no-group
              in a long listing, don't print group names

       -h, --human-readable
              with -l, print sizes in human readable format (e.g., 1K 234M 2G)

       --si   likewise, but use powers of 1000 not 1024

       -H, --dereference-command-line
              follow symbolic links listed on the command line

       --dereference-command-line-symlink-to-dir
              follow each command line symbolic link

              that points to a directory

       --hide=PATTERN
              do not list implied entries matching shell PATTERN (overridden by -a or -A)

       --indicator-style=WORD
              append indicator with style WORD to entry names: none (default), slash (-p), file-type (--file-type), classify (-F)

       -i, --inode
              print the index number of each file

       -I, --ignore=PATTERN
              do not list implied entries matching shell PATTERN

       -k, --kibibytes
              default to 1024-byte blocks for disk usage

       -l     use a long listing format

       -L, --dereference
              when showing file information for a symbolic link, show information for the file the link references rather than for the link itself

       -m     fill width with a comma separated list of entries

       -n, --numeric-uid-gid
              like -l, but list numeric user and group IDs

       -N, --literal
              print raw entry names (don't treat e.g. control characters specially)

       -o     like -l, but do not list group information

       -p, --indicator-style=slash
              append / indicator to directories

       -q, --hide-control-chars
              print ? instead of nongraphic characters

       --show-control-chars
              show nongraphic characters as-is (the default, unless program is 'ls' and output is a terminal)

       -Q, --quote-name
              enclose entry names in double quotes

       --quoting-style=WORD
              use quoting style WORD for entry names: literal, locale, shell, shell-always, c, escape

       -r, --reverse
              reverse order while sorting

       -R, --recursive
              list subdirectories recursively

       -s, --size
              print the allocated size of each file, in blocks

       -S     sort by file size

       --sort=WORD
              sort by WORD instead of name: none (-U), size (-S), time (-t), version (-v), extension (-X)

       --time=WORD
              with -l, show time as WORD instead of default modification time: atime or access or use (-u) ctime or status (-c); also use specified time
              as sort key if --sort=time

       --time-style=STYLE
              with  -l,  show  times  using style STYLE: full-iso, long-iso, iso, locale, or +FORMAT; FORMAT is interpreted like in 'date'; if FORMAT is
              FORMAT1<newline>FORMAT2, then FORMAT1 applies to non-recent files and FORMAT2 to recent files; if STYLE is prefixed with  'posix-',  STYLE
              takes effect only outside the POSIX locale

       -t     sort by modification time, newest first

       -T, --tabsize=COLS
              assume tab stops at each COLS instead of 8

       -u     with -lt: sort by, and show, access time; with -l: show access time and sort by name; otherwise: sort by access time

       -U     do not sort; list entries in directory order

       -v     natural sort of (version) numbers within text

       -w, --width=COLS
              assume screen width instead of current value

       -x     list entries by lines instead of by columns

       -X     sort alphabetically by entry extension

       -1     list one file per line

       SELinux options:

       --lcontext
              Display security context.   Enable -l. Lines will probably be too wide for most displays.

       -Z, --context
              Display security context so it fits on most displays.  Displays only mode, user, group, security context and file name.

       --scontext
              Display only security context and file name.

       --help display this help and exit

       --version
              output version information and exit

       SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of
       1000).

       Using color to distinguish file types is disabled both by default and with --color=never.  With --color=auto, ls  emits  color  codes  only  when
       standard output is connected to a terminal.  The LS_COLORS environment variable can change the settings.  Use the dircolors command to set it.

   Exit status:
       0      if OK,

       1      if minor problems (e.g., cannot access subdirectory),

       2      if serious trouble (e.g., cannot access command-line argument).

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report ls translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Richard M. Stallman and David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for ls is maintained as a Texinfo manual.  If the info and ls programs are properly installed at your site, the command

              info coreutils 'ls invocation'

       should give you access to the complete manual.

GNU coreutils 8.22                                                    November 2020                                                                LS(1)
```