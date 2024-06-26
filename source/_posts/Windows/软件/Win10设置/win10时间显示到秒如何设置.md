---
title: win10时间显示到秒如何设置
categories:
  - Windows
  - 软件
  - Win10设置
abbrlink: 8f77ff30
date: 2024-06-26 12:21:32
updated: 2024-06-26 12:21:32
---

## win10时间显示到秒如何设置

### 修改注册表并重启

- 打开注册表编辑器：
  - 按下Win键+R组合键，打开“运行”对话框，输入“regedit”并按回车键，进入注册表编辑器。
- 定位到相关位置：
  - 在注册表中，定位到
    - `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced`。
- 新建DWORD值：
  - 在右侧窗口中，右击空白处选择“新建”->“DWORD(32位)值”，并将其命名为
    - “`ShowSecondsInSystemClock`”。
- 修改数值数据：
  - 双击新建的“ShowSecondsInSystemClock”值，将其数值数据修改为“`1`”。
- 重启系统：
  - 关闭注册表编辑器并重启系统。现在，你的任务栏时间应该已经显示到秒了。
