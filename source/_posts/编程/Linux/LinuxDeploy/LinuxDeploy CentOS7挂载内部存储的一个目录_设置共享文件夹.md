---
title: LinuxDeploy CentOS7挂载内部存储的一个目录_设置共享文件夹
categories: 
  - 编程
  - Linux
  - LinuxDeploy
abbrlink: ff69adec
date: 2021-04-03 23:18:21
updated: 2021-04-04 14:02:57
---
<div id='my_toc'><a href="/blog/ff69adec/#成功安装CentOS后再设置挂载点" class="header_1">成功安装CentOS后再设置挂载点</a>&nbsp;<br><a href="/blog/ff69adec/#在Linux中创建共享文件夹（挂载点）" class="header_1">在Linux中创建共享文件夹（挂载点）</a>&nbsp;<br><a href="/blog/ff69adec/#进入-mnt目录" class="header_2">进入/mnt目录</a>&nbsp;<br><a href="/blog/ff69adec/#创建共享目录" class="header_2">创建共享目录</a>&nbsp;<br><a href="/blog/ff69adec/#获取共享目录路径" class="header_2">获取共享目录路径</a>&nbsp;<br><a href="/blog/ff69adec/#SD卡中创建共享目录" class="header_1">SD卡中创建共享目录</a>&nbsp;<br><a href="/blog/ff69adec/#LinuxDeploy上设置挂载点" class="header_1">LinuxDeploy上设置挂载点</a>&nbsp;<br><a href="/blog/ff69adec/#停止服务" class="header_2">停止服务</a>&nbsp;<br><a href="/blog/ff69adec/#输入挂载点的源地址和目的地址" class="header_2">输入挂载点的源地址和目的地址</a>&nbsp;<br><a href="/blog/ff69adec/#配置系统" class="header_1">配置系统</a>&nbsp;<br><a href="/blog/ff69adec/#启动系统" class="header_1">启动系统</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 成功安装CentOS后再设置挂载点
先安装好CentOS，然后启动CentOS，通过SSH客户端连接到CentOS中，然后创建挂载点。
不要在安装CentOS的时候就设置挂载点，此时Linux中还没有你要挂载的目录，这样会造成Linux安装失败。
# 在Linux中创建共享文件夹（挂载点）
启动Linux，然后
## 进入/mnt目录
```
[root@localhost ~]# clear
[root@localhost ~]# cd /mnt
[root@localhost mnt]# ls
[root@localhost mnt]# 
```
## 创建共享目录
```
[root@localhost mnt]# mkdir ShareFolder
[root@localhost mnt]# ls
ShareFolder
[root@localhost mnt]#
```
## 获取共享目录路径
```
[root@localhost mnt]# cd files/
[root@localhost ShareFolder]# pwd
/mnt/ShareFolder
[root@localhost ShareFolder]# 
```
我这里设置的路径为`/mnt/ShareFolder`；
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/LinuxDeploy/SetMountPoints/1.png)

# SD卡中创建共享目录
打开手机上的文件管理器，在SD卡根目录下创建一个ShareFolder目录：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/LinuxDeploy/SetMountPoints/2.png)

这样就得到了两个目录：
- Linux上的：`/mnt/ShareFolder`
- 手机SD卡上的：`/sdcard/ShareFolder`


# LinuxDeploy上设置挂载点
## 停止服务
挂载之前先点击下方的**停止**按钮，先停止服务。然后点击右下角的按钮，设置系统的属性：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/LinuxDeploy/SetMountPoints/3.png)
## 输入挂载点的源地址和目的地址
源地址是SD卡上的地址，目的地址是Linux上的地址：
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/LinuxDeploy/SetMountPoints/4.png)

# 配置系统
然后点击右上角的三点按钮，然后选择配置。
# 启动系统
配置完毕后，点击**启动**按钮系统即可
<!-- Blog/Programming/Linux/LinuxDeploy/SetMountPoints/ -->
