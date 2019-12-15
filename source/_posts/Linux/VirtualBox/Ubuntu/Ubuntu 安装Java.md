---
title: Ubuntu 安装Java
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-25 18:07:50
updated: 2019-12-09 19:45:23
abbrlink: 6266bb6b
---
# Ubuntu 安装Java #
环境:VirtualBox+Ubuntu虚拟机
# 安装Oracle java8 #
## 下载压缩包 ##
进入[Java下载路径](https://www.oracle.com/technetwork/java/javase/downloads/index.html),下载`.tar.gz`格式的压缩包。

在/usr目录下创建一个名为java的目录:
```shell
cd /usr
sudo mkdir java
cd java
```
复制压缩包到java目录下
```shell
sudo cp ~/桌面/jdk-8u231-linux-x64.tar.gz /usr/java
```
## 解压缩 ##
```shell
sudo tar -zxvf jdk-8u231-linux-x64.tar.gz
```
## 配置java到用户环境遍历 ##
### 获取Java安装路径 ###
```shell
cd jdk1.8.0_231
pwd
```
```shell
/usr/java/jdk1.8.0_231
```
### 配置环境遍历 ###
```shell
vim ~/.bashrc
```
在**最后**`追加`如下命令:
```shell
export JAVA_HOME=/usr/java/jdk1.8.0_231
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

### 让配置生效 ###
```shell
source ~/.bashrc
```
### 测试Java是否配置成功 ###
```shell
java -version 
```
```
blue@blue-VirtualBox:~$ java -version
java version "1.8.0_231"
Java(TM) SE Runtime Environment (build 1.8.0_231-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.231-b11, mixed mode)
```
### 系统环境变量 ###
`~/.bashrc`配置的是**用户的环境变量**。

如果希望直接配置系统环境变量，可以直接在`/etc/profile`内直接做相同的配置过程
```shell
sudo vim /etc/profile
```
# 安装Oracle java11 #
## 下载.deb安装包 ##
进入[Java下载路径](https://www.oracle.com/technetwork/java/javase/downloads/index.html),下载`.deb`格式的安装包.

## 点击安装 ##
下载好后点击这个安装包,即可安装.
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/install/Java11/2.png)
这个安装我不知道安装到哪里去了,移除掉了.
# 参考资料 #
[https://blog.csdn.net/sangewuxie/article/details/80958611](https://blog.csdn.net/sangewuxie/article/details/80958611)
[https://blog.csdn.net/qq_39852676/article/details/90046886](https://blog.csdn.net/qq_39852676/article/details/90046886)
