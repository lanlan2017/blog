---
title: 更新package.json中安装好的程序
categories: 
  - JavaScript
  - NodeJS
date: 2019-12-14 10:36:39
updated: 2019-12-14 10:36:39
---
<div id='my_toc'><a href="/blog/null/#安装npm-check-updates">安装npm-check-updates</a><br/><a href="/blog/null/#查询是否后最新版本">查询是否后最新版本</a><br/><a href="/blog/null/#更新依赖文件配置">更新依赖文件配置</a><br/><a href="/blog/null/#更新软件">更新软件</a><br/><a href="/blog/null/#参考资料">参考资料</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 安装npm-check-updates
```
npm install -g npm-check-updates
```
# 查询是否后最新版本
在package.json所在的目录中,打开cmd,注意打开的是cmd,git-bash可能无效,输入:
```
npm-check-updates
```
或者使用该命令的简写:
```
ncu
```
该命令插件会去npm官网查询是否有最新版本,如果有新版本的话,显示效果如下:
```
E:\Blog\exam>ncu
Checking E:\Blog\exam\package.json
[====================] 15/15 100%
 hexo                     ^3.9.0  →  ^4.1.1
 hexo-generator-archive   ^0.1.5  →  ^1.0.0
 hexo-generator-category  ^0.1.3  →  ^1.0.0
 hexo-generator-tag       ^0.2.0  →  ^1.0.0
 hexo-renderer-ejs        ^0.3.1  →  ^1.0.0
 hexo-renderer-stylus     ^0.3.3  →  ^1.1.0
 hexo-server              ^0.3.3  →  ^1.0.0
Run ncu -u to upgrade package.json
```
# 更新依赖文件配置
按提示输入:
```
ncu -u
```
更新依赖配置文件即可.
```
E:\Blog\exam>ncu -u
Upgrading E:\Blog\exam\package.json
[====================] 15/15 100%
 hexo                     ^3.9.0  →  ^4.1.1
 hexo-generator-archive   ^0.1.5  →  ^1.0.0
 hexo-generator-category  ^0.1.3  →  ^1.0.0
 hexo-generator-tag       ^0.2.0  →  ^1.0.0
 hexo-renderer-ejs        ^0.3.1  →  ^1.0.0
 hexo-renderer-stylus     ^0.3.3  →  ^1.1.0
 hexo-server              ^0.3.3  →  ^1.0.0
Run npm install to install new versions.
```
# 更新软件
然后按提示输入:
```
npm install
```
更新软件版本即可
# 参考资料
[https://www.jianshu.com/p/f192d11b60a2](https://www.jianshu.com/p/f192d11b60a2)
[https://www.jianshu.com/p/ce9a46ae3a03](https://www.jianshu.com/p/ce9a46ae3a03)
[https://blog.csdn.net/Mweb_demo/article/details/100583577](https://blog.csdn.net/Mweb_demo/article/details/100583577)
