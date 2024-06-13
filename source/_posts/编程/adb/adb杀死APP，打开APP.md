---
title: adb杀死APP，打开APP
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: 6c801463
date: 2023-03-28 12:05:23
updated: 2023-03-28 12:56:15
---
# 查找进程
## 查看所有进程
```cmd
adb shell ps
```
## 根据包名查找app对应的进程
```cmd
adb shell ps|findstr app的包名
```
如果存在多个设备，则在adb后面加上'-s 设备序列号'选项来选择设备
```cmd
adb -s 设备的序列号 shell ps|findstr app的包名
```
例如：在序列号为`75aed56d`的设备上查找包名为`com.xyz.reader`的进程
```cmd
adb -s 75aed56d shell ps|findstr com.xyz.reader
```
运行效果如下：
```cmd
C:\Users\WindowsUserName>adb -s 75aed56d shell ps|findstr com.xyz.reader
u0_a83    583   666   2232416 55824 ffffffff 00000000 S com.xyz.reader:channel
u0_a83    628   666   2714884 398728 ffffffff 00000000 S com.xyz.reader
```
# 杀死进程
## 杀死进程不清除数据
强制停止APP进程，不会清除APP进程在系统中产生的数据
```cmd
adb shell am force-stop app的包名
```
如果你电脑连接多个设备，则指明设备的序列号：
```cmd
adb [-s 设备序列号] shell am force-stop app的包名
```
例如：在序列号为`75aed56d`的设备上杀死包名为`com.xyz.reader`的进程：
```cmd
C:\Users\WindowsUserName>adb -s 75aed56d shell am force-stop com.xyz.reader

C:\Users\WindowsUserName>
```
执行该命令后没有输出，你可以在手机上看到对应进程已被杀死。

## 杀死进程名清除数据
停止APP进程，并且清除这个APP进程产生的所有数据，相当于reset
```cmd
adb shell pm clear 包名
```
执行该命令后输出success即表示命令执行成功，app进程被杀死，且会清楚所有数据，相当于卸载重装的效果，一般不建议使用。

# adb打开app
## 先杀死app
```cmd
adb -s 75aed56d shell am force-stop com.kmxs.reader
```
## 查找app的启动Activity
上面的命令在windows的cmd中运行即可，下面的命令有一些cmd是没有的，我这里是在git-bash中运行的。

打开**git-bash**，输入如下命令，然后打开手机上的APP。
```cmd
adb -s 75aed56d shell logcat | grep -i ActivityManager
```
app正常运行后，把上面这条命令的输出复制下来，放到文件中，然后在该文件中查找"包名/."

我这里查找的是`com.kmxs.reader/.`：
```bash
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ adb -s 75aed56d shell logcat | grep -i ActivityManager
I/ActivityManager( 1269): START u0 {act=com.coloros.recents.SHOW_RECENTS flg=0x10804000 cmp=com.coloros.recents/.RecentsActivity} from uid 1000 and from pid 32257 on display 0
V/ActivityManager( 1269): Display changed displayId=0
......
I/ActivityManager( 1269): topActivity.packageName = com.oppo.launcher
I/ActivityManager( 1269): START u0 {act=android.intent.action.MAIN cat=[android.intent.category.LAUNCHER] flg=0x10200000 cmp=com.kmxs.reader/com.km.app.home.view.LoadingActivity bnds=[36,378][288,672]} from uid 10044 and from pid 3825 on display 0
I/ActivityManager( 1269): START u0 {cmp=com.kmxs.reader/.home.ui.HomeActivity (has extras)} from uid 10083 and from pid 628 on display 0
W/ActivityManager( 1269): Unable to start service Intent { act=action.com.heytap.openid.OPEN_ID_SERVICE cmp=com.heytap.openid/.IdentifyService } U=0: not found

省略...
```
我这里查找到第一个匹配项是`com.kmxs.reader/.home.ui.HomeActivity`，看来这个就是启动这个APP的Activity。

再次杀死这个APP的进程：
```cmd
adb -s 75aed56d shell am force-stop com.kmxs.reader
```
然后在cmd中，输入如下命令，启动APP：
```cmd
adb -s 75aed56d shell am start -n com.kmxs.reader/.home.ui.HomeActivity
```
可以看到我手机上的APP成功启动。搞定。

# 参考资料
https://www.cnblogs.com/Dahlia/p/10456945.html
