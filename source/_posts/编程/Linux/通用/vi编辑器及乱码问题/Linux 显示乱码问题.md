---
title: Linux 显示乱码问题
categories: 
  - 编程
  - Linux
  - 通用
  - vi编辑器及乱码问题
abbrlink: 4116ba94
date: 2021-05-30 21:01:41
updated: 2021-05-30 21:01:41
---
# 屏幕显示乱码问题
## 现象
```
cat /bin/bash
```
或
```
head -n 1 /bin/bash
```
导致屏幕乱码，键盘输入也只能看到画表用的框框符
## 原因
/bin/bash文件不是文本文件，这些二进制内容逐字节送到终端，凑巧一个序列被终端理解为一个转义序列，执行动作：修改了终端字符集
## 字符集
ASCII字符集（7比特128种符号）
选择其他字符集，相同码值代表了那个字符集之中的某个符号
## 解决方法
断开连接，重新登录
注意不要把非文本信息在终端输出
# 文本文件格式问题
## 现象
Linux下的文本文件在Windows用notepad打开，所有内容粘在一行内
## 原因
Linux和Windows的文本文件的存储格式不同
## 解决方法
在Linux完成格式转换后再用Windows处理（首选此方案）
用Windows中可容忍Linux文本文件格式的其他编辑器
## 文本文件格式
Windows和Linux文本文件行的行尾不同
- Linux：行尾处仅存换行字符
- Windows：行尾处存回车和换行两个字符

例:文件mini.txt，第一行为ab，第二行为xyz
Windows中，文件的大小为9字节

<pre>
61 62 <mark>0d 0a</mark> 78 79 7a <mark>0d 0a</mark>
</pre>

在Linux中，文件的大小为7字节

<pre>
61 62 <mark>0a</mark> 78 79 7a <mark>0a</mark>
</pre>

### 示例
#### Windows文本文件
```
lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$ ls
helloworld.c  mini_windows.txt

lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$ file mini_windows.txt
mini_windows.txt: ASCII text, with CRLF line terminators

lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$ cat mini_windows.txt
ab
xyz
lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$ od -t x1 mini_windows.txt
0000000 61 62 0d 0a 78 79 7a
0000007

lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$
```
#### linux文本文件
```
[root@localhost encode]# file mini.txt 
mini.txt: ASCII text
[root@localhost encode]# cat mini.txt 
ab
xyz
[root@localhost encode]# od -t x1 mini.txt 
0000000 61 62 0a 78 79 7a 0a
0000007
[root@localhost encode]# 
```

## 相关命令
（两种格式间转换）
dos2unix/unix2dos, todos/fromdos
（查看文件的数据类型，供参考）
### dos2unix和fromdos命令
> https://www.linuxidc.com/Linux/2014-01/95144.htm
> 两个命令的用法相同,不同的是两个命令使用的环境不一样.
> dos2unix在CentOS系列的系统中使用，fromdos则在Ubuntu系列的系统中使用。
> 用法：
> ```
> dos2unix filename
> fromdos filename
> ```
> 意思是：转换文件格式，将windos系统的文件转换成linux系统可以使用的文件格式，否则文件在linux系统中可能会出现错误，如：文件中显示^m 这样的错误字符。
> 导致这样的错误出现的原因是，windos环境中的换行符是`\r\n`,而linux系统中的换行符直接`\n`就行了。

### file
如果没有file命令则需要先安装file命令：
```
[root@localhost vi]# file helloworld.c 
-bash: file: 未找到命令
[root@localhost vi]# yum list file
已加载插件：fastestmirror
Repodata is over 2 weeks old. Install yum-cron? Or run: yum makecache fast
Determining fastest mirrors
 * epel: mirrors.ustc.edu.cn
可安装的软件包
file.aarch64                                                                     5.11-37.el7                                                                     base
[root@localhost vi]# yum install file
```
#### 示例
```
[root@localhost vi]# file helloworld.c 
helloworld.c: C source, ASCII text
[root@localhost vi]# 
```
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog/source/_posts/编程/Linux/通用/vi编辑器及乱码问题 (master)
$ file 'Linux 显示乱码问题.md'
Linux 显示乱码问题.md: UTF-8 Unicode text
```
### Windows文本文件和Linux文本文件相互转换
#### Windows系统中用记事本创建的helloworld.c文件
```
lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$ cat helloworld.c
#include <stdio.h>

int main()
{
        printf("%s\n","Hello");
        printf("%s\n","World");
        printf("%s\n","Welcome to Linux");
}
lan@DESKTOP-8ISAT6B MINGW64 /g/Desktop/test/Linux
$ file helloworld.c
helloworld.c: C source, ASCII text, with CRLF line terminators

```
可以看到helloworld.c文件使用的是CRLF，也就是**回车换行符**`\r\n`。
#### Linux中打开Windows文本文件
将该文件上传到CentOS中，再次执行file命令：
```
[root@localhost encode]# file helloworld.c 
helloworld.c: C source, ASCII text, with CRLF line terminators
[root@localhost encode]# 
```
使用vi打开该文件：
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/DisplayGarbledProblem/1.png)
#### Linux中吧Windows文本文件转换成Linux文本文件
```
[root@localhost encode]# dos2unix helloworld.c 
dos2unix: converting file helloworld.c to Unix format ...
[root@localhost encode]# file helloworld.c 
helloworld.c: C source, ASCII text
[root@localhost encode]# 
```
然后在使用vi打开该文件:
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/DisplayGarbledProblem/2.png)


# 中文编码问题
## 问题
从Windows迁来的文件，只有在显示中文字符时是乱码。Linux本生的中文信息正常显示。
## 原因
中文GBK与UTF8不兼容
## 英文字符集
7比特ASCII码，字节高位为0的，后面7位是英文ASCII码
## 中文字符编码GBK
Windows默认中文编码方案，两个字节表示一个汉字，字节的高位为1，以区别于ASCII码
## 中文字符编码UTF8
许多Linux默认中文编码方案，三个字节表示一个汉字，字节的高位为1，以区别于ASCII码
## 检查系统设置
与语言有关的环境变量LANG应为`en_US.UTF-8`
```
env | grep LANG
```
若有问题，设置方法为：
```
export LANG=en_US.UTF-8
```
## 命令iconv：中文字符编码的转换
### from GBK to UTF8
```
iconv –f gbk –t utf8
```
### from UTF8 to GBK  
```
iconv –f utf8 –t gbk
```
### 示例
```
$ echo "汉字" | od -t x1
0000000 e6 b1 89 e5 ad 97 0a
$ echo "汉字" | iconv -f utf-8 -t gbk | od -t x1 
0000000 ba ba d7 d6 0a
```
# 终端配置：配色和中文编码
## 问题
终端不是默认的黑底白字，ls，grep，vi等输出信息无配色
中文显示的是乱码
## 调整终端仿真软件的配置
根据所用的终端仿真软件的不同，调整终端类型和字符编码，具体方法与所用软件有关

<!-- Blog/Programming/Linux/General/VIEditorAndGarbledProblem/DisplayGarbledProblem -->
