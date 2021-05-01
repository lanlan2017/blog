---
title: Linux ls命令详解
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: 3283dcaa
date: 2021-03-23 05:11:29
updated: 2021-04-13 23:31:08
---
<div id='my_toc'><a href="/blog/3283dcaa/#ls命令含义" class="header_1">ls命令含义</a>&nbsp;<br><a href="/blog/3283dcaa/#语法" class="header_1">语法</a>&nbsp;<br><a href="/blog/3283dcaa/#参数" class="header_2">参数</a>&nbsp;<br><a href="/blog/3283dcaa/#实例" class="header_1">实例</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-a" class="header_2">ls -a</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-A" class="header_2">ls -A</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-F" class="header_2">ls -F</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-l" class="header_2">ls -l</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-l各列含义" class="header_3">ls -l各列含义</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-lh" class="header_3">ls -lh</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-l-full-time显示完整时间-显示年月日" class="header_2">ls -l --full-time显示完整时间 显示年月日</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-t-按时间排序列出-时间越近越在前" class="header_2">ls -t 按时间排序列出 时间越近越在前</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-tr-按时间排序-时间越远越在前" class="header_2">ls -tr 按时间排序 时间越远越在前</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-R" class="header_2">ls -R</a>&nbsp;<br><a href="/blog/3283dcaa/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# ls命令含义
Linux ls（英文全拼：list files）命令用于显示指定工作目录下之内容（列出目前工作目录所含之文件及子目录)。
# 语法
```bash
ls [-alrtAFR] [name...]
```
## 参数

|参数|描述|
|:---|:---|
|-a|显示所有文件及目录 (. 开头的隐藏文件也会列出)|
|-A|同 -a ，但不列出 "." (目前目录) 及 ".." (父目录)|
|-F|在列出的文件名称后加一符号；例如可执行档则加 "*", 目录则加 "/"|
|-l|除文件名称外，亦将文件型态、权限、拥有者、文件大小等资讯详细列出|
|-r|将文件以相反次序显示(原定依英文字母次序)|
|-t|将文件依建立时间之先后次序列出(时间越近越在前面)|
|-R|若目录下有文件，则以下之文件亦皆依序列出|

## man ls
```
LS(1)                                                                 General Commands Manual                                                                LS(1)

NAME
       ls, dir, vdir - 列目录内容

提要
       ls [选项] [文件名...]

       POSIX 标准选项: [-CFRacdilqrtu1]

GNU 选项 (短格式):
       [-1abcdfgiklmnopqrstuxABCDFGLNQRSUX]   [-w  cols]  [-T  cols]  [-I  pattern]  [--full-time]  [--format={long,verbose,commas,across,vertical,single-column}]
       [--sort={none,time,size,extension}] [--time={atime,access,use,ctime,status}] [--color[={none,auto,always}]] [--help] [--version] [--]

描述（ DESCRIPTION ）
       程序ls先列出非目录的文件项，然后是每一个目录中的“可显示”文件。如果 没有选项之外的参数【译注：即文件名部分为空】出现，缺省为  "."  （当前目录）。  选项“  -d
       ”使得目录与非目录项同样对待。除非“ -a ” 选项出现，文 件名以“.”开始的文件不属“可显示”文件。

       以当前目录为准，每一组文件（包括非目录文件项，以及每一内含文件的目录）分      别按文件名比较顺序排序。如果“      -l      ”选项存在，每组文件前显示一摘要行:
       给出该组文件长度之和（以 512 字节为单位）。

       输出是到标准输出（ stdout ）。除非以“ -C ”选项要求按多列输出，输出 将是一行一个。然而，输出到终端时，单列输出或多列输出是不确定的。可以分别  用选项“  -1  ”
       或“ -C ”来强制按单列或多列输出。

       -C     多列输出，纵向排序。

       -F     每个目录名加“ / ”后缀，每个 FIFO 名加“ | ”后缀， 每个可运行名加“ * ”后缀。

       -R     递归列出遇到的子目录。

       -a     列出所有文件，包括以 "." 开头的隐含文件。

       -c     使用“状态改变时间”代替“文件修改时间”为依据来排序 （使用“ -t ”选项时）或列出（使用“ -l ”选项时）。

       -d     将目录名象其它文件一样列出，而不是列出它们的内容。

       -i     输出文件前先输出文件系列号（即     i     节点号:     i-node     number）。     -l     列出（以单列格式）文件模式（     file     mode    ），文件的链
              接数，所有者名，组名，文件大小（以字节为单位），时间信     息，及文件名。缺省时，时间信息显示最近修改时间；可以以     选项“     -c      ”和“      -u
              ”选择显示其它两种时间信息。对于设 备文件，原先显示文件大小的区域通常显示的是主要和次要的 号（majorand minor device numbers）。

       -q     将文件名中的非打印字符输出为问号。（对于到终端的输出这是缺省的。）

       -r     逆序排列。

       -t     按时间信息排序。

       -u     使用最近访问时间代替最近修改时间为依据来排序（使用 “ -t ”选项时）或列出（使用“ -l ”选项时）。

       -1 单列输出。

GNU 细节
       如果标准输出是终端，将多列输出（纵向排序）。

       dir ( 也被安装为命令 d ) 等同于“ ls -C ”；即，文件
              缺省是多列输出，纵向排序。vdir ( 也被安装为命令 v ) 等同于“ ls -l ”； 即，文件缺省是按长格式输出。

GNU 选项
       -1, --format=single-column 一行输出一个文件（单列输出）。如标准输出不是到终端， 此选项就是缺省选项。

       -a, --all
              列出目录中所有文件，包括以“.”开头的文件。

       -b, --escape
              把文件名中不可输出的字符用反斜杠加字符编号(就象在 C 语言里一样)的形式列出。

       -c, --time=ctime, --time=status
              按文件状态改变时间（i节点中的ctime）排序并输出目录内                                              容。如采用长格式输出（选项“-l”），使用文件的状态改
              变时间取代文件修改时间。【译注：所谓文件状态改变（i节 点中以ctime标志），既包括文件被修改，又包括文件属性（ 如所有者、组、链接数等等）的变化】

       -d, --directory
              将目录名象其它文件一样列出，而不是列出它们的内容。

       -f     不排序目录内容；按它们在磁盘上存储的顺序列出。同时启 动“ -a ”选项，如果在“ -f ”之前存在“ -l ”、“ - -color ”或“ -s ”，则禁止它们。

       -g 忽略，为兼容UNIX用。

       -i, --inode
              在每个文件左边打印 i 节点号（也叫文件序列号和索引号: file serial number and index number）。i节点号在每个特定的文件系统中是唯一的。

       -k, --kilobytes
              如列出文件大小，则以千字节KB为单位。

       -l, --format=long, --format=verbose
              除每个文件名外，增加显示文件类型、权限、硬链接数、所               有者名、组名、大小（               byte                ）、及时间信息（如未指明是
              其它时间即指修改时间）。对于6个月以上的文件或超出未来 1 小时的文件，时间信息中的时分将被年代取代。

              每个目录列出前，有一行“总块数”显示目录下全部文件所    占的磁盘空间。块默认是    1024   字节；如果设置了   POSIXLY_CORRECT   的环境变量，除非用“   -k
              ”选项，则默认块大小是 512 字 节。每一个硬链接都计入总块数（因此可能重复计数），这无 疑是个缺点。

       列出的权限类似于以符号表示（文件）模式的规范。但是 ls
              在每套权限的第三个字符中结合了多位（ multiple bits ） 的信息，如下： s 如果设置了 setuid 位或 setgid 位，而且也设置了相应的可执行位。  S  如果设置了
              setuid    位或    setgid    位，但是没有设置相应的可执行位。    t   如果设置了   sticky   位，而且也设置了相应的可执行位。   T   如果设置了   sticky
              位，但是没有设置相应的可执行位。 x 如果仅仅设置了可执行位而非以上四种情况。 - 其它情况（即可执行位未设置）。

       -m, --format=commas
              水平列出文件，每行尽可能多，相互用逗号和一个空格分隔。

       -n, --numeric-uid-gid
              列出数字化的 UID 和 GID 而不是用户名和组名。

       -o     以长格式列出目录内容，但是不显示组信息。等于使用“ --format=long --no-group ”选项。提供此选项是为了与其它版本的 ls 兼容。

       -p     在每个文件名后附上一个字符以说明该文件的类型。类似“ -F ”选项但是不 标示可执行文件。

       -q, --hide-control-chars
              用问号代替文件名中非打印的字符。这是缺省选项。

       -r, --reverse
              逆序排列目录内容。

       -s, --size
              在每个文件名左侧输出该文件的大小，以 1024 字节的块为单位。如果设置了 POSIXLY_CORRECT 的环境变量，除非用“ -k ”选项，块大小是 512 字节。

       -t, --sort=time
              按文件最近修改时间（ i 节点中的 mtime ）而不是按文件名字典序排序，新文件 靠前。

       -u, --time=atime, --time=access, --time=use
              类似选项“ -t ”，但是用文件最近访问时间（ i 节点中的 atime ）取代文件修 改时间。如果使用长格式列出，打印的时间是最近访问时间。

       -w, --width cols
              假定屏幕宽度是 cols （ cols 以实际数字取代）列。如未用此选项，缺省值是这 样获得的：如可能先尝试取自终端驱动，否则尝试取自环境变量  COLUMNS  （如果设
              置了的话），都不行则取 80 。

       -x, --format=across, --format=horizontal
              多列输出，横向排序。

       -A, --almost-all
              显示除 "." 和 ".." 外的所有文件。

       -B, --ignore-backups
              不输出以“ ~ ”结尾的备份文件，除非已经在命令行中给出。

       -C, --format=vertical
              多列输出，纵向排序。当标准输出是终端时这是缺省项。使用命令名 dir 和 d 时， 则总是缺省的。

       -D, --dired
              当采用长格式（“ -l ”选项）输出时，在主要输出后，额外打印一行： //DIRED// BEG1 END1 BEG2 END2 ...

       BEGn 和 ENDn 是无符号整数，记录每个文件名的起始、结束位置在输出中的位置（
              字节偏移量）。这使得 Emacs 易于找到文件名，即使文件名包含空格或换行等非正 常字符也无需特异的搜索。

       如果目录是递归列出的（“ -R ”选项），每个子目录后列出类似一行：
              //SUBDIRED//  BEG1  END1  ...   【译注：我测试了  TurboLinux4.0  和  RedHat6.1 ，发现它们都是在 “ //DIRED// BEG1... ”之后列出“ //SUBDIRED// BEG1 ...
              ”，也即只有一个 而不是在每个子目录后都有。而且“ //SUBDIRED// BEG1 ... ”列出的是各个子目 录名的偏移。】

       -F, --classify, --file-type
              在每个文件名后附上一个字符以说明该文件的类型。“ * ”表示普通的可执行文件； “ / ”表示目录；“ @ ”表示符号链接；“ | ”表示FIFOs；“ =  ”表示套接字  (sock‐
              ets) ；什么也没有则表示普通文件。

       -G, --no-group
              以长格式列目录时不显示组信息。

       -I, --ignorepattern
              除非在命令行中给定，不要列出匹配  shell 文件名匹配式（ pattern ，不是指一般 表达式）的文件。在 shell 中，文件名以 "." 起始的不与在文件名匹配式 (pat‐
              tern) 开头的通配符匹配。

       -L, --dereference
              列出符号链接指向的文件的信息，而不是符号链接本身。

       -N, --literal
              不要用引号引起文件名。

       -Q, --quote-name
              用双引号引起文件名，非打印字符以 C 语言的方法表示。

       -R, --recursive
              递归列出全部目录的内容。

       -S, --sort=size
              按文件大小而不是字典序排序目录内容，大文件靠前。

       -T, --tabsize cols
              假定每个制表符宽度是 cols 。缺省为 8。为求效率， ls 可能在输出中使用制表符。 若 cols 为 0，则不使用制表符。

       -U, --sort=none
              不排序目录内容；按它们在磁盘上存储的顺序列出。（选项“ -U ”和“  -f  ”的不  同是前者不启动或禁止相关的选项。）这在列很大的目录时特别有用，因为不加排序
              能显著的加快速度。

       -X, --sort=extension
              按文件扩展名（由最后的 "." 之后的字符组成）的字典序排序。没有扩展名的先列 出。

       --color[=when]
              指定是否使用颜色区别文件类别。环境变量 LS_COLORS 指定使用的颜色。如何设置 这个变量见 dircolors(1) 。 when 可以被省略，或是以下几项之一：

       none 不使用颜色，这是缺省项。
              auto 仅当标准输出是终端时使用。 always 总是使用颜色。指定 --color 而且省略 when 时就等同于 --color=always 。

       --full-time
              列出完整的时间，而不是使用标准的缩写。格式如同  date(1)  的缺省格式；此格式  是不能改变的，但是你可以用  cut(1) 取出其中的日期字串并将结果送至命令 “
              date -d ”。

       输出的时间包括秒是非常有用的。（ Unix 文件系统储存文件的时间信息精确到秒，
              因此这个选项已经给出了系统所知的全部信息。）例如，当你有一个 Makefile 文件 不能恰当的生成文件时，这个选项会提供帮助。

GNU 标准选项
       --help 打印用法信息到标准输出并顺利退出。

       --version
              打印版本信息到标准输出并顺利退出。

       --     结束选项表。

环境
       变量  POSIXLY_CORRECT  可以决定一组选择。如果没有设置此变量，每个制表符的字  符数由变量  TABSIZE  决定。变量  COLUMNS  （当它由一个十进制整数表示时）决定输
       出的列宽度（同“ -C ”选项一起用时）。文件名不得为适应多列输出而被截断。变 量 LANG, LC_ALL, LC_COLLATE, LC_CTYPE, LC_MESSAGES 及 LC_TIME 仍保持原义。 变量 TZ
       给出时区供 ls 输出相应的时间字串。变量 LS_COLORS 用以决定是否使用 颜色。

已知错误
       在 BSD 系统上，对于从 HP-UX 系统上通过 NFS mount 而来的文件，“ -s ”选项报  告的大小只有正确值的一半；在  HP-UX  系统上，对于从  BSD  系统上通过  NFS  mount
       而来的文件， ls 报告的大小则有正确值的两倍。这是 HP-UX 的一个缺陷造成的，它 也影响 HP-UX 上的 ls 程序。

适合到
       POSIX 1003.2

参见
       dircolors(1)

注意
       本页描述的是  fileutils-3.16  文件包中的  ls  ，其它版本的可能略有不同。纠错或添  加（功能）请  mailto: aeb@cwi.nl 和 aw@mail1.bet1.puv.fi 及 ragnar@light‐
       side.ddns.org 。本程序的错误报告请 mailto: fileutils-bugs@gnu.ai.mit.edu 。

```
## man ls英文
```
LS(1)                                                                      User Commands                                                                     LS(1)

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

       -c     with  -lt: sort by, and show, ctime (time of last modification of file status information); with -l: show ctime and sort by name; otherwise: sort by
              ctime, newest first

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
              with -l, show time as WORD instead of default modification time: atime or access or use (-u) ctime or status (-c); also use specified time  as  sort
              key if --sort=time

       --time-style=STYLE
              with  -l, show times using style STYLE: full-iso, long-iso, iso, locale, or +FORMAT; FORMAT is interpreted like in 'date'; if FORMAT is FORMAT1<new‐
              line>FORMAT2, then FORMAT1 applies to non-recent files and FORMAT2 to recent files; if STYLE is prefixed with 'posix-', STYLE takes effect only out‐
              side the POSIX locale

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

       SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000).

       Using  color to distinguish file types is disabled both by default and with --color=never.  With --color=auto, ls emits color codes only when standard out‐
       put is connected to a terminal.  The LS_COLORS environment variable can change the settings.  Use the dircolors command to set it.

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

```
# 实例
列出根目录(\)下的所有目录：
```
[root@localhost exam]# ls /
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
## ls -a
```
[root@localhost exam]# ls -a /
.  ..  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
## ls -A
```
[root@localhost exam]# ls -A /
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
## ls -F
```
[root@localhost exam]# ls
_config.yml  FM.properties  HexoS.bat  HexoSTest.bat  package.json       scaffolds  StartWriting.bat
db.json      HexoD.bat      hexos.sh   node_modules   package-lock.json  source     themes
[root@localhost exam]# ls -F
_config.yml  FM.properties  HexoS.bat  HexoSTest.bat  package.json       scaffolds/  StartWriting.bat
db.json      HexoD.bat      hexos.sh*  node_modules/  package-lock.json  source/     themes/
[root@localhost exam]# 
```
## ls -l
```
[root@localhost exam]# ls -l
总用量 3640
-rw-r--r--.   1 root root    3093 3月  19 21:12 _config.yml
-rw-r--r--.   1 root root 3498022 3月  22 20:29 db.json
-rw-r--r--.   1 root root     158 3月  19 21:12 FM.properties
-rw-r--r--.   1 root root     576 3月  19 21:12 HexoD.bat
-rw-r--r--.   1 root root     431 3月  22 20:52 HexoS.bat
-rwxr--r--.   1 root root     174 3月  19 21:16 hexos.sh
-rw-r--r--.   1 root root     376 3月  19 21:12 HexoSTest.bat
drwxr-xr-x. 308 root root    8192 3月  19 21:19 node_modules
-rw-r--r--.   1 root root     817 3月  19 21:12 package.json
-rw-r--r--.   1 root root  170424 3月  19 21:19 package-lock.json
drwxr-xr-x.   2 root root    4096 3月  19 21:12 scaffolds
drwxr-xr-x.   9 root root    4096 3月  19 21:12 source
-rw-r--r--.   1 root root     422 3月  19 21:12 StartWriting.bat
drwxr-xr-x.   3 root root    4096 3月  19 21:12 themes
[root@localhost exam]#
```
### ls -l各列含义

|列数|描述|
|:---|:---|
|第一列|共10位，第1位表示文档类型，d表示目录，-表示文件，l表示链接文件，d表示可随机存取的设备，如U盘等，c表示一次性读取设备，如鼠标、键盘等。后9位，依次对应三种身份所拥有的权限，身份顺序为：owner、group、others，权限顺序为：readable、writable、excutable。如：-r-xr-x---的含义为当前文档是一个文件，拥有者可读、可执行，同一个群组下的用户，可读、可写，其他人没有任何权限。|
|第二列|表示链接数，表示有多少个文件链接到inode号码。|
|第三列|表示拥有者|
|第四列|表示所属群组|
|第五列|表示文档容量大小，单位字节|
|第六列|表示文档最后修改时间，注意不是文档的创建时间哦|
|第七列|表示文档名称。以点(.)开头的是隐藏文档|
|
### ls -lh
参考资料：[https://www.cnblogs.com/sparkdev/p/7476005.html](https://www.cnblogs.com/sparkdev/p/7476005.html)
在 Linux 命令中，涉及到文件大小的地方，一般默认是以**字节**为单位显示的。这样可读性就不是很好。所以有了 -h 选项！这个选项的全称是`--human-readable`(给人读的)。也就是以 K, M, G 等单位来显示文件的大小：
```
[root@localhost exam]# ls -lh
总用量 3.6M
-rw-r--r--.   1 root root 3.1K 3月  19 21:12 _config.yml
-rw-r--r--.   1 root root 3.4M 3月  22 20:29 db.json
-rw-r--r--.   1 root root  158 3月  19 21:12 FM.properties
-rw-r--r--.   1 root root  576 3月  19 21:12 HexoD.bat
-rw-r--r--.   1 root root  431 3月  22 20:52 HexoS.bat
-rwxr--r--.   1 root root  174 3月  19 21:16 hexos.sh
-rw-r--r--.   1 root root  376 3月  19 21:12 HexoSTest.bat
drwxr-xr-x. 308 root root 8.0K 3月  19 21:19 node_modules
-rw-r--r--.   1 root root  817 3月  19 21:12 package.json
-rw-r--r--.   1 root root 167K 3月  19 21:19 package-lock.json
drwxr-xr-x.   2 root root 4.0K 3月  19 21:12 scaffolds
drwxr-xr-x.   9 root root 4.0K 3月  19 21:12 source
-rw-r--r--.   1 root root  422 3月  19 21:12 StartWriting.bat
drwxr-xr-x.   3 root root 4.0K 3月  19 21:12 themes
[root@localhost exam]# 
```
## ls -l --full-time显示完整时间 显示年月日


## ls -t 按时间排序列出 时间越近越在前
```
[root@localhost exam]# ls -t
HexoS.bat  package-lock.json  hexos.sh  themes       FM.properties  HexoSTest.bat  scaffolds
db.json    node_modules       source    _config.yml  HexoD.bat      package.json   StartWriting.bat
[root@localhost exam]#
```
## ls -tr 按时间排序 时间越远越在前
```
[root@localhost 专项练习]# ls -lt --full-time
总用量 36
drwxr-xr-x. 5 root root 4096 2021-04-12 23:05:19.448995210 +0800 Linux
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 操作系统
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 计算机网络
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 数据库
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 智力题
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 JavaScript
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 加密和安全
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:00.987846496 +0800 HTML CSS
drwxr-xr-x. 5 root root 4096 2021-03-19 21:12:12.596962591 +0800 Java
[root@localhost 专项练习]# ls -ltr --full-time
总用量 36
drwxr-xr-x. 5 root root 4096 2021-03-19 21:12:12.596962591 +0800 Java
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:00.987846496 +0800 HTML CSS
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 加密和安全
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 JavaScript
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 智力题
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 数据库
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 计算机网络
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 操作系统
drwxr-xr-x. 5 root root 4096 2021-04-12 23:05:19.448995210 +0800 Linux
[root@localhost 专项练习]# 
```
## ls -R
`ls Java`:
```
[root@localhost 专项练习]# pwd
/root/exam/source/_posts/牛客网/专项练习
[root@localhost 专项练习]# ls
HTML CSS  Java  JavaScript  Linux  操作系统  计算机网络  加密和安全  数据库  智力题
[root@localhost 专项练习]# ls Java
2019年10月  2019年11月  2019年12月
```
`ls -R Java`:
```
[root@localhost 专项练习]# ls -R Java
Java:
2019年10月  2019年11月  2019年12月

Java/2019年10月:
2019年10月28日 java 1.md  2019年10月29日 Java 1.md  2019年10月29日 java 3.md  2019年10月29日 java 5.md  2019年10月30日 java 2.md  2019年10月30日 java 4.md
2019年10月28日 java 2.md  2019年10月29日 java 2.md  2019年10月29日 java 4.md  2019年10月30日 java 1.md  2019年10月30日 java 3.md  2019年10月30日 java 5.md

Java/2019年11月:
2019年11月10日 Java1.md  2019年11月14日 java2.md  2019年11月22日 java1.md  2019年11月28日 java2.md  2019年11月5日 Java 2.md  2019年11月8日 Java1.md
2019年11月11日 java1.md  2019年11月15日 java1.md  2019年11月23日 java1.md  2019年11月29日 java1.md  2019年11月5日 java3.md   2019年11月8日 java2.md
2019年11月11日 Java2.md  2019年11月15日 java2.md  2019年11月23日 java2.md  2019年11月2日 java 1.md  2019年11月6日 java1.md   2019年11月9日 java1.md
2019年11月13日 java1.md  2019年11月15日 java3.md  2019年11月24日 java1.md  2019年11月4日 java 1.md  2019年11月6日 java2.md   2019年11月9日 java2.md
2019年11月14日 java1.md  2019年11月16日 java1.md  2019年11月28日 java1.md  2019年11月5日 Java 1.md  2019年11月7日 java3.md

Java/2019年12月:
2019年12月10日 java1.md  2019年12月11日 java2.md  2019年12月13日 java2.md  2019年12月17日 java1.md  2019年12月25日 java1.md
2019年12月10日 java2.md  2019年12月12日 java1.md  2019年12月14日 java1.md  2019年12月23日 java1.md  2019年12月30日 java1.md
2019年12月10日 java3.md  2019年12月13日 java1.md  2019年12月16日 java1.md  2019年12月24日 java1.md  2019年12月8日 java2.md
[root@localhost 专项练习]#
```
## ls -s：列出文件的大小
```
[root@localhost 2021年04月]# ls -s
总用量 148
16 2021年04月09日Linux专项练习1.md  16 2021年04月12日Linux专项练习2.md  12 2021年04月18日Linux专项练习1.md  12 2021年04月18日Linux专项练习4.md
16 2021年04月11日Linux专项练习1.md  16 2021年04月12日Linux专项练习3.md  12 2021年04月18日Linux专项练习2.md  12 2021年04月18日Linux专项练习5.md
12 2021年04月12日Linux专项练习1.md  12 2021年04月17日Linux专项联系1.md  12 2021年04月18日Linux专项练习3.md
[root@localhost 2021年04月]#
```
### ls -hs：列出文件大小，阅读友好显示
```
[root@localhost 2021年04月]# ls -hs
总用量 148K
16K 2021年04月09日Linux专项练习1.md  16K 2021年04月12日Linux专项练习2.md  12K 2021年04月18日Linux专项练习1.md  12K 2021年04月18日Linux专项练习4.md
16K 2021年04月11日Linux专项练习1.md  16K 2021年04月12日Linux专项练习3.md  12K 2021年04月18日Linux专项练习2.md  12K 2021年04月18日Linux专项练习5.md
12K 2021年04月12日Linux专项练习1.md  12K 2021年04月17日Linux专项联系1.md  12K 2021年04月18日Linux专项练习3.md
[root@localhost 2021年04月]# 
```
## ls -S：按文件大小而不是字典序排序目录内容，大文件靠前。
```
[root@localhost 2021年04月]# ls -s|sort -r|head
总用量 148
16 2021年04月12日Linux专项练习3.md
16 2021年04月12日Linux专项练习2.md
16 2021年04月11日Linux专项练习1.md
16 2021年04月09日Linux专项练习1.md
12 2021年04月18日Linux专项练习5.md
12 2021年04月18日Linux专项练习4.md
12 2021年04月18日Linux专项练习3.md
12 2021年04月18日Linux专项练习2.md
12 2021年04月18日Linux专项练习1.md
[root@localhost 2021年04月]# ls -S|head
2021年04月11日Linux专项练习1.md
2021年04月09日Linux专项练习1.md
2021年04月12日Linux专项练习2.md
2021年04月12日Linux专项练习3.md
2021年04月18日Linux专项练习5.md
2021年04月12日Linux专项练习1.md
2021年04月17日Linux专项联系1.md
2021年04月18日Linux专项练习1.md
2021年04月18日Linux专项练习2.md
2021年04月18日Linux专项练习3.md
[root@localhost 2021年04月]# 
```
# ls与其他命令组合使用
查看当前目录下大小最大的前10个文件：
```
[root@localhost 2021年04月]# ls -sh|sort -r|head
总用量 148K
16K 2021年04月12日Linux专项练习3.md
16K 2021年04月12日Linux专项练习2.md
16K 2021年04月11日Linux专项练习1.md
16K 2021年04月09日Linux专项练习1.md
12K 2021年04月18日Linux专项练习5.md
12K 2021年04月18日Linux专项练习4.md
12K 2021年04月18日Linux专项练习3.md
12K 2021年04月18日Linux专项练习2.md
12K 2021年04月18日Linux专项练习1.md
[root@localhost 2021年04月]#
```
查看当前目录下大小最小的前10个文件：
```
[root@localhost 2021年04月]# ls -sh|sort|head
12K 2021年04月12日Linux专项练习1.md
12K 2021年04月17日Linux专项联系1.md
12K 2021年04月18日Linux专项练习1.md
12K 2021年04月18日Linux专项练习2.md
12K 2021年04月18日Linux专项练习3.md
12K 2021年04月18日Linux专项练习4.md
12K 2021年04月18日Linux专项练习5.md
16K 2021年04月09日Linux专项练习1.md
16K 2021年04月11日Linux专项练习1.md
16K 2021年04月12日Linux专项练习2.md
[root@localhost 2021年04月]#
```
# 参考资料
[https://www.runoob.com/linux/linux-comm-ls.html](https://www.runoob.com/linux/linux-comm-ls.html)
