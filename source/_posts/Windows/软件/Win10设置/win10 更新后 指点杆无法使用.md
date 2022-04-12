---
title: win10 更新后 指点杆无法使用
categories: 
  - Windows
  - 软件
  - Win10设置
abbrlink: 4ca2ad13
date: 2021-07-21 09:24:05
updated: 2022-04-04 00:51:44
---
# 原因

我更新win10之后，键盘上的小红帽(指点杆)就无法使用了，经过我的排查，发现是因为：

win10更新时，会更新Synaptics Pointing Device这个驱动造成的，把这个更新后的驱动卸载掉之后，指点杆就可以了使用了。

# 卸载Synaptics Pointing Device

## 打开设备管理器

按快捷键**win+x**打开**设备管理器**，然后点开**鼠标和其他指针设备**，然后在Snaptics Pointing Device上面**右键**，然后选择**卸载设备**。

![image-20210721092523064](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210721092530.png)

![image-20210721093149204](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210721093149.png)

然后在弹出的对话框中勾选上删除此设备的驱动程序软件，然后点击卸载即可

![image-20210721093424814](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210721093424.png)

如果没有勾选**删除此设备的驱动程序软件**，**可能会出错**，我的错误是**电脑屏幕闪烁**,但是**我并不确定到底是不是卸载驱动不完全造成的。也有可能是我电脑的屏幕坏掉了**。

## 重启电脑

卸载后，会要求重启电脑，按要求重启即可。

