---
title: Win10 安装Linux子系统
categories: 
  - Windows
date: 2019-11-27 10:49:35
updated: 2019-12-09 19:45:23
abbrlink: 942c9c89
---
<div id='my_toc'><a href="/blog/942c9c89/#总结">总结</a><br/><a href="/blog/942c9c89/#打开开发者选项">打开开发者选项</a><br/><a href="/blog/942c9c89/#勾选适用于Linux的Windows子系统">勾选适用于Linux的Windows子系统</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#小娜搜索-进入-启用或关闭-Windows功能的步骤">小娜搜索 进入 启用或关闭 Windows功能的步骤</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#通过控制面板进入-启用或关闭-Windows功能的步骤">通过控制面板进入 启用或关闭 Windows功能的步骤</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#快速打开控制面板">快速打开控制面板</a><br/><a href="/blog/942c9c89/#Microsoft-store安装Linux">Microsoft store安装Linux</a><br/><a href="/blog/942c9c89/#启动Linux">启动Linux</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#cmd中启动">cmd中启动</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#文件资源管理器中启动">文件资源管理器中启动</a><br/><a href="/blog/942c9c89/#配置Linux">配置Linux</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#设置root用户密码">设置root用户密码</a><br/><a href="/blog/942c9c89/#更换国内apt源-并更新软件">更换国内apt源 并更新软件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#更新源列表">更新源列表</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#更新已安装使所有软件">更新已安装使所有软件</a><br/><a href="/blog/942c9c89/#安装中文字体及设置">安装中文字体及设置</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#安装中文字体">安装中文字体</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#查看中文字体">查看中文字体</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#配置环境变量">配置环境变量</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#查看中文字体">查看中文字体</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#切换中文">切换中文</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#查看系统语言">查看系统语言</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#重启子系统">重启子系统</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#关闭子系统">关闭子系统</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#开启子系统">开启子系统</a><br/><a href="/blog/942c9c89/#安装桌面方式1">安装桌面方式1</a><br/><a href="/blog/942c9c89/#unset-SESSION-MANAGER">unset SESSION_MANAGER</a><br/><a href="/blog/942c9c89/#exec-etc-X11-xinit-xinitrc">exec /etc/X11/xinit/xinitrc</a><br/><a href="/blog/942c9c89/#安装桌面方式2">安装桌面方式2</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#解决错误1">解决错误1</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#合并目录">合并目录</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#解决错误2">解决错误2</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#重启子系统">重启子系统</a><br/><a href="/blog/942c9c89/#安装中文输入法">安装中文输入法</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#配置变量">配置变量</a><br/><a href="/blog/942c9c89/#连接桌面">连接桌面</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#安装VNC">安装VNC</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#启动VNX">启动VNX</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#再次启动VNC">再次启动VNC</a><br/><a href="/blog/942c9c89/#安装VNC客户端">安装VNC客户端</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#如何退出VNC全屏的方法">如何退出VNC全屏的方法</a><br/><a href="/blog/942c9c89/#如何查看ubuntu版本">如何查看ubuntu版本</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#安装程序">安装程序</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/942c9c89/#查看版本">查看版本</a><br/><a href="/blog/942c9c89/#参考资料">参考资料</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 总结 #
经过我一天的瞎忙活,我发现安装后的window子系统只有一个简单的文件管理器可以用,其他的图形化工具太少了,还是算了,**老老实实用虚拟机来的实在**
也可能是我不会安装相应软件的原因吧。
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
# 安装桌面方式1 #
```shell
sudo apt-get install tasksel -y
```
```shell
sudo tasksel
```
待续.....
```shell
sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
```
```shell
sudo vim .vnc/xstartup
```
```shell
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY
LANG=zh_CN.UTF-8
# unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
```
# 安装桌面方式2 #
```shell
sudo apt-get install xubuntu-desktop
```
之后会自动安装桌面。（gnome桌面、xfce4桌面、Unity桌面、kde桌面等可自行选择，只需命令sudo install xxx就可安装了）

如果界面管理器出错就安装（没有就不用管这句）：sudo apt install lightdm 安装完成后重启系统就好了
sudo apt-get install xubuntu-desktop

## 解决错误1 ##
```shell
在处理时有错误发生：
 blueman
E: Sub-process /usr/bin/dpkg returned an error code (1)
```
创建需要的文件目录然后再安装:
```shell
sudo mv /var/lib/dpkg/info /var/lib/dpkg/info.bak
sudo mkdir /var/lib/dpkg/info
sudo apt-get update
sudo apt-get install xubuntu-desktop
```
### 合并目录 ###
```shell
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info.bak
sudo rm -rf /var/lib/dpkg/info
sudo mv /var/lib/dpkg/info.bak /var/lib/dpkg/info
```
## 解决错误2 ##
```shell
W: APT had planned for dpkg to do more than it reported back (0 vs 4).
   Affected packages: blueman:amd64
```
输入如下命令解决:
```shell
sudo dpkg -C
```
## 重启子系统 ##
以管理员身份启动windows的cmd,输入如下命令:
```cmd
net stop LxssManager
net start LxssManager
```
# 安装中文输入法 #
```shell
sudo apt install -y fcitx fcitx-googlepinyin*
```
## 配置变量 ##
```shell
sudo vim .profile
```
在文件末尾添加:
```shell
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
```
# 连接桌面 #
## 安装VNC ##
```shell
sudo apt-get install vnc4server
```
## 启动VNX ##
```shell
sudo vncserver -geometry 1366x768 :0
```
`1366x768`是表示屏幕分辨率,` :0`是表示**桌面**的端口号为零,分辨率和端口号都可以随意自行更改,只要不出错就行
然后会提示设置**连接密码**,会提示输入**两次**,然后就能看见为0的端口号在运行。
```shell
blue@DESKTOP-8ISAT6B:~$ sudo vncserver -geometry 1366x768 :0

You will require a password to access your desktops.

Password:Verify:xauth:  file /home/blue/.Xauthority does not exist

New 'DESKTOP-8ISAT6B:0 (root)' desktop is DESKTOP-8ISAT6B:0

Creating default startup script /home/blue/.vnc/xstartup
Starting applications specified in /home/blue/.vnc/xstartup
Log file is /home/blue/.vnc/DESKTOP-8ISAT6B:0.log

blue@DESKTOP-8ISAT6B:~$
```
之后输入VNC结束命令：
```shell
sudo vncserver -kill :0
```
先输入命令：
```shell
sudo vim .vnc/xstartup
```
然后复制以下内容粘贴到`xstartup`文本里:(桌面空白也用此方法解决)
```shell
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
startxfce4 &
```
## 再次启动VNC ##
```shell
sudo vncserver -geometry 1366x768 :0
```
输出如下:
```
blue@DESKTOP-8ISAT6B:~$ sudo vncserver -geometry 1366x768 :0

New 'DESKTOP-8ISAT6B:0 (root)' desktop is DESKTOP-8ISAT6B:0

Starting applications specified in /home/blue/.vnc/xstartup
Log file is /home/blue/.vnc/DESKTOP-8ISAT6B:0.log
```
可以看大这里的煮面端口是`0`(DESKTOP-8ISAT6B`:0`)
如果**显示端口是4**那么在客户端连接的就是127.0.0.1:4 (每个人的不一样，可自行修改，一般默认是0)
使用vnc客户端连接即可查看桌面，
# 安装VNC客户端 #
到vnc-viewer官网:[https://vnc-viewer.en.softonic.com/download](https://vnc-viewer.en.softonic.com/download)下载VNC客户端
然后安装,
## 如何退出VNC全屏的方法 ##
如果你不小心在VNC客户段上点击全屏后,是无法在VNC客户端结束全屏的.
不过幸好的是现在还连着Linux,所以可以杀死Linux上的VNC进程,这样Windows客户段连接不上Linux,就会自动退出.
结束vnc进程命令为.
```shell
sudo vncserver -kill :0
```
0表示为桌面端口号。

# 如何查看ubuntu版本 #
## 安装程序 ##
```shell
sudo apt-get install neofetch
```
## 查看版本 ##
```shell
neofetch
```




Win10/SubSystem/Linux/Ubuntu/
# 参考资料 #
[https://www.bilibili.com/video/av51515689/](https://www.bilibili.com/video/av51515689/)
[https://www.tkdcz.top/post/46.html](https://www.tkdcz.top/post/46.html)
