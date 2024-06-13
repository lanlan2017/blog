---
title: adb传输文件到外置sd卡
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: b2a02ec1
date: 2022-08-24 16:58:09
updated: 2022-08-24 16:58:09
---
# adb传输文件到手机
使用adb push命令即可把文件传输到Android手机。
<!-- more -->

## adb --help
输入`adb --help`命令，查看帮助文档，adb push相关内容如下所示：

```
D:\雷电模拟器\已下载\用户>adb --help
Android Debug Bridge version 1.0.41
Version 31.0.2-7242960
Installed as F:\Program Files\scrcpy-win64-v1.18\adb.exe

......

file transfer:
 push [--sync] [-z ALGORITHM] [-Z] LOCAL... REMOTE
     copy local files/directories to device
     --sync: only push files that are newer on the host than the device
     -n: dry run: push files to device without storing to the filesystem
     -z: enable compression with a specified algorithm (any, none, brotli)
     -Z: disable compression
 pull [-a] [-z ALGORITHM] [-Z] REMOTE... LOCAL
......
```

`--sync`参数，表示如果主机上的文件比设备上的文件更新，则推送该文件。我推测，这个参数是用在主机和设备上有同名文件的情况，如果不使用这个参数，则会使用主机上的文件，覆盖设备上的同名文件。如果使用该参数，则遇到同名文件时，先比较两者的最后修改时间。如果主机上的最后修改时间比设备上的最后修改时间大的话，就推送该文件到设备上，覆盖设备上的文件。


## 推送到外置sd卡
安装**ES文件浏览器**，或者其他的文件浏览器。找到sd卡：

![image-20220824174016335](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824174016.png)

然后进入SD卡，在顶部可以看到SD卡的绝对路径：

![image-20220824174026974](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824174027.png)

例如我这里是：`/storage/0123-4567/`

### 被测试目录的结构
```
D:\Desktop\test\adb>mytree f

D:\Desktop\test\adb
├─子目录1\
│ └─子目录文件.txt
├─子目录2\
└─测试.txt

D:\Desktop\test\adb>
```


### adb push文件到外置sd卡

推送**测试.txt**到**外置SD卡**的根目录下的**视频**目录中：
```
adb -s U8ENW18117021408 push 测试.txt /storage/0123-4567/视频
```
运行效果：
```
D:\Desktop\test\adb>adb -s U8ENW18117021408 push 测试.txt /storage/0123-4567/视
频
测试.txt: 1 file pushed, 0 skipped. 0.0 MB/s (11 bytes in 0.001s)

D:\Desktop\test\adb>
```
在文件管理器中刷新一下，即可看到推送的效果：

![image-20220824172755977](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824172841.png)

## 推送目录到外置SD卡

推送`D:\Desktop\test\adb`目录到`/storage/0123-4567/视频`目录中：

```
D:\Desktop\test\adb> adb -s U8ENW18117021408 push D:\Desktop\test\adb /storage/0123-4567/视频
D:\Desktop\test\adb\: 2 files pushed, 0 skipped. 0.0 MB/s (11 bytes in 0.061s)

D:\Desktop\test\adb>
```

这样就把adb整个目录树都推送到视频目录中了，你可以在手机上的视频目录中看到一个新的adb子目录：

![image-20220824174840128](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824174840.png)

手机上的adb子目录和电脑上的adb目录是一样的：

![image-20220824175044318](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824175044.png)

### 推送目录下的所有文件或目录 到外置SD卡
上门会把电脑上的adb目录，复制到手机的**视频**目录下的adb子目录中。
如果项把adb目录下的所有文件或目录复制到**视频2**目录的根目录下，而**不是复制到视频2的adb子目录中**该怎么办呢？

```
adb -s U8ENW18117021408 push D:\Desktop\test\adb\. /storage/0123-4567/视频2
```
运行效果：

```
D:\Desktop\test\adb>adb -s U8ENW18117021408 push D:\Desktop\test\adb\. /storage/0123-4567/视频2
D:\Desktop\test\adb\.\: 2 files pushed, 0 skipped. 0.0 MB/s (11 bytes in 0.079s)

D:\Desktop\test\adb>
```
回到SD卡的根目录，刷新一下，可以看到，有一个名为**视频2**的新目录。

![image-20220824180257279](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824180257.png)

进入**视频2**目录，目录结构如下：

![image-20220824180308155](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220824180308.png)

可以看到视频2目录下不会再有adb子目录了。





