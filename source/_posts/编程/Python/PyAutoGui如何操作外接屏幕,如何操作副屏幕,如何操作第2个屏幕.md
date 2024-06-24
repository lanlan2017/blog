---
title: 'PyAutoGui如何操作外接屏幕,如何操作副屏幕,如何操作第2个屏幕'
categories:
  - 编程
  - Python
abbrlink: 8958000f
date: 2022-06-14 14:32:43
updated: 2022-06-14 14:32:43
---
# PyAutoGui如何在外接屏幕工作 如何在副屏幕上工作

PyAutoGui目前只能在主屏幕上工作，如果要使PyAutoGui在外接屏幕上工作，只需要把外接屏幕设置为主屏幕即可。

<!-- more -->

## 问题描述

PyAutoGui目前不能操作手机，所以我先把手机投屏到电脑上，然后再使用PyAutoGui来操作手机镜像。
为了操作手机镜像，就需要把手机镜像置顶显示，不然PyAutoGui无法识别到指定的图片，也就无法操作手机了。

可问题是，手机镜像会占用一片不小的屏幕空间,并且一直置顶，这会影响我使用电脑上的其他程序。

刚好我电脑上有一个外接的屏幕，要是PyAutoGui能操作外接屏幕就好了。

不过事与愿违，查阅官方文档：

```txt https://pyautogui.readthedocs.io/en/latest/index.html#faq-frequently-asked-questions
问：PyAutoGUI 可以在 Android、iOS 或平板电脑/智能手机应用程序上运行吗？

答：不幸的是没有。PyAutoGUI 仅在 Windows、macOS 和 Linux 上运行。

问：PyAutoGUI 是否适用于多显示器设置。

A：不，现在 PyAutoGUI 只处理主监视器。

问：PyAutoGUI 做 OCR 吗？

答：不，但这是路线图上的一项功能。

问：PyAutoGUI 是否可以进行键盘记录，或者检测当前是否按下了某个键？

A：不，PyAutoGUI 目前无法做到这一点。
```

可知，目前PyAutoGui不能操作副屏幕，只能操作主屏幕。

![image-20220614150736907](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220614161124.png)

## 解决方案

不过也不要灰心，**把外接屏幕设置为主屏幕就行了**

# 参考资料

多个屏幕如何设置主显示器：

https://jingyan.baidu.com/article/77b8dc7fba543e6174eab60e.html

PyAutoGui文档:

https://pyautogui.readthedocs.io/en/latest/index.html