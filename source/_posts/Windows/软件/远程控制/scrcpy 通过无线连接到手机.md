---
title: scrcpy 通过无线连接到手机
categories: 
  - Windows
  - 软件
  - 远程控制
abbrlink: 7ce83934
date: 2021-07-29 09:07:02
updated: 2022-04-04 00:51:44
---
# 前言
之前我一直使用的数据线来连接手机的，有线的优点是速度快。
但是这几天我使用数据线遇到了麻烦，连接有时候好，有时候又断开，可能是usb接口接触不良吧。

所以我打算改用无线连接。
# 步骤
## 用数据线连接手机
## adb tcpip 端口号
例如:
```
adb tcpip 65000
```
运行成功效果：
```
F:\Program Files\scrcpy-win64-v1.17>adb tcpip 65000
restarting in TCP mode port: 65000

F:\Program Files\scrcpy-win64-v1.17>
```
## adb connect 手机IP地址:端口号

### 获取手机的IP地址

#### 电脑开热点，手机连接到电脑的热点

这种情况下可以在电脑上的**设置**，**移动热点**页面看到已经连接到电脑热点的手机的IP地址，如下图所示：

![image-20210729091633391](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210729091633.png)

得到手机的IP地址（192.168.137.190）之后，和上面设置的端口号（65000）组合到一起即可得到手机的地址：

```
192.168.137.190:65000
```
### 连接到手机
```
F:\Program Files\scrcpy-win64-v1.17>adb connect 192.168.137.190:65000
connected to 192.168.137.190:65000

F:\Program Files\scrcpy-win64-v1.17>
```
## 断开数据线 连接手机

### 使用scrcpy.exe连接手机
直接输入命令
```
scrcpy.exe
```
即可连接到手机:
```
F:\Program Files\scrcpy-win64-v1.17>scrcpy.exe
INFO: scrcpy 1.17 <https://github.com/Genymobile/scrcpy>
F:\Program Files\scrcpy-win64-v1.17\scrcpy-server: 1 file pushed, 0 skipped. 3.0 MB/s (34930 bytes in 0.011s)
adb.exe: error: more than one device/emulator
ERROR: "adb reverse" returned with value 1
WARN: 'adb reverse' failed, fallback to 'adb forward'
27183
[server] INFO: Device: HUAWEI XYZ-xyz (Android 8.0.0)
INFO: Renderer: direct3d
INFO: Initial texture: 1080x2160
libpng warning: iCCP: cHRM chunk does not match sRGB

```

![image-20210729093457108](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210729093457.png)

### 使用ScrcpyGui连接手机

使用ScrcpyGui，可以很方便打开手机镜像，关闭手机镜像，设置手机镜像。



如果你不小心关掉了手机投屏，可以在GUI界面中重新打开，不用再输入命令

也可以在GUI里设置打开手机镜像的时候，关闭手机的屏幕。

![image-20210729093252198](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210729093252.png)


# 参考资料
https://www.jianshu.com/p/2d7c06daf655
https://zhuanlan.zhihu.com/p/80264357
https://www.itgeeker.net/scrcpy-how-to-connect-with-andorid-phone-via-usb-and-wifi/
