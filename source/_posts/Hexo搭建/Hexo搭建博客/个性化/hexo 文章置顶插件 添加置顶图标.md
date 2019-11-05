---
title: hexo 文章置顶插件 添加置顶图标
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 个性化
date: 2019-02-15 21:49:16
updated: 2019-11-04 17:02:01
abbrlink: 7162b91b
---
- [卸载hexo-generator-index插件](/blog/7162b91b/#卸载hexo-generator-index插件)
- [安装hexo-generator-index-pin-top插件](/blog/7162b91b/#安装hexo-generator-index-pin-top插件)
- [添加front-matter配置项](/blog/7162b91b/#添加front-matter配置项)
- [重新部署](/blog/7162b91b/#重新部署)
- [添加置顶标识](/blog/7162b91b/#添加置顶标识)
- [参考资料](/blog/7162b91b/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
已经有了有大佬开发了置顶插件了，安装插件，然后在front-matter中配置一下就好了
## 卸载hexo-generator-index插件 ##
hexo站点目录下，输入下面命令卸载插件
```
npm uninstall hexo-generator-index --save
```
## 安装hexo-generator-index-pin-top插件 ##
hexo站点目录下，输入下面命令安装插件
```
npm install hexo-generator-index-pin-top --save
```
## 添加front-matter配置项 ##
在需要置顶的文章的Front-matter中加上`top: true`即可实现文章置顶功能。
## 重新部署 ##
```
hexo clean &&hexo s
```
这样就可以看到置顶的文章了，但是还没有显示置顶标签，下面来添加置顶标识。
## 添加置顶标识 ##
打开：`/blog/themes/next/layout/_macro` 目录下的`post.swig`文件，定位到`<div class="post-meta">`标签，在该标签下面，插入如下代码：
```html
        <div class="post-meta">
	  <!-- 置顶插件添加 开始 -->
	  {% if post.top %}
	       <font color="#1fa67a"><i class="fa fa-arrow-up"></i>
	       <strong>Top</strong></font>
	       <span class="post-meta-divider">|</span>
          {% endif %}
	  <!-- 置顶插件添加 结束 -->
	   .........
```
如果显示出现了中文乱码,则把`post.swig`转为`utf-8`格式即可,转换步骤：全选`post.swing`中的内容,然后修改`post.swing`的编码为utf-8,然后粘贴到`post.swing`中,这样就修改了post.swing的编码格式了。
显示效果：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/gexinghua/top/1.png)

## 参考资料 ##
插件github地址: [https://github.com/netcan/hexo-generator-index-pin-top](https://github.com/netcan/hexo-generator-index-pin-top)
开发插件的大佬的教程: [http://www.netcan666.com/2015/11/22/解决Hexo置顶问题/](http://www.netcan666.com/2015/11/22/%E8%A7%A3%E5%86%B3Hexo%E7%BD%AE%E9%A1%B6%E9%97%AE%E9%A2%98/)
添加置顶图标教程: [http://wangwlj.com/2018/01/09/blog_pin_post/](http://wangwlj.com/2018/01/09/blog_pin_post/)
Hexo博客功能优化: [https://www.itfanr.cc/2017/12/06/hexo-blog-optimization/#文章置顶](https://www.itfanr.cc/2017/12/06/hexo-blog-optimization/#%E6%96%87%E7%AB%A0%E7%BD%AE%E9%A1%B6)
[如何使用FrontAwesome图标](https://www.lansheng.net.cn/blog/4181f9ed/)
>原文链接: [hexo 文章置顶插件 添加置顶图标](https://lanlan2017.github.io/blog/7162b91b/)
