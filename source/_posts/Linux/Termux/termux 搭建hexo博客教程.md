---
title: termux 搭建hexo博客教程
categories: 
  - Linux
  - Termux
date: 2019-10-31 15:08:27
updated: 2019-11-01 17:29:07
abbrlink: 4a95e633
---
- [安装termux](/blog/html/4a95e633/#安装termux)
- [安装git](/blog/html/4a95e633/#安装git)
- [安装nodejs](/blog/html/4a95e633/#安装nodejs)
- [使用淘宝镜像](/blog/html/4a95e633/#使用淘宝镜像)
- [设置npm全局安装路径和全局缓存路径](/blog/html/4a95e633/#设置npm全局安装路径和全局缓存路径)
- [安装hexo](/blog/html/4a95e633/#安装hexo)
- [创建站点](/blog/html/4a95e633/#创建站点)
- [进入站点](/blog/html/4a95e633/#进入站点)
- [启动本地服务器](/blog/html/4a95e633/#启动本地服务器)
- [手机浏览器上进入网站](/blog/html/4a95e633/#手机浏览器上进入网站)
- [Termux优化](/blog/html/4a95e633/#Termux优化)
    - [终端配色](/blog/html/4a95e633/#终端配色)
    - [访问外置存储优化](/blog/html/4a95e633/#访问外置存储优化)
        - [创建QQ文件夹软连接](/blog/html/4a95e633/#创建QQ文件夹软连接)
- [清除缓存](/blog/html/4a95e633/#清除缓存)
- [复制主题](/blog/html/4a95e633/#复制主题)
- [克隆一个分支](/blog/html/4a95e633/#克隆一个分支)
- [获取管理员权限](/blog/html/4a95e633/#获取管理员权限)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 安装termux
# 安装git
```shell
pkg install git
```
# 安装nodejs
注意安装长期支持版的
```shell
pkg install nodejs-lts
```
# 使用淘宝镜像
```shell
npm config set registry http://registry.npm.taobao.org
```
# 设置npm全局安装路径和全局缓存路径
# 安装hexo
```shell
npm install hexo-cli -g
```
# 创建站点
```shell
hexo init blog
```
# 进入站点
```shell
cd blog
```
# 启动本地服务器
```shell
hexo s
```
# 手机浏览器上进入网站
[http://localhost:4000](http://localhost:4000)

# Termux优化
要翻墙，不翻墙无法访问
## 终端配色
主要使用了zsh来替代bash作为默认shell.
使用一键安装脚本来安装,一步到位,顺便启动了外置存储,可以直接访问SD卡下的目录.

执行下面这个命令确保已经安装好了curl
```shell
sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)" 
```
Android6.0以上会弹框确认是否授权,允许授权后Termux可以方便的访问SD卡文件.
脚本允许后先后有如下两个选项:
```shell
Enter a number, leave blank to not to change: 14 Enter a number, leave blank to not to change: 6
```
分别选择背景色和字体
想要继续更改挑选配色的话,继续运行脚本来再次筛选:
```shell
~/termux-ohmyzsh/install.sh
```
## 访问外置存储优化

执行过上面的zsh一键配置脚本后,并且授予文件访问权限的话,会在家目录生成storage目录，并且生成若干目录，软连接都指向外置存储卡的相应目录
### 创建QQ文件夹软连接
手机上一般经常使用手机QQ来接收文件,这里为了方便文件传输,直接在storage目录下创建软链接.
```shell
ln -s /data/data/com.termux/files/home/storage/shared/tencent/QQfile_recv qq
```
```shell
ln -s /data/data/com.termux/files/home/storage/shared/blog blog
```
# 清除缓存
```shell
npm cache clean --force
```
# 复制主题
```shell
git clone https://github.com/theme-next/hexo-theme-next themes/next
```
# 克隆一个分支
```shell
git clone -b master https://github.com/lanlan2017/ReadingNotes.git
```
```shell
git clone -b master https://github.com/lanlan2017/blog.git
```
# 获取管理员权限
没有 root 的手机是没有 root 权限的。不过 termux 给我们提供了一个解决办法可以模拟 root 权限。

我们下载安装 proot

pkg install proot
然后执行下面的命令即可获得 root 权限

termux-chroot
root 时输入exit可以退回普通用户

>原文链接: [termux 搭建hexo博客教程](https://lanlan2017.github.io/blog/4a95e633/)
