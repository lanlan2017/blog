---
title: Linux bash的启动
categories:
  - 编程
  - Linux
  - 通用
  - Shell的基本机制
abbrlink: 2b671225
date: 2021-06-26 14:39:59
updated: 2021-06-26 14:39:59
---
## 启动交互式bash 
## 三种启动方法
- 注册shell:注册shell（用户登录系统系统时运行）
- 键入bash命令:交互式shell（用户打开终端时运行）
- 脚本解释器（解释.sh文件）

## 自动执行的一批命令（用户偏好）
- 当bash作为`注册shell`被**启动时**:自动执行用户主目录下的`.bash_profile`文件中命令，`~/.bash_profile`或`$HOME/.bash_profile`
- 当bash作为`注册shell`**退出时**: 自动执行`$HOME/.bash_logout`
- 当bash作为`交互式shell`**启动时**: 自动执行`$HOME/.bashrc`
- 类似umask之类的命令，应当写在`.profile`文件中

## 启动交互式bash
自动执行的一批命令（系统级）
- 当bash作为`注册shell`被**启动**时：自动执行`/etc/profile`文件中命令
- 当bash作为`交互式shell`**启动**时: 自动执行`/etc/bash.bashrc`
- 当bash作为`注册shell`**退出**时：自动执行`/etc/bash.bash.logout`

# 脚本文件
◼编辑文件lsdir(格式为文本文件，文件名不必须为.sh后缀，只是个惯例)
```sh lsdir.sh
if [ $# = 0 ] #判断命令行的参数个数是不是0个
then 
    dir=. #如果是0个的话，则使用当前目录
else
    dir=$1 #如果不是的话，则使用第一个参数作为目录
fi
find $dir -type d -print #查找目录下的所有子孙目录并打印
echo '----------------'
cd $dir # 修改当前工作目录到指定的目录
pwd # 打印当前工作目录
```
## 脚本文件的执行
### 新创建子进程，并在子进程中执行脚本
- `bash<lsdir`
  - 无法携带命令行参数
- `bash lsdir`，`bash -x lsdir`（-x选项表示执行命令时，打印出正在执行的命令。这种方式可以看出命令的执行轨迹，便于debug调试），`bash lsdir 目录`
- 给文件设置可执行属性x：`chmod u+x lsdir`然后执行`./lsdir 目录`。

三种方法均启动程序/bin/bash，生成新进程

#### 示例
```
[root@localhost shell的基本机制]# bash < lsdir.sh 
.
&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;
/root/Linux_Test/shell的基本机制
[root@localhost shell的基本机制]# 
```

```
[root@localhost shell的基本机制]# bash -x lsdir.sh 
+ '[' 0 = 0 ']'
+ dir=.
+ find . -type d -print
.
+ echo ----------------
----------------
+ cd .
+ pwd
/root/Linux_Test/shell的基本机制
[root@localhost shell的基本机制]# 
```

```
[root@localhost shell的基本机制]# bash lsdir.sh /root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/sonDir
/root/Linux_Test/文件和目录的权限/NewShellNewDir
/root/Linux_Test/文件和目录的权限/验证
----------------
/root/Linux_Test/文件和目录的权限
[root@localhost shell的基本机制]# 
```

```
[root@localhost shell的基本机制]# ls -l
总用量 4
-rw-r--r--. 1 root root 378 6月  26 15:00 lsdir.sh
[root@localhost shell的基本机制]# chmod u+x lsdir.sh 
[root@localhost shell的基本机制]# ls -l
总用量 4
-rwxr--r--. 1 root root 378 6月  26 15:00 lsdir.sh
[root@localhost shell的基本机制]# ./lsdir.sh /root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/sonDir
/root/Linux_Test/文件和目录的权限/NewShellNewDir
/root/Linux_Test/文件和目录的权限/验证
----------------
/root/Linux_Test/文件和目录的权限
[root@localhost shell的基本机制]#
```
### 在当前shell进程中执行脚本
```
. lsdir.sh 参数
```
这里最左边的点号`.`会被当成内部命令运行，表示点号后面的命令在当前shell内运行。
```
source lsdir 参数
```
#### 示例
```
[root@localhost shell的基本机制]# . lsdir.sh 
.
----------------
/root/Linux_Test/shell的基本机制
[root@localhost shell的基本机制]# . lsdir.sh /root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/sonDir
/root/Linux_Test/文件和目录的权限/NewShellNewDir
/root/Linux_Test/文件和目录的权限/验证
----------------
/root/Linux_Test/文件和目录的权限
[root@localhost 文件和目录的权限]# 
```
```
[root@localhost shell的基本机制]# ls
lsdir.sh
[root@localhost shell的基本机制]# source lsdir.sh 
.
----------------
/root/Linux_Test/shell的基本机制
[root@localhost shell的基本机制]# source lsdir.sh /root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/sonDir
/root/Linux_Test/文件和目录的权限/NewShellNewDir
/root/Linux_Test/文件和目录的权限/验证
----------------
/root/Linux_Test/文件和目录的权限
[root@localhost 文件和目录的权限]# 
```
## 启动新的shell运行与在当前shell运行的区别
脚本里有些命令会影响当前shell进程的状态，如果是启动新的shell子进程运行，则改变的是子进程的状态，对当前shell进程没有影响。

启动新的bash运行：

<pre>
[root@localhost <mark>shell的基本机制</mark>]&#35; ./lsdir.sh /root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/sonDir
/root/Linux_Test/文件和目录的权限/NewShellNewDir
/root/Linux_Test/文件和目录的权限/验证
----------------
/root/Linux_Test/文件和目录的权限
[root@localhost shell的基本机制]&#35; ls
<mark>lsdir.sh</mark>
[root@localhost <mark>shell的基本机制</mark>]&#35; 
</pre>

在当前bash中运行：

<pre>
[root@localhost <mark>shell的基本机制</mark>]&#35; source lsdir.sh /root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/
/root/Linux_Test/文件和目录的权限/sonDir
/root/Linux_Test/文件和目录的权限/NewShellNewDir
/root/Linux_Test/文件和目录的权限/验证
----------------
/root/Linux_Test/文件和目录的权限
[root@localhost 文件和目录的权限]&#35; ls
<mark>NewShellNewDir  newShellnewFile.c  sonDir  test.c  验证</mark>
[root@localhost <mark>文件和目录的权限</mark>]&#35; 
</pre>

**可以看到，在当前bash下运行的脚本里面的cd命令 会改变当前bash的工作路径**
而启用新的bash运行的脚本，则不会改变当前bash的工作路径。