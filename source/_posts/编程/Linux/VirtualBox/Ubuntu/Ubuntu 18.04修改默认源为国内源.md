---
title: Ubuntu 18.04修改默认源为国内源
categories: 
  - 编程
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-25 17:44:39
updated: 2021-03-20 10:16:12
abbrlink: 4fc37c0d
---
<div id='my_toc'><a href="/blog/4fc37c0d/#Ubuntu-18-04修改默认源为国内源" class="header_1">Ubuntu 18.04修改默认源为国内源</a>&nbsp;<br><a href="/blog/4fc37c0d/#获取当前Ubuntu版本系统代号" class="header_2">获取当前Ubuntu版本系统代号</a>&nbsp;<br><a href="/blog/4fc37c0d/#其他Ubuntu版本系统代号" class="header_3">其他Ubuntu版本系统代号</a>&nbsp;<br><a href="/blog/4fc37c0d/#备份/etc/apt/sources-list" class="header_2">备份/etc/apt/sources.list</a>&nbsp;<br><a href="/blog/4fc37c0d/#添加国内apt源" class="header_2">添加国内apt源</a>&nbsp;<br><a href="/blog/4fc37c0d/#更新程序" class="header_2">更新程序</a>&nbsp;<br><a href="/blog/4fc37c0d/#更新软件列表" class="header_3">更新软件列表</a>&nbsp;<br><a href="/blog/4fc37c0d/#更新软件" class="header_3">更新软件</a>&nbsp;<br><a href="/blog/4fc37c0d/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Ubuntu 18.04修改默认源为国内源
修改阿里源为Ubuntu 18.04默认的源
## 获取当前Ubuntu版本系统代号
```shell
lsb_release -c
```
```shell
blue@DESKTOP-8ISAT6B:~$  lsb_release -c
Codename:       bionic
```
可以看到Ubuntu 18.04代号为**`bionic`**
### 其他Ubuntu版本系统代号
同样的我们也可以得到之前任意版本的系统代号：
Ubuntu 12.04 (LTS)代号为precise。
Ubuntu 14.04 (LTS)代号为trusty。
Ubuntu 15.04 代号为vivid。
Ubuntu 15.10 代号为wily。
Ubuntu 16.04 (LTS)代号为xenial。


## 备份/etc/apt/sources.list
```shell
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
```
## 添加国内apt源
```shell
sudo vim /etc/apt/sources.list
```
****
`注释`掉其他`apt`源,然后在`/etc/apt/sources.list`文件**前面**添加如下条目:
```shell
    # 阿里云源 开始
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
    # 阿里云源 结束
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/ChangeSource/1.png)
其他Ubuntu版本的apt源,只需要替换上面的系统代号即可.

```shell
    # 中科大源 开始
    deb https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
    deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
    deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
    # 中科大源 开始
```

## 更新程序
### 更新软件列表
```shell
sudo apt-get update
```
这个命令，会访问**源列表**里的每个网址，并读取**软件列表**，然后保存在本地电脑。软件包管理器里看到的软件列表，都是通过update命令更新的。
### 更新软件
```shell
sudo apt-get upgrade
```
这个命令将**`本地已安装的软件`和`软件列表的该软件`进行对比**，如果发现已安装的软件版本太低，就会提示你更新。如果你的软件都是最新版本，会提示：
```shell
升级了 0 个软件包，新安装了 0 个软件包，要卸载 0 个软件包，有 0 个软件包未被升级。
```
**update是更新`软件列表`，upgrade是更新`软件`**。
所以一般先执行`sudo apt-get update`，再执行`sudo apt-get upgrade`
# 参考资料
[https://blog.csdn.net/beckeyloveyou/article/details/51352426](https://blog.csdn.net/beckeyloveyou/article/details/51352426)
[https://www.linuxidc.com/Linux/2019-04/158158.htm](https://www.linuxidc.com/Linux/2019-04/158158.htm)
[https://blog.csdn.net/zhangjiahao14/article/details/80554616](https://blog.csdn.net/zhangjiahao14/article/details/80554616)
[https://blog.csdn.net/xiangxianghehe/article/details/80112149](https://blog.csdn.net/xiangxianghehe/article/details/80112149)
[https://www.linuxidc.com/Linux/2018-08/153709.htm](https://www.linuxidc.com/Linux/2018-08/153709.htm)
