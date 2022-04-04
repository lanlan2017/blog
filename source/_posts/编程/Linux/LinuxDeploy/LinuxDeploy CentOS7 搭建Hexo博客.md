---
title: LinuxDeploy CentOS7 搭建Hexo博客
categories: 
  - Linux
  - LinuxDeploy
abbrlink: 4562533d
date: 2021-03-18 03:02:03
updated: 2022-04-04 00:51:45
---
# 前言
安装hexo之前，需要先安装好nodejs,如果还没安装好nodejs，请先安装好nodejs
```shell
node -v
npm -v
npm config list
```
运行效果：
```
[root@localhost ~]# node -v
v12.21.0
[root@localhost ~]# npm -v
6.14.11
[root@localhost ~]# npm config list
; cli configs
metrics-registry = "https://registry.npm.taobao.org/"
scope = ""
user-agent = "npm/6.14.11 node/v12.21.0 linux arm64"

; userconfig /root/.npmrc
registry = "https://registry.npm.taobao.org/"

; node bin location = /usr/bin/node
; cwd = /root
; HOME = /root
; "npm config ls -l" to show all defaults.

[root@localhost ~]# 
```
# 安装hexo
```shell
npm install hexo-cli -g
```
# 创建站点或克隆已有站点
## 创建站点
创建一个名为test的站点：
```shell
hexo init test
```

## 克隆已有站点
我之前已经在github-pages部署过站点了，只需要克隆站点，然后更新命令即可。
克隆已有站点：
```shell
git clone git@github.com:lanlan2017/blog.git blog
```
进入站点目录，删除package-lock.json文件，这个文件存放的是hexo各个插件的url,可能插件的url已经更新了，删掉，后面重新安装插件，就会使用更新之后的插件url.
```shell
cd blog/
rm package-lock.json
```
安装插件
```shell
npm install
```
部分允许效果：
```
[root@localhost hexo]# git clone git@github.com:lanlan2017/blog.git blog
正克隆到 'blog'...
Warning: Permanently added the RSA host key for IP address '13.229.188.59' to the list of known hosts.
......
remote: Total 10545 (delta 902), reused 1756 (delta 838), pack-reused 8701
接收对象中: 100% (10545/10545), 4.57 MiB | 33.00 KiB/s, done.
处理 delta 中: 100% (6862/6862), done.
[root@localhost hexo]# ls
blog
[root@localhost hexo]# cd blog/
[root@localhost blog]# ls
_config.yml  FM.properties  HexoD.bat  HexoS.bat  HexoS.sh  HexoSTest.bat  KillBlog.sh  package.json  package-lock.json  scaffolds  source  StartWriting.bat  themes
[root@localhost blog]# rm package-lock.json 
rm：是否删除普通文件 "package-lock.json"？y
[root@localhost blog]# ls
_config.yml  FM.properties  HexoD.bat  HexoS.bat  HexoS.sh  HexoSTest.bat  KillBlog.sh  package.json  scaffolds  source  StartWriting.bat  themes
[root@localhost blog]# npm install
npm WARN deprecated highlight.js@9.18.5: Support has ended for 9.x series. Upgrade to @latest
......
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"arm64"})

added 535 packages from 563 contributors in 36.961s

12 packages are looking for funding
  run `npm fund` for details

[root@localhost blog]# 
```
# 测试hexo
输入如下命令，启动本地服务器：
```shell
hexo s
```
部分运行结果：
```
[root@localhost blog]# hexo s
INFO  Start processing
......
INFO  Hexo is running at http://localhost:4000 . Press Ctrl+C to stop.
```
## 浏览器查看
### 当前手机上的浏览器查看
在手机上的浏览器进入[http://localhost:4000](http://localhost:4000)即可访问该站点(我的博客)。
### 其他设备查看
#### 确保当前手机和其他设备在同一个网络下
其他设备连接到手机的同一个WiFi下，或者连接该手机的热点，或者手机连接该设备的热点。

打开浏览器，进入`http://手机IP:4000`即可访问该站点，例如此时：http://192.168.1.6:4000/

# 更新hexo插件
进入上面的站点目录
```
[root@localhost blog]# pwd
/opt/hexo/blog
[root@localhost blog]# ls
_config.yml  FM.properties  HexoS.bat  HexoSTest.bat  node_modules  package-lock.json  source            themes
db.json      HexoD.bat      HexoS.sh   KillBlog.sh    package.json  scaffolds          StartWriting.bat
```
## 手动更新
### 检查更新
```shell
npm outdated
```
运行效果：
```
[root@localhost blog]# npm outdated
Package               Current  Wanted  Latest  Location
hexo                    4.2.1   4.2.1   5.4.0  hexo-site
hexo-deployer-git       2.1.0   2.1.0   3.0.0  hexo-site
hexo-renderer-stylus    1.1.0   1.1.0   2.0.1  hexo-site
hexo-server             1.0.0   1.0.0   2.0.0  hexo-site
```
npm outdated命令介绍：[https://juejin.cn/post/6844903960784961543](https://juejin.cn/post/6844903960784961543)
可以看到hexo可以更新到5.4.0版本，hexo-deployer-git可以更新到3.0.0版本等。
### 更新package.json文件中插件的版本号
修改根目录的package.json文件，将对应插件名称所对应的版本号更改为要更新的版本号。
```
[root@localhost blog]# cat package.json 
{
......
  "hexo": {
    "version": "4.2.1"
  },
  "dependencies": {
    "hexo": "^4.2.1",
......
    "hexo-deployer-git": "^2.1.0",
......
    "hexo-renderer-stylus": "^1.1.0",
    "hexo-server": "^1.0.0"
  }
}
```
修改成如下内容
```
[root@localhost blog]# cat package.json 
{
......
  "hexo": {
    "version": "5.4.0"
  },
  "dependencies": {
    "hexo": "^5.4.0",
......
    "hexo-deployer-git": "^3.0.0",
......
    "hexo-renderer-stylus": "^2.0.1",
    "hexo-server": "^2.0.0"
  }
}
```
### 安装更新
```shell
npm install --save
```
### 回退hexo版本
如果你更新了hexo,网站可能打不开，例如我的hexo从4.2.1更新到5.4.0之后，网站打不开了，然后回退到4.2.1后，才可以正常打开网站。
把上面修改过的hexo版本修改会4.2.1即可：
```
[root@localhost blog]# cat package.json 
{
......
  "hexo": {
    "version": "4.2.1"
  },
  "dependencies": {
    "hexo": "^4.2.1",
......
    "hexo-deployer-git": "^3.0.0",
......
    "hexo-renderer-stylus": "^2.0.1",
    "hexo-server": "^2.0.0"
  }
}
```
然后安装：
```shell
npm install --save
```
也就是说**只更新插件，不要更新hexo**.
```
[root@localhost blog]# git diff package.json 
diff --git a/package.json b/package.json
index 499cb10..9085013 100644
--- a/package.json
+++ b/package.json
@@ -15,7 +15,7 @@
     "hexo": "^4.2.1",
     "hexo-abbrlink": "^2.2.1",
     "hexo-auto-category": "^0.2.0",
-    "hexo-deployer-git": "^2.1.0",
+    "hexo-deployer-git": "^3.0.0",
     "hexo-generator-archive": "^1.0.0",
     "hexo-generator-baidu-sitemap": "^0.1.9",
     "hexo-generator-category": "^1.0.0",
@@ -25,7 +25,7 @@
     "hexo-generator-tag": "^1.0.0",
     "hexo-renderer-ejs": "^1.0.0",
     "hexo-renderer-kramed": "^0.1.4",
-    "hexo-renderer-stylus": "^1.1.0",
-    "hexo-server": "^1.0.0"
+    "hexo-renderer-stylus": "^2.0.1",
+    "hexo-server": "^2.0.0"
   }
 }
[root@localhost blog]# 
```

## 自动更新
```shell
npm update
```

## 安装npm-check
```shell
npm install -g npm-check
```
