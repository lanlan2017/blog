---
title: Linux vi编辑状态和光标移动
categories: 
  - Linux
  - 通用
  - vi编辑器及乱码问题
abbrlink: f09fb131
date: 2021-05-20 16:49:27
updated: 2022-04-04 00:51:45
---
# vi用户的偏好设置

## 通过用户HOME目录下的文件.exrc设置vi偏好
记作$HOME/.exrc(每用户一份，用户独立设置)
```
set number       每行左边显示行号
set tabstop=4   制表符位置为4格对齐
```
```
[root@localhost vi]# vi ~/.exrc
[root@localhost vi]# cat ~/.exrc 
set number
set tabstop=4
[root@localhost vi]# 
```
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/2.png)

## 在vi运行时检查偏好设置
在vim中输入
```
:set number
:set tabstop=4
```
执行`:set number`和`:set tabstop=4`后：
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/1.png)

# vi的两种工作状态
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/3.png)
## 命令状态：键盘输入解释为命令
- vi一启动就进入命令方式，键盘输入解释为命令
- 一般按键无回显
- 以冒号可以引入行编辑的命令和查找命令
- 在命令状态下按下i键或a键等，可以从命令状态转到文本状态

## 文本状态
- 键盘输入解释为输入的文本
- 可以输入多行，每输入完一行后按回车转入下一行
- 正文输入时有回显
- 输入完毕按键盘左上角的Esc键，返回到命令状态

## 正文插入
### 命令i
**在当前字符前**插入正文段，直至按Esc键(insert)

### 命令a
**在当前字符后**插入正文段，直至按Esc键(append)

## 光标单字符移动
### 单字符移动
（四个字母键盘上相邻的按键）
- h 光标左移一列
- j 光标下移一行
- k 光标上移一行
- l 光标右移一列

一般可以直接使用键盘上的方向键代替这四个字母
### 执行多次单字符移动命令
命令前加一整数，表示这个命令连续执行多少遍
- 5h 光标左移5列
- 6j 光标下移6行
- 23k 光标上移23行
- 10l 光标右移10列

注意：在vi命令状态下的按键命令没有回显
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/4.png)

## 翻页命令

- Ctrl+b 向后翻页(Backward)
- Ctrl+f 向前翻页(Forward)

![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/5.png)

一般可以用PgDn键代替Ctrl+f，用PgUp键代替Ctrl+b

### 连续翻页
也可以使用下面的命令
- 6Ctrl-f 向前翻6页
- 15Ctrl-b 向后翻15页

## 光标行内快速移动
### 行尾行首
- 将光标移至当前行首`^`，（按shift+6按键即可输入`^`）
- 将光标移至当前行尾`$`，（按shift+4按钮即可输入`$`）

![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/7.png)

### 移动一个单词
- 移到右一个单词`w`
- 移到左一个单词`b`
- 也可以使用6w，5b命令

![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/6.png)
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/8.png)

## 光标移动到指定行
### 移到指定的行
- `:476` 将光标定位于第476行
- `:1` 将光标定位于第1行（文件首）
- `:$` 将光标定位于文件尾

![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/9.png)

#### 在描述行号时可以使用
圆点（`.`）代表当前行号，
`$`代表最后一行的行号。

![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/10.png)

## 括号配对%
把光标移到一个花括号(或圆括号，或方括号)上，按%键，则光标自动定位到与它配对的那一个括号
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Programming/Linux/General/VIEditorAndGarbledProblem/11.png)

# 参考资料
<http://c.biancheng.net/vi/>


<!-- Blog/Programming/Linux/General/VIEditorAndGarbledProblem -->
