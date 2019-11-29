---
title: Hexo博客问题 RSS地址出错为(yoursite.com)
categories: 
  - Hexo
  - Hexo搭建博客
  - 遇到问题
date: 2018-08-29 19:35:07
updated: 2019-11-26 13:21:56
abbrlink: 2c22a8d1
---
<div id='my_toc'>

- [URL](/blog/2c22a8d1/#URL)
    - [If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'](/blog/2c22a8d1/#If-your-site-is-put-in-a-subdirectory,-set-url-as-'http-yoursite-com-child'-and-root-as-'-child-')
- [网站的地址](/blog/2c22a8d1/#网站的地址)
- [URL](/blog/2c22a8d1/#URL)
    - [If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'](/blog/2c22a8d1/#If-your-site-is-put-in-a-subdirectory,-set-url-as-'http-yoursite-com-child'-and-root-as-'-child-')
- [网站的地址](/blog/2c22a8d1/#网站的地址)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
打开**站点配置文件**，定位到url配置项，如下所示，可以看到我的网站地址错误的设置为`https://yoursite.com`
```
# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
# 网站的地址
url: https://yoursite.com/
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:
```
把站点配置文件`url`字段，改为你自己的域名即可。我这里改为域名`https://www.lansheng.net.cn/`这样就可以了，如下所示。
```
# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
# 网站的地址
url: https://www.lansheng.net.cn/
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:
```
然后后面就可以使用`hexo clean && hexo g -d`进行发布,然后就可正确使用RSS功能了。

>原文链接: [Hexo博客问题 RSS地址出错为(yoursite.com)](https://lanlan2017.github.io/blog/2c22a8d1/)
