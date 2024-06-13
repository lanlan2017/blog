---
title: adb命令进入WiFi设置界面 adb命令打开手机WiFi列表
categories:
  - 编程
  - adb
abbrlink: 3997c01a
date: 2023-05-02 16:20:05
updated: 2023-05-02 16:20:05
---
# 获取手机WiFi界面的activity
进入设置，打开WiFi列表，然后在cmd中执行如下命令，来查询当前界面的activity：
```cmd
adb -s 75aed56d shell dumpsys window w |findstr \/ |findstr name=
```
在我手机上执行的结果如下：
```cmd
C:\Users\haha>adb -s 75aed56d shell dumpsys window w |findstr \/ |findstr name=
      mSurface=Surface(name=com.coloros.wirelesssettings/com.coloros.wirelesssettings.wifi.OppoWifiSettingsActivity)

C:\Users\haha>
```
name=后面的信息就是WiFi列表的activity：
`com.coloros.wirelesssettings/com.coloros.wirelesssettings.wifi.OppoWifiSettingsActivity`

## adb打开指定的activity
adb打开某个APP的指定activity的命令如下：
```cmd
adb shell am start -n 包名/activity名
```

# 使用adb命令进入WiFi的activity
所以，使用adb命令打开我这个OPPO手机的WiFi列表的命令如下：
```cmd
adb -s 75aed56d shell am start -n com.coloros.wirelesssettings/com.coloros.wirelesssettings.wifi.OppoWifiSettingsActivity
```
执行上述命令收我的手机成功切换到WiFi列表了，此时再手动选择要连接的WiFi即可。

## 其他手机上
我在我的荣耀手机上执行查询activity命令输出如下：

```cmd
C:\Users\haha>adb -s U8ENW18426004595 shell dumpsys window w |findstr \/ |findstr name=
       mAnimationIsEntrance=true      mSurface=Surface(name=StatusBar)/@0x50bafc7
      mSurface=Surface(name=com.android.settings/com.android.settings.Settings$WifiSettingsActivity)/@0xad1a806
      mSurface=Surface(name=com.android.systemui.HwImageWallpaper)/@0xaafb1de

C:\Users\haha>
```
这里的输出有点多，我们需要的activity是：

```cmd
com.android.settings/com.android.settings.Settings$WifiSettingsActivity
```

命令如下：

```cmd
adb -s U8ENW18426004595 shell am start -n com.android.settings/com.android.settings.Settings$WifiSettingsActivity
```
执行结果：
```cmd
C:\Users\haha>adb -s U8ENW18426004595 shell am start -n com.android.settings/com.android.settings.Settings$WifiSettingsActivity
Starting: Intent { cmp=com.android.settings/.Settings }

C:\Users\haha>
```
无法打开WiFi界面，屏幕闪了一下就回退到原来的界面。

## 解决方案
在start后面加上` -a android.intent.action.MAIN `选项即可：

```cmd
C:\Users\haha>adb -s U8ENW18426004595 shell am start -a android.intent.action.MAIN -n com.android.settings/.wifi.WifiSettings
Starting: Intent { act=android.intent.action.MAIN cmp=com.android.settings/.wifi.WifiSettings }

C:\Users\haha>
```

adb shell dumpsys window w | findstr mCurrent