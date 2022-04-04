---
title: Linux 权限相关命令
categories: 
  - Linux
  - 通用
  - 文件和目录的权限
abbrlink: 4e33e580
date: 2021-06-23 16:35:34
updated: 2022-04-04 00:51:45
---
# 确定文件的权限
## 使用ls命令
有关选项-l和-d
例:`ls -l`可以查当前目录下所有文件和子目录的权限
```
[root@localhost Linux命令风格；文件系统]# ls -l
总用量 60
-rwxr-xr-x. 1 root root 71368 6月  23 15:04 dir
-rw-r--r--. 1 root root   536 6月  23 15:03 dir.c
-rwxr-xr-x. 1 root root 71136 6月  23 14:06 openfile
-rw-r--r--. 1 root root   291 6月  23 14:06 openfile.c
-rwxr-xr-x. 1 root root 71024 6月  18 22:19 useEnv
-rw-r--r--. 1 root root   239 6月  18 22:19 useEnvC
[root@localhost Linux命令风格；文件系统]# 
```
`ls -ld .`列出当前目录自身的权限:
```
[root@localhost Linux命令风格；文件系统]# ls -ld
drwxr-xr-x. 2 root root 4096 6月  23 15:04 .
[root@localhost Linux命令风格；文件系统]# 
```
# chmod
## chmod：修改权限（字母形式）
字母形式
```
chmod [ugoa][+-=][rwxst] 文件名表
```
u--user  文件主的权限
g--group 同组用户的权限
o--other 其他用户权限
a--all   所有上述三级权限
(t--Sticky, s--SUID)
例: 
```shell
chmod u+rw * # 所有的文件的文件主都加上读权限和写权限
chmod go-rwx *.[ch] #对所有的.c或.h文件，同组用户和其他用户都减去读权限、写权限、执行权限
chmod a+x batch #对于batch文件的 所有用户（文件主，同组用户，其他用户）都加上执行权限
chmod u=rx try2 # 给try2文件的文件主的赋予读权限和执行权限
```

## chmod：修改权限（数字形式）
数字形式(八进制数字)
例：
```
chmod 644  xyz1 xyz2
```

|八进制：|6|4|4 |
|:---|:---|:---|:---|
|二进制：|110|100|100|
|权限：|rw-|r--|r--|

注意: 只允许文件主和超级用户修改文件权限

# umask命令：控制文件/目录的初始权限
## 功能：决定文件/目录的初始权限
- 用vi新建文件
- 用输出重定向创建文件
- 创建新目录

这些新创建的文件或目录的权限就可以使用umask来指定。

## umask是进程属性的一部分
- umask是shell内部命令
- umask是进程属性的一部分

## 命令
打印当前的umask值：
```
umask
```
将umask值设置为八进制的022
```
umask 022
```

## 进程umask属性的作用
### 掩码值的含义
例：
掩码值：022
二进制：000 010 010
取消新文件和新目录的组的w权限和其他用户的w权限
```
[root@localhost 文件和目录的权限]# umask
0022
[root@localhost 文件和目录的权限]# ls -ld
drwxr-xr-x. 2 root root 4096 6月  24 11:08 .
[root@localhost 文件和目录的权限]# 
```

禁止组的所有权限和其他用户的所有权限（比特为1的地方的权限被屏蔽掉）
```
umask 077
```

### 自动执行批处理文件
umask对当前shell进程有效，关闭当前shell后，umask属性将会丢失。
所以，如果需要的话，一般将umask命令放到shell自动执行批处理文件中
例如放到bash用户偏好文件中(`$HOME/.bash_profile`)，

### 示例
查看当前shell进程的umask值，查看当前目录的权限：
```
[root@localhost 文件和目录的权限]# ls
[root@localhost 文件和目录的权限]# umask
0022
[root@localhost 文件和目录的权限]# ls -ld
drwxr-xr-x. 2 root root 4096 6月  24 11:08 .
[root@localhost 文件和目录的权限]# 
```
修改当前shell进程的umask值为077，已经存在的目录不会受影响：
```
[root@localhost 文件和目录的权限]# umask 077
[root@localhost 文件和目录的权限]# ls -ld
drwxr-xr-x. 2 root root 4096 6月  24 11:08 .
[root@localhost 文件和目录的权限]# 
```
新创建的目录或文件的权限将受影响：
```
[root@localhost 文件和目录的权限]# mkdir sonDir
[root@localhost 文件和目录的权限]# touch test.c
[root@localhost 文件和目录的权限]# ls -l
总用量 4
drwx------. 2 root root 4096 6月  24 11:57 sonDir
-rw-------. 1 root root    0 6月  24 11:57 test.c
[root@localhost 文件和目录的权限]# 
```
修改shell进程的umask值后，对整个shell进程创建的新目录或文件都有影响：
```
[root@localhost 文件和目录的权限]# cd ..
[root@localhost Linux_Test]# ls -ld
drwxr-xr-x. 22 root root 4096 6月  24 12:02 .
[root@localhost Linux_Test]# mkdir umask
[root@localhost Linux_Test]# touch umask.c
[root@localhost Linux_Test]# ls -l |grep 'umask*'
drwx------. 2 root root 4096 6月  24 12:02 umask
-rw-------. 1 root root    0 6月  24 12:02 umask.c
[root@localhost Linux_Test]# 
```
umask命令只对当前shell有效，重新打开一个shell，umask为默认值022：
```
[root@localhost 文件和目录的权限]# ls -ld
drwxr-xr-x. 3 root root 4096 6月  24 11:57 .
[root@localhost 文件和目录的权限]# ls -l
总用量 4
drwx------. 2 root root 4096 6月  24 11:57 sonDir
-rw-------. 1 root root    0 6月  24 11:57 test.c
[root@localhost 文件和目录的权限]# umask
0022
[root@localhost 文件和目录的权限]# 
```
另一个shell的umask命令不会影响当前shell新创建的目录或文件的权限：
```
[root@localhost 文件和目录的权限]# touch newShellnewFile.c
[root@localhost 文件和目录的权限]# mkdir NewShellNewDir
[root@localhost 文件和目录的权限]# ls -l
总用量 8
drwxr-xr-x. 2 root root 4096 6月  24 12:06 NewShellNewDir
-rw-r--r--. 1 root root    0 6月  24 12:05 newShellnewFile.c
drwx------. 2 root root 4096 6月  24 11:57 sonDir
-rw-------. 1 root root    0 6月  24 11:57 test.c
[root@localhost 文件和目录的权限]# 
```

## 系统调用umask
### 功能
修改进程自身的umask属性值

### 初创文件的权限
- 受open的规定值和进程自身属性umask值双重影响
- 已存在的文件的权限，不受open/umask的影响

例:当umask为077时，用C程序
```
fd=open(filename,O_CREAT|O_WRONLY,0666);
```
open的权限为0666，经过umask屏蔽掉077后文件的实际权限为0600
### 系统调用umask
```c
int umask(int mask); 
```
- mask为指定的新umask值，返回值为原先的umask值
- 读出进程umask属性而不改变它，需调umask两次
