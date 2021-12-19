---
title: nvm for windows安装使用详解
categories:
  - 编程
  - NodeJS
abbrlink: 1dec4fca
date: 2021-07-10 20:22:27
updated: 2021-07-10 20:22:27
---
# 下载nvm for windows
进入如下地址下载：
<https://github.com/coreybutler/nvm-windows/releases>
或者：
```
https://github.com/coreybutler/nvm-windows/releases/download/1.1.7/nvm-setup.zip
```
# 安装到C盘
nodejs注意要安装到C盘,如果安装到其他盘，可能会造成无法切换nodejs版本。
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Windows/Software/Win10Settings/NVMForWindowsInstallationUseDetails/1.png)

当然，选择其他盘也是可以的，只不过切换nodejs版本是需要提供管理员权限，也就是执行切换命令的cmd，要以管理员权限打开。

# 修改setting.txt 添加下载node和npm的淘宝镜像

安装完后打开setting.txt添加以下内容，切换node和npm的下载镜像：
```
node_mirror: https://npm.taobao.org/mirrors/node/
npm_mirror: https://npm.taobao.org/mirrors/npm/
```
## 安装后npm -v无显示的情况
如果不使用淘宝镜像的话，安装的时候，可能只安装上node.exe，安装不上npm.exe。

# 使用nvm
## 查看可安装版本
```
nvm list available
```
运行效果：
```
PS C:\Users\18190> nvm list available
|   CURRENT    |     LTS      |  OLD STABLE  | OLD UNSTABLE |
|--------------|--------------|--------------|--------------|
|    16.4.2    |   14.17.3    |   0.12.18    |   0.11.16    |
|    16.4.1    |   14.17.2    |   0.12.17    |   0.11.15    |
|    16.4.0    |   14.17.1    |   0.12.16    |   0.11.14    |
|    16.3.0    |   14.17.0    |   0.12.15    |   0.11.13    |
|    16.2.0    |   14.16.1    |   0.12.14    |   0.11.12    |
|    16.1.0    |   14.16.0    |   0.12.13    |   0.11.11    |
|    16.0.0    |   14.15.5    |   0.12.12    |   0.11.10    |
|   15.14.0    |   14.15.4    |   0.12.11    |    0.11.9    |
|   15.13.0    |   14.15.3    |   0.12.10    |    0.11.8    |
|   15.12.0    |   14.15.2    |    0.12.9    |    0.11.7    |
|   15.11.0    |   14.15.1    |    0.12.8    |    0.11.6    |
|   15.10.0    |   14.15.0    |    0.12.7    |    0.11.5    |
|    15.9.0    |   12.22.3    |    0.12.6    |    0.11.4    |
|    15.8.0    |   12.22.2    |    0.12.5    |    0.11.3    |
|    15.7.0    |   12.22.1    |    0.12.4    |    0.11.2    |
|    15.6.0    |   12.22.0    |    0.12.3    |    0.11.1    |
|    15.5.1    |   12.21.0    |    0.12.2    |    0.11.0    |
|    15.5.0    |   12.20.2    |    0.12.1    |    0.9.12    |
|    15.4.0    |   12.20.1    |    0.12.0    |    0.9.11    |
|    15.3.0    |   12.20.0    |   0.10.48    |    0.9.10    |
This is a partial list. For a complete list, visit https://nodejs.org/download/release
PS C:\Users\18190>
```
## 参看可切换的版本
```
PS C:\Users\18190> nvm list
    12.22.3
  * 10.24.1 (Currently using 64-bit executable)
PS C:\Users\18190>
```
## 使用特定版本
```
nvm use 12.22.3
```
此时会跳出两个窗口，都点确认，就可以切换了。
## 设置npm的下载的淘宝镜像
```
npm config set registry https://registry.npm.taobao.org --global 
npm config set disturl https://npm.taobao.org/dist --global
```
## 设置npm的全局安装路径
```
npm config set prefix "G:\dev2\nvm\nodejs\node_global"
npm config set cache "G:\dev2\nvm\nodejs\node_cache"
```

# 参考资料
<https://segmentfault.com/a/1190000020807954>

<!-- Blog/Windows/Software/Win10Settings/NVMForWindowsInstallationUseDetails -->