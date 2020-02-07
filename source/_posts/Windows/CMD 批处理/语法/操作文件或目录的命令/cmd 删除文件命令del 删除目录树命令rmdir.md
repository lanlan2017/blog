---
title: cmd 删除文件命令del 删除目录树命令rmdir
categories: 
  - Windows
  - CMD 批处理
  - 语法
  - 操作文件或目录的命令
date: 2019-01-31 17:32:41
updated: 2019-12-17 05:18:52
abbrlink: 5d4c4249
---
<div id='my_toc'><a href="/blog/5d4c4249/#删除文件-del或erase命令" class="header_2">删除文件 del或erase命令</a>&nbsp;<br><a href="/blog/5d4c4249/#删除-当前目录-下某个文件" class="header_3">删除 当前目录 下某个文件</a>&nbsp;<br><a href="/blog/5d4c4249/#删除-当前目录-下某个后缀的所有文件" class="header_3">删除 当前目录 下某个后缀的所有文件</a>&nbsp;<br><a href="/blog/5d4c4249/#删除-当前目录树-下某个后缀的所有文件" class="header_3">删除 当前目录树 下某个后缀的所有文件</a>&nbsp;<br><a href="/blog/5d4c4249/#测试" class="header_4">测试</a>&nbsp;<br><a href="/blog/5d4c4249/#删除目录-rmdir或rd命令" class="header_2">删除目录 rmdir或rd命令</a>&nbsp;<br><a href="/blog/5d4c4249/#删除空目录" class="header_3">删除空目录</a>&nbsp;<br><a href="/blog/5d4c4249/#删除非空目录" class="header_3">删除非空目录</a>&nbsp;<br><a href="/blog/5d4c4249/#直接删除非空目录" class="header_3">直接删除非空目录</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 删除文件 del或erase命令 ##
del命令用于删除一个或多个文件，帮助文档如下所示：
```cmd
c:\users\lan>del /?
删除一个或数个文件。
del [/p] [/f] [/s] [/q] [/a[[:]attributes]] names
erase [/p] [/f] [/s] [/q] [/a[[:]attributes]] names
  names         指定一个或多个文件或者目录列表。
                通配符可用来删除多个文件。
                如果指定了一个目录，该目录中的所
                有文件都会被删除。
  /p            删除每一个文件之前提示确认。
  /f            强制删除只读文件。
  /s            删除所有子目录中的指定的文件。
  /q            安静模式。删除全局通配符时，不要求确认
  /a            根据属性选择要删除的文件
  属性          r  只读文件                     s  系统文件
                h  隐藏文件                     a  存档文件
                i  无内容索引文件               l  重分析点
                -  表示“否”的前缀
如果命令扩展被启用，del 和 erase 更改如下:
/s 开关的显示句法会颠倒，即只显示已经删除的文件，而不显示找不到的文件。

```
### 删除 当前目录 下某个文件 ###
输入`del 文件名`即可删除该文件，如:`del a.txt`。
### 删除 当前目录 下某个后缀的所有文件 ###
输入`del *.后缀名`就可以删除以后该缀名的所有文件，如要删除掉当前目录下所的所有`.html`文件:
```cmd
del *.html
```
删除掉当前目录下的所有`.html`,`.js`,`.css`文件:
```cmd
del *.html *.js *.css
```
同时，从帮助文档中，我们可以看到，`erase`命令和`del`命令的功能一样，所以使用：
```cmd
erase *.html *.js *.css
```
一样能删除当前目录下的所有`.html`,`.js`,`.css`文件。
### 删除 当前目录树 下某个后缀的所有文件 ###
首先是要先`cd`到该目录下,然后再该目录下使用`for`命令进行删除
```cmd
@echo off
G:
echo ############################################################### 进入G盘
echo.
cd G:\Desktop\语音合成
echo ############################################################### 进入语音合成目录:%cd%
echo.
echo ############################################################### 删除所有的pcm文件
echo.
for /r . %%i in (*.pcm) do (
    echo     删除:"%%i"
    del "%%i"
)
echo.
echo ############################################################### 删除所有的xmp文件
echo.
for /r . %%i in (*.xmp) do (
    echo     删除:"%%i"
    del "%%i"
)
pause
```
#### 测试 ####
现在目录结构如下:
```cmd
G:\Desktop\语音合成\神儒玄章>mytree f
G:\Desktop\语音合成\神儒玄章
├─神儒玄章.mp3
├─神儒玄章.pcm
└─神儒玄章.xmp
```
然后运行上面批处理脚本删除文件，程序输出如下:
```cmd
############################################################### 进入G盘

############################################################### 进入语音合成目录:G:\Desktop\语音合成

############################################################### 删除所有的pcm文件

    删除:"G:\Desktop\语音合成\神儒玄章\神儒玄章.pcm"

############################################################### 删除所有的xmp文件

    删除:"G:\Desktop\语音合成\神儒玄章\神儒玄章.xmp"
请按任意键继续. . .
```
然后再从查看当前目录,可以看到`.pcm`后缀和`.xmp`后缀的文件都没删除掉了.
```cmd
G:\Desktop\语音合成\神儒玄章>mytree f
G:\Desktop\语音合成\神儒玄章
└─神儒玄章.mp3
```
## 删除目录 rmdir或rd命令 ##
`rmdir`命令用于删除一个目录，`cmd`中输入`rmdir /?`查看帮助文档，如下所示:
```cmd
c:\users\lan>rmdir /?
删除一个目录。
rmdir [/s] [/q] [drive:]path
rd [/s] [/q] [drive:]path
    /s      除目录本身外，还将删除指定目录下的所有子目录和文件。用于删除目录树。
    /q      安静模式，带 /s 删除目录树时不要求确认
```
同样的,`rd`命令和`rmdir`命令一样。以后就直接使用`rd`命令这样可以少打几次键盘。
### 删除空目录 ###
如果一个目录时空目录的话，则可以直接使用 `rmdir 目录名`直接删除即可：
例如:`rmdir myjavadoc`,如果该目录不是空目录则这样无法删除:
```
D:\学习9\疯狂Java讲义第三版光盘\codes\03\3.1>rmdir myjavadoc
目录不是空的。
```
### 删除非空目录 ###
删除非空目录，需要加上`/s`参数:
```cmd
rmdir /s myjavadoc
```
不过为了避免误操作，使用这个命令时,还需要我们输入`y`进行确认.
```
D:\学习9\疯狂Java讲义第三版光盘\codes\03\3.1>rmdir /s myjavadoc
myjavadoc, 是否确认(Y/N)? y
```
### 直接删除非空目录 ###
如果删除非空目录时，不想再确认，则可以加上`/q`参数：
```cmd
rmdir /q /s myjavadoc
```
这样就直接删除掉非空目录`myjavadoc`了。
当然如果`myjavadoc`目录时空目录的话加上参数也是能删掉的，但是空目录的话不加参数就可以删掉，加上参数反而画蛇添足。
