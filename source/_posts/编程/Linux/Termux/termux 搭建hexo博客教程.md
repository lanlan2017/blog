---
title: termux 搭建hexo博客教程
categories:
  - 编程
  - Linux
  - Termux
abbrlink: 4a95e633
date: 2019-10-31 15:08:27
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/4a95e633/#安装termux" class="header_1">安装termux</a>&nbsp;<br><a href="/blog/4a95e633/#下载termux" class="header_2">下载termux</a>&nbsp;<br><a href="/blog/4a95e633/#更换国内源" class="header_1">更换国内源</a>&nbsp;<br><a href="/blog/4a95e633/#官方方法" class="header_2">官方方法</a>&nbsp;<br><a href="/blog/4a95e633/#直接编辑源文件" class="header_2">直接编辑源文件</a>&nbsp;<br><a href="/blog/4a95e633/#修改效果" class="header_2">修改效果</a>&nbsp;<br><a href="/blog/4a95e633/#Termux获取管理员权限" class="header_1">Termux获取管理员权限</a>&nbsp;<br><a href="/blog/4a95e633/#Termux优化" class="header_1">Termux优化</a>&nbsp;<br><a href="/blog/4a95e633/#终端配色" class="header_2">终端配色</a>&nbsp;<br><a href="/blog/4a95e633/#访问外置存储优化" class="header_2">访问外置存储优化</a>&nbsp;<br><a href="/blog/4a95e633/#创建QQ文件夹软连接" class="header_3">创建QQ文件夹软连接</a>&nbsp;<br><a href="/blog/4a95e633/#安装git" class="header_1">安装git</a>&nbsp;<br><a href="/blog/4a95e633/#Termux-上搭建Hexo博客" class="header_1">Termux 上搭建Hexo博客</a>&nbsp;<br><a href="/blog/4a95e633/#安装nodejs长期支持版本" class="header_2">安装nodejs长期支持版本</a>&nbsp;<br><a href="/blog/4a95e633/#使用淘宝镜像" class="header_2">使用淘宝镜像</a>&nbsp;<br><a href="/blog/4a95e633/#安装hexo" class="header_2">安装hexo</a>&nbsp;<br><a href="/blog/4a95e633/#创建站点" class="header_2">创建站点</a>&nbsp;<br><a href="/blog/4a95e633/#进入站点" class="header_2">进入站点</a>&nbsp;<br><a href="/blog/4a95e633/#启动本地服务器" class="header_2">启动本地服务器</a>&nbsp;<br><a href="/blog/4a95e633/#手机浏览器上进入网站" class="header_2">手机浏览器上进入网站</a>&nbsp;<br><a href="/blog/4a95e633/#在非Termux目录下写博客" class="header_1">在非Termux目录下写博客</a>&nbsp;<br><a href="/blog/4a95e633/#克隆博客源码" class="header_2">克隆博客源码</a>&nbsp;<br><a href="/blog/4a95e633/#题外话" class="header_1">题外话</a>&nbsp;<br><a href="/blog/4a95e633/#设置npm全局安装路径和全局缓存路径" class="header_2">设置npm全局安装路径和全局缓存路径</a>&nbsp;<br><a href="/blog/4a95e633/#取消自定义个npm全局安装路径" class="header_2">取消自定义个npm全局安装路径</a>&nbsp;<br><a href="/blog/4a95e633/#设置Linux环境变量" class="header_2">设置Linux环境变量</a>&nbsp;<br><a href="/blog/4a95e633/#安装指定版本的nodejs" class="header_2">安装指定版本的nodejs</a>&nbsp;<br><a href="/blog/4a95e633/#安装n模块" class="header_3">安装n模块</a>&nbsp;<br><a href="/blog/4a95e633/#升级node-js到最新稳定版" class="header_3">升级node.js到最新稳定版</a>&nbsp;<br><a href="/blog/4a95e633/#查看Nodejs历史版本" class="header_3">查看Nodejs历史版本</a>&nbsp;<br><a href="/blog/4a95e633/#安装指定版本的nodejs" class="header_3">安装指定版本的nodejs</a>&nbsp;<br><a href="/blog/4a95e633/#切换到指定版本的nodejs" class="header_3">切换到指定版本的nodejs</a>&nbsp;<br><a href="/blog/4a95e633/#清除npm缓存" class="header_1">清除npm缓存</a>&nbsp;<br><a href="/blog/4a95e633/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 系统要求
> [System requirements:](https://wiki.termux.com/wiki/Main_Page)
> **Android 7.0 - 9.0 (10+ may have issues)**
> CPU: AArch64, ARM, i686, x86_64.
> At least 200 MB of disk space.

# 安装termux
官网:
[https://termux.com/](https://termux.com/)
github仓库:
[https://github.com/termux/termux-app](https://github.com/termux/termux-app)
## 下载termux ##
[f-droid 下载](https://f-droid.org/packages/com.termux/)
[Google Play 下载](https://play.google.com/store/apps/details?id=com.termux)


# 更换国内源 #
更换`Termux`清华大学源,加快软件包下载速度. 
## 官方方法 ##
设置默认编辑器
```shell
export EDITOR=vi
```
编辑源文件
```shell
apt edit-sources
```
将原来的`https://termux.net`官方源替换为`http://mirrors.tuna.tsinghua.edu.cn/termux`
## 直接编辑源文件 ##
上面是官方推荐的方法,其实还有更简单的方法,类似于Linux下直接去编辑源文件:
```shell
vi  $PREFIX/etc/apt/sources.list
```
## 修改效果 ##
```shell
u0_a391@localhost~ cat $PREFIX/etc/apt/sources.list
# The main termux repository:
# deb https://termux.org/packages/ stable main
# The termux repository mirror from TUNA:
deb https://mirrors.tuna.tsinghua.edu.cn/termux stable main

```
# 更新软件
依次输入如下命令，更新软件:
```cmd
pkg update
pkg upgrade
```

## pkg命令介绍
基本命令
Termux除了支持apt命令外,还在此基础上封装了pkg命令,pkg命令向下兼容apt命令.apt命令大家应该都比较熟悉了,这里直接简单的介绍下pkg命令:
```cmd
基本命令
Termux除了支持apt命令外,还在此基础上封装了pkg命令,pkg命令向下兼容apt命令.apt命令大家应该都比较熟悉了,这里直接简单的介绍下pkg命令:

pkg search <query>              搜索包
pkg install <package>           安装包
pkg uninstall <package>         卸载包
pkg reinstall <package>         重新安装包
pkg update                      更新源
pkg upgrade                     升级软件包
pkg list-all                    列出可供安装的所有包
pkg list-installed              列出已经安装的包
pkg shoe <package>              显示某个包的详细信息
pkg files <package>             显示某个包的相关文件夹路径
```


# Termux获取管理员权限
没有 `root` 的手机是没有 `root` 权限的。不过 `termux` 给我们提供了一个解决办法可以模拟 `root` 权限。
我们下载安装 proot
```shell
pkg install proot
```
然后执行下面的命令即可获得 root 权限
```shell
termux-chroot
```
root 时输入exit可以退回普通用户

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

# 安装git
```shell
pkg install git
```
# Termux 上搭建Hexo博客 #
## 安装nodejs长期支持版本
注意安装长期支持版的
```shell
pkg install nodejs-lts
```
卸载nodejs长期支持版本:
```shell
pkg unstall nodejs-lts
```
## 使用淘宝镜像
```shell
npm config set registry http://registry.npm.taobao.org
```
## 安装hexo
```shell
npm install hexo-cli -g
```
## 创建站点
在**用户主目录**下,输入如下命令创建一个Hexo站点:
```shell
hexo init blogTest
```
注意**必须在Termux自己的目录**下才可以**创建站点**
如果在非Termux的目录下执行上面的命令,则会报错如下:
```shell
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm WARN tar EPERM: operation not permitted, futime
npm ERR! cb() never called!

npm ERR! This is an error with npm itself. Please report this error at:
npm ERR!     <https://npm.community>
WARN  Failed to install dependencies. Please run 'npm install' manually!

```
## 进入站点
```shell
cd blogTest
```
## 启动本地服务器
```shell
hexo s
```
## 手机浏览器上进入网站
[http://localhost:4000](http://localhost:4000)

# 在非Termux目录下写博客 #
虽然在Termux下面可以搭建好Hexo,但是不好的是:手机中无法通过其他markdown软件编辑Termux中的文件。虽然使用进入Termux中使用vim编辑也是可以的,但是很麻烦.

现在我只用git管理博客源码就行了,然后通过markdown编辑软件
```shell
ln -s /data/data/com.termux/files/home/storage/shared/blog blog
```
```shell
cd ~blog
```
## 克隆博客源码
```shell
git clone -b master https://github.com/lanlan2017/blog.git
```
```shell
git clone -b master https://github.com/lanlan2017/ReadingNotes.git
```

# 题外话 #
## 设置npm全局安装路径和全局缓存路径
可以不设置
cd ~
mkdir nodejs_data
cd ~/nodejs_data
mkdir npm_global
mkdir node_cache
```shell
npm config set cache "~/nodejs_data/node_cache"
```
```shell
npm config set prefix "~/nodejs_data/npm_global"
```
上面配置好的全局安装目录的信息会下载用户home目录下的`.npmrc`文件中
```shell
cat .npmrc
```
```shell
 u0_a391@localhost  ~  cat .npmrc 
registry=http://registry.npm.taobao.org
prefix=/data/data/com.termux/files/home/nodejs_data/npm_global
cache=/data/data/com.termux/files/home/nodejs_data/node_cache

```
## 取消自定义个npm全局安装路径
删除用户home目录下的配置文件`.npmrc `中的`prefix`和`cache`即可:

## 设置Linux环境变量
```shell
cp /etc/profile /etc/profile.bak
```
```shell
vim /etc/profile
```
在最后添加:
```shell
source /etc/profile
```
## 安装指定版本的nodejs ##
node有一个模块n，是专门用来管理node.js的版本的。
### 安装n模块 ###
```shell
npm install -g n
```
### 升级node.js到最新稳定版 ###
先获取root权限
```shell
termux-chroot
```
```shell
n stable
```
### 查看Nodejs历史版本 ###
[https://nodejs.org/en/about/releases/](https://nodejs.org/en/about/releases/)
点击上面的**版本号**即可看到安装的版本,例如点击[v10](https://nodejs.org/download/release/latest-v10.x/),然后拉到最后,可以看到当前最新的nodejs 10的版本为:`v10.17.0`
```shell
node-v10.17.0.tar.xz                               22-Oct-2019 16:41            21514260
```
### 安装指定版本的nodejs ###
```shell
n v10.17.0
```
### 切换到指定版本的nodejs ###
输入
```shell
n
```
# 清除npm缓存
```shell
npm cache clean --force
```
# 参考资料 #
[https://www.sqlsec.com/2018/05/termux.html](https://www.sqlsec.com/2018/05/termux.html)
[https://www.cnblogs.com/anyun/p/8328397.html](https://www.cnblogs.com/anyun/p/8328397.html)
[https://blog.csdn.net/flw8840488/article/details/90513873](https://blog.csdn.net/flw8840488/article/details/90513873)
