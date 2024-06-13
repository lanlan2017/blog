---
title: adb展开通知栏 adb收起通知栏
categories:
  - 编程
  - adb
abbrlink: 7aecf665
date: 2023-04-04 10:00:07
updated: 2023-04-04 10:00:25
---

# 显示通知栏
```cmd
adb shell service call statusbar 1
```
# 隐藏状态栏
```cmd
adb shell service call statusbar 2
```

# 参考资料
https://blog.csdn.net/qq_39172055/article/details/113361887
https://juejin.cn/post/6844904112966877198
https://tianma8023.github.io/post/android-shell-service-commands/
