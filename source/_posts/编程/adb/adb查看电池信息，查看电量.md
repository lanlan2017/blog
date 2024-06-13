---
title: adb查看电池信息，查看电量
categories:
  - 编程
  - adb
abbrlink: 2b698a01
date: 2023-04-12 09:25:00
updated: 2023-04-12 09:25:00
---
# 获取手机电池信息

```cmd
adb shell dumpsys battery
```
不同的手机输出的结果可能不一样。

## adb -s 75aed56d shell dumpsys battery
下面是oppo手机的的输出结果：
```cmd
G:\dev2>adb -s 75aed56d shell dumpsys battery
Current OPPO Battery Service state:
  Charger voltage : 4576
  Battery current : 121
  Accessory present:false
  Accessory status: 0
  Accessory capacity: 0
  Chargetimeout: false
  Chargesocfall: false
  ChargerTechnology: 1
  ChargeFastCharger: false
  PlugType: 1
  UpdatesStopped: false
  LowBatteryVoltageWarningLevel: 3300
  HighBatteryVoltageWarningLevel: 4500
  LowChargerVoltageWarningLevel: 4400
  HighChargerVoltageWarningLevel: 40
  TomorrowLowBatteryWarningLevel: 40

Current Battery Service state:
  AC powered: true
  USB powered: false
  Wireless powered: false
  status: 5
  health: 2
  present: true
  level: 100
  scale: 100
  voltage: 3914
  temperature: 314
  technology: Li-ion

G:\dev2>
```
## adb -s U8ENW17C13004746 shell dumpsys battery
下面是荣耀手机的输出结果：
```cmd
G:\dev2>adb -s U8ENW17C13004746 shell dumpsys battery
Current Battery Service state:
  AC powered: false
  USB powered: true
  Wireless powered: false
  Max charging current: 900000
  Max charging voltage: 5000000
  Charge counter: 943000
  status: 2
  health: 2
  present: true
  level: 68
  scale: 100
  voltage: 3890
  temperature: 270
  technology: Li-poly

G:\dev2>
```
## adb -s U8ENW18119024027 shell dumpsys battery
下面是另一个荣耀手机的输出结果:
```cmd
G:\dev2>adb -s U8ENW18119024027 shell dumpsys battery
Current Battery Service state:
  AC powered: false
  USB powered: true
  Wireless powered: false
  Max charging current: 900000
  Max charging voltage: 5000000
  Charge counter: 1000
  status: 5
  health: 2
  present: true
  level: 100
  scale: 100
  voltage: 4371
  temperature: 240
  technology: Li-poly

G:\dev2>
```
我们主要看**Current Battery Service state:**之后的信息就行了。


## 命令分析
```cmd
AC powered: false       #是否使用充电器充电
USB powered: true       #是否使用USB充电
Wireless powered: false #是否无线充电
status: 1               #电池状态：2：充电状态 ，其他数字为非充电状态 2:正充电；3：没插充电器；4：不充电； 5：电池充满
health: 2               #电池健康状态：2:良好； 3:过热; 4:无用的； 5：超压； 7：温度过低
present: true           #电池是否安装在机身
level: 55               #电量: 百分比
scale: 100
voltage: 3977           #电池电压
current now: -335232    #电流值，负数表示正在充电
temperature: 335        #电池温度，单位是0.1摄氏度
technology: Li-poly     #电池种类=
```

## 切换电池为非充电状态
切换手机电池为非充电状态：

```cmd
adb shell dumpsys battery set status 1
```
这个命令执行之后我发现，电池的电量一直是100%，并且插上充电线之后，也没显示充电。手机重启后再充电就正常了。

## 设置电池为充电状态
```cmd
adb shell dumpsys battery set status 2
```
这个命令执行之后，我发现，手机一直处于充电状态。电池电量一直保持不变。拔掉数据线之后，手机还是显示在充电，充电指示灯也一直亮着。


## 复位，恢复实际状态
```cmd
adb shell dumpsys battery reset
```
## 获取整个设备的电量消耗信息
```cmd
adb shell dumpsys batterystats  | more
```
## 获取某个apk的电量消耗信息
```cmd
adb shell dumpsys batterystats  包名 | more
```

## 模拟断开充电（实际还在充电）



# 参考资料
https://www.cnblogs.com/guozhijiang/p/7092209.html

https://www.cnblogs.com/xiaobaibailongma/p/13284028.html

https://www.cnblogs.com/lialong1st/p/8297928.html

https://www.jianshu.com/p/9636d17907b7
