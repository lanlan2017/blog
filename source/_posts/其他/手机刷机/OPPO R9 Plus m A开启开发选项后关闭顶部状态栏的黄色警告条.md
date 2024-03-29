---
title: OPPO R9 Plus m A开启开发选项后关闭顶部状态栏的黄色警告条
categories:
  - 其他
  - 手机刷机
abbrlink: 6be23f32
date: 2023-04-17 11:20:41
updated: 2023-04-17 11:20:41
---
# 问题描述
我手上有部OPPO的旧手机，OPPO R9 Plusm A。

因为是旧手机不怎么使用，所以我使用USB数据线连接该手机，并通过scrcpy.exe投屏来操作手机。

使用scrcpy.exe投屏的话，就要在手机上开启USB调试功能。要开启USB调试功能。就打开开发者模式。

但是我这个傻逼的OPPO手机，在开启USB调试之后，会在手机顶部显示一个黄色的警告栏。
如下图所示：
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2023/04/20230417113554.png)

这个讨厌的警告条会一直显示在手机顶部，如果你一不小心点到它，开发者选项就会关闭。
那么USB调试也就关闭掉了，那么scrcpy.exe投屏也就无法使用了。

如果你还是想继续投屏使用手机，那你得重新打开开发者选项，重新打开USB调试功能。

这就很烦。
# 查找不到可以去掉该黄色警告条的方法
那么有没有什么方法也去掉这个警告条呢。

很遗憾，我在搜索和很久，都没有搜到解决方案。

OPPO的客服也说了这是不可以去掉的。


# 解决方案：在状态栏中关闭开发模式，然后在状态栏中开启USB调试
我记得我以前是可以关掉这个黄色警告栏的。

后来警告我的不断尝试，我终于到到了方法。具体操作如下。
## 确保状态栏中可以设置USB调试
我这个方法的前提就是状态栏中有 可以的设置USB调试的通知

连接好USB调试之后，下拉手机顶部打开状态栏。如果你的状态栏如下图所示，则可继续：
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2023/04/20230417114140.png)
上图中的状态栏中有三栏，我们要操作第3栏（"开发者选项"已开启_存在系统异常，崩溃等风险，点击关闭）和第1栏（USB调试已打开_点击可设置停用USB调试）

如果你手机上的状态栏上，没有显示第1栏（USB调试设置栏），则把数据线从电脑的当前USB接口中拔出，然后插到电脑上的另一个USB接口上。这样应该就会出现第1栏了。

### 在状态栏中关闭开发者选项

点击上图冲的第3栏（"开发者选项"已开启_存在系统异常，崩溃等风险，点击关闭），点击之后，开发者选项就关闭掉了。

这个时候USB调试功能也会关闭

## 在状态栏中开启USB调试功能
不过，幸运的是，此时任务栏中的第1栏还在，点击第1栏，然后再打开USB调试的按钮即可，如下图所示：
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2023/04/20230417114954.png)

此时，USB调试是打开的状态，但是呢，开发者选项是关闭的，顶部也不会有黄色的警告条了。
