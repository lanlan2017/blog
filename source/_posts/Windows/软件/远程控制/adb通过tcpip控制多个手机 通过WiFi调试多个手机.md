---
title: adb通过tcpip控制多个手机 通过WiFi调试多个手机
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: 15f3dec3
date: 2022-04-27 10:16:48
updated: 2022-04-27 10:17:04
---
# adb通过tcpip控制多个手机 通过WiFi调试多个手机
通过USB连接第1个手机，执行`adb tcpip 5555`设置在5555端口监听手机1，然后执行`adb connect 手机1的IP:5555`，就可以通过tcpip调试手机1。
通过USB连接第2个手机，执行`adb -s 手机2设备id tcpip 5556`设置在另一个端口5556监听手机2，然后执行`adb connect 手机2的IP:5556`，即可通过tcpip调试手机2。
<!-- more -->

# adb通过WiFi控制第1个手机
## adb tcpip 5555
使用usb连接到第1个手机到电脑上，打开手机的USB调试功能。然后进入adb命令所在的路径，输入`adb tcpip 5555`命令。即可开启USB调试。
```
F: && cd F:\Program Files\scrcpy-win64-v1.18 && adb tcpip 5555
```
## 获取手机的IP

如果你手机连接的WIFI是电脑开的热点的话，可以在电脑上看到手机的IP地址。
如果你手机连接的WIFI与电脑连接的WIFI是同一个的话，那么你需要登录路由器的后台地址，那里可以看到手机的IP地址。

![image-20220427102806164](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220427102806.png)

## adb connect 手机1的IP:5555
```
adb connect 192.168.10.6:5555
```
## 验证连接是否成功
输入`adb devices -l`命令：
```
F:\Program Files\scrcpy-win64-v1.18>adb devices -l
List of devices attached
U8ENW18117021408       device product:LLD-AL10 model:LLD_AL10 device:HWLLD-H transport_id:6
192.168.10.6:5555      device product:LLD-AL10 model:LLD_AL10 device:HWLLD-H transport_id:2
```
如果发现类似`192.168.10.6:5555`的设备ID，那么说明手机已经成功通过tcpip连接到电脑上了。
## 拔掉use数据线
成功通过tcpip连接之后，就可以拔掉USB数据线。
## 'adb -s 192.168.10.6:5555 命令'来控制手机1
使用`adb -s 192.168.10.6:5555 控制命令`即可控制该手机，例如在手机左侧向上滑动手机：
```cmd
adb -s 192.168.10.6:5555 shell input swipe 8 1650 8 700 300
```

# adb通过WiFi控制第2个手机
使用usb连接第2个手机到电脑上，打开手机的use调试功能。
## 获取手机2的设备ID
输入`adb devices -l`命令，查看连接到电脑的手机设备：
```
adb devices -l
```
运行结果如下：
```
F:\Program Files\scrcpy-win64-v1.18>adb devices -l
List of devices attached
75aed56d               device product:R9PlusmA model:OPPO_R9_Plusm_A device:R9PlusA transport_id:4
192.168.10.6:5555      device product:LLD-AL10 model:LLD_AL10 device:HWLLD-H transport_id:2
```
上面的`75aed56d`是第2个手机的设备ID。
## adb -s 手机2的设备id tcpip 5556
由于连接第1个手机时已经占用了5555端口，那么不可以再使用5555端口了。此时使用另一个端口接口，我这里设置为5556，你可以设置成其他。
### error: more than one device/emulator错误
需要注意的是，由于现在电脑上已经连接了两个手机，所以单纯的使用`adb tcpip 5556`命令将会出错，因为电脑不知道要控制的是哪个手机。
会报错`error: more than one device/emulator`，如下所示：
```
F:\Program Files\scrcpy-win64-v1.18>adb tcpip 5556
error: more than one device/emulator

F:\Program Files\scrcpy-win64-v1.18>
```

这种情况下，需要指定设备ID，也就是多加上`-s 手机2的设备id`参数：
```
F:\Program Files\scrcpy-win64-v1.18>adb -s 75aed56d tcpip 5556

F:\Program Files\scrcpy-win64-v1.18>
```
如果命令没有输出任何信息，则说明连接成功。

## adb connect 手机2的IP:5555
接下来使用adb connect命令连接即可：
```
F:\Program Files\scrcpy-win64-v1.18>adb connect 192.168.10.39:5556
connected to 192.168.10.39:5556

F:\Program Files\scrcpy-win64-v1.18>
```
## 查看连接效果
再次输入`adb devices -l`命令：
```
F:\Program Files\scrcpy-win64-v1.18>adb devices -l
List of devices attached
75aed56d               device product:R9PlusmA model:OPPO_R9_Plusm_A device:R9PlusA transport_id:4
192.168.10.39:5556     device product:R9PlusmA model:OPPO_R9_Plusm_A device:R9PlusA transport_id:5
192.168.10.6:5555      device product:LLD-AL10 model:LLD_AL10 device:HWLLD-H transport_id:2

F:\Program Files\scrcpy-win64-v1.18>
```
可以看到第2个手机已经成功通过tcpip连接到电脑上了。

## 使用'adb -s 手机2IP:5556 命令'控制手机2
此时就可以拔掉手机2的数据线，然后使用`adb -s 192.168.10.39:5556 控制命令`来控制手机2.

# 参考资料
https://blog.csdn.net/weixin_42522148/article/details/117303866