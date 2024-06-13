---
title: adb获取Android手机上的apk到电脑
categories:
  - 编程
  - adb
abbrlink: fa55fbf8
date: 2023-05-11 14:22:04
updated: 2023-05-11 14:22:04
---
# adb获取Android手机上的apk到电脑

## 获取APP的包名
可以通过先在手机中启动相应的应用，使该应用位于前台。通过如下命令：
```cmd
adb shell dumpsys window | findstr mCurrentFocus
```
可以获取到当前的activity。

例如：

```
D:\只读>adb -s U8ENW18117021408 shell dumpsys window | findstr mCurrentFocus
  mCurrentFocus=Window{409f2b3 u0 com.playgame.havefun/com.bd.ad.v.game.center.MainActivity}

D:\只读>
```
这条命令的输出中斜杠`/`之前和倒数第1个空格之间的字符串`com.playgame.havefun`就是包名

## 根据包名查找APP在手机上的apk的路径
有了包名之后，通过如下命令来查询apk在Android设备上的路径：
```cmd
adb shell pm path 包名
```
例如：
```
D:\只读>adb -s U8ENW18117021408 shell pm path com.playgame.havefun
package:/data/app/com.playgame.havefun-p8wNMhz11x_BgqI5wH6d8A==/base.apk

D:\只读>
```
这条命令的输出结果中的`package:`后面的就是我们需要的apk的地址：`/data/app/com.playgame.havefun-p8wNMhz11x_BgqI5wH6d8A==/base.apk`。

## 从手机pull到电脑上
知道apk在Android上的地址之后，通过如下的命令即可把apk从Android拉取到电脑上：
```cmd
adb pull 手机上的apk路径 电脑上的路径
```
电脑上的路径可以是相对路径，如果是相对路径的话，则下载到当前目录下。在拉取的时候可以给apk取一个别名。

例如：
```
D:\只读>adb -s U8ENW18426004595 pull /data/app/com.ztgame.wzzt-4COnnGkt9XsPxhOhVnhu5Q==/base.apk 王者征途.apk
从lan 获取
/data/app/com.ztgame.wzzt-4COnnGkt9XsPxhOhVnhu5Q==/base.apk...ile pulled, 0 skipped. 30.4 MB/s (36797240 bytes in 1.153s)

D:\只读>
```
如果出现类似上面的输出，可以看到拉取成功了。

## 查看从Android获取到的apk
```
D:\只读>dir|findstr 王者征途.apk
2023.05.11  13:02        36,797,240 王者征途.apk

D:\只读>
```
可以看到我们已经成功从手机上获取到这个apk了。

# 参考资料
https://blog.csdn.net/u013379032/article/details/106663706