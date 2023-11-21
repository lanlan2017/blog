---
title: adb禁止USB充电adb允许USB充电
categories: 
  - 编程
  - adb
abbrlink: e0ddc9c1
date: 2023-08-22 20:10:58
updated: 2023-08-23 20:07:22
---
# 前言
为了避免 Android 手机在连接 USB 进行自动化测试时充电过度导致电池鼓包的问题，可以通过以下步骤实现禁止充电若干小时后自动充电的功能。

# adb禁止Android手机使用USB充电

```
adb shell dumpsys battery set usb 0
```

# adb允许手机USB充电
```
adb shell dumpsys battery set usb 1
```

# 示例
当前手机 设置 电池的信息如下：
![图1](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2023/08/20230822201723.png)

从图中可以看到，电池电量百分数的百分号后面有“正在充电”四个字，这说明当前手机正在充电。下面还有一行字显示还需要多少时间电池能充满
执行下面的命令：
```
adb shell dumpsys battery set usb 0
```
禁止USB充电后，电池信息如下：
![图2](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2023/08/20230822202048.png)
从图中可以看到，电量百分号后面的“正在充电”的提示信息消失了。电量下面的一行字变成我们可以使用多少分钟。



# 其他
adb获取电池信息
```
adb shell dumpsys battery
```
adb获取电池电量
```
adb shell dumpsys battery | findstr level
```
## adb恢复电池默认设置 adb电池复位

```
adb shell dumpsys battery reset
```