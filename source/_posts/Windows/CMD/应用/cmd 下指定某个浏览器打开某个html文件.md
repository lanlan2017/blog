---
title: cmd 下指定某个浏览器打开某个html文件
categories: 
  - Windows
  - CMD
  - 应用
abbrlink: ce34466e
date: 2019-01-31 18:29:25
updated: 2022-04-04 16:31:54
---
# 使用Chrome浏览器打开指定html文件
例如，我想使用chrome打开当前路径下的`index.html`文件,可以输入如下命令:
```cmd
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" index.html
```
命令解释:
- `"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"`这个是谷歌浏览器(chrome)的绝对路径,因为路径中间有空格,最好用括号包裹起来。
- `index.html`这个是html文件的相对路径。

# 创建批处理脚本chrome.bat来打开html文件
创建`chrome.bat`文件,在其中写入:
```cmd
@echo off
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %1
```
命令解释:
- `@echo off`不显示正在运行的命令。
- `"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"`谷歌浏览器路径，以你的为准
- `%1`这个表示第一个命令行参数,也就是文件名
然后现在只需要输入`chrome.bat index.html`就可以完成上述功能了,甚至`.bat`也可以省略,只需要输入`chrome index.html`即可。
# chrome.bat配置到path环境变量中
为了在所有的目录下都可以使用chrome.bat来打来html文件,还需要把`chrome.bat`的绝对路径配置到path环境变量中。
