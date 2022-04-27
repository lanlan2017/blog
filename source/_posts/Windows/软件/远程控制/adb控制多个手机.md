---
title: adb控制多个手机
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: 9a1e9796
date: 2022-04-25 09:18:34
updated: 2022-04-25 09:18:34
---
# adb控制多个手机
如果直接将好几台不同的手机设备直接连接在电脑上，使用一般的 adb 便会不好使，因为电脑不知道我们操作哪一个手机，这时候，我们需要添加`-s 手机设备ID`参数来指定手机设备来执行操作。

<!-- more -->
## 使用"adb devices"获取到连接的设备ID
```cmd
C:\Users\18190>adb devices
adb server version (40) doesn't match this client (41); killing...
* daemon started successfully
List of devices attached
75aed56d        device
U8ENW18117021408        device
```
可以看到我电脑上现在又两个手机，一个设备id是`75aed56d`，另一个设备id是`U8ENW18117021408`。
## 使用"adb -s 设备ID 操作命令"控制指定的手机
使用`adb -s 75aed56d 命令`，即可操作第1个手机。如在第1个手机左侧向上滑动：
```cmd
@REM 上划屏幕左侧
@REM adb shell input swipe 8 1650 8 700 300
adb -s 75aed56d shell input swipe 8 1650 8 700 300
```

# 参考资料
https://www.jianshu.com/p/7d9c74998b85