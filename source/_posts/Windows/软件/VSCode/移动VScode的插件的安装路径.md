---
title: 移动VScode的插件的安装路径
categories: 
  - Windows
  - 软件
  - VSCode
abbrlink: 687154e5
date: 2021-04-06 16:27:46
updated: 2022-04-04 00:51:44
---
# 前言
VScode默认安装在C盘之中：
"C:\Users\用户名\AppData\Local\Programs\Microsoft VS Code")中,
VScode的插件也默认安装在C盘之中：
`C:\Users\用户名\.vscode\extensions`
但是最近我的C盘满了，所以我打算把插件的安装路径改到其他的盘符中。
# 使用符号链接
## 剪切extensions目录到其他盘符中
按Win+E快捷键打开File Explorer，进入`C:\Users\用户名\.vscode`目录，剪切里面的extensions目录到其他盘符，然后粘贴到其他盘符下，我这里粘贴到`E:\vscode_extensions`目录中。

## 在.vscode下创建符号链接extensions
以**管理员**的身份打开cmd，然后输入如下命令创建一个目录的符号链接：
```cmd
mklink /D "C:\Users\用户名\.vscode\extensions" "剪切后的路径"
```
我这里的是：
```cmd
mklink /D "C:\Users\{username}\.vscode\extensions" "E:\vscode_extensions\extensions"
```
命令输出效果：
```cmd
C:\WINDOWS\system32>mklink /D "C:\Users\lan\.vscode\extensions" "E:\vscode_extensions\extensions"
为 C:\Users\lan\.vscode\extensions <<===>> E:\vscode_extensions\extensions 创建的符号链接

C:\WINDOWS\system32>
```
此时可以在.vscode目录下看到一个名为extensions的符号链接：


点击该链接可以访问到刚才粘贴的扩展

## mklink命令详解
```
C:\WINDOWS\system32>mklink
创建符号链接。

MKLINK [[/D] | [/H] | [/J]] Link Target

        /D      创建目录符号链接。默认为文件
                符号链接。
        /H      创建硬链接而非符号链接。
        /J      创建目录联接。
        Link    指定新的符号链接名称。
        Target  指定新链接引用的路径
                (相对或绝对)。
```
