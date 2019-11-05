---
title: hexo Coding无法部署：Coding 提示 Repo size exceeded quota 512M 仓库容量超限 512M
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 遇到问题
date: 2018-11-06 14:35:04
updated: 2019-11-04 17:02:01
abbrlink: 39481c48
---
- [问题描述](/blog/39481c48/#问题描述)
- [解决方案](/blog/39481c48/#解决方案)
    - [登录coding 清空仓库](/blog/39481c48/#登录coding-清空仓库)
    - [重新部署](/blog/39481c48/#重新部署)
    - [重新开启pages服务](/blog/39481c48/#重新开启pages服务)
    - [重新绑定域名](/blog/39481c48/#重新绑定域名)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 问题描述 ##
今天部署到coding的时候，我又无法部署了，说我超出了容量(512M),我不可能写了那么多东西,我很奇怪。
```
Coding 提示: Repo size exceeded quota: 512M (100.02%).
仓库容量超限: 512M (100.02%)， 查看您的会员计划: https://coding.net/vip
......
fatal: Could not read from remote repository.
Please make sure you have the correct access rights
and the repository exists.
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
Error: Coding 提示: Repo size exceeded quota: 512M (100.02%).
仓库容量超限: 512M (100.02%)， 查看您的会员计划: https://coding.net/vip
......
```
## 解决方案 ##

### 登录coding 清空仓库 ###
登录到coding.net,打开你的仓库，点击`设置->仓库设置->清空仓库`。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/wenti/codingcangkubuzu/qingkongcangku.png)
### 重新部署 ###
站点目录下，打开git-bash 输入命令`hexo clean&&hexo g&&hexo d`重新部署，部署后,点开`设置->项目预览`，可以看到我这次推送占用的容量为：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/wenti/codingcangkubuzu/qingkongzhihou.png)
**这个Git仓库你每部署(推送)一次,就会占用一些容量。推送多了就会超出容量限制(512M)了，所以还是不要频繁部署**。
### 重新开启pages服务 ###
清空仓库后，pages服务默认关掉了，需要重新开启,点击`代码->Pages服务`。然后开启Pages服务：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/wenti/codingcangkubuzu/kaiqipages.png)
### 重新绑定域名 ###
开启服务后，就可以使用Coding默认的域名(`https://用户名.coding.me`)来访问了。如果使用coding的默认域名的话到这里就可以了。
如果之前绑定了自己买的域名的话，清空仓库后，之前绑定的域名也失效了，需要重新绑定。但是奇怪的是，我在coding上一直绑定不上。也不知道为什么，我猜是域名解析的问题，所以我到万网上，先删除coding和github的解析，然后在重新添加Coding的解析。然后回到Coding.net上绑定域名，神奇的是，这样就可以绑定上了，最后在重新添加github的解析就行了。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/wenti/codingcangkubuzu/bangdingyuming.png)
>原文链接: [hexo Coding无法部署：Coding 提示 Repo size exceeded quota 512M 仓库容量超限 512M](https://lanlan2017.github.io/blog/39481c48/)
