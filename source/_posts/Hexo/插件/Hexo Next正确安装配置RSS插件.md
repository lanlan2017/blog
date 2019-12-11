---
title: Hexo Next正确安装配置RSS插件
categories: 
  - Hexo
  - 插件
date: 2018-10-25 19:13:51
updated: 2019-12-09 20:34:40
abbrlink: 82e4ee34
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/82e4ee34/#安装插件">安装插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/82e4ee34/#修改站点配置文件">修改站点配置文件</a><br/><a href="/blog/82e4ee34/#设置RSS插件">设置RSS插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/82e4ee34/#修改主题配置文件">修改主题配置文件</a><br/><a href="/blog/82e4ee34/#Set-rss-to-false-to-disable-feed-link">Set rss to false to disable feed link.</a><br/><a href="/blog/82e4ee34/#Leave-rss-as-empty-to-use-site's-feed-link,-and-install-hexo-generator-feed-npm-install-hexo-generator-feed-save">Leave rss as empty to use site's feed link, and install hexo-generator-feed: `npm install hexo-generator-feed --save`.</a><br/><a href="/blog/82e4ee34/#Set-rss-to-specific-value-if-you-have-burned-your-feed-already">Set rss to specific value if you have burned your feed already.</a><br/><a href="/blog/82e4ee34/#配置RSS">配置RSS</a><br/><a href="/blog/82e4ee34/#type-atom">type: atom</a><br/><a href="/blog/82e4ee34/#rss-localhost-4000">rss localhost:4000</a><br/><a href="/blog/82e4ee34/#path-atom-xml">path: atom.xml</a><br/><a href="/blog/82e4ee34/#"></a><br/><a href="/blog/82e4ee34/#limit-0">limit: 0</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/82e4ee34/#部署看效果">部署看效果</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 安装插件 ##
进入本地hexo站点目录，打开git-bash。输入以下命令
```
npm install hexo-generator-feed
```
## 修改站点配置文件 ##
hexo站点根目录下的_config.yml文件中，添加以下配置。
```
# 设置RSS插件
plugin:
- hexo-generator-feed
#Feed Atom
feed:
  type: atom
  path: atom.xml
  limit: 0 #0表示生成全部文章的RSS链接，其他
```
## 修改主题配置文件 ##
打开主题目录下的_config.yml文件，找到rss配置项，在后面添加如下配置：
```
# Set rss to false to disable feed link.
# Leave rss as empty to use site's feed link, and install hexo-generator-feed: `npm install hexo-generator-feed --save`.
# Set rss to specific value if you have burned your feed already.
rss: /atom.xml

# 配置RSS
#feed: 
  #feed 类型 (atom/rss2)
#  type: atom
#  rss localhost:4000
#  path: atom.xml
#  #在 rss 中最多生成的文章数(0显示所有)
#  limit: 0 #显示所有的文章
```
主题配置文件中的feed配置项，注释掉,因为已经在站点配置文件配置了，在主题配置文件虽然也可以使用RSS，但是只能默认生成20条，及时就该limit也不行，不知道为什么。
## 部署看效果 ##
输入命令`hexo -d`部署到GithHub上，点击RSS按钮即可订阅整个站点的文章。

参考：[https://blog.csdn.net/u011303443/article/details/52333695](https://blog.csdn.net/u011303443/article/details/52333695)

>原文链接: [Hexo Next正确安装配置RSS插件](https://lanlan2017.github.io/blog/82e4ee34/)
