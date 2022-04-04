---
title: LinuxDeploy CentOS7 安装nodejs
categories: 
  - Linux
  - LinuxDeploy
abbrlink: b9668ed5
date: 2021-03-18 01:17:20
updated: 2022-04-04 00:51:45
---
# 使用EPEL安装 (yum安装方式)
## nodejs CentOS安装介绍
进入Github上的仓库:[https://github.com/nodesource/distributions](https://github.com/nodesource/distributions)
按下ctrl+f打开搜索，输入centos,找到要[centos对应的安装的方式](https://github.com/nodesource/distributions#installation-instructions-1)：
或者直接点击下方链接进入
> [Installation instructions](https://github.com/nodesource/distributions#installation-instructions-1)
> NOTE: If you are using RHEL 6 or CentOS 6, you might want to read about running Node.js on older distros.
> The Nodesource RPM package signing key is available here: https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL
> Run on RHEL, CentOS, CloudLinux, Amazon Linux or Fedora:
> ......
> **Node.js v12.x**
> As root
> ```
> curl -fsSL https://rpm.nodesource.com/setup_12.x | bash -
> ```
> No root privileges
> ```
> curl -fsSL https://rpm.nodesource.com/setup_12.x | sudo bash -
> ```
> ......
> To compile and install native addons from npm you may also need to install build tools:
> yum install gcc-c++ make
>  or: yum groupinstall 'Development Tools'

## 安装方法
root用户,执行命令：
```
curl -fsSL https://rpm.nodesource.com/setup_12.x | bash -
```
然后根据提示，输入命令：
```
sudo yum install -y nodejs
```
等待安装完毕即可
验证是否安装成：
```
node -v
npm -v
```
安装成功效果：
```
  正在安装    : 2:nodejs-12.21.0-1nodesource.aarch64                                                                                                              1/1 
  验证中      : 2:nodejs-12.21.0-1nodesource.aarch64                                                                                                              1/1 

已安装:
  nodejs.aarch64 2:12.21.0-1nodesource                                                                                                                                

完毕！
[root@localhost ~]# npm -v
6.14.11
[root@localhost ~]# node -v
v12.21.0
[root@localhost ~]# 
```
# 通过nvm安装
## 安装NVM
打开网址[https://github.com/nvm-sh/nvm#installing-and-updating](https://github.com/nvm-sh/nvm#installing-and-updating)
复制命令：
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```
或者
```
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```
命令进行安装NVM.
## 解决curl无法链接到raw.githubusercontent.com的问题
不知道怎么回事,命令之中无法连接到raw.githubusercontent.com，报错如下：
```
[root@localhost ~]# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (7) Failed connect to raw.githubusercontent.com:443; 拒绝连接
```
### 解决方案1
#### 下载nvm-sh源码压缩包
进入nvm-sh仓库的releases页面：[https://github.com/nvm-sh/nvm/releases](https://github.com/nvm-sh/nvm/releases),手动下载nvm-sh的.tar.gz包：[https://github.com/nvm-sh/nvm/archive/v0.37.2.tar.gz](https://github.com/nvm-sh/nvm/archive/v0.37.2.tar.gz)
#### 通过Xshell上传到系统中并解压
通过Xshell，将源码包上传到/opt目录下，然后解压：
```
[root@localhost ~]# cd /opt
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  nvm-0.37.2.tar.gz  tomcat  tomcat85
[root@localhost opt]# mkdir nvm
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  nvm  nvm-0.37.2.tar.gz  tomcat  tomcat85
[root@localhost opt]# tar -zxvf nvm-0.37.2.tar.gz -C nvm
nvm-0.37.2/
nvm-0.37.2/.dockerignore
nvm-0.37.2/.editorconfig
......
nvm-0.37.2/test/sourcing/setup
nvm-0.37.2/test/sourcing/teardown
nvm-0.37.2/update_test_mocks.sh
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  nvm  nvm-0.37.2.tar.gz  tomcat  tomcat85
```
#### 运行nvm解压后目录里面的install.sh脚本
```
[root@localhost opt]# cd nvm
[root@localhost nvm]# ls
nvm-0.37.2
[root@localhost nvm]# cd nvm-0.37.2/
[root@localhost nvm-0.37.2]# ls
bash_completion  CONTRIBUTING.md  Dockerfile  install.sh  LICENSE.md  Makefile  nvm-exec  nvm.sh  package.json  README.md  ROADMAP.md  test  update_test_mocks.sh
[root@localhost nvm-0.37.2]# ./install.sh 
=> Downloading nvm from git to '/root/.nvm'
=> 正克隆到 '/root/.nvm'...
remote: Enumerating objects: 333, done.
remote: Counting objects: 100% (333/333), done.
remote: Compressing objects: 100% (283/283), done.
remote: Total 333 (delta 38), reused 150 (delta 25), pack-reused 0
接收对象中: 100% (333/333), 177.15 KiB | 0 bytes/s, done.
处理 delta 中: 100% (38/38), done.
=> Compressing and cleaning up git repository

=> Appending nvm source string to /root/.bashrc
=> Appending bash_completion source string to /root/.bashrc
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
使NVM命令立即生效：
```
source ~/.bashrc
```
### 解决方案2
使用git克隆仓库，然后再运行install.sh脚本

## 验证nvm命令
```
[root@localhost nvm-0.37.2]# nvm list-remote
        v0.1.14
        v0.1.15
        v0.1.16
......
        v6.15.1   (LTS: Boron)
......        
        v6.17.1   (Latest LTS: Boron)
         v7.0.0
......
        v8.17.0   (Latest LTS: Carbon)
         v9.0.0
......
       v10.12.0
       v10.13.0   (LTS: Dubnium)
......
       v10.24.0   (Latest LTS: Dubnium)
        v11.0.0
.......
       v12.13.0   (LTS: Erbium)
......
       v12.20.2   (LTS: Erbium)
       v12.21.0   (Latest LTS: Erbium)
        v13.0.0
......
       v14.15.0   (LTS: Fermium)
........
       v14.15.5   (LTS: Fermium)
       v14.16.0   (Latest LTS: Fermium)
        v15.0.0
.......
       v15.10.0
       v15.11.0
[root@localhost nvm-0.37.2]# 
```
可以看到nvm安装成功了,后面可以通过nvm来更新nodejs
## nvm 安装指定版本的nodejs
```shell
nvm install v8.6.0
```
## 安装最新稳定版的nodejs
```shell
nvm install stable
```
## nvm 切换Node.js版本
```shell
nvm use v8.6.0
```
## 查看当前机器已安装node版本号
```shell
nvm list
```
## 设置默认的node版本
```shell
nvm alias default v9.5.0
```

## 升级npm
```shell
npm -g
```


# nodejs配置
## 使用淘宝镜像
```shell
npm config set registry https://registry.npm.taobao.org
```
查看设置效果：
```shell
 npm config list
```
运行效果：
```shell
[root@localhost nvm-0.37.2]# npm config set registry https://registry.npm.taobao.org
[root@localhost nvm-0.37.2]# npm config list
; cli configs
metrics-registry = "https://registry.npm.taobao.org/"
scope = ""
user-agent = "npm/6.14.11 node/v12.21.0 linux arm64"

; project config /opt/nvm/nvm-0.37.2/.npmrc
package-lock = false

; userconfig /root/.npmrc
registry = "https://registry.npm.taobao.org/"

; node bin location = /usr/bin/node
; cwd = /opt/nvm/nvm-0.37.2
; HOME = /root
; "npm config ls -l" to show all defaults.

[root@localhost nvm-0.37.2]#
```
# 参考资料
https://www.cnblogs.com/fps2tao/p/9956139.html
https://github.com/nodesource/distributions
