---
title: windows系统中 使用nvm切换多个nodejs版本
categories: 
  - NodeJS
abbrlink: 102bf6f5
date: 2020-10-11 06:44:16
updated: 2022-04-04 00:51:45
---
# 使用nvm切换多个nodejs版本
## 删除本机上正在使用的nodejs
将之前安装的nodejs从本机中删除掉.
## 下载nvm nvm-windows
到github上下载最新版本的nvm-setup.zip这个压缩包:
[https://github.com/coreybutler/nvm-windows/releases](https://github.com/coreybutler/nvm-windows/releases)
解压nvm-setup.zip,得到nvm-setup.exe,点击运行nvm-setup.exe,
- 选择nvm的安装路径(E:\dev2\nvm\nvm)
  - **注意nvm的安装路径里面不能有空格**,(不要安装到类似`E:\Program Files\nvm`这类路径下)如果有空格的话使用`nvm use 版本号`的时候会报错:
  - **exit status 1...**

- 选择nodejs的安装路径(E:\dev2\nvm\nodejs)

## 使用淘宝源
使用淘宝镜像,安装的时候可以快一点.

打开nvm安装路径下的settings.txt文件,在后面添加如下两行代码:
```
node_mirror: https://npm.taobao.org/mirrors/node/
npm_mirror: https://npm.taobao.org/mirrors/npm/
```
完整配置文件如下所示
```txt E:\dev2\nvm\nvm\settings.txt
root: E:\dev2\nvm\nvm
path: E:\dev2\nvm\nodejs
node_mirror: https://npm.taobao.org/mirrors/node/
npm_mirror: https://npm.taobao.org/mirrors/npm/
```
## 查看可安装的版本
```bash
nvm list available
```
查询效果如下:
```
$ nvm list available

|   CURRENT    |     LTS      |  OLD STABLE  | OLD UNSTABLE |
|--------------|--------------|--------------|--------------|
|   14.13.1    |   12.19.0    |   0.12.18    |   0.11.16    |
|   14.13.0    |   12.18.4    |   0.12.17    |   0.11.15    |
|   14.12.0    |   12.18.3    |   0.12.16    |   0.11.14    |
|   14.11.0    |   12.18.2    |   0.12.15    |   0.11.13    |
|   14.10.1    |   12.18.1    |   0.12.14    |   0.11.12    |
|   14.10.0    |   12.18.0    |   0.12.13    |   0.11.11    |
|    14.9.0    |   12.17.0    |   0.12.12    |   0.11.10    |
|    14.8.0    |   12.16.3    |   0.12.11    |    0.11.9    |
|    14.7.0    |   12.16.2    |   0.12.10    |    0.11.8    |
|    14.6.0    |   12.16.1    |    0.12.9    |    0.11.7    |
|    14.5.0    |   12.16.0    |    0.12.8    |    0.11.6    |
|    14.4.0    |   12.15.0    |    0.12.7    |    0.11.5    |
|    14.3.0    |   12.14.1    |    0.12.6    |    0.11.4    |
|    14.2.0    |   12.14.0    |    0.12.5    |    0.11.3    |
|    14.1.0    |   12.13.1    |    0.12.4    |    0.11.2    |
|    14.0.0    |   12.13.0    |    0.12.3    |    0.11.1    |
|   13.14.0    |   10.22.1    |    0.12.2    |    0.11.0    |
|   13.13.0    |   10.22.0    |    0.12.1    |    0.9.12    |
|   13.12.0    |   10.21.0    |    0.12.0    |    0.9.11    |
|   13.11.0    |   10.20.1    |   0.10.48    |    0.9.10    |

This is a partial list. For a complete list, visit https://nodejs.org/download/release

```
## 安装指定版本的nodejs
例如安装最新的长期支持版本12.19.0:
```bash
nvm install 10.21.0
```
运行效果:
```
$ nvm install 10.21.0
Downloading node.js version 10.21.0 (64-bit)...
Complete
Creating E:\dev2\nvm\nvm\temp

Downloading npm version 6.14.4... Complete
Installing npm v6.14.4...

Installation complete. If you want to use this version, type

nvm use 10.21.0

```
## 使用指定版本的nodejs
例如使用刚才安装的版本:
```bash
nvm use 12.19.0
```
运行效果:
```
$ nvm use 12.19.0
Now using node v12.19.0 (64-bit)

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/MyGitBook
$ node -v
v12.19.0

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/MyGitBook
$ npm -v
6.14.8

```
## 查看已安装的nodejs版本
```bash
nvm list
```
运行效果:
```
$ nvm list

  * 12.19.0 (Currently using 64-bit executable)
    10.21.0

```
切换到10.21.0版本:
```bash
nvm use 10.21.0
```
运行效果:
```
$ nvm use 10.21.0
Now using node v10.21.0 (64-bit)

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/MyGitBook
$ node -v
v10.21.0

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/MyGitBook
$ npm -v
6.14.4

```
# 参考资料
[https://www.jianshu.com/p/a230bd5f6fe9](https://www.jianshu.com/p/a230bd5f6fe9)
[https://www.jianshu.com/p/7204af51fa01](https://www.jianshu.com/p/7204af51fa01)
[windows下Nodejs多版本切换](https://www.jianshu.com/p/62e44e1ace5f)
[nvm-windows下载链接](https://github.com/coreybutler/nvm-windows/releases)
[https://juejin.im/post/6844903875669917703](https://juejin.im/post/6844903875669917703)
