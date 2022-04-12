---
title: Win10 禁止安装Synaptics Pointing Device驱动
categories: 
  - Windows
  - 软件
  - Win10设置
abbrlink: 2018f329
date: 2021-07-24 18:50:16
updated: 2022-04-04 00:51:44
---
# 前言
在上篇文章:[win10 更新后 指点杆无法使用](/blog/4ca2ad13/)中，我介绍了win10更新后ThinkPad的指点杆无法使用，可以通过卸载Synaptics Pointing Device来恢复指点杆的功能。
但是，不就之后，win10会自动安装上Synaptics Pointing Device。
也就是说我就算卸载掉Synaptics Pointing Device，过两天win10就又自动给安装上了。这就很烦。

# Synaptics Pointing Device安装不完整会 造成屏幕闪烁
Synaptics Pointing Device还有另一个问题，就是会造成电脑的屏幕闪烁，这同样需要卸载，重启。
这样才会解决闪烁问题。

# win10专业版 卸载触摸板驱动后不再安装
<https://answers.microsoft.com/zh-hans/windows/forum/all/%E8%A7%A6%E6%91%B8%E6%9D%BF%E6%97%A0%E6%B3%95/cc068155-6afd-42db-9045-7e6ff63c2566?auth=1>
## 打开组策略
**重要提示**
我在这一步误操作，会可能会造成电脑的键盘和鼠标无法使用。
后来我使用外接键盘才可以操作电脑，所以请先**准备好外接键盘**。

Win+R运行，调出运行框，输入“gpedit.msc”打开组策略。
依次找到： **计算机配置**-**管理模版**-**系统**-**设备安装**--**设备安装限制**

![image-20210724191531](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191531.png)

接着在右侧找到“**阻止使用与下列设备安装程序类相匹配的驱动程序安装设备**”， 在上面**右键**，选择“**编辑**”

![image-20210724191652](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191652.png)

![image-20210724191740](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191740.png)



打开设置对话框。 勾选“已启用”后点击“显示”输入设备的类GUID

![image-20210724191914](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191914.png)

## 获取Synaptics Pointing Device的 类GUID
Win+X打开设备管理器，然后点开鼠标和其他指针设备，在Synaptics Pointing Device上面右键，选择属性。

![image-20210724191724](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191724.png)

然后点开详细信息选项卡，点开属性选择列表，选择类 Guid

![image-20210724191733](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191733.png)

然后在类 Guid值上右键，选择复制。

![image-20210724191749](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724191749.png)

## 在组策略中 粘贴类Guid

![image-20210724192243](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724192243.png)

## 卸载Synaptics Pointing Device

![image-20210724192556](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724192556.png)

![image-20210724192602](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724192602.png)

![image-20210724192758](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210724192758.png)
