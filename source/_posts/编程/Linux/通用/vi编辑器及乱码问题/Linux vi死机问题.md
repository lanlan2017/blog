---
title: Linux vi死机问题
categories: 
  - Linux
  - 通用
  - vi编辑器及乱码问题
abbrlink: 3658ccba
date: 2021-05-30 17:42:19
updated: 2022-04-04 00:51:45
---
# 死机问题
## 所谓“死机”问题
### 现象
vi编辑结束后执行存盘操作，结果导致屏幕卡死，输入任何信息都不再有显示（死机，终端死机）
### 原因
vi编辑结束后按下Ctrl-S，因为Windows编辑器一般设置Ctrl-S热键的动作为Save，但Linux却进入流量控制状态
### 解决方法
按下Ctrl-Q键后流量控制解除


## 意外中止问题
### 现象
vi编辑结束后存盘，程序意外中止，编辑成果丢失，文件内容未发生变化
### 原因
vi存盘命令Shift-ZZ，误操作为Ctrl-ZZ，而Ctrl-Z按键导致当前运行进程被挂起（suspend），暂停运行（但进程尚在，处于Stopped状态）
### 解决方法
调用bash的作业管理机制，恢复运行被Stopped的进程
列表当前被Stopped的进程有哪些
```
jobs
```
将1号作业恢复到前台（foreground）运行
```
fg %1
```
或者：
```
%1
```
## 退格键(Backspace)无法使用的问题
### 现象
bash命令输入时，Backspace键可用，但是，运行自己写的程序时Backspace键无法正常使用
### 原因
当前终端的“行律”设置不正确
### 解决方法
Backspace按键对应的ASCII码是控制字符`Ctrl-H`
执行`stty erase ^H`设定行律模块把Ctrl-H为删除符，以后Ctrl-H和Backspace都可以做删除。如果需要，把命令放到`$HOME/.bash_profile`中（类似的，stty erase ^A可以设置用Ctrl-A做删除操作）
`stty -a`可以了解终端行律的状态
