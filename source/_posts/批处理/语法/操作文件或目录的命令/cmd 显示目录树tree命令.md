---
title: cmd 显示目录树tree命令
categories: 
  - 批处理
  - 语法
  - 操作文件或目录的命令
date: 2019-04-26 21:18:26
updated: 2019-10-30 11:55:40
abbrlink: 979e79b0
---
- [显示目录树命令 tree](/blog/html/979e79b0/#显示目录树命令-tree)
    - [帮助文档](/blog/html/979e79b0/#帮助文档)
    - [只显示目录不显示文件 不带参数](/blog/html/979e79b0/#只显示目录不显示文件-不带参数)
    - [显示文件 参数/f](/blog/html/979e79b0/#显示文件-参数-f)
    - [参数/a](/blog/html/979e79b0/#参数-a)
    - [不要使用/a参数好](/blog/html/979e79b0/#不要使用-a参数好)
    - [把目录树写入剪贴板](/blog/html/979e79b0/#把目录树写入剪贴板)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 显示目录树命令 tree #
## 帮助文档 ##
```cmd
E:\workspace>tree /?
以图形显示驱动器或路径的文件夹结构。
TREE [drive:][path] [/F] [/A]
   /F   显示每个文件夹中文件的名称。
   /A   使用 ASCII 字符，而不使用扩展字符。
```
## 只显示目录不显示文件 不带参数 ##
```cmd
tree MarkdownTools
```
显示效果:
```cmd
卷 固态 的文件夹 PATH 列表
卷序列号为 0DBF-1035
E:\WORKSPACE\MARKDOWNTOOLS
├─.settings
├─bin
│  ├─add
│  ├─delete
│  ├─mainclass
│  └─markdown
│      ├─code
│      ├─formmat
│      └─table
├─lib
├─runable
└─src
    ├─add
    ├─delete
    ├─mainclass
    └─markdown
        ├─code
        ├─formmat
        └─table

```
## 显示文件 参数/f ##
显示一个项目的目录树:
```cmd
tree /f MarkdownTools
```
显示效果如下:
```cmd
卷 固态 的文件夹 PATH 列表
卷序列号为 00000173 0DBF:1035
E:\WORKSPACE\MARKDOWNTOOLS
│  fabu.bat
│  README.md
│  showpath.bat
│  UpdateLocalRepertory.bat  
├─lib
│      CodeFormat.jar
│      SysClipboardUtil.jar
│      SysClipboardUtil.zip
│      
├─runable
│      install.bat
│      M.bat
│      M.jar
│      uninstall.bat
│      
└─src
    ├─add
    │      Add.java
    │      
    ├─delete
    │      Delete.java
    │      
    ├─mainclass
    │      MMD.java
    │      
    └─markdown
        ├─code
        │      MDCodeBlock.java
        │      
        ├─formmat
        │      Formmat2Markdown.java
        │      
        └─table
                MDTable.java

```
## 参数/a ##
`/a`参数会,使用`ASCII`字符来显示目录树
```cmd
tree /f /a MarkdownTools
```
运行结果:
```cmd
卷 固态 的文件夹 PATH 列表
卷序列号为 0DBF-1035
E:\WORKSPACE\MARKDOWNTOOLS
|   .classpath
|   .gitignore
|   .project
|   fabu.bat
|   README.md
|   showpath.bat
|   UpdateLocalRepertory.bat
|   
+---.settings
|       org.eclipse.core.resources.prefs
|       org.eclipse.jdt.core.prefs
|       
+---bin
|   +---add
|   |       Add.class
|   |       
|   +---delete
|   |       Delete.class
|   |       
|   +---mainclass
|   |       MMD.class
|   |       
|   \---markdown
|       +---code
|       |       MDCodeBlock.class
|       |       
|       +---formmat
|       |       Formmat2Markdown.class
|       |       
|       \---table
|               MDTable.class
|               
+---lib
|       CodeFormat.jar
|       SysClipboardUtil.jar
|       SysClipboardUtil.zip
|       
+---runable
|       install.bat
|       M.bat
|       M.jar
|       uninstall.bat
|       
\---src
    +---add
    |       Add.java
    |       
    +---delete
    |       Delete.java
    |       
    +---mainclass
    |       MMD.java
    |       
    \---markdown
        +---code
        |       MDCodeBlock.java
        |       
        +---formmat
        |       Formmat2Markdown.java
        |       
        \---table
                MDTable.java

```
## 不要使用/a参数好 ##
对于同一个命令,`tree /f MarkdownTools`命令占了**37行**,`tree /f /a MarkdownTools`命令占了**65行**,所以,还是不要使用`/a`参数好,因为这样能剩下好多行.
## 把目录树写入剪贴板 ##
使用上述命令加上,管道符即可,也就是如下形式:
```cmd
tree /f /a MarkdownTools|clip
```
`clip`表示系统剪贴板,管道符`|`表示把前一个命令的输出作为第二个命令的输入.
>原文链接: [cmd 显示目录树tree命令](https://lanlan2017.github.io/blog/979e79b0/)