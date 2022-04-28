---
title: adb报错：‘error冒号 more than one device斜杠emulator’
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: 4f6d3c70
date: 2022-04-27 11:01:03
updated: 2022-04-27 11:01:03
---
# error: more than one device/emulator
这是因为电脑上连接了多个手机，使用`adb -s 手机设备ID`给adb命令指定要操作哪个手机即可。
<!-- more -->

## 问题描述
在执行`adb tcpip 5556`命令时，报错如下：
```
F:\Program Files\scrcpy-win64-v1.18>adb tcpip 5556
error: more than one device/emulator
```
这是因为电脑上连接了多个手机，adb命令不知道要监听哪个手机造成的。

## 使用'adb -s 设备id tcpip 5556'
这种情况，使用`-s 设备id`来指定要操作哪个手机即可。
### adb devices -l
输入`adb devices -l`命令，查看电脑上所有连接的手机：
```
F:\Program Files\scrcpy-win64-v1.18>adb devices -l
List of devices attached
75aed56d               device product:R9PlusmA model:OPPO_R9_Plusm_A device:R9PlusA transport_id:4
192.168.10.6:5555      device product:LLD-AL10 model:LLD_AL10 device:HWLLD-H transport_id:2

F:\Program Files\scrcpy-win64-v1.18>
```
可以看到要操作的第2个手机的设备ID为`75aed56d`

### adb -s 75aed56d tcpip 5556
使用``即可，如果没有报错，就说明运行成功：
```
F:\Program Files\scrcpy-win64-v1.18>adb -s 75aed56d tcpip 5556

F:\Program Files\scrcpy-win64-v1.18>
```
### 正常执行后续命令
```
F:\Program Files\scrcpy-win64-v1.18>adb connect 192.168.10.39:5556
connected to 192.168.10.39:5556

F:\Program Files\scrcpy-win64-v1.18>adb devices -l
List of devices attached
75aed56d               device product:R9PlusmA model:OPPO_R9_Plusm_A device:R9PlusA transport_id:4
192.168.10.39:5556     device product:R9PlusmA model:OPPO_R9_Plusm_A device:R9PlusA transport_id:5
192.168.10.6:5555      device product:LLD-AL10 model:LLD_AL10 device:HWLLD-H transport_id:2


F:\Program Files\scrcpy-win64-v1.18>
```
可以看到第2个手机也成功连接上了，此时就可以拔掉第2个手机的数据先，后面使用tcpip来操作手机即可。

# 参考资料
https://blog.51cto.com/u_15328720/3382916