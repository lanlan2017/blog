---
title: Ubuntu 安装intellij IDEA Ultimate
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
abbrlink: fa17fccd
date: 2019-11-25 17:52:23
updated: 2022-04-04 00:51:45
---
# Ubuntu安装intellij IDEA Ultimate
## 下载压缩包(.tar.gz)
进入[Linux下载路径](https://www.jetbrains.com/idea/download/download-thanks.html?platform=linux)
## 移动压缩包到要安装的路径
例如,我这里从桌面复制到`/usr/java/`这个路径下:
```shell
sudo cp ~/桌面/ideaIU-2019.2.4.tar.gz /usr/java/
```
## 进入复制后的路径
```shell
cd /usr/java/
```
## 解压压缩包
```shell
sudo tar -zxvf /usr/java/ideaIU-2019.2.4.tar.gz
```
## 进入bin目录
```shell
cd idea-IU-192.7142.36/bin/
```
## 启动idea
```shell
./idea.sh
```
剩下的和Window上的操作一样
## 创建桌面快捷方式
每次进入`idea`安装路径下执行`idea.sh`还是挺麻烦的,下面介绍在桌面创建这个`idea.sh`的快捷方式.
### 在桌面创建idea.desktop
```shell
cd ~/桌面
touch idea.desktop
vim idea.desktop
```
然后`vim idea.desktop`,然后写入如下内容:
```shell
[Desktop Entry]
Name=IntelliJ IDEA
Type=Application
Comment=IntelliJ IDEA
Exec=/usr/java/idea-IU-192.7142.36/bin/idea.sh
Icon=/usr/java/idea-IU-192.7142.36/bin/idea.png
Terminal=false
Categories=Developer;
```
你只需要修改`Exec`和`Icon`这两个选项为你实际的路径即可.其他的不用管。这样点击就可以运行了,点击的时候会让你选择是否信任,点击`信任`即可

# 参考资料
[https://blog.csdn.net/qq_40950957/article/details/81386387](https://blog.csdn.net/qq_40950957/article/details/81386387)
