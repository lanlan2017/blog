---
title: hexo站点恢复
categories:
  - Hexo
  - 迁移
abbrlink: 531c345b
date: 2024-06-13 16:07:21
update: 2024-06-13 16:41:21
---

# 问题描述

我固态硬盘坏掉了，保存在里面的数据都没有了，我原来的hexo站点保存在固态硬盘上，自然也跟着没有了。

不过万幸的是，我之前曾经把这个Hexo站点迁移到我的台式机上。台式机上可以正常启动本地服务器，也可以正常部署到GitHub pages。

就是我最近写的文章没有同步到台式机上，损失了一些新文章。不过也还好，损失不大。现在把Hexo站点从台式机复制到笔记本上就了可以继续写文章了，不需要重新给站点安装插件以及修改配置文件。

<!-- mode -->

# 从台式机复制整个站点到笔记本上

在台式机上，把整个站点打包成一个压缩包，复制到笔记本上。

解压缩复制好的压缩包，如果此时还没安装好node,hexo,是无法启动本地服务器的，要先安装。

如果此时还没安装好git,配置好用户名和邮箱，配置好到GitHub的SSH链接。是无法部署到Github page的。要先安装并配置好。

# 安装git

下载git的安装包，安装的时候，勾选添加到path环境变量，其他的默认安装即可。

# 配置git账号

略，看本站点相关文章。

# 设置到GitHub的SSH链接

略，看本站点相关文章。

# 安装nvm

略，看本站定相关文章。

# 安装node

为了避免不同版本的node之间可能存在不兼容的问题，保险起见，安装和台式上的node一样的版本：

```cmd
nvm install 12.22.4
```

## 使用指定版本的node

```cmd
nvm use 12.22.4
```

安装成功效果：

```cmd
C:\Users\username>nvm use 12.22.4
Now using node v12.22.4 (64-bit)

C:\Users\username>node -v
v12.22.4

C:\Users\username>npm -v
6.14.14
```

## 安装hexo

```cmd
npm install hexo-cli -g
```

安装效果：

```cmd
C:\Users\username>hexo -v
hexo-cli: 4.3.2
os: win32 10.0.19044 undefined
node: 12.22.4
v8: 7.8.279.23-node.56
uv: 1.40.0
zlib: 1.2.11
brotli: 1.0.9
ares: 1.17.1
modules: 72
nghttp2: 1.41.0
napi: 8
llhttp: 2.1.3
http_parser: 2.9.4
openssl: 1.1.1k
cldr: 37.0
icu: 67.1
tz: 2019c
unicode: 13.0

C:\Users\username>
```

# 测试

到这里，所有需要安装的软件都安装好了，因为我原来的站点上得插件我也一起复制过来了，就不需要再次安装站点的插件了。此时hexo应该可以正常执行了

## 启动本地服务器

```cmd
hexo s
```

## 部署到GitHub page

```cmd
hexo clean && hexo g && hexo d
```
