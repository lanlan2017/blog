---
title: vscode打开properties文件中文乱码解决
categories:
  - 编程
  - IDE
  - VSCode
abbrlink: 10a74dc5
date: 2024-06-23 11:24:53
updated: 2024-06-23 11:24:53
---
## 问题描述

新电脑上没有安装idea，我用vscode打开`.properties`文件的时候中文出现乱码：

```properties
com.taobao.live=\u70b9\u6dd8
```

## 解决方法

在vscode安装ASCII转换插件 Native-ASCII Converter ，然后在命令面板中执行相关的转换命令即可。修改之前，先把ASCII转换成中文，保存的时候再转换成ASCII即可。
