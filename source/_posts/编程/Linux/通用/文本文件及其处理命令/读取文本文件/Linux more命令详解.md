---
title: Linux more命令详解
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: 65cb3430
date: 2021-03-24 11:10:08
updated: 2021-04-03 18:15:30
---
<div id='my_toc'><a href="/blog/65cb3430/#more命令" class="header_1">more命令</a>&nbsp;<br><a href="/blog/65cb3430/#more内置快捷键" class="header_2">more内置快捷键</a>&nbsp;<br><a href="/blog/65cb3430/#格式" class="header_2">格式</a>&nbsp;<br><a href="/blog/65cb3430/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# more命令
more命令是一个基于vi编辑器文本过滤器，它以全屏幕的方式按页显示文本文件的内容，支持vi中的关键字定位操作。
## more内置快捷键
more名单中内置了若干快捷键，常用的有
- H（获得帮助信息），
- Enter（向下翻滚一行），
- 空格（向下滚动一屏），
- Q（退出命令）。

该命令一次显示一屏文本，满屏后停下来，并且在屏幕的底部出现一个提示信息，给出至今己显示的该文件的百分比：--More--（XX%）可以用下列不同的方法对提示做出回答：
- 按Space键：显示文本的下一屏内容。
- 按Enter键：只显示文本的下一行内容。
- 按斜线符`/`：接着输入一个模式，可以在文本中寻找下一个相匹配的模式。
- 按H键：显示帮助屏，该屏上有相关的帮助信息。
- 按B键：显示上一屏内容。
- 按Q键：退出rnore命令。

## man more
```
MORE(1)                                                             BSD General Commands Manual                                                            MORE(1)

NAME
     more — 在显示器上阅读文件的过滤器

总览 (SYNOPSIS)
     more [-dlfpcsu] [-num] [+/ pattern] [+ linenum] [file ...]

描述 (DESCRIPTION)
     More 是 一个 过滤器, 用于 分页 显示 (一次一屏) 文本. 这个 版本 非常 基本.  用户 应该 知道 less(1) 提供了 more(1) 的 模拟, 并且 做了 增强.

选项 (OPTION)
     下面 介绍 命令行选项. 选项 可以 从 环境变量 MORE 中获取 (要 确保 它们 以 短横线 开头 (``-'')), 但是 命令行选项 能够 覆盖 它们.

     -num  这个选项指定屏幕的行数 (以整数表示).

     -d    让 more 给 用户 显示 提示信息 "[Press space to continue, 'q' to quit.]", 当 用户 按下 其他键 时, 显示 "[Press 'h' for instructions.]", 而不是 扬声器
           鸣笛.

     -l    More 在 通常情况下 把 ^L (form feed) 当做 特殊字符, 遇到 这个字符 就会 暂停.  -l 选项 可以 阻止 这种特性.

     -f    使 more 计数 逻辑行, 而不是 屏幕行 (就是说, 长行 不会 断到 下一行).

     -p    不卷屏, 而是 清除 整个屏幕, 然后 显示 文本.

     -c    不卷屏, 而是 从 每一屏的 顶部 开始 显示 文本, 每 显示完 一行, 就 清除 这一行的 剩余部分.

     -s    把 重复的空行 压缩成 一个 空行.

     -u    防止下划线.

     +/    在 显示 每个文件 前, 搜索 +/ 选项 指定的 文本串.

     +num  从行号 num 开始显示.

命令 (COMMAND)
     more 的交互命令基于 vi(1).  有些命令 以 一个 十进制数字 开始, 在 下面的描述 里 称之为 k. 后面的 描述中, ^X 指 control-X.

     h or ?      帮助: 显示 这些 命令 的 摘要. 你 如果 忘掉 所有 其他的命令, 请记住这个.

     SPACE       显示 接下来的 k 行文本. 缺省值 是 当前的屏幕大小.

     z           显示 接下来的 k 行文本. 缺省值 是 当前的屏幕大小. 参数 成为 新的缺省值.

     RETURN      显示 接下来的 k 行文本. 缺省值 是 1. 参数 成为 新的缺省值.

     d or ^D     卷屏 k 行. 缺省值 是 当前的 卷屏大小, 初始化为 11. 参数 成为 新的缺省值.

     q 或 Q 或 INTERRUPT
                 退出.

     s           向前跳过 k 行文本. 缺省值 是 1.

     f           向前跳过 k 屏文本. 缺省值 是 1.

     b or ^B     向后跳回 k 屏文本. 缺省值 是 1.

     '           跳到 上一次 搜索 开始 的 地方.

     =           显示当前行号.

     /pattern    搜索 第 k 个 符合 正则表达式的 文本串. 缺省值 是 1.

     n           搜索 最后 第 k 个 符合 正则表达式的 文本串. 缺省值 是 1.

     !&lt;cmd&gt; or :!&lt;cmd&gt;
                 在子 shell 中执行 &lt;cmd&gt;.

     v           启动 /usr/bin/vi, 指向 当前行.

     ^L          刷新屏幕.

     :n          跳到 后面 第 k 个 文件.  缺省值 是 1.

     :p          跳到 前面 第 k 个 文件.  缺省值 是 1.

     :f          显示 当前文件名 和 行号.

     .           重复上次命令.

环境 (ENVIRONMENT)
     More 利用 下面的 环境变量 (如果 它们 存在):

     MORE        这个变量 设置 你 喜欢的 more 选项.

     SHELL       当前使用的 shell (一般说来 就是 登录 shell).

     TERM        指定 终端类型, more 用它来 获取 操作屏幕 所需的 终端特性.

另见 (SEE ALSO)
     vi(1) less(1)

作者 (AUTHOR)
     Eric Shienbrood, UC Berkeley
     Modified by Geoff Peck, UCB to add underlining, single spacing
     Modified by John Foderaro, UCB to add -c and MORE environment variable

历史 (HISTORY)
     more 命令 出现在 3.0BSD.  本手册页 描述了 more version 5.19 (Berkeley 6/29/88), 目前 它 用在 Linux 社团.  制作文档时 使用了 其他几个版本 的 手册页, 并且 根据
     源程序 作了 扩充.
```
## 测试文件
为了测试文件，现在创建一个more_test.txt文件，写入如下内容：
```
[root@localhost Linux_Test]# cat more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
4
5
6
7
8
9
A
B
C
D
E
F
G
H
I
J
K
L
M
N
O
P
Q
R
S
T
U
V
W
X
Y
Z
[root@localhost Linux_Test]#
```
## more
```
[root@localhost Linux_Test]# more more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
4
5
6
7
8
9
A
B
C
D
E
F
G
H
I
J
K
L
M
N
O
P
Q
R
S
T
U
--More--(96%)
```
## more选项
### more -num文件：指定屏幕的行数 (以整数表示)
`more -5 more_test.txt`刚开始只显示文件的前面5行：
```
[root@localhost Linux_Test]# more -5 more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
--More--(78%)

```
如果按下空格，则会再显示下一屏幕（5行）：
```
[root@localhost Linux_Test]# more -5 more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
4
5
6
7
8
--More--(81%)

```
### more -d：显示提示信息 按错键不鸣笛
more -d：让more给用户显示提示信息"[Press space to continue, 'q' to quit.]", 当用户按下其他键时,显示"[Press 'h' for instructions.]",而不是扬声器鸣笛.
```
[root@localhost Linux_Test]# more -d -5 more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
--More--(78%)[Press space to continue, 'q' to quit.]

```
### more -f：more计数逻辑行而不是屏幕行
more -f：使more计数逻辑行,而不是屏幕行(就是说,长行不会断到下一行).
```
[root@localhost Linux_Test]# more -f -5 more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
4
--More--(78%)

```
### more -p：清屏后再显示
不卷屏,而是清除整个屏幕,然后显示文本.
```
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
--More--(78%)
```
当你按下空格键，显示下一屏的时候，会再次清屏，然后在输出：
```
4
5
6
7
8
--More--(81%)
```
你可以向上滚动屏幕，可以看到清屏，然后输出的效果：
```
[root@localhost Linux_Test]# more -p -5 more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
--More--(78%)
4
5
6
7
8
--More--(81%)
9
A
B
C
D
--More--(85%)

```
### more -c：下一屏幕的内容会覆盖当前屏幕的内容
不卷屏,而是从每一屏的顶部开始显示文本,每显示完一行,就清除这一行的剩余部分.
```
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
--More--(78%)

```
当你按下空格后，more命令会清除当前屏幕的输出行，然后再使用下一屏幕的内容覆盖到当前屏幕输出。
```
4
5
6
7
8
--More--(81%)

```
当你向上滚动屏幕时，只会看到more输出了一个屏幕而已，标准输出中不会有之前的输出信息，这就是和more -p的区别：

```
[root@localhost Linux_Test]#
4
5
6
7
8
--More--(81%)

```
### more -s：压缩重复空行
#### 测试文件
```
[root@localhost Linux_Test]# cat more_test_2.txt 
1
2



6
[root@localhost Linux_Test]#
```
```
[root@localhost Linux_Test]# more -5 more_test_2.txt 
1
2



--More--(77%)
```
```
[root@localhost Linux_Test]# more -s -5 more_test_2.txt 
1
2

6
[root@localhost Linux_Test]#
```
### more +/正则表达式：从有匹配正则表达式的字符串的行开始显示
#### 测试文件
```
[root@localhost Linux_Test]# cat more_test3.txt 
1
2



6
aaa
b
c
d
e
f
[root@localhost Linux_Test]# 
```
命令：`more -5 +/^[a-z] more_test3.txt`表示每屏幕显示5行，从匹配正则表达式^[a-z]开始的行附近开始显示。
```
[root@localhost Linux_Test]# more -5 +/^[a-z] more_test3.txt 

...跳过

6
aaa
b
c
--More--(73%)
```

### more +linenum：从第linenum行开始显示

```
[root@localhost Linux_Test]# more -5  more_test.txt 
0英文的26个字母大写是：A、 B、 C、 D、 E、 F、 G 、H 、I、 J、 K 、L、 M 、N 、O、 P 、Q 、R、 S、 T、 U、 V、 W、 X 、Y
 、Z。阿拉伯数字为：0、1、2、3、4、5、6、7、8、9。
1
2
3
--More--(78%)

```
一屏幕显示5行，从第5行开始显示：
```
[root@localhost Linux_Test]# more -5 +5 more_test.txt 
4
5
6
7
8
--More--(81%)

```
## more的显示控制命令
满屏后，显示--more--或--more--(xx%)，可以使用more命令：

|more命令|功能|
|:---|:---|
|空格|显示下一屏|
|回车|上滚一行，当所感兴趣的段落内容正好处于当前屏的尾部，另有一部分在下一页中时，可以连续按回车，将感兴趣的部分滚动上来|
|q|(quit)退出程序，后面的内容不再显示|
|/pattern|搜索指定模式的字符串，模式描述用正则表达式|
|/|继续查找指定模式的字符串|
|h|(Help)帮助信息。打印more命令的所有功能列表|
|Ctrl-L|屏幕刷新|
### 测试文件
```
[root@localhost Linux_Test]# cat more_test4.txt 
1
2
3
4
5
6
7
8
9
0
A
B
C
D
E
F
G
H
I
J
K
L
M
N
O
PP
QQ
RR
SS
TT
UU
VV
WW
XX
YY
ZZ
[root@localhost Linux_Test]# 
```
### 显示5行逻辑行
```
[root@localhost Linux_Test]# more -f -5 more_test4.txt 
1
2
3
4
5
--More--(12%)

```
此时可以输入more的命令。
#### 显示more的控制命令的帮助文档
输入h或者shift+?可以显示帮助文档，
```
Most commands optionally preceded by integer argument k.  Defaults in brackets.
Star (*) indicates argument becomes new default.
-------------------------------------------------------------------------------
<space>                 Display next k lines of text [current screen size]
z                       Display next k lines of text [current screen size]*
<return>                Display next k lines of text [1]*
d or ctrl-D             Scroll k lines [current scroll size, initially 11]*
q or Q or <interrupt>   Exit from more
s                       Skip forward k lines of text [1]
f                       Skip forward k screenfuls of text [1]
b or ctrl-B             Skip backwards k screenfuls of text [1]
'                       Go to place where previous search started
=                       Display current line number
/<regular expression>   Search for kth occurrence of regular expression [1]
n                       Search for kth occurrence of last r.e [1]
!<cmd> or :!<cmd>       Execute <cmd> in a subshell
v                       Start up /usr/bin/vi at current line
ctrl-L                  Redraw screen
:n                      Go to kth next file [1]
:p                      Go to kth previous file [1]
:f                      Display current file name and line number
.                       Repeat previous command
-------------------------------------------------------------------------------
--More--(12%)

```
#### 正则查找
输入`/`可以进入正则表达式查找功能。
例如输入`/^[A-Z]`跳转到以大写字母开头的行：
```
/^[A-Z]  
...跳过
9
0
A
B
--More--(28%)
```
输入`/[A-Z][A-Z]`，跳转到包含两个大写字母的行：
```
/[A-Z][A-Z]
...跳过
N
O
PP
QQ
--More--(67%)

```
##### 按键n：跳转到下一个正则匹配行：
按下一次按键n的效果：
```
[root@localhost Linux_Test]# more -f -5 more_test4.txt 
1
2
3
4
5
/[A-Z]
...跳过
9
0
A
B
/[A-Z][A-Z]
...跳过
N
O
PP
QQ
RR
SS
TT
UU
--More--(81%)
```
再按一次按钮n的效果：
```
[root@localhost Linux_Test]# more -f -5 more_test4.txt 
1
2
3
4
5
/[A-Z]
...跳过
9
0
A
B
/[A-Z][A-Z]
...跳过
N
O
PP
QQ
RR
SS
TT
UU
VV
WW
XX
YY
--More--(96%)
```
##### more中输入正则表达式需要注意的点
在more中输入的正则表达式只能从左至右按顺序输入，无法使用左右箭头移动光标。
如果输入错了可以按下Ctrl+backSpace键进行删除，单独按backSpace键是无法删除的，反而会输入`^H`字符。
#### 调用Vi编辑器打开当前文件
输入v可以使用vi编辑器打开more正在打开的文件。
# 参考资料
[https://www.cnblogs.com/peida/archive/2012/11/02/2750588.html](https://www.cnblogs.com/peida/archive/2012/11/02/2750588.html)
[https://www.yiibai.com/linux/more.html](https://www.yiibai.com/linux/more.html)
[https://man.linuxde.net/more](https://man.linuxde.net/more)
[https://www.runoob.com/linux/linux-comm-more.html](https://www.runoob.com/linux/linux-comm-more.html)