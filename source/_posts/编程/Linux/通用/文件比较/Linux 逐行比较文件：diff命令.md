---
title: Linux 逐行比较文件：diff命令
categories: 
  - 编程
  - Linux
  - 通用
  - 文件比较
abbrlink: fe546836
date: 2021-05-19 13:17:06
updated: 2021-05-20 16:20:11
---
<div id='my_toc'><a href="/blog/fe546836/#Linux-求出两个文件的差别：diff命令介绍" class="header_1">Linux 求出两个文件的差别：diff命令介绍</a>&nbsp;<br><a href="/blog/fe546836/#用法" class="header_2">用法</a>&nbsp;<br><a href="/blog/fe546836/#功能" class="header_2">功能</a>&nbsp;<br><a href="/blog/fe546836/#输出格式" class="header_2">输出格式</a>&nbsp;<br><a href="/blog/fe546836/#normal格式" class="header_2">normal格式</a>&nbsp;<br><a href="/blog/fe546836/#normal格式文件转化指令" class="header_3">normal格式文件转化指令</a>&nbsp;<br><a href="/blog/fe546836/#更换指令c" class="header_4">更换指令c</a>&nbsp;<br><a href="/blog/fe546836/#删除指令d" class="header_4">删除指令d</a>&nbsp;<br><a href="/blog/fe546836/#增加指令a" class="header_4">增加指令a</a>&nbsp;<br><a href="/blog/fe546836/#unified格式" class="header_2">unified格式</a>&nbsp;<br><a href="/blog/fe546836/#diff-标准输出" class="header_1">diff 标准输出</a>&nbsp;<br><a href="/blog/fe546836/#diff命令输出信息" class="header_2">diff命令输出信息</a>&nbsp;<br><a href="/blog/fe546836/#diff-a-txt-b-txt" class="header_2">diff a.txt b.txt</a>&nbsp;<br><a href="/blog/fe546836/#diff-b-txt-a-txt" class="header_2">diff b.txt a.txt</a>&nbsp;<br><a href="/blog/fe546836/#diff-c：上下文格式" class="header_1">diff -c：上下文格式</a>&nbsp;<br><a href="/blog/fe546836/#diff-c输出信息" class="header_2">diff -c输出信息</a>&nbsp;<br><a href="/blog/fe546836/#行前有感叹号-表示-该行-需要修改" class="header_3">行前有感叹号 表示 该行 需要修改</a>&nbsp;<br><a href="/blog/fe546836/#行前有减号-表示改行需要删除" class="header_3">行前有减号 表示改行需要删除</a>&nbsp;<br><a href="/blog/fe546836/#行前有加号表示需要添加改行" class="header_3">行前有加号表示需要添加改行</a>&nbsp;<br><a href="/blog/fe546836/#diff-u：统一格式输出" class="header_1">diff -u：统一格式输出</a>&nbsp;<br><a href="/blog/fe546836/#diff命令手册" class="header_1">diff命令手册</a>&nbsp;<br><a href="/blog/fe546836/#man-diif" class="header_2">man diif</a>&nbsp;<br><a href="/blog/fe546836/#tldr-diif" class="header_2">tldr diif</a>&nbsp;<br><a href="/blog/fe546836/#cheat-diff" class="header_2">cheat diff</a>&nbsp;<br><a href="/blog/fe546836/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Linux 求出两个文件的差别：diff命令介绍
Linux diff命令用于比较文件的差异。

diff以逐行的方式，比较文本文件的异同处。如果指定要比较目录，则diff会比较目录中相同文件名的文件，但不会比较其中子目录。

diff 命令是一个分析文件信息的命令，可以打印出文件之间的差异。它可以逐行地比较两个文件的内容，也可以递归地比较文件夹的内容。diff 命令的输出内容可以让我们知道要使两个文件相同需要做哪些修改，这对于我们的工作很有帮助。
## 用法
```
diff file1 file2
diff –u file1 file2
```
## 功能
- 比较两个版本的文本文件，以寻找两者间差别

## 输出格式
- normal，
- unified (-u)

## normal格式
normal格式：**列出一个如何将原文件file1转化为新文件file2的指令**
- 这些指令有
  - a（Add），
  - c（Change）
  - d（Delete）
- 指令字母左边的行号是file1的行号，右面是file2的行号
- 列出内容时，
  - 大于号后边的内容是需要在file1文件中增加的内容；
  - 小于号后边的内容是需从file1中删除的内容

### normal格式文件转化指令
#### 更换指令c

<pre>
25<mark>c</mark>25,26
&lt; &#35;define MAX_WEIGHT 2000000000 
---
&gt; /* max signed 32-bit integer */
&gt; &#35;define MAX_WEIGHT 0x7fffffff
</pre>

将原文件file1的第25行更换(change)成新文件file2的的第25~26行。
#### 删除指令d

<pre>
61,62<mark>d</mark>60
&lt;                 x2 = ht[j].weight;
&lt;                 m2 = j;
</pre>

将原文件file1第6l~62行删除(delete)后，后面的内容与新文件file2的第60行之后一致
#### 增加指令a

<pre>
68<mark>a</mark>67,68
&gt;         ht[i].parent = -1;
&gt;         printf("Create new tree\n");
</pre>

将原文件file1的第68行增加(add)新文件file2中的第67~68行


## unified格式
unified在git中使用的就是这种格式。

<pre>
$ diff -u0 ht.c ht2.c 
--- ht.c 2018-11-14 18:18:59.595497610 +0800
+++ ht2.c       2018-11-17 08:22:58.191858259 +0800
@@ -25 +25,2 @@
-&#35;define MAX_WEIGHT 2000000000 
+/* max signed 32-bit integer */
+&#35;define MAX_WEIGHT 0x7fffffff
@@ -50,2 +51 @@
- x1 = x2 = MAX_WEIGHT;
- m1 = m2 = 0;
+        x1 = MAX_WEIGHT;
@@ -61,2 +60,0 @@
- x2 = ht[j].weight;
- m2 = j;
@@ -68,0 +67,2 @@
+        ht[i].parent = -1;
+        printf("Create new tree\n");
</pre>

以下的信息表示两个文件差异的内容：
```
@@ -25 +25,2 @@
-&#35;define MAX_WEIGHT 2000000000 
+/* max signed 32-bit integer */
+&#35;define MAX_WEIGHT 0x7fffffff
```
表示删除第一个文件ht.c第25行的内容，然后在第25行添加两行新内容。
```
@@ -50,2 +51 @@
- x1 = x2 = MAX_WEIGHT;
- m1 = m2 = 0;
+        x1 = MAX_WEIGHT;
```
删除第一个文件的50行之后的两行内容。然后在第51行添加一行内容。
```
@@ -61,2 +60,0 @@
- x2 = ht[j].weight;
- m2 = j;
```
删除第一个文件第61行之后的两行内容
```
@@ -68,0 +67,2 @@
+        ht[i].parent = -1;
+        printf("Create new tree\n");
```
在第67行后添加两行内容。

# diff 标准输出

<pre>
[root@localhost cmp]&#35; cat -n a.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
     5    this is a new line
[root@localhost cmp]&#35; cat -n b.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost cmp]&#35; diff a.txt b.txt 
3c3
&lt; helloworld!
&#45;&#45;&#45;
&gt; this is line c
5d4
&lt; this is a new line
[root@localhost cmp]&#35; 
</pre>

## diff命令输出信息
diff 命令所参考的不是第一个文件，而是第二个文件，它的输出信息有以下几种字符：
- `a` : 表示必须文件1必须 添加一行 才能和文件2相同
- `c` : 表示必须文件1必须 修改行 才能和文件2相同
- `d` : 表示必须文件1必须 删除一行 才能和文件2相同
- 字符前的数字表示第一个文件中的行数，
- 字符后的内容表示第二个文件中的行数。
- `<` 表示引用的第一个文件中的内容，
- `>` 表示引用的第一个文件中的内容。

所以上面的输出信息的含义如下：

<pre>
3c3              &#35; 根据第2个文件b.txt的第3行,第一个文件a.txt的第3行需要改变的内容，我猜这里的c应该是change的意思
&lt; helloworld!    &#35; 第1个文件a.txt的第3行的内容
&#45;&#45;&#45;              &#35; 分隔符
&gt; this is line c &#35; 第2个文件b.txt的第3行的内容
5d4              &#35; 根据第2个文件的第4行，第一个文件a.txt的第5行需要删除掉的内容
&lt; this is a new line
</pre>

## diff a.txt b.txt
<pre>
[root@localhost cmp]&#35; diff a.txt b.txt 
3c3
&lt; helloworld!
&#45;&#45;&#45;
&gt; this is line c
5d4
&lt; this is a new line
[root@localhost cmp]&#35; 
</pre>

为了使得a.txt和b.txt相同，我们必须
- 修改a.txt的第3行的内容。(<mark>3c</mark>3)
- 删除a.txt的第5行的内容。(<mark>5d</mark>4)

## diff b.txt a.txt
现在调换两个文件的位置,输出如下：

<pre>
[root@localhost cmp]&#35; diff b.txt a.txt 
3c3
&lt; this is line c
&#45;&#45;&#45;
&gt; helloworld!
4a5
&gt; this is a new line
[root@localhost cmp]&#35; 
</pre>

可以看到如果要使得b.txt和a.txt内容一样。
- 修改b.txt的 第3行的内容。
- 在b.txt的第4行之后添加内容。

# diff -c：上下文格式
```
[root@localhost cmp]# diff -c a.txt b.txt 
*** a.txt    2021-05-19 11:45:23.117869628 +0800
--- b.txt    2021-05-15 22:41:56.157986437 +0800
***************
*** 1,5 ****
  this is line a
  this is line b
! helloworld!
  this is line d
- this is a new line
--- 1,4 ----
  this is line a
  this is line b
! this is line c
  this is line d
[root@localhost cmp]# 
```
## diff -c输出信息
其中
```
*** a.txt    2021-05-19 11:45:23.117869628 +0800
```
表示文件a.txt的信息用星号表示
```
--- b.txt    2021-05-15 22:41:56.157986437 +0800
```
表示b.txt的信息用减号表示
```
*** 1,5 ****   表示下方是a.txt的第1到第5行的内容
```
```
--- 1,4 ----  表示下方是b.txt的第1到第4行的内容。
```
### 行前有感叹号 表示 该行 需要修改
```
! helloworld!
```
和
```
! this is line c
```
表示要使得a.txt与b.txt内容一样，需要修改helloworld为this is line c.
### 行前有减号 表示改行需要删除
```
- this is a new line
```
表示要使得a.txt与b.txt内容一样，该行需要删除掉。


```
[root@localhost cmp]# diff -c b.txt a.txt 
*** b.txt    2021-05-15 22:41:56.157986437 +0800
--- a.txt    2021-05-19 11:45:23.117869628 +0800
***************
*** 1,4 ****
  this is line a
  this is line b
! this is line c
  this is line d
--- 1,5 ----
  this is line a
  this is line b
! helloworld!
  this is line d
+ this is a new line
[root@localhost cmp]# 
```
### 行前有加号表示需要添加改行
```
+ this is a new line
```
表示要使得b.txt比a.txt多了
```
this is a new line
```
这一行
# diff -u：统一格式输出
统一输出格式是上下文格式的改进版本，并产生较小的输出。
使用-u选项告诉diff以统一格式打印输出：

```
[root@localhost cmp]# diff -u a.txt b.txt 
--- a.txt    2021-05-19 11:45:23.117869628 +0800
+++ b.txt    2021-05-15 22:41:56.157986437 +0800
@@ -1,5 +1,4 @@
 this is line a
 this is line b
-helloworld!
+this is line c
 this is line d
-this is a new line
[root@localhost cmp]# 
```
表示把b.txt的
```
helloworld!
```
这样修改为
```
this is line c
```
，然后删除
```
this is a new line
```
即可得到a.txt

# diff命令手册
## man diif
<https://manned.org/diff.1>
## tldr diif
```
[root@localhost cmp]# tldr diff
  diff

  Compare files and directories.
  More information: https://man7.org/linux/man-pages/man1/diff.1.html.

  - Compare files (lists changes to turn old_file into new_file):
    diff old_file new_file

  - Compare files, ignoring white spaces:
    diff -w old_file new_file

  - Compare files, showing the differences side by side:
    diff -y old_file new_file

  - Compare files, showing the differences in unified format (as used by git diff):
    diff -u old_file new_file

  - Compare directories recursively (shows names for differing files/directories as well as changes made to files):
    diff -r old_directory new_directory

  - Compare directories, only showing the names of files that differ:
    diff -rq old_directory new_directory

[root@localhost cmp]# 
```
## cheat diff

<pre>
[root@localhost ~]&#35; cheat diff
&#35; To view the differences between two files:
diff -u version1 version2

&#35; To view the differences between two directories:
diff -ur folder1/ folder2/

&#35; To ignore the white spaces:
diff -ub version1 version2

&#35; To ignore the blank lines:
diff -uB version1 version2

&#35; To ignore the differences between uppercase and lowercase:
diff -ui version1 version2

&#35; To report whether the files differ:
diff -q version1 version2

&#35; To report whether the files are identical:
diff -s version1 version2

&#35; To diff the output of two commands or scripts:
diff &lt;(command1) &lt;(command2)

&#35; Generate a patch file from two files
diff -Naur version1 version2 &gt; version.patch
[root@localhost ~]&#35; 
</pre>

# 参考资料
<http://www.weixueyuan.net/a/550.html>
<https://segmentfault.com/a/1190000023138544>
<https://www.myfreax.com/diff-command-in-linux/>
<https://segmentfault.com/a/1190000039105296>
<https://www.jianshu.com/p/6ee74c2790b1>
<https://codingdict.com/article/10090>
<http://blog.itpub.net/29270124/viewspace-2220511/>
<https://os.51cto.com/art/201311/418930.htm>