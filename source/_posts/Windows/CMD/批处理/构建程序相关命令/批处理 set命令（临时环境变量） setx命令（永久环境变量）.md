---
title: 批处理 set命令（临时环境变量） setx命令（永久环境变量）
categories: 
  - Windows
  - CMD
  - 批处理
  - 构建程序相关命令
abbrlink: 7c811d1c
date: 2019-02-01 16:31:16
updated: 2022-04-04 16:36:22
---
# set命令（临时环境变量） setx命令（永久环境变量）
set命令可设置当前cmd窗口的临时变量，
setx命令可以设置系统环境变量。
<!-- more -->
## set命令
set命令用于设置当前cmd窗口中的环境变量，只在当前cmd窗口有效，cmd窗口关闭后将会失效。而其不会影响到系统中保存的用户环境变量.
### 批处理输入信息 set /p
```cmd
SET /P variable=[promptString]
```
这个命令表示从键盘读入信息.
## setx命令
### setx设置永久用户环境变量
```cmd
setx env_name env_value
```
**注意**:有的路径中会带有空格,所以最好用双引号把变量和值都包裹起来,也就是写成如下形式:
```cmd
setx "env_name" "env_value"
```
例，追加一个路径到用户path环境变量中:
```cmd
setx "path" "D:\test;%path%"
```
### setx设置永久系统环境变量
setx加上`/m`参数表示设置的是系统的环境变量，格式如下所示:
```cmd
setx env_name env_value /m
```
**注意**:有的路径中会带有空格,所以最好用双引号把变量和值都包裹起来,也就是写成如下形式:
```cmd
setx "env_name" "env_value" /m
```
例如，设置当前路径`%cd%`到系统环境环境变量中:
```cmd
setx "Path" "%cd%;%path%" /m
```
**注意**:setx设置环境变量后，将在新打开的终端中生效，当前终端不会立即生效。
**注意**:setx可能会在环境变量中设置多个相同的值，例如，在当前cmd窗口中运行:
```cmd
setx "Path" "D:\test;%path%" /m
```
然后再重新打开cmd窗口,进入`D:\test`路径,然后再次运行:
```cmd
setx "Path" "D:\test;%path%" /m
```
这样`D:\test`将会在path环境变量中出现两次.

## 参考资料
[https://blog.csdn.net/fm0517/article/details/52450940](https://blog.csdn.net/fm0517/article/details/52450940)
