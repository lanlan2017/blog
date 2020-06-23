---
title: 恢复Open With Code书包右键菜单
categories:
  - 编程
  - IDE
  - VSCode
abbrlink: 4869d326
date: 2020-02-12 07:20:05
updated: 2020-02-12 08:10:55
---
<div id='my_toc'><a href="/blog/4869d326/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/4869d326/#手动设置" class="header_1">手动设置</a>&nbsp;<br><a href="/blog/4869d326/#打开注册表编辑器" class="header_2">打开注册表编辑器</a>&nbsp;<br><a href="/blog/4869d326/#进入shell目录" class="header_2">进入shell目录</a>&nbsp;<br><a href="/blog/4869d326/#新建项Open-With-Code" class="header_2">新建项Open With Code</a>&nbsp;<br><a href="/blog/4869d326/#设置图标" class="header_2">设置图标</a>&nbsp;<br><a href="/blog/4869d326/#在安装目录下查找图标" class="header_3">在安装目录下查找图标</a>&nbsp;<br><a href="/blog/4869d326/#转换图标为-ico格式" class="header_3">转换图标为.ico格式</a>&nbsp;<br><a href="/blog/4869d326/#在注册表中设置图标" class="header_3">在注册表中设置图标</a>&nbsp;<br><a href="/blog/4869d326/#设置鼠标右键菜单对应的命令" class="header_2">设置鼠标右键菜单对应的命令</a>&nbsp;<br><a href="/blog/4869d326/#方法2" class="header_1">方法2</a>&nbsp;<br><a href="/blog/4869d326/#替换VSCode的安装路径" class="header_2">替换VSCode的安装路径</a>&nbsp;<br><a href="/blog/4869d326/#替换图标" class="header_2">替换图标</a>&nbsp;<br><a href="/blog/4869d326/#点击运行" class="header_2">点击运行</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
安装VScode的时候会在鼠标右键设置一个Open With Code菜单,这样可以在目录的空白处直接右键打开该目录,但是我的被360删除掉了。现在来介绍怎么恢复.
# 手动设置
## 打开注册表编辑器
按下Win+R打开运行,输入regedit,然后回车打开注册表编辑器
## 进入shell目录
在注册表编辑器的地址栏上粘贴下面的地址,然后回车:
```
HKEY_CLASSES_ROOT\Directory\Background\shell
```
## 新建项Open With Code
右键shell目录,选择**新建**,然后选择**项**,这样会创建一个类似文件夹的东西,然后是输入项的名称**Open With Code**
## 设置图标
图标不是必须的,这一步可忽略,直接进入下一步.
### 在安装目录下查找图标
在桌面上的VScode的快捷方式上右键,然后选择**打开文件所在的位置(I)**,然后在VSCode的安装目录下搜索`code icon`,这样会搜到一个图标:
```
C:\Users\lan\AppData\Local\Programs\Microsoft VS Code\resources\app\out\vs\workbench\contrib\update\browser\media\code-icon.svg
```
### 转换图标为.ico格式
但是不幸的是这个图标是.svg格式的,windows上面的图标是.ico格式的,所以需要转码一下:
网上找个svg转ico的网站,将这个.svg的图标转码成.ico(128*128大小),然后下载转码的.ico图标,将下载好的图标保存到VSCode的安装路径下
```
"C:\Users\lan\AppData\Local\Programs\Microsoft VS Code\code.ico"
```
### 在注册表中设置图标
现在我们得到图标了,回到注册表,点击Open With Code,新建一个字符串,命名为Icon,然后值设置为刚才保存的图标的路径:
```
"C:\Users\lan\AppData\Local\Programs\Microsoft VS Code\code.ico"
```
## 设置鼠标右键菜单对应的命令
还是在Open With Code上右键,选择**新建**,**项**,命名为`command`.
然后点击command,在右侧修改command的默认值:
修改为VScode的路径+空格+"%V",这里的`%V`代表的按下鼠标右键的目录.
```
"C:\Users\lan\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%V"
```
到这里如果没有问题的话就可以了.
找一个目录,然后按下鼠标右键,选择Open With Code就可以用VSCode中打开这个目录
# 方法2
下面是我导出的注册表文件内容:
```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\Open With Code]
"Icon"="\"C:\\Users\\lan\\AppData\\Local\\Programs\\Microsoft VS Code\\code.ico\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\Open With Code\command]
@="\"C:\\Users\\lan\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe\" \"%V\""
```
如果懒得手动设置,可以将这个代码保存为.reg文件,然后用VSCode等文件编辑器打开该文件。
## 替换VSCode的安装路径
打开查找替换功能,搜索下面安装路径:
```
C:\\Users\\lan\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe
```
替换成你电脑上VScode的绝对路径即可,注意路径分隔符号有两个.例如替换为:
```
G:\\Programs\\Microsoft VS Code\\Code.exe
```
## 替换图标
打开查找,输入上面的图标路径:
```
C:\\Users\\lan\\AppData\\Local\\Programs\\Microsoft VS Code\\code.ico
```
替换成你的图标路径即可.注意**路径分隔符要是两个斜杠**
## 点击运行
然后保存这个.reg文件,点击这个.reg文件即可导入注册表.
# 方法3 更新VSCode
今天我发现VSCode自动更新了,然后惊喜的是上面的鼠标右键快捷方式又回来了,所以更新VSCode也可以恢复鼠标右键快捷方式