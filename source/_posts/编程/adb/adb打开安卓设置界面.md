---
title: adb打开安卓设置界面
categories:
  - 编程
  - adb
abbrlink: 33d3ede7
date: 2023-10-16 16:05:24
updated: 2023-10-16 16:05:24
---
# adb打开安卓设置界面
```
adb shell am start -n com.android.settings/.Settings
```
如果不能打开，则可能是手机厂商重写了设置界面。

# 打开华为手机设置界面，打开EMUI设置界面

例如我的华为手机(EMUI9.0)的设置界面的activity是：`com.android.settings/.HWSettings`

```
adb shell am start -n com.android.settings/.HWSettings
```
# OPPO手机打开设置界面
```
adb shell am start -n com.android.settings/com.oppo.settings.SettingsActivity
```