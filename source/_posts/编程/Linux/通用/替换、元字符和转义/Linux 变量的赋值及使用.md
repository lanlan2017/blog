---
title: Linux 变量的赋值及使用
categories:
  - 编程
  - Linux
  - 通用
  - 替换、元字符和转义
abbrlink: 70ed3de5
date: 2021-06-27 14:56:00
updated: 2021-06-27 14:56:00
---
# bash变量
## 存储的内容
- 字符串(对于数字串来说，不是二进制形式)
- 在执行过程中其内容可以被修改

## 变量名
- 第一个字符必须为字母
- 其余字符可以是字母，数字，下划线

## 变量的赋值和引用
## 赋值与引用
```sh
addr=20.1.1.254
ftp $addr
```
注意：
赋值作为单独一条命令，等号两侧不许多余空格
引用addr变量的方法:`$addr`或`${addr}`
```sh
echo ${addr}A
echo $addrA
```
命令行中含有$符的变量引用，shell会先完成变量替换。
```
[root@localhost 替换、元字符和转义]# addr=20.1.1.254
[root@localhost 替换、元字符和转义]# echo ${addr}A
20.1.1.254A
[root@localhost 替换、元字符和转义]# echo $addrA

[root@localhost 替换、元字符和转义]# 
```

## 赋值时，等号右侧字符串中含有特殊字符
```sh
unit="Beiyou University"
echo $unit
```
```
[root@localhost 替换、元字符和转义]# unit="Beiyou University"
[root@localhost 替换、元字符和转义]# echo $unit
Beiyou University
[root@localhost 替换、元字符和转义]# 
```
## 变量的引用
**如果引用未定义变量，则变量值为空字符串**
```sh
echo Connect to $proto Network
proto=TCP/IP
echo Connect to $proto Network
```
上面的第一行引用了proto变量，不过该变量没有定义过，此时将替换为空字符串，
第3行的也引用了proto变量，不过由于该变量在第2行已经定义过了，将会替换为该变量的值。
运行效果：
```
[root@localhost 替换、元字符和转义]# cat variable.sh 
echo Connect to $proto Network
proto=TCP/IP
echo Connect to $proto Network
[root@localhost 替换、元字符和转义]# bash variable.sh 
Connect to Network
Connect to TCP/IP Network
[root@localhost 替换、元字符和转义]# 
```

## shell内部开关
- `set -u`：当引用一个未定义的变量时，产生一个错误
- `set +u`：当引用一个未定义的变量时，认为是一个**空串**（默认情形）
- `set -x`：执行命令前打印出shell替换后的命令及参数，为区别于正常的shell输出，前面冠以+号
- `set +x`：取消上述设置

在上面的代码前面加上`set -u`
```sh varSet+U.sh
set -u
echo Connect to $proto Network
proto=TCP/IP
echo Connect to $proto Network
```
得到`varSet+U.sh`，然后运行该脚本：
```
[root@localhost 替换、元字符和转义]# bash varSet+U.sh 
varSet+U.sh:行2: proto: 为绑定变量
[root@localhost 替换、元字符和转义]# 
```
# 命令echo
## 语法与功能
```
echo arg1 arg2 arg3 ...
```
打印各命令行参数，每两个参数之间用一空格分开，最后打印换行符
## 不可打印字符(转义)：
Linux需加选项-e，(不同UNIX间兼容性差)
echo支持C语言字符串常数描述格式的转义和\c

|转义字符|功能|
|:---|:---|
|`\c`|打印完毕，不换行|
|`\b`|退格|
|`\n`|换行|
|`\r`|回车|
|`\t`|水平制表|
|`\\`|反斜线|
|`\nnn`|八进制描述的字符ASCII码|

## 示例
举例
```sh
echo Beijing   China
echo "Beijing    China"
echo -e '\065'
echo -e "\\r$cnt \\c"
```
```
[root@localhost ~]# echo Beijing   China
Beijing China
[root@localhost ~]# echo "Beijing    China"
Beijing    China
[root@localhost ~]# echo -e '\065'
5
[root@localhost ~]# echo -e "\\r$cnt \\c"
 [root@localhost ~]# 
[root@localhost ~]# 
```
# 命令printf
命令printf，用法与C函数printf类似,例如：
```
printf '\033[01;33mConnect to %s Network\n' $proto
```
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/ReplacementMetadatureAndEscape/AssignmentAndUseOfLinuxVariables/1.png)




<!-- Blog/Programming/Linux/General/ReplacementMetadatureAndEscape/AssignmentAndUseOfLinuxVariables -->
