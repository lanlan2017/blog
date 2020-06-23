---
title: Hexo搭建
categories:
  - Hexo
  - 搭建
comments: false
abbrlink: 57ee7c1d
date: 2018-08-26 23:59:13
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/57ee7c1d/#Sidebar-Avatar" class="header_1">Sidebar Avatar</a>&nbsp;<br><a href="/blog/57ee7c1d/#Deployment" class="header_1">Deployment</a>&nbsp;<br><a href="/blog/57ee7c1d/#Docs-https//hexo-io/docs/deployment-html" class="header_2">Docs: https://hexo.io/docs/deployment.html</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
<!-- <script type="text/javascript" src="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/search_children.js" homePageName="返回首页" homePageUrl="/"></script> -->
# 基本配置
## 修改菜单
在菜单中添加链接。编辑 **主题配置文件** ， 取消`categories`前面的注释`#`，添加 categories 到 menu 中，如下: 
```
menu:
  home: / || home
  #about: /about/ || user
  tags: /tags/ || tags
  categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat
```
然后，开启本地服务器，显示效果如下：

![](https://i.imgur.com/URgDMoO.png)
## 添加标签页面
### 创建页面
```cmd
hexo new page tags
```
### 打开菜单
```yml
menu:
  home: / || home
  #about: /about/ || user
  tags: /tags/ || tags
  categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat
```

## 设置代码高亮主题

NexT 使用 Tomorrow Theme 作为代码高亮，共有5款主题供你选择。 NexT 默认使用的是 白色的 normal 主题，可选的值有 normal，night， night blue， night bright， night eighties： 

在**主题配置文件**中，更改 `highlight_theme` 字段，将其值设定成你所喜爱的高亮主题，例如：
```
highlight_theme: night
```
这样，代码框部分就显示如下了。这个根据个人喜好配置。
![](https://i.imgur.com/8OVB603.png)
## 设置头像
打开**主题配置文件**,查找`avatar`,设置头像的路径(url):
```
# Sidebar Avatar
avatar:
  # In theme directory (source/images): /images/avatar.gif
  # In site directory (source/uploads): /uploads/avatar.gif
  # You can also use other linking images.
  url: /images/avatar.jpg
  # If true, the avatar would be dispalyed in circle.
  rounded: true
  # The value of opacity should be choose from 0 to 1 to set the opacity of the avatar.
  opacity: 1
  # If true, the avatar would be rotated with the cursor.
  rotated: false
```
配置解释：
- `url: /images/avatar.jpg`,这个表示头像的路径在博客站点目录下`source`目录下的`images`目录下。这就是这样的形式`\blog7\source\images`。
- `rounded: true`表示图像显示的方式，false则显示方形,true则显示圆形
- `rotated: false`表示当鼠标碰到头像的时候,是否旋转头像.
- `opacity: 1`这个是不透明度值,可以设置从0到1的任意小数,如设置为0.5.

## 设置图标
在主题配置文件中,查找`favicon:`,然后设置对应的图片。图片路径还是在博客站点目录下`source`目录下的`images`目录下。这就是这样的形式`\blog7\source\images`。
```
favicon:
  small: /images/favicon-16x16-next.png
  medium: /images/favicon-32x32-next.png
  apple_touch_icon: /images/apple-touch-icon-next.png
  safari_pinned_tab: /images/logo.svg
  #android_manifest: /images/manifest.json
  #ms_browserconfig: /images/browserconfig.xml
```
还有就是图片的名字不要乱改成其他名字,使用配置文件中默认的即可.这样在后续重新搭建一个hexo博客的时候，就可以吧`images`目录直接复制过去使用.就不用再浪费时间重新配置一次。
### 图标显示N的问题
上面的设置后就可以正常显示图标了，如果图标还没显示出来,按下`Ctrl+F5`直接从服务器加载开开.如果还不行的话,到主题的图标文件夹：`\blog7\themes\next\source\images`中删除,或者替换同名的图片即可,也就是:
```
favicon-16x16-next.png
favicon-32x32-next.png
apple-touch-icon-next.png
logo.svg
```
还有就是替换`loading.gif`可以实现自定义的图片加载效果。
## 开启打赏
在主题配置文件中,查找`reward:`然后设置对应的图片即可。图片要先放到博客站点目录下`source`目录下的`images`目录下。这就是这样的形式`\blog7\source\images`。
```
reward:
  enable: true
  #comment: 欢迎打赏.
  wechatpay: /images/wechatpay.jpg
  alipay: /images/alipay.jpg
  #bitcoin: /images/bitcoin.jpg
```
## 修改内容区域显示宽度
[http://theme-next.iissnan.com/faqs.html#custom-content-width](http://theme-next.iissnan.com/faqs.html#custom-content-width)
如何更改内容区域的宽度？
NexT 对于内容的宽度的设定如下：
- 700px，当屏幕宽度 < 1600px
- 900px，当屏幕宽度 >= 1600px
- 移动设备下，宽度自适应
如果你需要修改内容的宽度，同样需要编辑样式文件。 编辑主题的 `source/css/_variables/custom.styl `文件，新增变量：
```styl
// 修改成你期望的宽度
$content-desktop = 700px
// 当视窗超过 1600px 后的宽度
$content-desktop-large = 900px
```
## 修改代码块字体
默认的字体太大了,会溢出代码块,为了避免反复拖拽滚动条,我选择把字体改小。
[http://theme-next.iissnan.com/faqs.html#custom-font](http://theme-next.iissnan.com/faqs.html#custom-font)
编辑主题下的 `source/css/_variables/custom.styl` 文件，新增下面变量变量： 
```
// 代码字体的大小
$code-font-size = 12px
```
我这里调整代码时为了在移动端,可以多看点,免得我反复拖动.
# 插件
## 插件库
[https://hexo.io/plugins/](https://hexo.io/plugins/)
## 本地搜索
[hexo-generator-search](https://github.com/wzpan/hexo-generator-search)
### 安装
```cmd
npm install hexo-generator-search --save
```
### 修改站点配置文件
添加:
```cmd
search:
  path: search.xml
  field: post
  content: true
```
### 修改Next主题配置文件
找到`local_search:`，把enable改为true即可。
```
local_search:
    enable: true
```
## github远程仓库推送
插件github:[hexo-deployer-git](https://github.com/hexojs/hexo-deployer-git)

### 安装
```cmd
npm install hexo-deployer-git --save
```
### 修改站点配置文件
```
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
- type: git
  repo:
    github: git@github.com:XXXXXXXXX/XXXXXXXXX.github.io.git  # Github pages地址
  branch: master
```
## 持久化链接
插件位置:[hexo-abbrlink](https://github.com/rozbo/hexo-abbrlink)
### 安装
```cmd
npm install hexo-addlink --save
```
### 修改站点配置文件
`站点配置文件`中查找`permalink`:,把`permalink: :year/:month/:day/:title/`修改为:
```
permalink: blog/:abbrlink/ #blog可以修改为其他信息,blog
```
`站点配置文件`中设置算法:
```
abbrlink:
  alg: crc32  # 算法：crc16(default) and crc32
  rep: hex    # 进制：dec(default) and hex
```
## 文章置顶
### 卸载hexo-generator-index插件
hexo站点目录下，输入下面命令卸载插件
```cmd
npm uninstall hexo-generator-index --save
```
### 安装hexo-generator-index-pin-top插件
hexo站点目录下，输入下面命令安装插件
```cmd
npm install hexo-generator-index-pin-top --save
```
添加`front-matter`配置项

在需要置顶的文章的`Front-matter`中加上`top: true`即可实现文章置顶功能。
# 问题
## 端口被占用 则修改端口
### 临时改动
如果你想修改端口，可以通过如下命令来指定端口:
```cmd
hexo s -p 4007
```
这个是临时改动而已,当你下一次使用`hexo s`,来启动的时候还是在默认端口`4000`.
## 永久改动
永久改动的话,有的人推荐修改`hexo-server`的源文件,但是我不建议这么做,这里可以通过`批处理文件`实现,免去每次手动写出`hexo s -p 4007`,首先创建一个名字为`启动博客.bat`的批处理文件,然后写上如下几条命令:
```bat
::关闭回显
@echo off
::切换到博客所在的盘符
E:
::进入站点目录
cd E:\Blog\blog7
::在4007端口运行程序
hexo s -p 4007
```
然后把`启动博客.bat`放到桌面中,下次点击一下就可以在4007端口下启动博客了。这样做的好处就是可以,启动多个网站.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/Port/1.png)

# 自定义样式
修改的文件位置:`blog7\themes\next\source\css\_custom\custom.styl`.
## 修改代码段样式
打开`blog7\themes\next\source\css\_custom\custom.styl`这个文件,添加如下的样式代码:
```css
/* 自定义代码块样式 */
code {
    color: #c7254e;
    background-color: #f9f2f4;
}
```
这个样式是我从CSDN上的代码段样式中复制下来的,个人觉得比较好看.
# 参考资料
[hexo修改默认端口](https://www.leiyawu.com/2018/04/20/hexo%E4%BF%AE%E6%94%B9%E9%BB%98%E8%AE%A4%E7%AB%AF%E5%8F%A3/)
