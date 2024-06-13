---
title: adb点亮屏幕
categories:
  - 编程
  - adb
abbrlink: 458ceb33
date: 2023-11-11 16:55:28
updated: 2023-11-11 16:55:28
---
# adb shell input keyevent 26点亮屏幕
使用adb命令输入keyevent 26可以触发电源键事件：
```
adb shell input keyevent 26
```
如果手机屏幕是关闭的，这个命令将点亮手机屏幕。
如果手机的屏幕是亮的，执行这条命令将会关闭屏幕