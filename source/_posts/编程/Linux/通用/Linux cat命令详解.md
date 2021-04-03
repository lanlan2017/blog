---
title: Linux cat命令详解
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: af7f7587
date: 2021-03-24 11:08:13
updated: 2021-03-28 15:33:45
---
<div id='my_toc'><a href="/blog/af7f7587/#cat命令" class="header_1">cat命令</a>&nbsp;<br><a href="/blog/af7f7587/#语法格式" class="header_2">语法格式</a>&nbsp;<br><a href="/blog/af7f7587/#参数" class="header_2">参数</a>&nbsp;<br><a href="/blog/af7f7587/#示例" class="header_1">示例</a>&nbsp;<br><a href="/blog/af7f7587/#cat-n：显示行号" class="header_2">cat -n：显示行号</a>&nbsp;<br><a href="/blog/af7f7587/#cat-b：显示行号空白行不编号" class="header_2">cat -b：显示行号空白行不编号</a>&nbsp;<br><a href="/blog/af7f7587/#cat-s：替换多个空白行为一个空白行" class="header_2">cat -s：替换多个空白行为一个空白行</a>&nbsp;<br><a href="/blog/af7f7587/#cat-v：" class="header_2">cat -v：</a>&nbsp;<br><a href="/blog/af7f7587/#cat-E：显示结束符" class="header_2">cat -E：显示结束符</a>&nbsp;<br><a href="/blog/af7f7587/#cat-T：显示tab键" class="header_2">cat -T：显示tab键</a>&nbsp;<br><a href="/blog/af7f7587/#cat-A：显示tab键，显示换行符" class="header_2">cat -A：显示tab键，显示换行符</a>&nbsp;<br><a href="/blog/af7f7587/#同时查看多个文件" class="header_2">同时查看多个文件</a>&nbsp;<br><a href="/blog/af7f7587/#其他应用" class="header_1">其他应用</a>&nbsp;<br><a href="/blog/af7f7587/#使用cat命令创建文件" class="header_2">使用cat命令创建文件</a>&nbsp;<br><a href="/blog/af7f7587/#将cat命令与more或less命令一起使用" class="header_2">将cat命令与more或less命令一起使用</a>&nbsp;<br><a href="/blog/af7f7587/#输出一个文件的内容到另一个文件的末尾" class="header_2">输出一个文件的内容到另一个文件的末尾</a>&nbsp;<br><a href="/blog/af7f7587/#合并文件" class="header_2">合并文件</a>&nbsp;<br><a href="/blog/af7f7587/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->

# cat命令
cat（英文全拼：concatenate）命令用于连接文件并打印到标准输出设备上。
## 语法格式
```
cat [-AbeEnstTuv] [--help] [--version] fileName
```
## 参数
```
-n 或 --number：由 1 开始对所有输出的行数编号。
-b 或 --number-nonblank：和 -n 相似，只不过对于空白行不编号。
-s 或 --squeeze-blank：当遇到有连续两行以上的空白行，就代换为一行的空白行。
-v 或 --show-nonprinting：使用 ^ 和 M- 符号，除了 LFD 和 TAB 之外。
-E 或 --show-ends : 在每行结束处显示 $。
-T 或 --show-tabs: 将 TAB 字符显示为 ^I。
-A, --show-all：等价于 -vET。
-e：等价于"-vE"选项；
-t：等价于"-vT"选项；
```

# 示例
## cat -n：显示行号
```
[root@localhost C_Test]# cat -n file1.txt 
     1	Hello World!
     2	
     3	
     4	
     5	Hello World!
     6	------file1 end-------
[root@localhost C_Test]#
```
## cat -b：显示行号空白行不编号
```
[root@localhost C_Test]# cat -b file1.txt 
     1    Hello World!



     2    Hello World!
     3    ------file1 end-------
[root@localhost C_Test]# 
```
## cat -s：替换多个空白行为一个空白行
```
[root@localhost C_Test]# cat -n file1.txt 
     1    Hello World!
     2    
     3    
     4    
     5    Hello World!
     6    ------file1 end-------
[root@localhost C_Test]# cat -ns file1.txt 
     1    Hello World!
     2    
     3    Hello World!
     4    ------file1 end-------
[root@localhost C_Test]# 
```
## cat -v：

## cat -E：显示结束符
```
[root@localhost C_Test]# cat -E file1.txt 
Hello World!$
$
$
$
Hello World!$
------file1 end-------$
[root@localhost C_Test]# 
```
## cat -T：显示tab键
```
[root@localhost C_Test]# cat file3.txt 
hello file3
    hello


--------file3 end-----------
[root@localhost C_Test]# cat -T file3.txt 
hello file3
^Ihello


--------file3 end-----------
[root@localhost C_Test]# 
```
## cat -A：显示tab键，显示换行符
```
[root@localhost C_Test]# cat -A file3.txt 
hello file3$
^Ihello$
$
$
--------file3 end-----------$
[root@localhost C_Test]# 
```
## 同时查看多个文件
```
cat file1 file2
```
例如：
```
[root@localhost C_Test]# cat -n file1.txt file2.txt 
     1    Hello World!
     2    
     3    
     4    
     5    Hello World!
     6    ------file1 end-------
     7    hello file2
     8    
     9    
    10    
    11    
    12    hello file2
    13    ------file2 end---------
[root@localhost C_Test]# 
```

# 其他应用
## 使用cat命令创建文件
```
cat >file4.txt
```
此时可以在屏幕上输入文字，如果想结束输入请按下Ctrl键，然后按D键。
这种方法输入并不友好，可以不输入，直接按下Ctrl键，然后按D键，这样就创建一个空的文件。类似于:
```
touch file4.txt
```
## 将cat命令与more或less命令一起使用
如果具有大量内容的文件无法容纳在输出终端中，并且屏幕快速滚动，则可以通过cat命令使用越来越多的参数，如上所示。
```
cat song.txt | more
cat song.txt | less
```
## 输出一个文件的内容到另一个文件的末尾
```
[root@localhost C_Test]# cat file3.txt 
hello file3
    hello


--------file3 end-----------
[root@localhost C_Test]# cat file1.txt >> file3.txt 
[root@localhost C_Test]# cat file3.txt 
hello file3
    hello


--------file3 end-----------
Hello World!



Hello World!
------file1 end-------
[root@localhost C_Test]#
```
## 合并文件
执行cat时使用输出重定向，可以把多个文件按指定顺序合并成一个文件，这是一个很有用的功能。
例如：
```
cat file1.txt file2.txt >file3.txt 
```
file1.txt和file2.txt合并成一个文件file3.txt。
```
[root@localhost C_Test]# cat file1.txt file2.txt 
Hello file1!
------file1 end-------
hello file2
------file2 end---------
[root@localhost C_Test]# cat file1.txt file2.txt >file3.txt 
[root@localhost C_Test]# cat file3.txt 
Hello file1!
------file1 end-------
hello file2
------file2 end---------
[root@localhost C_Test]#
```

# 参考资料
[https://www.runoob.com/linux/linux-comm-cat.html](https://www.runoob.com/linux/linux-comm-cat.html)
[https://zhuanlan.zhihu.com/p/91870070](https://zhuanlan.zhihu.com/p/91870070)
[https://www.jianshu.com/p/69ef4587c874](https://www.jianshu.com/p/69ef4587c874)
[https://www.howtoing.com/13-basic-cat-command-examples-in-linux](https://www.howtoing.com/13-basic-cat-command-examples-in-linux)
