---
title: Linux 在脚本中编辑文件
categories:
  - 编程
  - Linux
  - 通用
  - 替换、元字符和转义
abbrlink: 99a1f664
date: 2021-06-27 16:52:34
updated: 2021-06-27 16:52:34
---
# read:读用户的输入
内部命令read：变量取值的另外一种方法
**从标准输入读入一行内容赋值给变量**
例：读取用户的输入，并使用输入的信息。
```
[root@localhost 替换、元字符和转义]# ls
variable.sh  varSet+U.sh
[root@localhost 替换、元字符和转义]# read name
helloWorld!
[root@localhost 替换、元字符和转义]# echo $name
helloWorld!
[root@localhost 替换、元字符和转义]# read file
variable.sh   
[root@localhost 替换、元字符和转义]# echo $file 
variable.sh
[root@localhost 替换、元字符和转义]# ls -l $file 
-rw-r--r--. 1 root root 75 6月  27 15:56 variable.sh
[root@localhost 替换、元字符和转义]# 
```

# 脚本程序中的行编辑
假设应用程序myap运行时从myap.conf中读取配置参数
