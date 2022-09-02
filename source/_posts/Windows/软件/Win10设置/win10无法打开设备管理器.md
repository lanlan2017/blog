---
title: win10无法打开设备管理器
categories:
  - Windows
  - 软件
  - Win10设置
abbrlink: 9183f259
date: 2022-08-19 14:40:56
updated: 2022-08-19 14:40:56
---
# win10打开 设备管理器 被管理员阻止

## 使用devmgmt.msc命令打开设备管理器
以管理员身份执行devmgmt.msc命令，即可打开设备管理器。
<!-- more -->

## 以管理员权限打开 WindowsTerminal

### 在桌面创建WindowsTerminal的快捷方式
进入WindowsTerminal所在的目录：
```
C:\Users\用户名\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe
C:\Users\用户名\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe
```
然后在wt.exe上**右键**，选择**发送到桌面快捷方式**

### 给快捷方式赋予管理员权限

找到创建的wt.exe的快捷方式，在上门**右键**，选择**属性**，然后在**快捷方式**选项卡上，点击底部的**高级(D)...**按钮。

然后在弹出的**高级属性**对话框中，勾选，以**管理员身份运行(R)**。
这样，点击桌面上的wt.exe快捷方式，就可以以管理员身份运行WindowsTerminal了。

此时就可以通过`devmgmt.msc`命令打开设备管理器了。