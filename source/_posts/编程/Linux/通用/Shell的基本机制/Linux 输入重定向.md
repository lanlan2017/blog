---
title: Linux 输入重定向
categories:
  - 编程
  - Linux
  - 通用
  - Shell的基本机制
abbrlink: 265ffeb5
date: 2021-06-26 17:02:11
updated: 2021-06-26 17:02:11
---
# 输入重定向（从数据文件中获取stdin）
```sh
< filename
```
从文件filename中获取stdin,例如: `sort < telno.txt`。

# 输入重定向（从shell中获得stdin：允许替换）
```
<<word
```
从shell脚本文件获取数据直到再次遇到定界符word
```
[root@localhost ~]# cat << END
> 1
> 2
> 3
> 4
> END
1
2
3
4
[root@localhost ~]# 
```
不加单引号的情况，可以使用`$变量名`的形式获取变量的值：

<pre>
[root@localhost 文件管理和目录管理]&#35; cat &lt;&lt; END
&gt; hello you home dir is <mark>$HOME</mark>
&gt; END
hello you home dir is <mark>/root</mark>
[root@localhost 文件管理和目录管理]&#35; 
</pre>

```
[root@localhost 文件管理和目录管理]# cat << END
> now：`date`
> you home dir is：$HOME
> END
now：2021年 06月 26日 星期六 17:38:32 CST
you home dir is：/root
[root@localhost 文件管理和目录管理]# 
```

定界符所界定内容加工处理(等同双引号处理):
- 变量替换，命令替换
- 不执行文件名生成



# 输入重定向（从shell中获得stdin：不许替换）
`<<word`从shell脚本程序获取数据直到再次遇到定界符,**定界符两侧加单引号**：不允许定界符之间的内容进行替换操作。

定界符加上单引号，禁止**替换操作**：

<pre>
[root@localhost 文件管理和目录管理]&#35; cat &lt;&lt; 'END'
&gt; hello you home sir is <mark>$HOME</mark>
&gt; END
hello you home sir is <mark>$HOME</mark>
[root@localhost 文件管理和目录管理]&#35; 
</pre>

# 输入重定向（从命令行获取信息作为标准输入）
```
<<<word
```
直接使用三个大于号后面的单词作为命令的输入。


```
[root@localhost shell的基本机制]# base64 <<< helloWorld
aGVsbG9Xb3JsZAo=
[root@localhost shell的基本机制]# 
```

在批处理文件中输入重定向的定界符之后还可接着写其他命令：
```
[root@localhost shell的基本机制]# cat InputRedirection.sh 
cat << TOAST
**************************
Now : `date`
My Home Directory is $HOME
**************************
TOAST

pwd
[root@localhost shell的基本机制]# bash InputRedirection.sh 
**************************
Now : 2021年 06月 26日 星期六 18:23:20 CST
My Home Directory is /root
**************************
/root/Linux_Test/shell的基本机制
[root@localhost shell的基本机制]# 
```
[root@localhost shell的基本机制]# cat InputRedirection2.sh 
cat << 'TOAST'
**************************
Now : `date`
My Home Directory is $HOME
**************************
TOAST

pwd
[root@localhost shell的基本机制]# bash InputRedirection2.sh 
**************************
Now : `date`
My Home Directory is $HOME
**************************
/root/Linux_Test/shell的基本机制
[root@localhost shell的基本机制]# 
