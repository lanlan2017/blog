---
title: 正则应用：匹配Windows路径
categories: 
  - 正则表达式
  - 实例
abbrlink: 93d942f1
date: 2018-10-23 16:02:37
updated: 2022-04-04 16:20:34
---
# 问题描述
下面的文本中有好多路径如:`D:\dev\workspace\HexoTools`，我想用markdown`代码段标记`出来。
```
### 文件位置
- java工程位置：D:\dev\workspace\HexoTools
- java源码位置：D:\dev\workspace\HexoTools\src\front\matter\tools\HexoFrontMatter.java
- jar包文件位置：D:\dev\java\my\runable\HexoTools\FrontMatter\HexoFrontMatter.jar
- bat文件位置：D:\dev\java\my\runable\HexoTools\FrontMatter\HexoFrontMatter.bat
- 快捷方式位置：D:\快捷方式\HexoFrontMatter.lnk
```

也就是替换为：
```
### 文件位置
- java工程位置：`D:\dev\workspace\HexoTools`
- java源码位置：`D:\dev\workspace\HexoTools\src\front\matter\tools\HexoFrontMatter.java`
- jar包文件位置：`D:\dev\java\my\runable\HexoTools\FrontMatter\HexoFrontMatter.jar`
- bat文件位置：`D:\dev\java\my\runable\HexoTools\FrontMatter\HexoFrontMatter.bat`
- 快捷方式位置：`D:\快捷方式\HexoFrontMatter.lnk`
```

# 应用正则
这里使用的编辑器是：editplus，打开这篇文章，按下ctrl+h,打开查找替换，使用下面的正则表达式
查找正则:
```
(\w:(?:\\.+)+)
```
替换正则：
```
`$1`
```
这个匹配的不是很正确，使用的时候我还不敢点全部替换，我对正则表达式的掌握还不够,还得继续去学。
