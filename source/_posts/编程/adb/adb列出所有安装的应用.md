---
title: adb列出所有安装的应用
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: 18ee8e39
date: 2023-03-28 21:38:45
updated: 2023-03-28 21:38:45
---
# adb列出手机上安装的所有apk
```cmd
adb shell pm list package
```
上门的命令会列出所有的APP。
# adb列出非官方APP
一个手机中可能安装了好多APP，在cmd中，可以结合使用findstr命令进行筛选。

## cmd中筛选出不满足条件的行：findstr /V 条件
注意上门的/V要是大写的

# adb列出不包含某字符串的包名
例如：列出OPPO手机中不包含android，不包含oppo，不包含colloros，不包含qualcomm(高通)， 不包含google，不包含com.nearme的包名：
```cmd
adb -s 75aed56d shell pm list package |findstr /V android| findstr /V oppo| findstr /V com.coloros |findstr /V qualcomm| findstr /V google| findstr /V com.nearme
```
运行结果如下：
```cmd
C:\\Users\\haha>adb -s 75aed56d shell pm list package |findstr /V android| findstr /V oppo| findstr /V com.coloros |findstr /V qualcomm| findstr /V google| findstr /V com.nearme
package:com.gnss.power
package:com.qti.service.colorservice
package:com.quicinc.cne.CNEService
package:com.jifen.qukan
package:com.sohu.inputmethod.sogouoem
package:com.iflytek.speechcloud
package:com.tencent.mm
package:org.codeaurora.bluetooth
package:com.taobao.litetao
package:se.dirac.acs
package:com.dropboxchmod
package:org.codeaurora.ims
package:com.xm.freader
package:com.qti.xdivert
package:com.genymobile.gnirehtet
package:com.color.uiengine
package:com.svox.pico
package:com.dsi.ant.server
package:com.qti.backupagent
package:com.coolapk.market
package:com.cleanmaster.sdk
package:cn.youth.news
package:com.ximalaya.ting.lite
package:com.baidu.map.location
package:com.criticallog
package:com.kmxs.reader
package:com.taobao.taobao
package:com.taobao.live

C:\\Users\\haha>
```
# adb列出安装包关联的文件
```cmd
adb shell pm list packages -f
```
## 示例
```cmd
D:\Desktop>adb -s 75aed56d shell pm list package -f |findstr /V android| findstr /V oppo| findstr /V com.coloros |findstr /V qualcomm| findstr /V google| findstr /V com.nearme| findstr /V bluetooth
package:/system/app/GnssPowerSaver/GnssPowerSaver.apk=com.gnss.power
package:/system/vendor/app/colorservice/colorservice.apk=com.qti.service.colorservice
package:/system/priv-app/CNEService/CNEService.apk=com.quicinc.cne.CNEService
package:/data/app/com.jifen.qukan-1/base.apk=com.jifen.qukan
package:/data/app/com.sohu.inputmethod.sogouoem-1/base.apk=com.sohu.inputmethod.sogouoem
package:/system/app/IFlySpeechService/IFlySpeechService.apk=com.iflytek.speechcloud
package:/data/app/com.tencent.mm-2/base.apk=com.tencent.mm
package:/data/app/com.taobao.litetao-2/base.apk=com.taobao.litetao
package:/system/app/DiracAudioControlService/DiracAudioControlService.apk=se.dirac.acs
package:/system/app/OppoDropboxChmodService/OppoDropboxChmodService.apk=com.dropboxchmod
package:/system/vendor/app/ims/ims.apk=org.codeaurora.ims
package:/data/app/com.xm.freader-1/base.apk=com.xm.freader
package:/system/app/xdivert/xdivert.apk=com.qti.xdivert
package:/data/app/com.genymobile.gnirehtet-1/base.apk=com.genymobile.gnirehtet
package:/system/app/ColorUIEngine/ColorUIEngine.apk=com.color.uiengine
package:/system/app/PicoTts/PicoTts.apk=com.svox.pico
package:/system/app/AntHalService/AntHalService.apk=com.dsi.ant.server
package:/system/app/QtiBackupAgent/QtiBackupAgent.apk=com.qti.backupagent
package:/data/app/com.coolapk.market-1/base.apk=com.coolapk.market
package:/system/app/Cleanmaster64/Cleanmaster64.apk=com.cleanmaster.sdk
package:/data/app/cn.youth.news-1/base.apk=cn.youth.news
package:/data/app/com.ximalaya.ting.lite-2/base.apk=com.ximalaya.ting.lite
package:/system/app/NetworkLocation/NetworkLocation.apk=com.baidu.map.location
package:/system/app/OppoCriticalLogService/OppoCriticalLogService.apk=com.criticallog
package:/data/app/com.kmxs.reader-1/base.apk=com.kmxs.reader
package:/data/app/com.taobao.taobao-1/base.apk=com.taobao.taobao
package:/data/app/com.taobao.live-1/base.apk=com.taobao.live
```
# adb输出禁用的包
```cmd
adb shell pm list packages -d
```

```cmd
D:\Desktop>adb -s 75aed56d shell pm list packages -d
package:com.oppo.market
package:com.oppo.reader

D:\Desktop>
```
# adb输出启用的包
输出本机启用的包
```cmd
adb shell pm list packages -e
```
例如：
```cmd
adb -s 75aed56d shell pm list packages -e
```
省略。。。


# adb输出系统包名
```cmd
adb shell pm list packages -s
```
例如：
```cmd
adb -s 75aed56d shell pm list packages -s
```
运行效果：
```cmd
D:\Desktop>adb -s 75aed56d shell pm list packages -s
package:com.coloros.backuprestore
package:com.oppo.logkitsdservice
package:com.oppo.ctautoregist
package:com.coloros.phonenoareainquire
package:com.android.providers.telephony
package:com.coloros.wirelesssettings
package:com.android.engineeringmode
package:com.gnss.power
package:com.android.providers.calendar
package:com.android.providers.media
package:com.qti.service.colorservice
package:com.qualcomm.qti.modemtestmode
package:com.qualcomm.shutdownlistner
package:com.android.wallpapercropper
package:com.coloros.newsimdetect
package:com.quicinc.cne.CNEService
package:com.nearme.sync
package:com.android.documentsui
package:com.coloros.simsettings
package:com.sohu.inputmethod.sogouoem
package:com.android.externalstorage
package:com.android.htmlviewer
package:com.iflytek.speechcloud
package:com.android.quicksearchbox
package:com.android.mms.service
package:com.android.providers.downloads
package:com.coloros.providers.downloads.ui
package:com.oppo.autotest
package:com.coloros.blacklist
package:com.coloros.feedbackservice
package:com.oppo.camera.fastvideomode
package:com.qualcomm.interfacepermissions
package:com.android.browser
package:com.android.providers.applications
package:com.oppo.yellowpage
package:com.android.defcontainer
package:com.android.pacprocessor
package:com.coloros.fingerprint
package:com.coloros.gesture
package:com.oppo.camera.panorama
package:com.oppo.oppologkit
package:com.android.certinstaller
package:org.codeaurora.bluetooth
package:com.coloros.bootreg
package:android
package:com.oppo.camera.doubleexposure
package:com.android.contacts
package:com.qualcomm.wfd.service
package:com.coloros.oppoguardelf
package:com.android.mms
package:com.android.stk
package:com.android.backupconfirm
package:se.dirac.acs
package:com.dropboxchmod
package:com.android.dlna.service
package:com.coloros.activation
package:com.oppo.camera.superzoom
package:org.codeaurora.ims
package:com.android.calendar
package:com.oppo.fingerprints.service
package:com.qualcomm.qcrilmsgtunnel
package:com.android.providers.settings
package:com.qualcomm.qcom_qmi
package:com.android.sharedstoragebackup
package:com.android.printspooler
package:com.coloros.notificationmanager
package:com.nearme.ocloud
package:com.android.incallui
package:com.nearme.themespace
package:com.oppo.fingerprints.fingerprintsensortest
package:com.android.webview
package:com.android.inputdevices
package:com.qti.xdivert
package:oppo
package:com.coloros.compass
package:com.coloros.backuprestore.remoteservice
package:com.oppo.launcher
package:com.oppo.nw
package:com.coloros.preventmode
package:com.google.android.webview
package:com.coloros.recents
package:com.coloros.wallpapers
package:com.coloros.sau
package:com.android.server.telecom
package:com.color.uiengine
package:com.android.keychain
package:com.android.keyguard
package:com.coloros.weather
package:com.coloros.usbselection
package:com.nearme.gamecenter
package:com.nearme.statistics.rom
package:com.android.packageinstaller
package:com.oppo.resmonitor
package:com.coloros.pictorial
package:com.svox.pico
package:com.dsi.ant.server
package:com.android.proxyhandler
package:com.coloros.widget.smallweather
package:com.coloros.flashlight
package:com.qti.backupagent
package:com.coloros.photoeffects
package:com.android.managedprovisioning
package:com.oppo.c2u
package:com.oppo.ota
package:com.oppo.camera
package:com.coloros.feedback
package:com.coloros.alarmclock
package:com.oppo.sdcardservice
package:com.android.smspush
package:com.cleanmaster.sdk
package:com.oppo.camera.professional
package:com.android.wallpaper.livepicker
package:com.oppo.market
package:com.baidu.map.location
package:com.coloros.backup.composer.app
package:com.coloros.findmyphone
package:com.criticallog
package:com.nearme.themespacelib
package:com.coloros.safecenter
package:com.oppo.reader
package:com.android.settings
package:com.coloros.keyguard.notification
package:com.oppo.wifirf
package:com.coloros.exserviceui
package:com.android.calculator2
package:com.coloros.screenshot
package:com.oppo.bttestmode
package:com.qualcomm.location
package:com.oppo.dirac
package:com.oppo.music
package:com.coloros.video
package:com.coloros.filemanager
package:com.oppo.usercenter
package:com.oppo.camera.filter
package:com.android.vpndialogs
package:com.coloros.soundrecorder
package:com.coloros.speechassist
package:com.android.phone
package:com.android.shell
package:com.android.providers.userdictionary
package:com.nearme.ds
package:com.oppo.camera.gif
package:com.android.location.fused
package:com.coloros.speechassist.engine
package:com.android.systemui
package:com.qualcomm.qti.networksetting
package:com.qualcomm.fastdormancy
package:com.coloros.operationManual
package:com.nearme.romupdate
package:com.oppo.allowusbdebuggingcritically
package:com.oppo.gestureservice
package:com.coloros.gallery3d
package:com.android.bluetooth
package:com.qualcomm.timeservice
package:com.qualcomm.atfwd
package:com.android.providers.contacts
package:com.coloros.appmanager
package:com.android.captiveportallogin
package:com.oppo.usageDump
package:com.oppo.camera.facebeauty
package:com.coloros.oppomorningsystem
package:com.oppo.device.debug

D:\Desktop>
```
# adb列出第三方安装包
```cmd
D:\Desktop>adb -s 75aed56d shell pm list packages -3
package:com.jifen.qukan
package:com.ss.android.ugc.live
package:com.tencent.mm
package:com.taobao.litetao
package:com.xm.freader
package:com.genymobile.gnirehtet
package:com.coolapk.market
package:cn.youth.news
package:com.ximalaya.ting.lite
package:com.nearme.atlas
package:com.kmxs.reader
package:com.taobao.taobao
package:com.eg.android.AlipayGphone
package:com.taobao.live

D:\Desktop>
```
# adb输出包和安装来源
输出包和安装信息（安装来源） 
adb shell pm list packages -i

```cmd
D:\Desktop>adb -s 75aed56d shell pm list packages -i
package:com.coloros.backuprestore  installer=null
package:com.oppo.logkitsdservice  installer=null
package:com.oppo.ctautoregist  installer=null
package:com.coloros.phonenoareainquire  installer=null
package:com.android.providers.telephony  installer=null
......
```
# adb根据列出应用是设置过滤条件
```cmd
adb shell pm list packages -e "包名条件"
```
例如：
```cmd
D:\Desktop>adb -s 75aed56d shell pm list packages -e "com.taobao"
package:com.taobao.litetao
package:com.taobao.taobao
package:com.taobao.live

D:\Desktop>
```

# 参考资料
https://blog.csdn.net/weixin_38515203/article/details/90718733
https://www.cnblogs.com/yfp2019/p/10917902.html
