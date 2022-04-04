---
title: Hexo博客 百度sitemap无法抓取
categories: 
  - Hexo
  - next主题
  - Debug
abbrlink: ebaabcd4
date: 2018-10-28 10:34:03
updated: 2022-04-04 15:56:38
---
## 安装插件 ##
在站点目录下，打开git-bash,输入下面的命令安装插件。
```
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
```
## 配置站点配置文件_config.yml ##
在**站点配置文件**`_config.yml`中添加如下配置，我之前就没有在站点配置文件中填写下面的配置项。
```
Plugins:
- hexo-generator-baidu-sitemap
- hexo-generator-sitemap

baidusitemap:
    path: baidusitemap.xml
sitemap:
    path: sitemap.xml
```
## 部署 ##
输入命令:
```
hexo clean&&hexo g&&hexo d
```
部署到github和coding。
## 查看本地生成的baidusitemap.xml文件 ##
部署后打开本地站点镜像目录：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/%E9%81%87%E5%88%B0%E9%97%AE%E9%A2%98/%E7%99%BE%E5%BA%A6%E6%94%B6%E5%BD%95/baidusitemapIn_deploy_git.png)
可以看到站点目录下生成了`baidusitemap.xml`文件，把这个文件提交给百度即可。
## 确认浏览器中可以打开baidusitemap.xml文件 ##
在这之前先来确认浏览器能不能打开`baidusitemap.xml`文件：
输入地址：`https://www.lansheng.net.cn/baidusitemap.xml`是可以访问到`baidusitemap.xml`的：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/%E9%81%87%E5%88%B0%E9%97%AE%E9%A2%98/baidusitemapshow.png)
## 复制浏览器中的地址提价给百度 ##
那么剩下的就是提交到百度的链接不对了：复制浏览器上面`baidusitemap.xml`地址栏的地址：`https://www.lansheng.net.cn/baidusitemap.xml`填写到[百度sitemap提交位置](https://ziyuan.baidu.com/linksubmit/index)即可。`注意要写全url`,不要写成`www.lansheng.net.cn/baidusitemap.xml`,我之前就是没有写`https://`百度抓取的是`http://www.lansheng.net.cn/baidusitemap.xml`,这样就抓取失败了。抓取成功显示如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/%E9%81%87%E5%88%B0%E9%97%AE%E9%A2%98/%E7%99%BE%E5%BA%A6%E6%97%A0%E6%B3%95%E6%8A%93%E5%8F%96.png)
等过两天后再查看提交量，应该就可以看到sitemap提交的数目了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/%E7%99%BE%E5%BA%A6%E8%87%AA%E5%8A%A8%E6%8E%A8%E9%80%81/sitemapnotrue/sitemapyes.png)
其他配置可以点击的下面的参考链接查看：需要注意的是它这里的提交的百度链接不正确。
参考：[https://www.jianshu.com/p/9c2d6db2f855](https://www.jianshu.com/p/9c2d6db2f855)
