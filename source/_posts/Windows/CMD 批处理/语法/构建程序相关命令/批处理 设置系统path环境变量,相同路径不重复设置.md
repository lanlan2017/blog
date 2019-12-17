---
title: 批处理 设置系统path环境变量,相同路径不重复设置
categories: 
  - Windows
  - CMD 批处理
  - 语法
  - 构建程序相关命令
date: 2019-02-03 18:14:35
updated: 2019-12-17 05:17:09
abbrlink: e6156b85
---
<div id='my_toc'><a href="/blog/e6156b85/#问题描述" class="header_2">问题描述</a><br><a href="/blog/e6156b85/#遇到的问题" class="header_2">遇到的问题</a><br><a href="/blog/e6156b85/#实现1-使用find命令" class="header_2">实现1 使用find命令</a><br><a href="/blog/e6156b85/#获取当前文件所在的目录" class="header_3">获取当前文件所在的目录</a><br><a href="/blog/e6156b85/#在path环境变量中查找当前目录路径" class="header_3">在path环境变量中查找当前目录路径</a><br><a href="/blog/e6156b85/#根据查找结果处理" class="header_3">根据查找结果处理</a><br><a href="/blog/e6156b85/#添加当前目录路径到path系统环境变量中-不重复添加" class="header_3">添加当前目录路径到path系统环境变量中 不重复添加</a><br><a href="/blog/e6156b85/#实现2-使用for命令" class="header_2">实现2 使用for命令</a><br><a href="/blog/e6156b85/#批处理-for命令-增加-一个系统path环境变量" class="header_3">批处理 for命令 增加 一个系统path环境变量</a><br><a href="/blog/e6156b85/#拓展" class="header_2">拓展</a><br><a href="/blog/e6156b85/#批处理-for命令-遍历-系统path环境变量" class="header_3">批处理 for命令 遍历 系统path环境变量</a><br><a href="/blog/e6156b85/#批处理-for命令-查找-一个系统path环境变量" class="header_3">批处理 for命令 查找 一个系统path环境变量</a><br><a href="/blog/e6156b85/#批处理-for命令-删除-一个系统path环境变量" class="header_3">批处理 for命令 删除 一个系统path环境变量</a><br><a href="/blog/e6156b85/#参考资料" class="header_2">参考资料</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 问题描述 ##
我想点击运行一个批处理文件(install.bat)，然后把该文件所在的目录配置到path系统环境变量中。
这种功能我用在软件安装程序中,为自己的软件自动搭建好需要的环境。
## 遇到的问题 ##
追加一个路径到永久的path系统环境变量中，可以通过`setx /m "path" "%newpath%;%path%"`命令来实现，但是我可能运行多次`intall.bat`，这样就会造成intall.bat会`写入多个相同的路径到path环境变量中`。要解决这个问题，就需要在追加新路径到path环境变量之前，先检查path环境变量中是否已经存在了该路径，如果有了该路径，那我就不需要再添加。如果没有我再添加。不能一直无脑的添加。
## 实现1 使用find命令 ##
### 获取当前文件所在的目录 ###
批处理中`%0`变量表示当前的批处理文件，`%~dp0`则表示当前文件的绝对路径.
```bat
::获取当前文件所在的目录的绝对路径
set "thispath=%~dp0"
::删除之后的路径分隔符号“\”
set "thispath=%thispath:~0,-1%"
echo 当前文件所在目录路径:%thispath%
```
### 在path环境变量中查找当前目录路径 ###
这里使用find命令来实现查找，但是find命令好像只能在文件中查找字符串，不能再字符串中查找子串，所以我们要先把path环境变量先写到一个临时文件中，然后再在临时文件中查找。
```bat
::读取path环境变量到自定义变量中
set mypath=%path%
::把path环境变量写入临时文件中,以备后续使用findstr命令进行查找
echo %mypath% > temp.txt
::在临时文件中查找有没有当前路径
find "%thispath%" temp.txt
```
### 根据查找结果处理 ###
批处理命令都有程序返回码`errorlevel`，对于find命令，如果在文件中查找到则返回`0`，如果没有找到则返回`1`，返回的结果就保存在程序返回码`errorlevel`中。所以我们可以根据程序返回码来做响应的条件处理:
```bat
if %errorlevel% == 0 (
    echo path环境变量中 已经包含了 当前路径%thispath%
    echo 程序返回码:%errorlevel%
) else (
    echo path环境变量中 没有包含   当前路径%thispath%
    echo 程序返回码:%errorlevel%
    ::追加当前文件所在目录的路径到path环境变量中
    setx /m "path" "%thispath%;%path%"
)    
```
设置好环境变量后，删除临时文件即可,完整的代码如下:
### 添加当前目录路径到path系统环境变量中 不重复添加 ###
install.bat:
```bat
@echo off
::获取当前文件所在的目录的绝对路径
set "thispath=%~dp0"
::删除之后的路径分隔符号“\”
set "thispath=%thispath:~0,-1%"
echo 当前文件所在的目录的绝对路径:%thispath%
::读取path环境变量到自定义变量中
set mypath=%path%
::把path环境变量写入临时文件中,以备后续使用findstr命令进行查找
echo %mypath% > temp.txt
::在临时文件中查找有没有当前路径
find "%thispath%" temp.txt
::如果查找到则fin命令返回0,如果没有找到find命令返回1
if %errorlevel% == 0 (
    echo path环境变量中 已经包含了 当前路径%thispath%
    echo 程序返回码:%errorlevel%
) else (
    echo path环境变量中 没有包含   当前路径%thispath%
    echo 程序返回码:%errorlevel%
    ::追加当前文件所在目录的路径到path环境变量中
    setx /m "path" "%thispath%;%path%"
)    
::删除临时文件
del temp.txt
pause
```
还有要注意的是`setx /m "path" "%thispath%;%path%"`命令需要管理员权限,所以要以管理员身份运行该批处理脚本。
## 实现2 使用for命令 ##
### 批处理 for命令 增加 一个系统path环境变量 ###
```bat
@echo off
setlocal enabledelayedexpansion 
set remain=%path%
::待查找字符串
set toAdd=D:\dev\workspace\MarkdownTools
::标记,默认没有重复
set finded=false
:loop
for /f "tokens=1* delims=;" %%a in ("%remain%") do (
    ::如果找到相同的了
    if "%toAdd%"=="%%a" (
        ::直接退出
        goto :isFinded
        ::该表标记,true表示有重复的了
        set finded=true
    )
    rem 将截取剩下的部分赋给变量remain，其实这里可以使用延迟变量开关
    set remain=%%b
)
::如果还有剩余,则继续分割
if defined remain goto :loop
::如果没有重复:
if "%finded%"=="false" (
    echo 正在修改系统path环境变量...
    setx /m "path" "%toAdd%;%path%"
    ::结束程序
    goto :end
)
:isFinded
echo path环境变量中已经有了该环境变量,无须重复添加.
:end
pause
```
## 拓展 ##
### 批处理 for命令 遍历 系统path环境变量 ###
```bat
@echo off
setlocal enabledelayedexpansion 
set remain=%path%
:loop
for /f "tokens=1* delims=;" %%a in ("%remain%") do (
    echo %%a
    ::剩下的赋值给原来的副本,以备下次分段
    set remain=%%b
)
::如果还有剩余,则继续分割
if defined remain goto :loop
pause
```
运行结果:
```
D:\dev\workspace\MarkdownTools
D:\dev\workspace\HexoTools\runable
D:\dev\workspace\BaiduTranslatorPronunciationGenerator\runable
C:\Windows
C:\windows\system32
C:\Windows\System32\Wbem
C:\Windows\System32\WindowsPowerShell\v1.0\
C:\Windows\System32\OpenSSH\
D:\快捷方式
D:\dev\java\jdk1.8.0_91\bin
F:\Program Files\nodejs\node_global
F:\Program Files\nodejs\
F:\Program Files\Git\bin
D:\dev\apache-maven-3.5.4\bin
C:\Program Files\Microsoft VS Code\bin
D:\MinGW\bin
D:\dev\apache-tomcat-8.5.35\bin
D:\dev\java\my\runable\openwith
D:\GitHub\latex
F:\texlive\2018\texlive\2018\bin\win32
D:\GitHub\MD
请按任意键继续. . .
```
### 批处理 for命令 查找 一个系统path环境变量 ###
```bats
@echo off
setlocal enabledelayedexpansion 
set remain=%path%
echo %remain%
echo.
::待查找字符串
set toFind=D:\dev\workspace\MarkdownTools
:loop
for /f "tokens=1* delims=;" %%a in ("%remain%") do (
    if "%toFind%"=="%%a" (echo 找到:%%a)
    rem 将截取剩下的部分赋给变量remain，其实这里可以使用延迟变量开关
    set remain=%%b
)
::如果还有剩余,则继续分割
if defined remain goto :loop

pause
```
运行结果:
```
D:\dev\workspace\MarkdownTools;D:\dev\workspace\HexoTools\runable;D:\dev\workspace\BaiduTranslatorPronunciationGenerator\runable;C:\Windows;C:\windows\sy
stem32;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;D:\快捷方式;D:\dev\java\jdk1.8.0_91\bin;F:\Progr
am Files\nodejs\node_global;F:\Program Files\nodejs\;F:\Program Files\Git\bin;D:\dev\apache-maven-3.5.4\bin;C:\Program Files\Microsoft VS Code\bin;D:\Min
GW\bin;D:\dev\apache-tomcat-8.5.35\bin;D:\dev\java\my\runable\openwith;D:\GitHub\latex;F:\texlive\2018\texlive\2018\bin\win32;D:\GitHub\MD;

找到:D:\dev\workspace\MarkdownTools
请按任意键继续. . .
```

### 批处理 for命令 删除 一个系统path环境变量 ###
```bat
@echo off
setlocal enabledelayedexpansion 
set remain=%path%
::待删除字符串
set toDel=D:\dev\workspace\MarkdownTools
:loop
for /f "tokens=1* delims=;" %%a in ("%remain%") do (
    if not "%toDel%"=="%%a" (
        ::如果mypath没有定义的话就直接赋值,赋值之后就只需要追加
        if not defined mypath ( set mypath=%%a) else (set mypath=%mypath%;%%a)
    )
    rem 将截取剩下的部分赋给变量remain，其实这里可以使用延迟变量开关
    set remain=%%b
)
::如果还有剩余,则继续分割
if defined remain goto :loop
echo 删除之前的path环境变量
echo     %path%
echo.
echo 删除之后的path环境变量
echo     %mypath%
echo 正在修改系统path环境变量...
setx /m "path" "%mypath%"
echo 修改完毕...
pause
```
## 参考资料 ##
[Bat 处理字符串分割 （split功能）](http://blog.51cto.com/langlichong/1851961)
