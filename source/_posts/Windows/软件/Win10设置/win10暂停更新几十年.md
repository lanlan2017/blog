---
title: 暂停更新好多年
categories:
  - Windows
  - 软件
  - Win10设置
abbrlink: 361f138b
date: 2053-09-06 07:04:33
updated: 2053-09-06 07:04:33
---
## 修改注册表实现

### 打开注册表编辑器

在搜索框中，输入`regedit`，然后以管理员身份打开。

### 找到目录并新建值

目录`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings`。在**右侧**

新建**DWORD(32)位值**`FlightSettingsMaxPauseDays`为`65535`

然后关闭注册表。

### 暂停更新截止时间

Windows更新，然后选择高级选项，找到暂停更新，把截止日期拉倒最大

## 手动修改时间实现

这个方法可能

### 修改时间

在设置里，把自动设置时间按钮关掉，然后点击手动设置日期和时间，把年份拉倒最大，例如2054年。然后点击更改。

### 暂停更新

Windows更新，然后选择高级选项，找到暂停更新，把截止日期拉倒最大，例如2054年1月1日。

### 恢复时间

打开自动设置时间即可。

## 参考资料

<https://zhuanlan.zhihu.com/p/633610238>
<https://zhuanlan.zhihu.com/p/642914883>