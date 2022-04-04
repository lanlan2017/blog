---
title: Linux sed命令高级用法精讲
categories: 
  - Linux
  - 通用
  - 正则表达式
abbrlink: 95f62934
date: 2021-05-07 18:35:04
updated: 2022-04-04 00:51:45
---
# sed 多行命令
在学习 sed 命令的基础功能时，你可能注意到了一个局限，即所有的 sed 命令都只是针对单行数据执行操作，在 sed 命令读取缓冲区中的文本数据时，它会基于换行符的位置，将数据分成行，sed 会根据定义好的脚本命令一次处理一行数据。

但是，有时我们需要对跨多行的数据执行特定操作。比如说，在文本中查找一串字符串"http://c.biancheng.net"，它很有可能出现在两行中，每行各包含其中一部分。这时，如果用普通的 sed 编辑器命令来处理文本，就不可能发现这种被分开的情况。

幸运的是，sed 命令的设计人员已经考虑到了这种情况，并设计了对应的解决方案。sed 包含了三个可用来处理多行文本的特殊命令，分别是：
- Next 命令（N）：将数据流中的下一行加进来创建一个多行组来处理。
- Delete（D）：删除多行组中的一行。
- Print（P）：打印多行组中的一行。

# sed多行操作命令N
N 命令会将下一行文本内容添加到缓冲区已有数据之后（之间用换行符分隔），从而使前后两个文本行同时位于缓冲区中，sed 命令会将这两行数据当成一行来处理。
## 两行变一行
下面这个例子演示的 N 命令的功能：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
hello
world
[root@localhost sed]# sed "/hello/{N;s/\n/ /}" sed_append.txt 
this is line a
this is line b
this is line c
this is line d
hello world
[root@localhost sed]# 
```
在这个例子中，sed 命令查找含有单词 hello 的那行文本。找到该行后，它会用 N 命令将下一行合并到那行，然后用替换命令 s 将换行符替换成空格。结果是，文本文件中的两行在 sed 的输出中成了一行。
### 示例2
```
[root@localhost exam]# cat result1.txt 
1单选(3分)
下列哪个不是单字符正则表达式？
A.
. 
B.
 [i-k] 
C.
@
D.
$
正确答案：D你错选为C
[root@localhost exam]# sed -r 'N;s/([A-Z]\.)\n(.+)/\1 \2/g' result1.txt 
1单选(3分)
下列哪个不是单字符正则表达式？
A. . 
B.  [i-k] 
C. @
D. $
正确答案：D你错选为C
[root@localhost exam]# 
```
## sed多行删除命令D
sed 不仅提供了单行删除命令（d），也提供了多行删除命令 D，其作用是只删除缓冲区中的第一行，也就是说，D 命令将缓冲区中第一个换行符（包括换行符）之前的内容删除掉。
## 多行打印命令P
同 d 和 D 之间的区别一样，P（大写）命令和单行打印命令 p（小写）不同，对于具有多行数据的缓冲区来说，它只会打印缓冲区中的第一行，也就是首个换行符之前的所有内容。

未完待续
# 参考资料
[http://c.biancheng.net/view/4056.html](http://c.biancheng.net/view/4056.html)
