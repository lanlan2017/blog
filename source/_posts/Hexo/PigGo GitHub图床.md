---
title: PigGo GitHub图床
categories: 
  - Hexo
date: 2019-11-22 12:59:46
updated: 2019-12-09 19:55:22
abbrlink: b19c6a80
---
<div id='my_toc'><a href="/blog/b19c6a80/#生成token">生成token</a><br/><a href="/blog/b19c6a80/#下载安装PigGo">下载安装PigGo</a><br/><a href="/blog/b19c6a80/#配置PigGo">配置PigGo</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/b19c6a80/#Github图床配置">Github图床配置</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/b19c6a80/#githubPlus插件配置">githubPlus插件配置</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/b19c6a80/#同步更新删除Github">同步更新删除Github</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/b19c6a80/#配置githubPlus">配置githubPlus</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/b19c6a80/#PigGo其他配置">PigGo其他配置</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/b19c6a80/#上传快捷方式">上传快捷方式</a><br/><a href="/blog/b19c6a80/#参考连接">参考连接</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 生成token #
省略...
# 下载安装PigGo #
进入[PicGo仓库](https://github.com/Molunerfinn/PicGo)然后点击
# 配置PigGo #
详细配置见[PigGo配置手册](https://picgo.github.io/PicGo-Doc/zh/guide/#%E5%BA%94%E7%94%A8%E8%AF%B4%E6%98%8E)
## Github图床配置 ##
PigGo的Github图床配置有固定的格式:
仓库名格式为:`用户名/仓库名`
分支名设置为:`master`
Token设置为:上面获取到的`token`
存储路径可以随意,如设置为:`img/`
自定义域名格式为:
```
https://raw.githubusercontent.com/用户名/仓库名/分支名
```
这个默认的好像无法同步删除`github`上的图片,只能上传图片。所有安装`picgo-plugin-github-plus`
## githubPlus插件配置 ##
`githubPlus`可以同步相册,当在`PigGo`的相册中**删除图片后,会同步删除`github`上的图片**.
### 同步更新删除Github ###
在`插件设置`的搜索框中,输入插件的名称:`picgo-plugin-github-plus`,然后安装这个插件.
![](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/PicGo/install_plug_in.png)
### 配置githubPlus ###
这个插件的配置和上面的Github图片配置差不多一样.
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/PigGo/githubPlusSettings.png)
## PigGo其他配置 ##
### 上传快捷方式 ###
![图片_配置快捷方式](https://raw.githubusercontent.com/lanlan2017/images/master/img/Hexo/PicGo/KeyboardSetting.png)
# 参考连接 #
[PicGo仓库](https://github.com/Molunerfinn/PicGo)
[PicGo插件库](https://github.com/PicGo/Awesome-PicGo)
[picgo-plugin-github-plus仓库](https://github.com/zWingz/picgo-plugin-github-plus)
