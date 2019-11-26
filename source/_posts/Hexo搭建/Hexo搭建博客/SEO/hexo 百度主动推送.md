---
title: hexo 百度主动推送
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - SEO
date: 2018-10-31 11:18:30
updated: 2019-11-25 00:23:43
abbrlink: 7ac3f85
---
<div id='my_toc'>

- [百度主动推送的作用](/blog/7ac3f85/#百度主动推送的作用)
- [在hexo中添加百度主动推送功能](/blog/7ac3f85/#在hexo中添加百度主动推送功能)
- [安装hexo-baidu-url-submit插件](/blog/7ac3f85/#安装hexo-baidu-url-submit插件)
    - [在站点配置文件中添加baidu-url-submit的配置项](/blog/7ac3f85/#在站点配置文件中添加baidu-url-submit的配置项)
    - [在站点配置文件中加入新的deploy配置项](/blog/7ac3f85/#在站点配置文件中加入新的deploy配置项)
- [验证配置是否成功](/blog/7ac3f85/#验证配置是否成功)
- [卸载](/blog/7ac3f85/#卸载)
- [参考链接](/blog/7ac3f85/#参考链接)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 百度主动推送的作用 ##
> 作用：某些主机，比如Github，禁止百度爬虫访问博客，导致博客无法被百度收录。多亏百度提供了主动提交的接口，这才有了个补救的方法。除此之外， 使用主动推送还会达到如下功效：
- 及时发现：可以缩短百度爬虫发现您站点新链接的时间，使新发布的页面可以在第一时间被百度收录
- 保护原创：对于网站的最新原创内容，使用主动推送功能可以快速通知到百度，使内容可以在转发之前被百度发现

## 在hexo中添加百度主动推送功能 ##
## 安装hexo-baidu-url-submit插件 ##
首先，在**Hexo站点根目录**下，打开git-bash，输入下面命令安装插件：
```
npm install hexo-baidu-url-submit --save
```
### 在站点配置文件中添加baidu-url-submit的配置项 ###
把以下内容配置到**站点配置文件_config.yml**中。
```
#设置百度主动推送
baidu_url_submit:
  count: 200  #比如200，代表提交最新的200个链接
  host: www.lansheng.net.cn # 在百度站长平台中注册的域名，这个改为你自己的域名
  token: your_token # 请注意这是您的秘钥， 所以请不要把博客源代码发布在公众仓库里!
  path: baidu_urls.txt # 文本文档的地址， 新链接会保存在此文本文档里，这个默认
```
这个秘钥可以从百度站长平台的自动推送接口那里获取到，如下图所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/SEO/baiduzidongtuisong/baiduzidongtuisong.png)

### 在站点配置文件中加入新的deploy配置项 ###
同样在**站点配置文件**中找到deploy项，添加新的推送项，如下所示：
```
deploy:
- type: git
  repo:
    coding: git@git.coding.net:你的coding用户名/你的coding用户名.coding.me.git #coding地址
    github: git@github.com:你的github用户名/你的github用户名.github.io.git  # Github地址
  branch: master
- type: baidu_url_submitter
```
## 验证配置是否成功 ##
最后输入命令hexo s看看能不能启动本地服务器，如果就没问题了。可以输入命令hexo d部署即可。
成功不是可以在git-bash中看到如下的信息：
```
INFO  Deploying: baidu_url_submitter
INFO  Submitting urls
......
{"remain":4999900,"success":100}
INFO  Deploy done: baidu_url_submitter
```
就说明主动推送成功了。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/baiduSEO/zidongtuisong/yes.png)
## 卸载 ##
最近我新建一个站点`xuexi`，我自己个人看看就行了，不需要百度百度主动推送，和熊掌号的功能，使用这个插件还会占用时间所以，卸载：`npm uninstall hexo-baidu-url-submit`
```
lan@DESKTOP-8ISAT6B MINGW64 /E/Blog/xuexi
$ npm uninstall hexo-baidu-url-submit
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.4 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.4: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})
removed 2 packages and audited 7436 packages in 11.162s
found 2 vulnerabilities (1 low, 1 moderate)
  run `npm audit fix` to fix them, or `npm audit` for details
```
然后在站点配置文件中，删除上面的配置项，即可。
## 参考链接 ##
参考文章:[https://www.jianshu.com/p/f37452d4978e](https://www.jianshu.com/p/f37452d4978e)
插件GitHub地址:[https://github.com/huiwang/hexo-baidu-url-submit](https://github.com/huiwang/hexo-baidu-url-submit)
官方说明文档：[https://hui-wang.info/2016/10/23/Hexo%E6%8F%92%E4%BB%B6%E4%B9%8B%E7%99%BE%E5%BA%A6%E4%B8%BB%E5%8A%A8%E6%8F%90%E4%BA%A4%E9%93%BE%E6%8E%A5/](https://hui-wang.info/2016/10/23/Hexo%E6%8F%92%E4%BB%B6%E4%B9%8B%E7%99%BE%E5%BA%A6%E4%B8%BB%E5%8A%A8%E6%8F%90%E4%BA%A4%E9%93%BE%E6%8E%A5/)

>原文链接: [hexo 百度主动推送](https://lanlan2017.github.io/blog/7ac3f85/)
