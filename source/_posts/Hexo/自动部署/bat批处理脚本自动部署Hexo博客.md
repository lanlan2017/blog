---
title: bat批处理脚本自动部署Hexo博客
categories: 
  - Hexo
  - 自动部署
date: 2018-12-07 00:23:50
updated: 2019-12-09 19:55:22
abbrlink: 5d465f14
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/5d465f14/#使用bat批处理的好处：省时间">使用bat批处理的好处：省时间</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/5d465f14/#bat脚本启动hexo本地服务器">bat脚本启动hexo本地服务器</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/5d465f14/#指令说明">指令说明</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/5d465f14/#如何使用">如何使用</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/5d465f14/#bat脚本部署hexo博客">bat脚本部署hexo博客</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 使用bat批处理的好处：省时间 ##
windows中`.bat`文件可以直接点击运行，我们可以把`多个命令`写在里面，运行这个`.bat`文件时就会运行了文件中的所有命令。这样我们运行一次，就等于运行了好多条指令,这会我们省下宝贵的时间。
## bat脚本启动hexo本地服务器 ##
```bat
@echo off
E:
cd E:\Blog\blog5
hexo s
```
### 指令说明 ###
第一条指令`@echo off`，关闭回显。
第二叫指令`E:`，切换到博客站点目录所在的盘符，我这里是E盘，
第三条指令`cd E:\Blog\blog5`，进入站点目录，我这里是`E:\Blog\blog5`
第四条指令`hexo s`，启动本地服务器。
### 如何使用 ###
把上述指令写在一个以.bat为后缀的文本文件中，放到桌面上，命名为:`启动本地服务器.bat`。点击该文件即可运行，效果如下所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/bathexo/startlocal.png)
这样就启动好本地服务器了,如果想关闭本地服务器，只需要关闭cmd黑窗口就行了。
## bat脚本部署hexo博客 ##
修改一下hexo指令就可以部署了，如下所示：
```bat
@echo off
E:
cd E:\Blog\blog5
hexo clean&&hexo g&&hexo d
```
还是在桌面创建一个名为`发布博客.bat`的文本文件，粘贴上述代码，然后点击运行，即可发布博客。发布完毕后cmd窗口会自动关闭。
>原文链接: [bat批处理脚本自动部署Hexo博客](https://lanlan2017.github.io/blog/5d465f14/)
