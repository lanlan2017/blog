---
title: Linux 历史与别名
categories:
  - 编程
  - Linux
  - 通用
  - Shell的基本机制
abbrlink: 712fbae5
date: 2021-06-26 15:56:39
updated: 2021-06-26 15:56:39
---
# 历史表
历史，就是我们在Linux中曾经输入过的命令，bash会把这些命令保存下来，做成一张历史表。
## 历史表大小
- 先前键入的命令存于历史表，编号递增，FIFO刷新
- 表大小由变量HISTSIZE设定，修改HISTSIZE的配置应放入~/.bashrc

## 查看历史表
- 内部命令`history`（文件$HOME/.bash_history）

```
 ......
 1027  ls
 1028  cd ../shell的基本机制/
 1029  ls
 1030  source lsdir.sh 
 1031  source lsdir.sh /root/Linux_Test/文件和目录的权限/
 1032  ls
 1033  cd ../shell的基本机制/
 1034  ls
 1035  ./lsdir.sh /root/Linux_Test/文件和目录的权限/
 1036  ls
 1037  source lsdir.sh /root/Linux_Test/文件和目录的权限/
 1038  ls
 1039  history 
[root@localhost 文件和目录的权限]# 
```

## 历史替换
- 人机交互时直接使用上下箭头键
- 其他引用历史机制的方法
  - `!!`：引用上一命令
  - `!str`：引用以str开头的最近用过的命令，如:`!v`、`!m`、`!.`

### 示例
引用上一条命令：
```
[root@localhost 文件和目录的权限]# ls
NewShellNewDir  newShellnewFile.c  sonDir  test.c  验证
[root@localhost 文件和目录的权限]# !!
ls
NewShellNewDir  newShellnewFile.c  sonDir  test.c  验证
[root@localhost 文件和目录的权限]# 
```
引用最近使用过的以某字符串开头的命令：
```
[root@localhost 文件和目录的权限]# !l
ls
NewShellNewDir  newShellnewFile.c  sonDir  test.c  验证
[root@localhost 文件和目录的权限]# !s
source lsdir.sh /root/Linux_Test/文件和目录的权限/
-bash: lsdir.sh: 没有那个文件或目录
[root@localhost 文件和目录的权限]#
```

# 别名和别名替换
可以给一些常用的命令取个别名，这样输入别名，就相当于运行这些命令。
如果需要，**应把alias命令放入`./bashrc`**
## 在别名表中增加一个别名(内部命令alias)
```
alias dir="ls -flad"
alias n="netstat -p tcp -s | head -10"
alias r="netstat -rn"
alias h="history"
alais t='tail -f /usr/adm/pppd.log'
alias rm='rm -i'
alias p='ping 202.143.12.189'
alias rt='traceroute 217.226.227.27‘
```

### 示例
在`/etc/bashrc`文件末尾，加上如下命令，即可使用manen来查看英文版的命令手册：
```sh /etc/bashrc
......
alias manen='man -L en'
```
<https://lanlan2017.github.io/blog/6e64ba3d/#%E4%BD%BF%E7%94%A8man-L-en%E7%9A%84%E5%88%AB%E5%90%8D>


## 查看别名表alias
```
[root@localhost etc]# alias
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias manen='man -L en'
alias mv='mv -i'
alias rm='rm -i'
alias su='sudo su'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
[root@localhost etc]# 
```
## 取消别名(内部命令unalias)
```sh
unalias n #在别名表中取消n
```

<pre>
[root@localhost etc]&#35; alias
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
<mark>alias manen='man -L en'</mark>
alias mv='mv -i'
alias rm='rm -i'
alias su='sudo su'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
[root@localhost etc]&#35; 
</pre>

取消别名manen：
```
[root@localhost etc]# unalias manen
[root@localhost etc]# 
```
查询别名表：
```
[root@localhost etc]# alias
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias su='sudo su'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
[root@localhost etc]# 
```
可以看到已经没有了manen这个命令了，如果还继续输入该命令，则提示错误：
```
[root@localhost etc]# manen ls
-bash: manen: 未找到命令
[root@localhost etc]# 
```
因为取消别名命令写在交互式的bash中，只对当前的bash影响，打开其他的bash，`manen`命令依然有效。

# TAB键补全
在每行的首个单词中按下tab键：TAB键补全搜索$PATH下的命令
在行中的其它单词后按下tab键：TAB键补全当前目录下的文件名