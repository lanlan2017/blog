---
title: Linux vi查找、编辑及存盘
categories: 
  - Linux
  - 通用
  - vi编辑器及乱码问题
abbrlink: 799bb2d6
date: 2021-05-28 15:34:24
updated: 2022-04-04 00:51:45
---
# Linux 查找、编辑及存盘
## 删除命令
### 删除字符
#### 删除当前字符的命令 x
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/12.png)

#### 命令5x 删除从当前光标开始的5个字符
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/13.png)

### 删除行
#### 删除当前行的命令 dd
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/14.png)
#### 删除从当前行开始的3行命令 3dd
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/15.png)
## 字符替换
### 替换光标处字符 r
#### 将当前光标处字符替换为a：ra命令
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/16.png)
### 连续替换多个字符
~~将当前光标处开始的三个字符依次替换为abc，则需要按命令`rarbrc`~~

**亲测这种方式不可行**，只会替换当前字符，如果想连续替换着需要按下shift键和r键，切换到**REPLACE模式**下才行。


## 取消和重复
### 取消上一次的编辑操作(undo)  u
如：误删了一段正文，用u命令可撤销删除
如：把文件中的所有abc字符串替换成xyz字符串， 用u命令可撤销替换
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/12.png)

### 重复上一次的编辑操作 圆点.
按圆点键，可以重复上一次的编辑操作
例如：按3dd命令删除了三行，然后按圆点键就再删除三行，接着连续按圆点键，则继续删除三行，每按一次删三行。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/17.png)

## 文件操作命令
### 存盘退出
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/18.png)

#### ZZ
```
[root@localhost vi]# cat helloworld.c 
xx#include <stdio.h>

int main()
{
    printf("%s\n","HelloWorld!");
} 
[root@localhost vi]#
```
#### :wq回车

### 存盘不退出
```
:w<CR>
```
这里的`<CR>`表示Enter键

### 不存盘退出
```
:q!<CR>
```
### 当前行下插入文件内容
读入文件xyz.c插入到当前行之下
```
:r xyz.c<CR>
```
#### 示例
test.txt文件：
```txt test.txt
[root@localhost vi]# cat test.txt 
test.txt line 1
test.txt line 2
test.txt line 3
[root@localhost vi]#
```
光标在第1行时，输入`:r test.txt<CR>`后：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/19.png)

### 把当前文件的部分行写入文件
写文件,把第50行至文件尾的内容写到文件file1中
```
:50,$w file1<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/20.png)

强制覆，把第50行到行尾的内容强制覆盖到文件file1中：
```
:50,$w! file1<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/21.png)
## 剪贴板
### 删除，并拷贝到剪贴板
删除第10-50行：
```
:10,50d<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/24.png)

删除文件首至当前行的部分：
```
:1,.d<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/22.png)

删除当前行到文件尾
```
:.,$d<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/23.png)

### 不删除，拷贝到剪贴板(yank)
```
:10,50y<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/26.png)
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/27.png)

### 粘贴剪贴板信息（paste）
```
p
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/25.png)
## 块操作：复制与删除
### 复制
复制第5-10行到第56行之下：
```
:5,10co56<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/28.png)

### 移动
移动第8-34行的内容到第78行的内容之下：
```
:8,34m78<CR>
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/29.png)
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/30.png)
## 行合并、刷屏和状态显示
### 两行合并(Join)：J（shiff+j）
需要注意的是这个J是大写的，也就是按shift+j进行输入，单独按j键是不会起效果的：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/32.png)
### 两行合并末行命令 :j
也可以使用在末行命令：
```
:j
```
当前行下面的行合并到当前行
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/31.png)

### 刷新屏幕显示(load)  Ctrl-l
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/33.png)

### 状态显示Ctrl-g
在屏幕最下面一行列出正在编辑的文件的名字，总行数，当前行号，文件是否被修改过等信息
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/34.png)
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/35.png)

## 模式查找
用“正则表达式”来描述一个字符串模式
### 查找命令格式
```
/pattern
```
例：
```
/[0-9][0-9]*
```
vi好像只支持基本的正则表达式，扩展的正则表达式例如`.+`并不支持。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/40.png)

其实不是而是`.+`需要写成`.\+`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/39.png)

### 继续查找命令
n 向下查找下一个next
N 向上查找下一个
循环式搜索（向下搜索时遇到文件尾则回到文件头继续搜索）

![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/36.png)
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/37.png)
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/38.png)

## 模式替换
替换命令(substitution)
格式
```
:n1,n2s/pattern/string/g
```
例
```
:1,50s/abc/xyz/
```
```
:1,50s/abc/xyz/g
```
第50-75行右移4列：
```
:50,80s/^/ /
```
第50-75行左移4列：
```
:50,80s/^ //
```
消除尾部多余的空格
```
:1,$s/  *$//
```
小心陷阱：不能把`a[i]`替换为`b[j]`
```
:1,$s/a[i]/b[j]/g
```
小心陷阱：不能把a*b替换为x+y
```
:1,$/a*b/x+y/g
```
### 模式替换中的转义符
尤其是编辑C语言源程序时需要
将`a[i]*b[j]`替换为`x[k]*y[n]`的命令
```
:1,$s/a\[i]\*b\[j]/x[k]*y[n]/g
```
将`buf.len/1000`替为`buffer.size/1024`的命令
```
:1,$s/buf\.len\/1000/buffer.size\/1024/g
```
模式串和替换字符串中的斜线前加转义符`\`以区别于替换命令格式中所必须的斜线.

### 使用其他符号作为s替换末行命令的分隔符
```
:1,$s:buf\.len/1000:buffer.size/1024:g
```
s后面以冒号取代斜线，分界符就换为冒号，避免对斜线的转义
```
:1,$s^http://www\.myvdo\.com/a/b/c/index\.html^https://www.xyvdo.com/index.html^g
```

### 分组：模式描述中增加\(和\)
在正则表达式中圆括号，仍然代表它自身
在正则表达式中出现的\(和\)不影响匹配操作
例
```
[a-zA-Z_][a-zA-Z0-9_]*->number
\([a-zA-Z_][a-zA-Z0-9_]*\)->number
```
### 反向引用：\0 \1 \2
将“`变量名->number`”替换为“`变量名->num`”
```
:1,$s/\([a-zA-Z_][a-zA-Z0-9_]*\)->number/\1->num/g
```
将日期格式“`月-日-年`”改为“`年.月.日`”,
比如：将`04-26-1997`替换为`1997.04.26`使用命令:
```
:1,$s/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]*\)/\3.\1.\2/g
```
