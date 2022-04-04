---
title: 获取开热点的手机的ip地址
categories: 
  - 其他
  - 手机刷机
abbrlink: 7c085add
date: 2021-11-03 11:34:06
updated: 2022-04-04 15:13:22
---
# Android8.0之前开启热点的手机的iP地址
我的手机是Android8，当这个手机开启热点时，它的IP固定为：
```
192.168.43.1
```
# Android8.0之后开启热点的手机的IP地址
Android8.0之后开启热点的手机，被分配的ip不固定，需要动态获取。
可以安装终端模拟器app（例如：Termux）,然后输入`ip neigh`命令就可以看到手机自身热点下连接的设备的ip信息了

# 参考资料
https://haor233.com/hotspot-device-ip/
https://cloud.tencent.com/developer/article/1661980
