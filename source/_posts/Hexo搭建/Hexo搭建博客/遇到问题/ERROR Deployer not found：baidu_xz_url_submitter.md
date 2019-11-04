---
title: ERROR Deployer not found：baidu_xz_url_submitter
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 遇到问题
date: 2018-10-30 23:47:02
updated: 2019-10-30 11:55:39
abbrlink: 2740f49f
---
- [解决方案](/blog/html/2740f49f/#解决方案)
    - [修改package.json安装最新的hexo-baidu-url-submit插件](/blog/html/2740f49f/#修改package-json安装最新的hexo-baidu-url-submit插件)
    - [配置站点配置文件](/blog/html/2740f49f/#配置站点配置文件)
        - [baidu_url_submit 配置](/blog/html/2740f49f/#baidu-url-submit-配置)
        - [deploy 配置](/blog/html/2740f49f/#deploy-配置)
    - [部署](/blog/html/2740f49f/#部署)
    - [登录熊掌号查看提交效果](/blog/html/2740f49f/#登录熊掌号查看提交效果)
    - [参考链接](/blog/html/2740f49f/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 解决方案 #
## 修改package.json安装最新的hexo-baidu-url-submit插件 ##
进入站点根目录，打开`package.json`,把hexo-baidu-url-submit配置项改为：
```
  "dependencies": {
    "hexo": "^3.7.0",
    "hexo-baidu-url-submit": "https://github.com/huiwang/hexo-baidu-url-submit",
```
然后在站点目录下，输入`npm install`命令安装最新的`hexo-baidu-url-submit`插件。安装需要一段过程，中途不要管它。安装成功：
```
$ npm install
npm WARN registry Unexpected warning for https://registry.npmjs.org/: Miscellaneous Warning ETIMEDOUT: request to https://registry.npmjs.org/xmlhttprequest failed, reason: connect ETIMEDOUT 104.16.17.35:443
npm WARN registry Using stale package data from https://registry.npmjs.org/ due to a request error during revalidation.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.4 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.4: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

updated 1 package in 266.405s
```
然后在**站点配置文件**中添加下面两个配置：
## 配置站点配置文件 ##
### baidu_url_submit 配置 ###

```
baidu_url_submit:
  count: 1000 ## 提交最新的一个链接
  host: alili.tech ## 在百度站长平台中注册的域名
  token: xxxxx ## 请注意这是您的秘钥， 所以请不要把博客源代码发布在公众仓库里!
  path: baidu_urls.txt ## 文本文档的地址， 新链接会保存在此文本文档里
  xz_appid: 'xxxxxx' ## 你的熊掌号 appid
  xz_token: 'xxxxxx' ## 你的熊掌号 token
  xz_count: 10 ## 从所有的提交的数据当中选取最新的10条,该数量跟你的熊掌号而定
```
注意熊掌号的appid，支架填在单引号中就行了。不要去掉单引号。
### deploy 配置 ###

```
deploy:
- type: git
  repo:
    coding: git@git.coding.net:你的coding/你的coding.coding.me.git #coding地址
    github: git@github.com:你的Github用户名/你的Github用户名.github.io.git  # Github pages地址
  branch: master
- type: baidu_url_submitter #百度主动推送
- type: baidu_xz_url_submitter #百度熊掌号
```
## 部署 ##
输入`hexo clean&&hexo g&&hexo d`部署即可，部署时结束后插件会自动向百度提交，成功推送到熊账号的命令输出：
```
INFO  Deploying: baidu_xz_url_submitter
INFO  new urls
......
{"success_realtime":10,"remain_realtime":0}
INFO  最新数据提交完成
INFO  all urls
......
{"success_batch":20,"remain_batch":4999980}
INFO  历史数据提交完成
INFO  Deploy done: baidu_xz_url_submitter
```
## 登录熊掌号查看提交效果 ##
提交完毕后当了百度熊掌号的链接提页面，可以看到今日的10条额度已经用完了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/baiduSEO/xiongzhanghao/yes.png)
好了，事情到这里就靠一段落了，过几天再来看效果吧。

## 参考链接 ##
参考文章：[https://alili.tech/archive/9d64fe09/](https://alili.tech/archive/9d64fe09/)
**hexo-baidu-url-submit**插件官方位置：[https://github.com/huiwang/hexo-baidu-url-submit](https://github.com/huiwang/hexo-baidu-url-submit)
>原文链接: [ERROR Deployer not found：baidu_xz_url_submitter](https://lanlan2017.github.io/blog/2740f49f/)