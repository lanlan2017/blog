---
title: Ubuntu 安装Java
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-25 18:07:50
updated: 2019-12-15 10:01:44
abbrlink: 6266bb6b
---
<div id='my_toc'><a href="/blog/6266bb6b/#Ubuntu-安装Java" class="header_1">Ubuntu 安装Java</a><br><a href="/blog/6266bb6b/#安装Oracle-java8" class="header_1">安装Oracle java8</a><br><a href="/blog/6266bb6b/#下载压缩包" class="header_2">下载压缩包</a><br><a href="/blog/6266bb6b/#解压缩" class="header_2">解压缩</a><br><a href="/blog/6266bb6b/#配置java到用户环境遍历" class="header_2">配置java到用户环境遍历</a><br><a href="/blog/6266bb6b/#获取Java安装路径" class="header_3">获取Java安装路径</a><br><a href="/blog/6266bb6b/#配置环境遍历" class="header_3">配置环境遍历</a><br><a href="/blog/6266bb6b/#让配置生效" class="header_3">让配置生效</a><br><a href="/blog/6266bb6b/#测试Java是否配置成功" class="header_3">测试Java是否配置成功</a><br><a href="/blog/6266bb6b/#系统环境变量" class="header_3">系统环境变量</a><br><a href="/blog/6266bb6b/#安装Oracle-java11" class="header_1">安装Oracle java11</a><br><a href="/blog/6266bb6b/#下载.deb安装包" class="header_2">下载.deb安装包</a><br><a href="/blog/6266bb6b/#点击安装" class="header_2">点击安装</a><br><a href="/blog/6266bb6b/#参考资料" class="header_1">参考资料</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
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
