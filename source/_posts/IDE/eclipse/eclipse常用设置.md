---
title: eclipse常用设置
categories: 
  - IDE
  - eclipse
date: 2018-12-11 20:43:57
updated: 2020-02-12 08:10:56
abbrlink: 2b8e86b
---
<div id='my_toc'><a href="/blog/2b8e86b/#eclipse-for-JavaEE下载" class="header_2">eclipse for JavaEE下载</a>&nbsp;<br><a href="/blog/2b8e86b/#下载URL" class="header_3">下载URL</a>&nbsp;<br><a href="/blog/2b8e86b/#选择镜像" class="header_3">选择镜像</a>&nbsp;<br><a href="/blog/2b8e86b/#解压安装" class="header_3">解压安装</a>&nbsp;<br><a href="/blog/2b8e86b/#eclipse创建工作空间workspace" class="header_2">eclipse创建工作空间workspace</a>&nbsp;<br><a href="/blog/2b8e86b/#新建文件夹" class="header_3">新建文件夹</a>&nbsp;<br><a href="/blog/2b8e86b/#选择该文件夹作为workspace" class="header_3">选择该文件夹作为workspace</a>&nbsp;<br><a href="/blog/2b8e86b/#eclipse删除多余的工作区间" class="header_2">eclipse删除多余的工作区间</a>&nbsp;<br><a href="/blog/2b8e86b/#eclipse设置字体" class="header_2">eclipse设置字体</a>&nbsp;<br><a href="/blog/2b8e86b/#自动补全" class="header_2">自动补全</a>&nbsp;<br><a href="/blog/2b8e86b/#Java自动补全" class="header_3">Java自动补全</a>&nbsp;<br><a href="/blog/2b8e86b/#XML自动补全" class="header_3">XML自动补全</a>&nbsp;<br><a href="/blog/2b8e86b/#HTML自动补全" class="header_3">HTML自动补全</a>&nbsp;<br><a href="/blog/2b8e86b/#JavaScript自动补全" class="header_3">JavaScript自动补全</a>&nbsp;<br><a href="/blog/2b8e86b/#使用外部浏览器打开JavaWeb项目" class="header_2">使用外部浏览器打开JavaWeb项目</a>&nbsp;<br><a href="/blog/2b8e86b/#eclipse-使用自带暗色主题" class="header_2">eclipse 使用自带暗色主题</a>&nbsp;<br><a href="/blog/2b8e86b/#设置工作区间为UTF-8" class="header_2">设置工作区间为UTF-8</a>&nbsp;<br><a href="/blog/2b8e86b/#设置创建JSP文件使用的编码" class="header_2">设置创建JSP文件使用的编码</a>&nbsp;<br><a href="/blog/2b8e86b/#参考链接" class="header_2">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## eclipse for JavaEE下载 ##
### 下载URL ###
到[https://www.eclipse.org/downloads/packages/](https://www.eclipse.org/downloads/packages/)中找到Eclipse IDE for Java EE Developers,然后点击64位的版本
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/forJavaEEDevelopers.png)
### 选择镜像 ###
点击`>> Select Another Mirror`选择中国的镜像，这样下载可能快一点。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/selectMirror.png)
我这里选上海大学的镜像:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/shanghaiUniversityMirror.png)
### 解压安装 ###
下载好后解压缩即可使用
## eclipse创建工作空间workspace ##
### 新建文件夹 ###
先创建一个文件夹作为workspace，如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/workspace/newWorkSpace/newMulu.png)
### 选择该文件夹作为workspace ###
然后在eclipse中，依次点击file->switch workspace->others,选择这个新建的目录
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/workspace/newWorkSpace/switchWorkSpace_others.png)
点击ok即可：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/workspace/newWorkSpace/copysettings.png)
## eclipse删除多余的工作区间 ##
之前在eclipse中创建了太多的WorkSpace来放demo了,现在记录一下怎么从eclipse中删除掉这些无用的工作区间。
`window`->`Preferences`->`General`->`startup and shutdown`->`Workspaces`,然后选中，`remove`掉即可。如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/removeUselessWorkSpace.png)
## eclipse设置字体 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/textFont/font.png)
## 自动补全 ##
自动补全`Content Assist`
### Java自动补全 ###
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/java.png)
```
.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
### XML自动补全 ###
`Window`--`Preferences`--`XML`--`XML Files`--`Editor`--`Content Assist`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/xml.png)
"`<=:`"替换成:
```
<=: abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
注意a前面还有一个空格）
### HTML自动补全 ###
`Window`--`Preferences`--`Web`--`HTML Files`--`Editor`---`Content Assist`，勾选上`Automatically make suggestions`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/html.png)
"`<=:`"替换成"
```
<=: abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
(注意a前面还有一个空格)
### JavaScript自动补全 ###
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/javascript.png)
`Window`--`Preferences`--`JavaScript`--`Editor`---`Content Assist`,勾选上`Enable auto activation`启用自动补全。然后，在`Auto activation triggers for Java Script:`框中，把点号`.`设置为：
```
.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
## 使用外部浏览器打开JavaWeb项目 ##
Window--preferences--General--Web Brower​，选择Use external web browser
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/externalWeb/browser.png)
## eclipse 使用自带暗色主题 ##
`Window`->`Preferences`->`General`->`Appearance`,`Theme:`->`Dark`如下图所示
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/theme/defaultDark/defaultDark.png)
## 设置工作区间为UTF-8 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/encoding/workspace_enchoding.png)
## 设置创建JSP文件使用的编码 ##
在eclipse中，JSP文件的默认编码是ISO-8859-1，每次新增一个JSP文件，就必须手动的将JSP文件的编码格式改为UTF-8。这个挺烦人的。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/encoding/jsp.png)
这样新建的jsp就是UTF-8编码的了。
## 参考链接 ##
[Eclipse设置打开的默认浏览器](https://blog.csdn.net/qq193423571/article/details/76146046)
[https://blog.csdn.net/erlian1992/article/details/53706736](https://blog.csdn.net/erlian1992/article/details/53706736)
[Eclipse怎样删除多余workspace](https://jingyan.baidu.com/article/046a7b3ebb211df9c27fa926.html)
