---
title: Win10 20H2版本因为VirtulBox无法更新
categories: 
  - Windows
  - 软件
  - Win10设置
abbrlink: ab19e083
date: 2021-04-04 16:51:57
updated: 2021-04-08 00:26:28
---
<!-- Blog/Windows/Software/WIN10Settings/BecauseTheVirtualBoxWin10_20H2VersionCannotBeUpdated/ -->
# 无法更新的提示信息
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Windows/Software/WIN10Settings/BecauseTheVirtualBoxWin10_20H2VersionCannotBeUpdated/1.png)
可以看到这里提示Win10与VirtualBox冲突无法安装，我这里有两个VirtualBox：
- VirtualBox，这个是我安装虚拟机的VirtualBox
- VirtualBox(LDPlayer)，这个是安卓模拟器的VirtualBox

把这个两个VirtualBox卸载掉，然后再更新Win10即可。

# 卸载VirtualBox
## 备份
导出虚拟机
## 卸载VirtualBox
找到VirtualBox的安装文件，然后运行该安装文件。选择**删除**。
## 重装VirtualBox
### 导入虚拟机
## 删除C盘上 VirtualBox文件，目录
安装everything，然后在everything中搜索VirtualBox，删除C盘上的所有相关的文件或者目录，其他盘上的则保留。

# 卸载模拟器
## 备份
导出雷模拟器中安装过的app,然后卸载该模拟器。
## 重装模拟器
### 安装之前导入的app
