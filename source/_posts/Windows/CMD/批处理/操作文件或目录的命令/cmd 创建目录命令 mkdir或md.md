---
title: cmd 创建目录命令 mkdir或md
categories: 
  - Windows
  - CMD
  - 批处理
  - 操作文件或目录的命令
abbrlink: 47a3a21b
date: 2019-01-31 18:48:22
updated: 2022-04-04 16:32:20
---
# cmd 创建目录命令
mkdir命令可以用来创建目录,命令格式如下:
```cmd
D:\学习9\疯狂Java讲义第三版光盘\codes\03\3.1>mkdir /?
创建目录。
mkdir [drive:]path
md [drive:]path
如果命令扩展被启用，mkdir 会如下改变:
如果需要，mkdir 会在路径中创建中级目录。例如: 假设 \a 不
存在，那么:
    mkdir \a\b\c\d
与:
    mkdir \a
    chdir \a
    mkdir b
    chdir b
    mkdir c
    chdir c
    mkdir d
相同。如果扩展被停用，则需要键入 mkdir \a\b\c\d。
```
可以看到使用mkdir,或者md命令都可以创建目录，唯一要注意的就是`目录的格式要写对`，可以是绝对路径(如`mkdir D:\Test`),也可是相对路径(如`mkdir .\myjavadoc\test`).
