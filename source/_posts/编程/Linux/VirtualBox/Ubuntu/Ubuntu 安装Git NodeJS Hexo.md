---
title: Ubuntu 安装Git NodeJS Hexo
categories: 
  - Linux
  - VirtualBox
  - Ubuntu
abbrlink: 92f73acb
date: 2019-11-25 19:55:24
updated: 2022-04-04 00:51:45
---
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
