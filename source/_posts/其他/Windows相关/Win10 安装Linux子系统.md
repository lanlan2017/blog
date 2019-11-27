---
title: Win10 安装Linux子系统
categories: 
  - 其他
  - Windows相关
date: 2019-11-27 10:49:35
updated: 2019-11-27 16:26:48
abbrlink: 942c9c89
---
<div id='my_toc'>

- [打开开发者选项](/blog/942c9c89/#打开开发者选项)
- [勾选适用于Linux的Windows子系统](/blog/942c9c89/#勾选适用于Linux的Windows子系统)
    - [小娜搜索 进入 启用或关闭 Windows功能的步骤](/blog/942c9c89/#小娜搜索-进入-启用或关闭-Windows功能的步骤)
    - [通过控制面板进入 启用或关闭 Windows功能的步骤](/blog/942c9c89/#通过控制面板进入-启用或关闭-Windows功能的步骤)
        - [快速打开控制面板](/blog/942c9c89/#快速打开控制面板)
- [Microsoft store安装Linux](/blog/942c9c89/#Microsoft-store安装Linux)
- [启动Linux](/blog/942c9c89/#启动Linux)
    - [cmd中启动](/blog/942c9c89/#cmd中启动)
    - [文件资源管理器中启动](/blog/942c9c89/#文件资源管理器中启动)
- [配置Linux](/blog/942c9c89/#配置Linux)
    - [设置root用户密码](/blog/942c9c89/#设置root用户密码)
- [更换国内apt源 并更新软件](/blog/942c9c89/#更换国内apt源-并更新软件)
    - [更新源列表](/blog/942c9c89/#更新源列表)
    - [更新已安装使所有软件](/blog/942c9c89/#更新已安装使所有软件)
- [安装中文字体及设置](/blog/942c9c89/#安装中文字体及设置)
    - [安装中文字体](/blog/942c9c89/#安装中文字体)
    - [查看中文字体](/blog/942c9c89/#查看中文字体)
    - [配置环境变量](/blog/942c9c89/#配置环境变量)
    - [查看中文字体](/blog/942c9c89/#查看中文字体)
    - [切换中文](/blog/942c9c89/#切换中文)
    - [查看系统语言](/blog/942c9c89/#查看系统语言)
    - [重启子系统](/blog/942c9c89/#重启子系统)
        - [关闭子系统](/blog/942c9c89/#关闭子系统)
        - [开启子系统](/blog/942c9c89/#开启子系统)
- [参考资料](/blog/942c9c89/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 打开开发者选项 #
按下**`win+I`**快捷键,打开**设置**,然后进入**更新和安全**
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/1.png)
然后点击`左侧`的**开发者选项**,在右边选择**开发人员模式**选项
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/3.png)
在弹出的确认框中选择**是**
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/4.png)
打开效果:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/5.png)
# 勾选适用于Linux的Windows子系统 #
## 小娜搜索 进入 启用或关闭 Windows功能的步骤 ##
在小娜搜索框中输入**Windows功能**,然后选择**启用或关闭 Windows功能**
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/6.png)
## 通过控制面板进入 启用或关闭 Windows功能的步骤 ##
### 快速打开控制面板 ###
按下`Win+E`打开**文件资源管理器**,然后再地址栏上输入**控制面板**,即可打开**控制面板**:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/7.png)
然后再**控制面板的`搜索框`**中输入**启用或关闭 Windows功能**,然后再搜索结果中点击进入**启用或关闭 Windows功能**,然后**滚动到最底部**,勾选上**适用于 Linux的 Windows子系统**即可:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/8.png)
# Microsoft store安装Linux #
打开**`Microsoft store*`*,在搜索框中输入`Linux`,或是`Linux`的发行版的名字来查找你要安装的`Linux`,例如我这里输入`Ubuntu`,然后选择`Ubuntu 18.04 LTS`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/9.png)
然后点击**获取**,然后等待下载 安装完毕,我已经装好了,下面以获取**Ubuntu 16.04 LTS**为例:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/10.png)
# 启动Linux #
安装好Linux后,启动程序,第一次运行,需要输入**用户名**和**密码**.
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/11.png)

## cmd中启动 ##
通过上面的方式进入,会默认进入用户的`home`目录,在`cmd`中输入`bash`即可在**当前路径**下进入`Linux`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/12.png)
## 文件资源管理器中启动 ##
也可以在**文件资源管理器**的**地址栏**中输入`bash`进入`Linux`。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Win10/SubSystem/Linux/Ubuntu/13.png)
# 配置Linux #
## 设置root用户密码 ##
```shell
sudo passwd
```
# 更换国内apt源 并更新软件 #
见这篇文章:[Ubuntu 18.04修改默认源为国内源](/blog/4fc37c0d/)
```shell
sudo vim /etc/apt/sources.list
```
注释其他源,写入如下源:
```shell
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
```
## 更新源列表 ##
```shell
sudo apt-get update
```
## 更新已安装使所有软件 ##
```shell
sudo apt-get upgrade
```

# 安装中文字体及设置 #
## 安装中文字体 ##
```shell
sudo apt-get install language-pack-zh-hans
```
```shell
sudo apt-get install -y fonts-wqy-zenhei
```
或:
```shell
sudo apt install -y fonts-wqy-microhei
```
## 查看中文字体 ##
```shell
blue@DESKTOP-8ISAT6B:~$ fc-list :lang=zh-cn
/usr/share/fonts/truetype/wqy/wqy-microhei.ttc: WenQuanYi Micro Hei,文泉驛微米黑,文泉驿微米黑:style=Regular
/usr/share/fonts/truetype/wqy/wqy-microhei.ttc: WenQuanYi Micro Hei Mono,文泉驛等寬微米黑,文泉驿等宽微米黑:style=Regular
```
## 配置环境变量 ##
```shell
vim .profile
```
在末尾添加如下配置：
```shell
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
```
## 查看中文字体 ##
```shell
fc-list :lang=zh-cn
```
## 切换中文 ##
```shell
sudo dpkg-reconfigure locales
```
按键盘pagedown往下找到并且选择zh_CN.UTF-8（按空格键选择，按Tab键移动到确定，按回车键确定）
图片
到下一步，选择zh_CN.UTF-8（按回车键确定） 
图片


## 查看系统语言 ##
```shell
locale
```
```shell
blue@DESKTOP-8ISAT6B:~$ locale
LANG=C.UTF-8
LANGUAGE=
LC_CTYPE="C.UTF-8"
LC_NUMERIC="C.UTF-8"
LC_TIME="C.UTF-8"
LC_COLLATE="C.UTF-8"
LC_MONETARY="C.UTF-8"
LC_MESSAGES="C.UTF-8"
LC_PAPER="C.UTF-8"
LC_NAME="C.UTF-8"
LC_ADDRESS="C.UTF-8"
LC_TELEPHONE="C.UTF-8"
LC_MEASUREMENT="C.UTF-8"
LC_IDENTIFICATION="C.UTF-8"
LC_ALL=
```
发现系统语言已经是中文

## 重启子系统 ##
以管理员身份,打开**windows的cmd**,输入如下两个命令行:
### 关闭子系统 ###
```cmd
net stop LxssManager
```
### 开启子系统 ###
```cmd
net start LxssManager
```
运行效果如下
```cmd
C:\WINDOWS\system32>net stop LxssManager
LxssManager 服务正在停止.
LxssManager 服务已成功停止。

C:\WINDOWS\system32>net start LxssManager
LxssManager 服务正在启动 .
LxssManager 服务已经启动成功。

C:\WINDOWS\system32>
```


# 安装桌面 #
```shell
sudo apt-get install xubuntu-desktop
```
之后会自动安装桌面。（gnome桌面、xfce4桌面、Unity桌面、kde桌面等可自行选择，只需命令sudo install xxx就可安装了）

如果界面管理器出错就安装（没有就不用管这句）：sudo apt install lightdm 安装完成后重启系统就好了

Win10/SubSystem/Linux/Ubuntu/
# 参考资料 #
[https://www.bilibili.com/video/av51515689/](https://www.bilibili.com/video/av51515689/)
[https://www.tkdcz.top/post/46.html](https://www.tkdcz.top/post/46.html)
