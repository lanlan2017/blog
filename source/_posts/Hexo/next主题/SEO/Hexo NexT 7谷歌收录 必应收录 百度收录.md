---
title: Hexo NexT 7谷歌收录 必应收录 百度收录
categories: 
  - Hexo
  - next主题
  - SEO
date: 2019-12-01 12:12:27
updated: 2020-06-24 08:17:43
abbrlink: 242f5d55
---
# 前言
本文基于Hexo+NexT7.
# 安装生成站点地图的插件
```shell
npm install hexo-generator-sitemap --save
```
# 谷歌收录
## 验证网站所有权
先[翻墙](https://lanlan2017.github.io/blog/a1ad1d5d/),然后打开`Google Webmaster Tools`:[https://www.google.com/webmasters/tools](https://www.google.com/webmasters/tools),
登陆,然后选择获取`content`:
## 配置主题配置文件
打开主题配置文件
搜素:
```shell
google_site_verification
```
然后粘贴获取的:`content`即可:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/6.png)
## 重新部署
```shell
hexo clean&&hexo g&&hexo d
```
## 提交站点地图
重新部署后,会在`网站根目录`下生成一个`sitemap.xml`文件,先在浏览器看看是否能正确访问到这个文件.
```shell
https://lanlan2017.github.io/sitemap.xml
```
在谷歌站长工具控制台中提交sitemap.xml的地址即可.
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/1.png)
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/2.png)
然后在已提交的站点地图,点击站点地图,可以看到索引的数量:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/4.png)
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/5.png)

# 必应收录
必应收录和谷歌收录类似,必应收录不需要翻墙即可设置
# 百度收录
## 安装插件
```shell
npm install hexo-generator-baidu-sitemap --save
```
## 获取content
打开百度站长工具:[https://ziyuan.baidu.com/site/](https://ziyuan.baidu.com/site/)
点击`站点管理`,`添加网站`:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Baidu/1.png)
选择协议头,然后填入站点:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Baidu/2.png)
`设置站点领域`:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Baidu/3.png)
然后选择HTML验证,复制content的值:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Baidu/4.png)
## 配置主题配置文件
打开主题配置文件,搜索:
```shell
baidu_site_verification
```
然后粘贴获取都的`content`.
然后搜素:
```shell
baidu_push
```
设置为true即可:
```shell
baidu_push: true
```
## 重新部署
```shell
hexo clean&&hexo g&&hexo d
```
然后会在站点根目录下生成站点地图文件:`baidusitemap.xml`:
```shell
https://lanlan2017.github.io/baidusitemap.xml
```
等待部署完毕,然后点击`完成验证`。
## 提交sitemap
在百度站长工具中,点击左侧的`数据引入`,`链接提交`,
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/8.png)
然后`下拉`,选择`自动提交`,然后选择`sitemap`,粘贴`baidusitemap.xml`的地址,`提交`即可
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/9.png)

<!--
Hexo/seo/Google/
-->
# 查看被收录的文章
在搜素框中输入:
```shell
site:网站地址
```
即可查看搜素引擎收录的效果:
```shell
site:https://lanlan2017.github.io
```
例如谷歌收录的效果如下:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Goolge/10.png)
# 参考资料
[https://theme-next.org/docs/theme-settings/seo](https://theme-next.org/docs/theme-settings/seo)
