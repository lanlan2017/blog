---
title: Linux tail命令
categories: 
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: 1f720624
date: 2021-03-24 06:39:45
updated: 2022-04-04 00:51:45
---
# tail命令
tail 命令可用于查看文件的内容，**有一个常用的参数 -f 常用于查阅正在改变的日志文件。**

tail -f filename 会把 filename 文件里的最尾部的内容显示在屏幕上，并且不断刷新，只要 filename 更新就可以看到最新的文件内容。
# 命令格式
```
tail [参数] [文件] 
```
## 参数
```
-c, --bytes=NUM                 输出文件尾部的NUM（NUM为整数）个字节内容。
-f, --follow[={name|descript}]  显示文件最新追加的内容。“name”表示以文件名的方式监视文件的变化。
-F                              与 “--follow=name --retry” 功能相同。
-n, --line=NUM                  输出文件的尾部NUM（NUM位数字）行内容。
--pid=<进程号>                  与“-f”选项连用，当指定的进程号的进程终止后，自动退出tail命令。
-q, --quiet, --silent           当有多个文件参数时，不输出各个文件名。
--retry                         即是在tail命令启动时，文件不可访问或者文件稍后变得不可访问，都始终尝试打开文件。使用此选项时需要与选项“--follow=name”连用。
-s, --sleep-interal=<秒数>      与“-f”选项连用，指定监视文件变化时间隔的秒数。
-v, --verbose                   当有多个文件参数时，总是输出各个文件名。
--help                          显示指令的帮助信息。
--version                       显示指令的版本信息。
```

# 实例
## tail file：显示文件的最后10行
要显示 notes.log 文件的最后 10 行，请输入以下命令：
```
tail notes.log
```
## tail -f file：追踪显示 查看实时日志
要跟踪名为 notes.log 的文件的增长情况，请输入以下命令：
```
tail -f notes.log
```
此命令显示 notes.log 文件的最后 10 行。当将某些行添加至 notes.log 文件时，tail 命令会继续显示这些行。 显示一直继续，直到您按下（Ctrl-C）组合键停止显示。
## tail -n +N file：从第N行显示到文件末尾
显示文件 notes.log 的内容，从第 20 行至文件末尾:
```
tail -n +20 notes.log
```
查看第100行至文件末尾：
```
tail -n +100 itbilu.log
```
## tail -c N file：显示文件最后的N个字节
显示文件 notes.log 的最后 10 个字节:
```
tail -c 10 notes.log
```
```
tail file #（显示文件file的最后10行）
tail -n +20 file #（显示文件file的内容，从第20行至文件末尾）
tail -c 10 file #（显示文件file的最后10个字节）

tail -25 mail.log # 显示 mail.log 最后的 25 行
tail -f mail.log # 等同于--follow=descriptor，根据文件描述符进行追踪，当文件改名或被删除，追踪停止
tail -F mail.log # 等同于--follow=name --retry，根据文件名进行追踪，并保持重试，即该文件被删除或改名后，如果再次创建相同的文件名，会继续追踪
```

# tail结合其他命令使用
结合其他命令使用tail
通过使用管道将标准输出从其他实用程序重定向到其他实用程序，可以将tail命令与其他命令结合使用。

例如，要监视apache访问日志文件并仅显示包含IP地址192.168.42.12的行，可以使用：
```
tail -f /var/log/apache2/access.log | grep 192.168.42.12
```
以下ps命令将显示按CPU使用率排序的前十个正在运行的进程：
```
ps aux | sort -nk +3 | tail -5
```
## head和tail结合使用：查看从第N行到第M行
配合head命令，实现查看文件的第10到20行：
```
head -20 itbilu.log | tail -10
```
## 实时日志查看与grep过滤关键字
通过-f参数，并配合grep命令，可以实现对文件内容的过滤。如：查看前几行、后几行、或前后几行，这时可以通过以下几个参数实现：

|参数|描述|
|:---|:---|
|-A <显示行数>|除了显示符合匹配内容的那一行之外，并显示该行**之后**的内容|
|-B <显示行数>|在显示符合匹配内容的那一行之外，并显示该行**之前**的内容|
|-C <显示行数>或-<显示行数>|除了显示符合匹配内容的那一列之外，并显示该列**之前以及之后**的内容|

控itbilu.log日志件，并查看含有'foo'关键字的前后5行：

```
tail -f itbilu.log|grep 'foo' -C 5
```
或
```
tail -f itbilu.log|grep 'foo' -5
```
## 同时显示多个文件
如果提供了多个文件作为tail命令的输入，它将显示每个文件的最后十行。
```
tail filename1.txt filename2.txt
```
您可以使用与显示单个文件时相同的选项。 此示例显示文件filename1.txt和filename2.txt的最后20行：
```
tail -n 20 filename1.txt filename2.txt
```

# 参考资料
[https://www.runoob.com/linux/linux-comm-tail.html](https://www.runoob.com/linux/linux-comm-tail.html)
[https://wangchujiang.com/linux-command/c/tail.html](https://wangchujiang.com/linux-command/c/tail.html)
Linux tail命令与实时日志、文件查看及过滤：[https://itbilu.com/linux/man/H1_dxWhz4.html](https://itbilu.com/linux/man/H1_dxWhz4.html)
tail在线帮助文档：[https://man7.org/linux/man-pages/man1/tail.1.html](https://man7.org/linux/man-pages/man1/tail.1.html)
[https://zhuanlan.zhihu.com/p/105741730](https://zhuanlan.zhihu.com/p/105741730)
[https://www.yuque.com/gaoxizhi/linux/tail](https://www.yuque.com/gaoxizhi/linux/tail)
