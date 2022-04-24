---
title: vscode打开指定目录
categories: 
  - 编程
  - IDE
  - VSCode
abbrlink: 12ffeda4
date: 2022-04-23 17:16:05
updated: 2022-04-23 17:17:08
---
# vscode打开目录
本文将介绍如何在命令行中，如何在资源管理器中使用vscode打开指定目录，以及如何使用快捷方式来调用vscode开的指定目录。
<!-- more -->
## 在命令行 终端 cmd中使用vscode打开指定目录
在cmd，终端等命令行界面中，只需要输入code.exe 目录地址即可使用vscode打开该目录。

使用相对路径，使用绝对路径，都可以。

![image-20220423172412018](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220423172420.png)

![image-20220423172429975](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220423172430.png)

打开效果：

![image-20220423172458970](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220423172459.png)

## 在资源管理器中右键打开目录

在windows资源管理器中，可以进入到搞目录中，然后在空白处，按下右键。选择`通过Code打开`即可使用vscode打开该目录。

![image-20220423172801904](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220423172801.png)

## 使用快捷方式调用vscode打开指定目录

上面两种方式可以用来打开不常用的目录，如果一个目录经常需要使用到。可以通过设置快捷方式来快速打开。

在桌面创建一个快捷方式，然后在该快捷方式上面，点击右键，选择属性，选择快捷方式选项卡，在目标(T):文本框中输入vscode的安装路径+空格+目录的绝对路径。
然后点击这个快捷方式，即可使用vscode快速打开这个目录。

```
"G:\Program Files\Microsoft VS Code\Code.exe" G:\Blog\blogRoot\source\todo
```

![image-20220423173157284](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220423173157.png)

