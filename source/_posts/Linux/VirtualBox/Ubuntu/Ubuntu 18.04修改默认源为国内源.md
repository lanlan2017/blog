---
title: Ubuntu 18.04修改默认源为国内源
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-25 17:44:39
updated: 2019-11-25 20:00:29
abbrlink: 4fc37c0d
---
<div id='my_toc'>

- [Ubuntu 18.04修改默认源为国内源](/blog/4fc37c0d/#Ubuntu-18-04修改默认源为国内源)
    - [备份/etc/apt/sources.list](/blog/4fc37c0d/#备份-etc-apt-sources-list)
    - [添加阿里云源](/blog/4fc37c0d/#添加阿里云源)
    - [更新程序](/blog/4fc37c0d/#更新程序)
- [参考资料](/blog/4fc37c0d/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# Ubuntu 18.04修改默认源为国内源 #
修改阿里源为Ubuntu 18.04默认的源

## 备份/etc/apt/sources.list ##
```shell
cp /etc/apt/sources.list /etc/apt/sources.list.bak
```
## 添加阿里云源 ##
在`/etc/apt/sources.list`文件**前面**添加如下条目:
```shell
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/ChangeSource/1.png)
## 更新程序 ##
然后执行如下命令更新:
```shell
sudo apt-get update
sudo apt-get upgrade
```
# 参考资料 #
[https://blog.csdn.net/xiangxianghehe/article/details/80112149](https://blog.csdn.net/xiangxianghehe/article/details/80112149)
[https://www.linuxidc.com/Linux/2018-08/153709.htm](https://www.linuxidc.com/Linux/2018-08/153709.htm)
