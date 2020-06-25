---
title: cmd 显示目录树tree命令
categories: 
  - Windows
  - CMD批处理
  - 语法
  - 操作文件或目录的命令
date: 2019-04-26 21:18:26
updated: 2020-04-11 09:15:21
abbrlink: 979e79b0
---
<div id='my_toc'><a href="/blog/979e79b0/#显示目录树命令-tree" class="header_1">显示目录树命令 tree</a>&nbsp;<br><a href="/blog/979e79b0/#帮助文档" class="header_2">帮助文档</a>&nbsp;<br><a href="/blog/979e79b0/#只显示目录不显示文件-不带参数" class="header_2">只显示目录不显示文件 不带参数</a>&nbsp;<br><a href="/blog/979e79b0/#显示文件-参数/f" class="header_2">显示文件 参数/f</a>&nbsp;<br><a href="/blog/979e79b0/#参数/a" class="header_2">参数/a</a>&nbsp;<br><a href="/blog/979e79b0/#不要使用/a参数好" class="header_2">不要使用/a参数好</a>&nbsp;<br><a href="/blog/979e79b0/#把目录树写入剪贴板" class="header_2">把目录树写入剪贴板</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

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
