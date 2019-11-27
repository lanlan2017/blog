---
title: Win10 安装Linux子系统
categories: 
  - 其他
  - Windows相关
date: 2019-11-27 10:49:35
updated: 2019-11-27 12:31:43
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
    - [设置中文环境](/blog/942c9c89/#设置中文环境)
- [更换国内apt源 并更新软件](/blog/942c9c89/#更换国内apt源-并更新软件)
- [安装桌面环境](/blog/942c9c89/#安装桌面环境)
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
## 设置中文环境 ##
```shell
sudo dpkg-reconfigure locales 
```
这会弹出一个界面,按**下箭头**按键,拉到最后,选择`zh_CN UTF-8 UTF-8`将系统切换为中文环境:
![](https://raw.githubusercontent.com/lanlan2017/images/master/ Win10/SubSystem/Linux/Ubuntu/14.png)
# 更换国内apt源 并更新软件 #
见这篇文章:[Ubuntu 18.04修改默认源为国内源](/blog/4fc37c0d/)
# 安装桌面环境 #
安装`ubuntu-desktop`,`unity`,`compizconfig-settings-manager`
这个几个命令会执行很长的时间,要耐心等待(先去做其他事情).一条命令安装:
```shell
sudo apt-get install ubuntu-desktop unity compizconfig-settings-manager
```

```shell
export  DISPLAY=localhost:0
```
# 安装远程桌面 VcXsrv #
VcXsrv是一个免费开源的软件，并且在SourceForget上评价也不错，下载地址为[https://sourceforge.net/projects/vcxsrv/](https://sourceforge.net/projects/vcxsrv/)
下载后安装，打开XLaunch，选择：“one large window”，Display number设置成0，其它默认即可，一路下一步


路到最后一步，推荐大家点个**保存**，要不然每次打开XLaunch都要重新设置一遍：


可以保存到桌面，下次打开的时候，直接点桌面上保存的文件就可以了：

## 配置 ##
```shell
ccsm
```
在X-windows中，即会弹出ccsm的配置界面，
按照下图配置即可


## 打开 ##
```shell
sudo compiz
```
Win10/SubSystem/Linux/Ubuntu/
# 参考资料 #
[https://www.bilibili.com/video/av51515689/](https://www.bilibili.com/video/av51515689/)
