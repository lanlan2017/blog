---
title: idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题
categories: 
  - IDE
  - Idea
abbrlink: cbf0ce22
date: 2019-10-03 12:06:07
updated: 2022-04-04 00:51:45
---
# idea Shift+Alt+I快捷键是弹出TouchPad Driver Diagnostics的问题
## 原因
`Shift+Alt+L`是`Synaptics`(新思)触摸板驱动中用于触摸板测试的快捷键
## 解决方案:禁用触控板
以管理员身份运行`cmd`,输入如下命令:
```cmd
reg add HKEY_LoCAL_MACHINE\sYsTEM\CurrentControlset\services\synTP\Parameters\Debug /v DumpKernel /d 00000000 /t REG_DwoRD /f
```
## 重启电脑后生效
运行后,不会立即生效,需要重启电脑才会生效.
