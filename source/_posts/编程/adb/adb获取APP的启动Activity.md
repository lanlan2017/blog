---
title: adb获取APP的启动Activity
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: 22423de8
date: 2023-03-28 14:10:43
updated: 2023-03-28 14:10:43
---
# 启动APP时执行命令获取app的启动Activity
打开APP时在cmd中迅速执行如下命令：
```cmd
adb -s 75aed56d shell dumpsys window w |findstr \/ |findstr name=
```
接下来就可以通过如下的命令，来启动apk：

```cmd
adb -s 75aed56d shell am start -n com.kmxs.reader/com.km.app.home.view.LoadingActivity
```
# 参考资料
https://blog.csdn.net/hzblucky1314/article/details/124223736