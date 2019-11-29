---
title: cmd切换到 新版控制台 后没有显示文字怎么办
categories: 
  - Windows
  - CMD 批处理
  - Debug
date: 2019-10-07 00:20:19
updated: 2019-11-29 21:19:57
abbrlink: e1bf4c3f
---
<div id='my_toc'>

- [cmd切换到 新版控制台 后没有显示文字怎么办](/blog/e1bf4c3f/#cmd切换到-新版控制台-后没有显示文字怎么办)
    - [问题描述](/blog/e1bf4c3f/#问题描述)
    - [解决方案](/blog/e1bf4c3f/#解决方案)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# cmd切换到 新版控制台 后没有显示文字怎么办 #
## 问题描述 ##
今天从旧版控制台切换到新版控制台后,弹出的cmd是个黑框框,上面没有文字,好奇怪.

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191007002459946.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx,size_16,color_FFFFFF,t_70)
## 解决方案 ##
在cmd窗体顶部`右键`,选择`属性`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191007002644467.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx,size_16,color_FFFFFF,t_70)然后切换到`终端`选项卡,在终端颜色那一块,**取消勾选**`使用单独的前景`即可。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191007002826494.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx,size_16,color_FFFFFF,t_70)这样就有文字了。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191007002914887.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx,size_16,color_FFFFFF,t_70)


>原文链接: [cmd切换到 新版控制台 后没有显示文字怎么办](https://lanlan2017.github.io/blog/e1bf4c3f/)
