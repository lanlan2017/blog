---
title: git clone速度太慢
categories: 
  - Git
date: 2019-08-12 12:55:50
updated: 2019-11-14 11:39:26
abbrlink: 1f883a6b
---
<div id='my_toc'>

- [问题描述](/blog/1f883a6b/#问题描述)
- [分析原因](/blog/1f883a6b/#分析原因)
- [解决方案](/blog/1f883a6b/#解决方案)
    - [查找域名对应IP地址](/blog/1f883a6b/#查找域名对应IP地址)
    - [添加IP和域名到hosts文件](/blog/1f883a6b/#添加IP和域名到hosts文件)
    - [保存更新DNS](/blog/1f883a6b/#保存更新DNS)
    - [测试git clone](/blog/1f883a6b/#测试git-clone)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
**`本文转自`**:[https://blog.csdn.net/shahuhu000/article/details/83965642#commentBox](https://blog.csdn.net/shahuhu000/article/details/83965642#commentBox)
# 问题描述 #
最近发现使用git clone的速度比较慢，于是找到了办法分享给大家：
# 分析原因 #
`git clone`特别慢是因为`github.global.ssl.fastly.net`域名被限制了。只要找到这个域名对应的ip地址,然后在`hosts`文件中加上`ip 域名`的映射，刷新`DNS`缓存便可。
# 解决方案 #
## 查找域名对应IP地址 ##
在网站[https://www.ipaddress.com/](https://www.ipaddress.com/)分别搜索：
```
github.global.ssl.fastly.net
github.com
```
得到域名对应的IP地址如下:

|Name|Type|Data|
|:---|:---|:---|
|`github.global.ssl.fastly.net`|A|`151.101.185.194`|

|Name|Type|Data|
|:---|:---|:---|
|`github.com`|A|`192.30.253.112`|
|`github.com`|A|`192.30.253.113`|
## 添加IP和域名到hosts文件 ##
打开`hosts`文件:
- `Windows`上的`hosts`文件路径在`C:\Windows\System32\drivers\etc\hosts`
- `Linux`上的`hosts`文件路径在:`sudo vim /etc/hosts`

在`hosts`文件`末尾`添加IP地址和对应的域名,以空格隔开,如下所示:
```
192.30.253.112 github.com
151.101.185.194 github.global.ssl.fastly.net
```
## 保存更新DNS ##
- `Winodws`上的做法:打开`CMD`,输入`ipconfig /flushdns`
- `Linux`上的做法:在`终端`输入`sudo /etc/init.d/networking restart`

## 测试git clone ##
`github.com`有两个IP地址:`192.30.253.112`和`192.30.253.113`,哪个快就用哪个,我这里测试得到`192.30.253.112`稍微快点.

>原文链接: [git clone速度太慢](https://lanlan2017.github.io/blog/1f883a6b/)
