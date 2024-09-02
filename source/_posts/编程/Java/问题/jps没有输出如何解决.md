---
title: jps没有输出如何解决
categories:
  - 编程
  - Java
  - 问题
abbrlink: 374f3015
date: 2024-08-14 09:50:09
updated: 2024-08-14 09:50:09
---
## 问题描述、

今天我的一台电脑坏掉了，重装系统，重装Java后，我的Java程序有部分功能更失效。我检查了一席，是jps命令没有输出造成的。

我以为是Java没有安装好，我卸载后，重新安装，还是有这个问题。

## 解决方案

给目录：`C:\Users\用户名\AppData\Local\Temp\hsperfdata_用户名`设置完全控制权限：

在**hsperfdata_用户名**目录上右键，然后点击**安全**选项卡，然后点击**编辑**按钮，

然后选择EveryOne这个用户，勾选下面的完全控制权限，然后点击应用即可。

## 参考资料

<https://blog.csdn.net/DDelphine/article/details/77119836>
<https://blog.csdn.net/lingyiwin/article/details/123238600>