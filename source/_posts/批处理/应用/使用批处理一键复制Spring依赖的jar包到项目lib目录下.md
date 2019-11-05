---
title: 使用批处理一键复制Spring依赖的jar包到项目lib目录下
categories: 
  - 批处理
  - 应用
date: 2019-05-08 14:41:53
updated: 2019-11-04 17:02:02
abbrlink: cbe4b14b
---
- [前言](/blog/cbe4b14b/#前言)
- [目录结构](/blog/cbe4b14b/#目录结构)
    - [一键复制Spring依赖到项目lib目录下.bat](/blog/cbe4b14b/#一键复制Spring依赖到项目lib目录下-bat)
        - [命令解释](/blog/cbe4b14b/#命令解释)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 前言 #
在Java Web项目中,我们想要使用Spring,需要把Spring的jar包复制粘贴到项目的WEB-INF/lib目录下,如果创建多个项目,每次这样复制其实很麻烦,下面介绍使用批处理来批量复制Spring依赖的jar包到Web项目的WEB-INF/lib目录下:
# 目录结构 #
首先需要下载Spring的压缩包:`spring-framework-5.1.6.RELEASE-dist.zip`,以及`commons-logging-1.2`的压缩包:`commons-logging-1.2-bin.zip`.然后把两个压缩文件解压到当前目录.
```
G:\Desktop\书籍\JavaEE\jar
├─commons-logging-1.2\
├─spring-framework-5.1.6.RELEASE\
├─commons-logging-1.2-bin.zip
├─spring-framework-5.1.6.RELEASE-dist.zip
└─一键复制Spring依赖到项目lib目录下.bat
```
接下来使用下面的批处理文件即可快速的把所需要的jar文件,复制到Web项目中:
## 一键复制Spring依赖到项目lib目录下.bat ##
```cmd
@echo off
echo ----------------------复制Spring的jar包到项目lib目录下--------------------------------
::进入当前盘符
%~d0
::进入当前文件所在目录
cd %~dp0
::进入spring的libs目录下
cd spring-framework-5.1.6.RELEASE\libs
echo     当前工作目录:%cd%
::输入目标目录的路径
set /p target=输入lib目录的路径:
echo.
echo     将会把所需要的jar包复制到"%target%"这个目录下
::复制spring的jar文件到你的项目的lib目录下
:: /d参数表示不覆盖已有的文件
xcopy *.RELEASE.jar %target% /d
echo ----------------------复制Spring的jar包到项目lib目录下--------------------------------
echo ----------------------复制commons-logging-1.2的jar包到项目lib目录下-------------------
cd ..\..\commons-logging-1.2
echo     当前工作目录:%cd%
::复制commons-logging-1.2.jar到你输入的lib目录下
:: /d参数表示不覆盖已有的文件
xcopy commons-logging-1.2.jar %target% /d
echo ----------------------复制commons-logging-1.2的jar包到项目lib目录下-------------------
pause
```
### 命令解释 ###
`%~d0`:`%0`这个是命令行参数,表示当前批处理文件本身,`%~d0`表示当前批处理文件所在的盘符.直接写上这个命令标识进入当前批处理文件所在的盘符。
`cd %~dp0`:`%~dp0`标识当前批处理文件所在的目录,所以`cd %~dp0`表示进入当前批处理文件所在的目录.
`xcopy *.RELEASE.jar %target% /d`,`xcopy`可以用来复制文件或者目录,`xcopy *.RELEASE.jar`表示复制`Spring`需要的所有`jar`文件,`xcopy`的`/d`参数表示不覆盖目标目录中已经存在的同名文件.

>原文链接: [使用批处理一键复制Spring依赖的jar包到项目lib目录下](https://lanlan2017.github.io/blog/cbe4b14b/)
