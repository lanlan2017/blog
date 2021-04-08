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
<div id='my_toc'><a href="/blog/ab19e083/#无法更新的提示信息" class="header_1">无法更新的提示信息</a>&nbsp;<br><a href="/blog/ab19e083/#卸载VirtualBox" class="header_1">卸载VirtualBox</a>&nbsp;<br><a href="/blog/ab19e083/#备份" class="header_2">备份</a>&nbsp;<br><a href="/blog/ab19e083/#卸载VirtualBox" class="header_2">卸载VirtualBox</a>&nbsp;<br><a href="/blog/ab19e083/#重装VirtualBox" class="header_2">重装VirtualBox</a>&nbsp;<br><a href="/blog/ab19e083/#导入虚拟机" class="header_3">导入虚拟机</a>&nbsp;<br><a href="/blog/ab19e083/#删除C盘上-VirtualBox文件，目录" class="header_2">删除C盘上 VirtualBox文件，目录</a>&nbsp;<br><a href="/blog/ab19e083/#卸载模拟器" class="header_1">卸载模拟器</a>&nbsp;<br><a href="/blog/ab19e083/#备份" class="header_2">备份</a>&nbsp;<br><a href="/blog/ab19e083/#重装模拟器" class="header_2">重装模拟器</a>&nbsp;<br><a href="/blog/ab19e083/#安装之前导入的app" class="header_3">安装之前导入的app</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
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
