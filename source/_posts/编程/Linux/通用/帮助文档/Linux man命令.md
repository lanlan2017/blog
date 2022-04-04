---
title: Linux man命令
categories: 
  - Linux
  - 通用
  - 帮助文档
abbrlink: 6e64ba3d
date: 2021-04-04 14:24:18
updated: 2022-04-04 00:51:45
---
# man命令简介
Linux最常用命令一般由两到三个字母构成，man取自manual（手册）的前三个字母。

## man命令分页器

|man命令分页器|功能|
|:---|:---|
|q|退出|
|空格|下一页|
|上下箭头|上移下移|

# man命令的几种用法
## man name
这里的name，可以是命令的名字，可以是系统调用的名字，也可以是库函数的名字，也可以是系统配置文件。
## man section name
section是一个数字编号，1表示第一章。
### man section中section的含义

|章节编号|描述|
|:---|:---|
|1|命令|
|2|系统调用|
|3|库函数|
|5|配置文件|

```
1、Standard commands （标准命令）
2、System calls （系统调用）
3、Library functions （库函数）
4、Special devices （设备说明）
5、File formats （文件格式）
6、Games and toys （游戏和娱乐）
7、Miscellaneous （杂项）
8、Administrative Commands （管理员命令）
```

例如
```
man 1 sheep #查看第一章的sleep命令
```
命令结果：
```
SLEEP(1)                                                                User Commands                                                               SLEEP(1)

NAME
       sleep - delay for a specified amount of time

SYNOPSIS
       sleep NUMBER[SUFFIX]...
       sleep OPTION

DESCRIPTION
       Pause  for NUMBER seconds.  SUFFIX may be 's' for seconds (the default), 'm' for minutes, 'h' for hours or 'd' for days.  Unlike most implementations
       that require NUMBER be an integer, here NUMBER may be an arbitrary floating point number.  Given two or more arguments, pause for the amount of  time
       specified by the sum of their values.

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report sleep translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Jim Meyering and Paul Eggert.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       sleep(3)

       The full documentation for sleep is maintained as a Texinfo manual.  If the info and sleep programs are properly installed at your site, the command
 Manual page sleep(1) line 1 (press h for help or q to quit)

```


## man -k regexp
列出关键字(keyword)与正则表达式regexp匹配的手册项目录
例如
```
man -k dhcp
```
## man查看C语言的库函数
```
man strcpy
```
```
man strstr
```

## 手册页内容
- 列出基本功能和语法
- 对于C语言的函数调用，列出头文件和链接函数库
- 功能说明
- SEE ALSO：有关的其它项目的名字和章节号

## man中文翻译
### Debian/Ubuntu安装man中文翻译
```
$ sudo apt update
$ sudo apt install manpages-zh
```
### Arch Linux
```
$ pacman -Syu
$ pacman -S man-pages-zh_cn man-pages-zh_tw
```
### Red Hat/CentOS
```
$ yum update
$ yum install man-pages-zh-CN
```
### Fedora
```
$ dnf update
$ dnf install man-pages-zh-CN
```
### 参考资料
[https://github.com/man-pages-zh/manpages-zh](https://github.com/man-pages-zh/manpages-zh)
[https://blog.csdn.net/zha6476003/article/details/84328257](https://blog.csdn.net/zha6476003/article/details/84328257)
[https://segmentfault.com/a/1190000019972482](https://segmentfault.com/a/1190000019972482)

## man中英文切换
但是中文存在翻译的问题有时也不能明确的表达意思，这时又想回去再看英文版的该怎么办呢，有3种方法：
### man -L en
1、可以使用man -L en依然用英文打开某个命令的man手册
例如
```
man -L en ls
```
将显示英文的ls手册
#### man -L zh_CN 命令
显示简体中文的命令手册。
```
man -L zh_CN ls
```
#### man -L zn_TW 命令
显示繁体中文的命令手册。
### 使用man -L en的别名
如果觉得环境变量切换来切换去比较麻烦，可以给man -L en创建一个别名，写进/etc/bashrc配置文件里，source一下，下次就可以直接使用这个命令来用英文来看man手册了
```
vim /etc/bashrc
```
在文件末尾添加如下代码：
```
alias manen='man -L en'
```
然后保存，退出。这样创建了一个manen命令，专门用来显示英文的命令手册。

输入如下命令，使配置生效。
```
source /etc/bashrc
```
下面就可以使用manen命令来创建查看英文的命令手册了。而使用man命令则显示中文手册。
#### 示例
```
manen mkdir
```
显示效果：
```
MKDIR(1)                                                                   User Commands                                                                  MKDIR(1)

NAME
       mkdir - make directories

SYNOPSIS
       mkdir [OPTION]... DIRECTORY...


```
### 临时切换系统语言的环境变量
临时切换为最早最简单的C语言环境（标准ASCII码）
```
LANG=C
```
临时切换语言为美国英文：
```
LANG=en_US.utf8
```
临时切换语言为简体中文：
```
LANG=zh_CN.utf8
```
这种切换只会对当前的bash有效，关闭当前bash之后，还是会显示中文。

#### 示例
当前的本地环境是中文的：
```
[root@localhost ~]# echo $LANG
zh_CN.UTF-8
```
切换为美国英文UTF-8：
```
[root@localhost ~]# LANG=en.US.UTF-8
[root@localhost ~]# echo $LANG
en.US.UTF-8
```
此时使用man查看手册就是英文的了
```
[root@localhost ~]# man mkdir
```
显示效果：
```
MKDIR(1)                                                                   User Commands                                                                  MKDIR(1)

NAME
       mkdir - make directories

SYNOPSIS
       mkdir [OPTION]... DIRECTORY...

```
同理输入LANG=zh_CN.UTF-8即可显示中文的手册
```
[root@localhost ~]# LANG=zh_CN.UTF-8
```
显示效果：
```
MKDIR(1)                                                              General Commands Manual                                                             MKDIR(1)

NAME
       mkdir -建立目录

总览
       mkdir [选项] 目录...

```

# 参考资料
[https://blog.csdn.net/shengjie87/article/details/106981351](https://blog.csdn.net/shengjie87/article/details/106981351)
<https://blog.csdn.net/binboot/article/details/41978573>
<https://www.topbyte.cn/2010/09/linux-man/>
