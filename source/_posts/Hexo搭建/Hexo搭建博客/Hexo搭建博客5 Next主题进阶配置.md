---
title: Hexo搭建博客5 Next主题进阶配置
categories: 
  - Hexo搭建
  - Hexo搭建博客
date: 2018-08-29 19:35:07
updated: 2019-11-05 10:32:10
abbrlink: f01200cd
---
- [实现点击出现爱心效果](/blog/f01200cd/#实现点击出现爱心效果)
- [网站底部字数统计](/blog/f01200cd/#网站底部字数统计)
    - [安装插件](/blog/f01200cd/#安装插件)
    - [修改文件](/blog/f01200cd/#修改文件)
- [保留**README.md**文件](/blog/f01200cd/#保留README-md文件)
- [设置网站的图标Favicon](/blog/f01200cd/#设置网站的图标Favicon)
- [实现统计功能](/blog/f01200cd/#实现统计功能)
    - [安装插件](/blog/f01200cd/#安装插件)
- [Dependencies: https://github.com/theme-next/hexo-symbols-count-time](/blog/f01200cd/#Dependencies-https-github-com-theme-next-hexo-symbols-count-time)
- [隐藏网页底部**powered By Hexo / 强力驱动**](/blog/f01200cd/#隐藏网页底部powered-By-Hexo-强力驱动)
- [隐藏网页底部**主题 – NexT.Gemini v6.4.0**](/blog/f01200cd/#隐藏网页底部主题-–-NexT-Gemini-v6-4-0)
- [修改字体大小](/blog/f01200cd/#修改字体大小)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 实现点击出现爱心效果 ##
原文：[https://blog.csdn.net/qq_33699981/article/details/72716951#t9](https://blog.csdn.net/qq_33699981/article/details/72716951#t9)

实现效果图：
![](https://i.imgur.com/EpUqVjH.gif)

具体实现方法：

在浏览器地址栏输入如下[http://7u2ss1.com1.z0.glb.clouddn.com/love.js](http://7u2ss1.com1.z0.glb.clouddn.com/love.js)


然后将里面的代码copy一下，新建love.js文件并且将代码复制进去，然后保存。将love.js文件放到路径`/themes/next/source/js/src`里面，然后打开`\themes\next\layout\_layout.swig`文件,在**末尾**（在前面引用会出现找不到的bug）添加以下代码：

```
<!-- 页面点击小红心 -->
<script type="text/javascript" src="/js/src/love.js"></script>
```
然后刷新浏览器就可看到效果了。

## 网站底部字数统计 ##

实现效果图：

![](https://i.imgur.com/ShrEa8j.png)

### 安装插件 ###
切换到根目录下，然后运行如下代码,安装插件。
```
npm install hexo-wordcount --save
```
### 修改文件 ###

然后在`/themes/next/layout/_partials/footer.swig`文件尾部加上：

```
<div class="theme-info">
  <div class="powered-by"></div>
  <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
</div>
```

## 保留`README.md`文件 ##

每个项目下一般都有一个 `README.md` 文件，但是使用 `hexo` 部署到仓库后，项目下是没有 `README.md` 文件的。

在 `Hexo` 目录下的 `source` 根目录下添加一个 `README.md` 文件，修改站点配置文件 `_config.yml`，将 `skip_render` 参数的值设置为
```
skip_render: README.md
```
保存退出即可。再次使用 `hexo d` 命令部署博客的时候就不会在渲染 `README.md` 这个文件了。

## 设置网站的图标Favicon ##

实现效果图


具体方法实现


在[EasyIcon](http://www.easyicon.net/)中找一张（32*32）的ico图标,或者去别的网站下载或者制作，我下载的是这个和很可爱的图标：[https://www.easyicon.net/570008-matte_white_square_icon_animals_animal_panda_sc_icon.html](https://www.easyicon.net/570008-matte_white_square_icon_animals_animal_panda_sc_icon.html)

![](https://i.imgur.com/PQNW5QZ.png)

下载后，用Photoshop调了大小(像素)：

![](https://i.imgur.com/gewa12f.png)

这里只是为了，记录着良心的图标网站，具体设置方法不细
在**主题配置文件**中配置就好了，图标和其他图片一样放在`source/images/`目录下。
```
favicon:
  small: /images/favicon-16x16-next.png
  medium: /images/favicon-32x32-next.png
  apple_touch_icon: /images/apple-touch-icon-next.png
  safari_pinned_tab: /images/logo.svg
  #android_manifest: /images/manifest.json
```
## 实现统计功能 ##

### 安装插件 ###

[https://github.com/willin/hexo-wordcount](https://github.com/willin/hexo-wordcount)这个插件已经好久没更新了，
而这个插件：
[https://github.com/theme-next/hexo-symbols-count-time](https://github.com/theme-next/hexo-symbols-count-time)
最近更新的。而且hexo-symbols-count-time的介绍是
> Symbols count and time to read of articles.
> 
> Better than [hexo-reading-time](https://github.com/ierhyna/hexo-reading-time) and faster than [hexo-worcount](https://github.com/willin/hexo-wordcount). No external dependencies.


所以当然选最快的啦。
```
npm install hexo-symbols-count-time --save
```
在主题配置文件中找到symbols_count_time然后配置如下：
```
# Dependencies: https://github.com/theme-next/hexo-symbols-count-time
symbols_count_time:
  separated_meta: true
  item_text_post: true
  item_text_total: false
  awl: 4
  wpm: 275
```
显示效果如下：

![](https://i.imgur.com/nULsorT.png)

## 隐藏网页底部`powered By Hexo / 强力驱动` ##
在主题配置文件中，找到powered键，设置enable为false就行。
```
  copyright:
  # -------------------------------------------------------------
  powered:
    # Hexo link (Powered by Hexo).
    enable: false #原本是默认打开的
    # Version info o
```
## 隐藏网页底部`主题 – NexT.Gemini v6.4.0` ##
在主题配置文件中，找到`theme:`，设置enable为false就行。
```
  theme:
    # Theme & scheme info link (Theme - NexT.scheme).
    enable: false #原本是默认打开的 设置为则false隐藏网页底部powered By Hexo / 强力驱动
    # Version info of NexT after scheme info (vX.X.X).
    version: true
```

显示效果：

![](https://i.imgur.com/hicNOt1.png)

## 修改字体大小 ##

打开`\themes\next\source\css\ _variables\base.styl`文件，将`$font-size-base`改成`16px`，如下所示：
```
$font-size-base            =16px
```
`16px`我看太大了手机上阅读不方便，留着这个方法，也许哪天我想把字体改小。


>原文链接: [Hexo搭建博客5 Next主题进阶配置](https://lanlan2017.github.io/blog/f01200cd/)
