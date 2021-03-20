---
title: Ubuntu 安装Git NodeJS Hexo
categories: 
  - 编程
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-25 19:55:24
updated: 2021-03-20 10:16:24
abbrlink: 92f73acb
---
<div id='my_toc'><a href="/blog/92f73acb/#Ubuntu-安装-git" class="header_1">Ubuntu 安装 git</a>&nbsp;<br><a href="/blog/92f73acb/#Ubuntu-安装-nodejs" class="header_1">Ubuntu 安装 nodejs</a>&nbsp;<br><a href="/blog/92f73acb/#安装指定的版本" class="header_2">安装指定的版本</a>&nbsp;<br><a href="/blog/92f73acb/#配置Nodejs" class="header_2">配置Nodejs</a>&nbsp;<br><a href="/blog/92f73acb/#使用淘宝镜像" class="header_3">使用淘宝镜像</a>&nbsp;<br><a href="/blog/92f73acb/#产看配置是否成功" class="header_3">产看配置是否成功</a>&nbsp;<br><a href="/blog/92f73acb/#安装hexo" class="header_1">安装hexo</a>&nbsp;<br><a href="/blog/92f73acb/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Ubuntu 安装 git
```shell
sudo apt-get install git
```
# Ubuntu 安装 nodejs
## 安装指定的版本
进入[nodejs官网](https://nodejs.org/en/)查看最新的**长期执行版本(LTS)**,可以看到现在的长期支持版本为`12`.
```shell
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```
或者
```shell
wget -qO- https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```
如果要安装`nodejs10.x`则将上面的数字改成10即可,也就是:
```shell
wget -qO- https://deb.nodesource.com/setup_12.x | sudo -E bash -
```
## 配置Nodejs
### 使用淘宝镜像
```shell
npm config set registry https://registry.npm.taobao.org
```
### 产看配置是否成功
```shell
blue@blue-VirtualBox:~/桌面/Blog$ npm config ls
; cli configs
metrics-registry = "https://registry.npm.taobao.org/"
scope = ""
user-agent = "npm/6.12.1 node/v12.13.1 linux x64"

; userconfig /home/blue/.npmrc
registry = "https://registry.npm.taobao.org/"

; node bin location = /usr/bin/node
; cwd = /home/blue/桌面/Blog
; HOME = /home/blue
; "npm config ls -l" to show all defaults.

```
# 安装hexo
```shell
sudo npm install hexo-cli -g
```

# 参考资料
[https://blog.csdn.net/heiheiya/article/details/86008575](https://blog.csdn.net/heiheiya/article/details/86008575)
