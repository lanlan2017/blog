---
title: Hexo Next正确安装配置RSS插件
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 给博客添加功能
date: 2018-10-25 19:13:51
updated: 2019-11-25 00:23:43
abbrlink: 82e4ee34
---
<div id='my_toc'>

- [安装插件](/blog/82e4ee34/#安装插件)
- [修改站点配置文件](/blog/82e4ee34/#修改站点配置文件)
- [设置RSS插件](/blog/82e4ee34/#设置RSS插件)
- [修改主题配置文件](/blog/82e4ee34/#修改主题配置文件)
- [Set rss to false to disable feed link.](/blog/82e4ee34/#Set-rss-to-false-to-disable-feed-link)
- [Leave rss as empty to use site's feed link, and install hexo-generator-feed: **npm install hexo-generator-feed --save**.](/blog/82e4ee34/#Leave-rss-as-empty-to-use-site's-feed-link,-and-install-hexo-generator-feed-npm-install-hexo-generator-feed-save)
- [Set rss to specific value if you have burned your feed already.](/blog/82e4ee34/#Set-rss-to-specific-value-if-you-have-burned-your-feed-already)
- [配置RSS](/blog/82e4ee34/#配置RSS)
- [type: atom](/blog/82e4ee34/#type-atom)
- [rss localhost:4000](/blog/82e4ee34/#rss-localhost-4000)
- [path: atom.xml](/blog/82e4ee34/#path-atom-xml)
- [](/blog/82e4ee34/#)
- [limit: 0](/blog/82e4ee34/#limit-0)
- [部署看效果](/blog/82e4ee34/#部署看效果)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

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
