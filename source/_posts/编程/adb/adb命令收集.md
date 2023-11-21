---
title: adb命令收集
categories:
  - 编程
  - adb
abbrlink: d712b3a7
date: 2023-09-05 15:58:59
updated: 2023-09-05 15:58:59
---
# adb命令收集

获取内部版本号
```
adb shell getprop ro.build.display.innerver
```

获取按键值
```
adb shell getevent
```

获取apk信息
adb shell dumpsys package 包名 ->info.txt
获取应用包名
adb shell dumpsys window windows | grep mFocusedApp  
或者 
adb shell dumpsys window windows | findstr mFocusedApp

## 打开WiFi设置界面
```
adb shell am start -a android.intent.action.MAIN -n com.android.settings/.wifi.WifiSettings
```
打开热点设置界面
```
adb shell am start -n com.android.settings/.TetherSettings
```
查询蓝牙是否开启
```
adb shell settings get global bluetooth_on
```
返回结果0代表关闭，1代表开启
```
adb shell dumpsys bluetooth_manager | findstr enabled
```
返回结果是true或者false，说明开启或关闭

查询WiFi是否开启
```
adb shell settings get global wifi_on
```
返回结果0代表关闭，1代表开启 
查询蓝牙地址
adb shell settings get secure bluetooth_address
查询WiFi地址
adb shell cat /sys/class/net/wlan0/address
开启WiFi
```
adb shell svc wifi enable
```
关闭WiFi
```
adb shell svc wifi disable
```
打开蓝牙设置界面
adb shell am start -a android.settings.BLUETOOTH_SETTINGS
获取手机休眠时间
adb shell settings get system screen_off_timeout
更改手机休眠时间
adb shell settings put system screen_off_timeout 600000（10分钟）
获取系统默认输入法
adb shell settings get secure default_input_method
获取手机是否为自动亮度
adb shell settings get system screen_brightness_mode  （0代表非自动，1代表为自动）
设置手机为自动调整亮度
adb shell settings put system screen_brightness_mode 1    
获取手机当前亮度
adb shell settings get system screen_brightness
设置手机亮度（0-255）
adb shell settings put system screen_brightness 350

## 定位操作
### 打开定位设置界面
得先打开设置APP，然后再执行下面的命令：
```
adb shell am start -a android.settings.LOCATION_SOURCE_SETTINGS
```

开启定位
```
adb shell settings put secure location_providers_allowed +gps
```
关闭定位
```
adb shell settings put secure location_providers_allowed -gps
```
查看定位方式
adb shell settings get secure location_providers_allowed  （前提是位置信息开启）
拨打电话
adb shell am start -a android.intent.action.CALL tel:8888888888888

发送短信
adb shell am start -a android.intent.action.SENDTO -d sms:10086（发送目的号码） --es sms_body "hello"（短信内容） --ez exit_on_sent true 

获取应用包名
adb shell dumpsys window windows | findstr  mFocusedApp

清除应用数据与缓存: 
adb shell pm clear cn.com.test.mobile
启动应用: 
adb shell am start -n cn.com.test.mobile/.ui.SplashActivity 
停止应用
adb shell am force-stop cn.com.test.mobile
飞行模式
adb shell settings set global airplane_mode_on
(0==关闭，1==开启)
开启飞行模式
adb shell settings put global airplane_mode_on 1

手机震动测试（前提手机root）
adb shell echo '3000'>/sys/devices/virtual/timed_output/vibrator/enable

## 滑动点击

向上滑
adb shell input touchscreen swipe 930 880 930 380 
向下滑
adb shell input touchscreen swipe 930 380 930 880
向右滑
adb shell input touchscreen swipe 330 880 930 880 
向左滑
adb shell input touchscreen swipe 930 880 330 880
模拟鼠标点击操作
adb shell input mouse tap 100 500
长按
adb shell input swipe startX startY startX startY 500
滑动解锁
adb shell input swipe 300 1000 300 500
冷启动app
adb shell am start -W -n package/activity
热启动
①停止app
adb shell input keyevent 3  ②adb shell am start -W -n package/activity
查看内存占用情况
adb -s 设备号 shell top -m 进程数量 -n 数据的刷新次数 -s 按哪列进行排序 -d 刷新时间间隔（默认5秒）

切换手机电池为非充电状态
adb shell dumpsys battery set status 1
改变手机电量
adb shell dumpsys battery set level 58

获取当前电量
adb shell cat /sys/class/power_supply/battery/capacity

手机截屏

adb shell /system/bin/screencap -p /sdcard/screenshot.png

录制屏幕
adb shell screenrecord --time-limit 10 /sdcard/demo.mp4

## 获取手机型号

```
adb shell getprop ro.product.model
```

获取电池信息
adb shell dumpsys battery  
获取屏幕分辨率
adb shell wm size
获取屏幕密度
adb shell wm density
显示屏参数
adb shell dumpsys window displays
获取手机IP地址
adb shell ifconfig | findstr Mask
查看WiFi局域网地址
adb shell ifconfig wlan0
显示区域位置
adb shell wm overscan 0,0,0,200  （四个数字分别表示距离左、上、右、下边缘的留白像素，以上命令表示将屏幕底部 200px 留白）
恢复原显示区域命令
adb shell wm overscan reset

获取USB调试模式
adb shell settings get global adb_enabled
关闭USB调试模式
adb shell settings put global adb_enabled 0

状态栏和导航栏的显示隐藏
adb shell settings put global policy_control key-values
key-values 可由如下几种键及其对应的值组成，格式为 key1=value1:key2=value2。
  immersive.full----------同时隐藏
  immersive.status----------隐藏状态栏
  immersive.navigation----------隐藏导航栏
  immersive.preconfirms----------?
这些键对应的值可则如下值用逗号组合：
  apps----------所有应用
  *----------所有界面
  packagename----------指定应用
 -packagename----------排除指定应用
例如：
adb shell settings put global policy_control immersive.full=*
表示设置在所有界面下都同时隐藏状态栏和导航栏。
adb shell settings put global policy_control immersive.status=com.package1,com.package2:immersive.navigation=apps,-com.package3
表示设置在包名为 com.package1 和 com.package2 的应用里隐藏状态栏，在除了包名为 com.package3 的所有应用里隐藏导航栏。


打开网页： adb shell am start -a android.intent.action.VIEW -d http://www.baidu.com

查看通信日志 ：
adb logcat -b radio (常用于查看详细的通话状态)
获取界面控件：
adb uiautomator dump
列出输入法：
adb shell ime list -s

永不休眠：
adb shell settings put system screen_off_timeout 2147483647

关闭\打开自动旋转：
adb shell settings put system accelerometer_rotation 0\1



# 参考资料
https://blog.csdn.net/qq_28170363/article/details/108695746
