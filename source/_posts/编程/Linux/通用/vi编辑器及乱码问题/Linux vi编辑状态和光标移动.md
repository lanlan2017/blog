---
title: Linux vi编辑状态和光标移动
categories:
  - 编程
  - Linux
  - 通用
  - vi编辑器及乱码问题
abbrlink: f09fb131
date: 2021-05-20 16:49:27
updated: 2021-05-20 16:49:27
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

<!-- Blog/Programming/Linux/General/VIEditorAndGarbledProblem -->