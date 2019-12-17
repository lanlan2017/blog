---
title: eclipse启动慢
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-05-19 15:51:37
updated: 2019-12-17 05:17:08
abbrlink: af6b423c
---
<div id='my_toc'><a href="/blog/af6b423c/#eclipse自身设置的原因" class="header_1">eclipse自身设置的原因</a><br><a href="/blog/af6b423c/#指定JRE路径" class="header_2">指定JRE路径</a><br><a href="/blog/af6b423c/#关闭用不到的插件" class="header_2">关闭用不到的插件</a><br><a href="/blog/af6b423c/#被Windows-Defender拦截" class="header_1">被Windows Defender拦截</a><br><a href="/blog/af6b423c/#Windows-Defender不扫描eclipse的安装目录" class="header_2">Windows Defender不扫描eclipse的安装目录</a><br><a href="/blog/af6b423c/#解决方案" class="header_3">解决方案</a><br><a href="/blog/af6b423c/#参考资料" class="header_3">参考资料</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# eclipse自身设置的原因 #
## 指定JRE路径 ##
在`eclipse`启动的时候，它总是会搜索让其运行的`jre`,往往就是这个搜索过程让`eclipse`启动变慢了,解决方案是,在`eclipse`的配置文件`eclipse.ini`(该文件位于eclipse安装目录下)中加入-`vm`配置,直接指定`jre`的位置,减少这个搜索过程.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/StartToLoSlow/1.png)
## 关闭用不到的插件 ##
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/StartToLoSlow/2.png)
我这里用到`Git`,所以我保留的`Git integration for Eclipse-UI`这个插件,
用到了`maven`,所以我保留了`m2e Marketplace`这个插件
还用到的`Spring`,所以我保留了`Spring`相关的插件,
至于其他插件,我全部取消勾选.
到这里应该就启动快了,我的是这样,至于其他的,就先不折腾了。
# 被Windows Defender拦截 #
## Windows Defender不扫描eclipse的安装目录 ##
上面是`eclipse`中的配置,但是我发现,配置之后没有效果.我打开任务管理器发现,每次启动`eclipse`的时候,都会被`Windows Defender`拦截，如下图所示：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/StartSlow/1.png)
`Windows Defender`会先扫描`eclipse`的安装目录,确认安全后再让`eclipse`运行.扫描是很耗时的,这就造成`eclipse`启动十分缓慢.
### 解决方案 ###
打开`windows defender`,然后点击`病毒和威胁防护`,然后点击`"病毒和威胁防护"设置`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/StartSlow/2.png)
然后向下拖动滚动条,找到`排除项`,点击`添加或删除排除项`。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/StartSlow/3.png)
然后点击`添加排除项`,添加`eclipse`的安装目录即可。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/StartSlow/4.png)
### 参考资料 ###
[如何让Windows Defender不扫描指定排除文件夹](https://jingyan.baidu.com/article/5553fa829ad79e65a2393433.html)]([如何让WindowsDefender不扫描指定排除文件夹](https://jingyan.baidu.com/article/5553fa829ad79e65a2393433.html))
