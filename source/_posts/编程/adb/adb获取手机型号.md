---
title: adb获取手机型号
categories:
  - 编程
  - adb
abbrlink: 3c05c2ec
date: 2023-09-13 15:17:34
updated: 2023-09-13 15:17:34
---
## 获取系统版本
```
adb shell getprop ro.build.version.release
```
## 获取系统api版本
```
adb shell getprop ro.build.version.sdk
```

## 获取手机系统版本
```
adb shell getprop ro.build.version.release
```
## 获取手机设备型号
```
adb shell getprop ro.product.model
```
## 获取手机厂商名称
```
adb shell getprop ro.product.brand
```
## 获取手机序列号
```
adb get-serialno
```
```
adb shell getprop ro.serialno
```


## 参考资料
https://blog.csdn.net/l_vaule/article/details/79866396