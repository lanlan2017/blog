---
title: Ubuntu 为shell脚本创建.destop快捷方式
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-26 00:48:27
updated: 2019-12-17 05:18:52
abbrlink: cc785ddc
---
<div id='my_toc'><a href="/blog/cc785ddc/#Ubuntu-为shell脚本创建-destop快捷方式" class="header_1">Ubuntu 为shell脚本创建.destop快捷方式</a>&nbsp;<br><a href="/blog/cc785ddc/#HexoS-sh" class="header_2">HexoS.sh</a>&nbsp;<br><a href="/blog/cc785ddc/#启动博客-desktop" class="header_2">启动博客.desktop</a>&nbsp;<br><a href="/blog/cc785ddc/#-desktop-配置详解" class="header_2">.desktop 配置详解</a>&nbsp;<br><a href="/blog/cc785ddc/#Desktop-Entry-文件结构" class="header_2">Desktop Entry 文件结构</a>&nbsp;<br><a href="/blog/cc785ddc/#关键字详解" class="header_2">关键字详解</a>&nbsp;<br><a href="/blog/cc785ddc/#必选关键字" class="header_3">必选关键字</a>&nbsp;<br><a href="/blog/cc785ddc/#可选关键字" class="header_3">可选关键字</a>&nbsp;<br><a href="/blog/cc785ddc/#以"Type"类型是"Application"为前提的关键字" class="header_4">以"Type"类型是"Application"为前提的关键字</a>&nbsp;<br><a href="/blog/cc785ddc/#以"Type"类型是"Link"为前提的关键字" class="header_4">以"Type"类型是"Link"为前提的关键字</a>&nbsp;<br><a href="/blog/cc785ddc/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Ubuntu 为shell脚本创建.destop快捷方式 #
## HexoS.sh ##
```shell
#! /bin/bash
# 杀死占用端口的所有进程
kill -s 9 $(lsof -i:4007 -t)
cd /home/blue/桌面/Blog/blog9/
hexo s -p 4007

```
## 启动博客.desktop ##
```shell
[Desktop Entry]
Encoding=UTF-8
Name=启动博客
Type=Application
Categories=Application;
StartupNotify=true
Terminal=true
Exec=sh /home/blue/桌面/Blog/blog9/HexoS.sh
```

## .desktop 配置详解 ##
`Desktop Entry` 文件以"`.desktop`"为后缀名。
以 `Linux GNOME` 桌面系统为例，用户打开应用程序浏览器后（见图1）会看见很多应用程序快捷方式。
事实上，每个应用程序快捷方式都和一个 `Desktop Entry` 文件相对应。
这些 `Desktop Entry` 文件通常被存放在 /`usr/share/applications/` 和/`opt/gnome/share/applications/` 等目录下。
从文件浏览器进入这些目录，点击相应的 `Desktop Entry` 文件就可以启动相对应的应用程序。

## Desktop Entry 文件结构
Desktop Entry 文件通常以字符串"[Desktop Entry]"开始

Desktop Entry文件的剩余内容由若干形如
```java
标准关键字＝值
```
的键值对组成。
## 关键字详解
Desktop Entry 文件标准定义了一系列标准关键字。
标准关键字分为**必选**和**可选**两种：
- 必选标准关键字必须在 .desktop 文件中被定义；
- 可选关键字则可以省略不写

### 必选关键字
关键字"Name"：[必选]
该数值指定了相关应用程序的名称，快捷方式的显示名称由关键字"Name"的数值所决定
关键字"Type"：[必选]
关键字"Type"定义了Desktop Entry文件的类型。常见的"Type"数值是"Application"和"Link"。
- "Type = Application"表示当前Desktop Entry文件指向了一个应用程序；
- 而"Type = Link"表示当前Desktop Entry文件指向了一个URL

### 可选关键字
关键字"Version"：[可选] 该数值指定了当前 Desktop Entry 文件所遵循的 Desktop Entry 文件标准版本。
关键字"Encoding"：[1.0 版本不推荐使用] 该数值指定了当前 Desktop Entry 文件中特定字符串所使用的编码方式。尽管Desktop Entry 文件标准 1.0 不再推荐使用该关键字，但由于历史原因该关键字仍然广泛出现在现有的 Desktop Entry 文件中。
关键字"GenericName"：[可选]
该数值指定了相关应用程序的通用名称
关键字"Comment"：[可选]
该数值是对当前Desktop Entry的简单描述。
关键字"Icon"：[可选]
该数值定义了当前Desktop Entry文件在应用程序浏览器或是在文件浏览器中所显示的图标
关键字"OnlyShowIn"和"NotShowIn"：[可选]
这两个关键字分别定义了当前Desktop Entry是否在特定Linux 桌面系统（例如：Linux GNOME 或 Linux KDE）下显示（由"OnlyShowIn"定义），或不显示（由"NotShowIn"定义）。具体定义请参考"Desktop Specification Menu"[4]

#### 以"Type"类型是"Application"为前提的关键字
关键字"Exec"：[可选]
关键字"Exec"只有在"Type"类型是"Application"时才有意义。"Exec"的数值定义了启动指定应用程序所要执行的命令，在此命令 是可以带参数的

关键字"StartupNotify"：[可选]
关键字"StartupNotify"的数值是布尔值（true 或是 false）。该关键字只有在"Type"类型是"Application"时才有意义。其数值的含义由规范"Startup Notification Protocol Specifications"[3]定义，在此不再详述。
关键字"Terminal"：[可选]
和"StartupNotify"一样，关键字"StartupNotify"的数值也是布尔值，并且该关键字只有在"Type"类型 是"Application"时才有意义。其数值指出了关键字"Exec"的指定的应用程序**是否需要在终端窗口中运行**。
关键字"Categories"只有在"Type"类型是"Application"时才有意义。"Categories"的数值指出了相关应用程序在菜单中显示的类别。具体菜单分类由规范"Desktop Specification Menu"具体定义[4]。

####  以"Type"类型是"Link"为前提的关键字
关键字"URL"：[可选]
关键字"URL"只有在"Type"类型是"Link"时才有意义。"URL"的数值定义了该Desktop Entry文件指向的URL
```java
Type = Link
URL = http://www.ibm.com/developerworks
```
则双击含有上述内容的Desktop Entry文件将启动web浏览器，并打开指定网页"http://www.ibm.com/developerworks"


# 参考资料
[Linux桌面快捷方式 Desktop Entry 详解](http://m.blog.chinaunix.net/uid-20332519-id-3015914)
