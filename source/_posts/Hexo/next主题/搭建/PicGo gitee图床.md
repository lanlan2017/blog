---
title: PicGo gitee图床
categories: 
  - Hexo
  - next主题
  - 搭建
abbrlink: 380c40ce
date: 2021-05-20 17:31:42
updated: 2022-04-04 15:56:38
---
Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite
# 前言
最近Github搭建的图床老是无法正常访问。所以我打算把放在github上的图床迁移到gitee上。
# PicGo上安装gitee插件
点击PicGo左侧的**插件设置**，然后在**搜索框**中输入`gitee`,安装`gitee x.x.x`这个插件:
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/1.png)
# 在gitee上创建仓库
点击gitee网站右上方的加号，选择创建仓库，或者从github导入。
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/2.png)
我原先在github上有图库了，这里选择从github导入。
# 获取gitee的token
点击gitee网站右上角的头像旁边的下拉菜单，选择**设置**，然后点击网站左侧的**安全设置**下方的**私人令牌**：
![](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/3.png)
然后单击右上方的**生成令牌**按钮：
![](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/4.png)
然后只勾选projects即可，其他的不要选：
![](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/5.png)
然后复制生成的token：
![](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/6.png)
# Gitee图床插件设置

|gitee图床插件输入框|描述|
|:---|:---|
|owner|填写你的gitee的用户名，不知道用户名可以从浏览器的地址中得到。|
|repo|填写仓库名，可从仓库的地址中复制的到|
|path|填写本次上传的图片相对于仓库根目录的路径，如果没有设置则图片保存在仓库的根路径中。还需要注意的是这个路径开头和结尾都不要带有地址符`/`。|
|token|填写刚才复制的私人令牌|

path开头和结尾不要带有地址符‘/’，也就是要写成`Blog/Hexo`，而不是`/Blog/Hexo/`或者`Blog/Hexo/`。
如果你path填写成`Blog/Hexo/`则得到的图片地址可能是

<pre>
https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo<mark>//</mark>7.png
</pre>

这种形式。

![](https://gitee.com/XiaoLan223/images/raw/master/Blog/Hexo/NextTheme/Build/PicgoGiteeImageHostingWebSite/7.png)

# 上传图片验证
到这里需要设置的都设置完了，可以上传图片查看效果。
