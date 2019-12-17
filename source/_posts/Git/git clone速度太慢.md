---
title: git clone速度太慢
categories: 
  - Git
date: 2019-08-12 12:55:50
updated: 2019-12-17 05:17:08
abbrlink: 1f883a6b
---
<div id='my_toc'><a href="/blog/1f883a6b/#原文链接" class="header_1">原文链接</a><br><a href="/blog/1f883a6b/#问题描述" class="header_1">问题描述</a><br><a href="/blog/1f883a6b/#分析原因" class="header_1">分析原因</a><br><a href="/blog/1f883a6b/#解决方案" class="header_1">解决方案</a><br><a href="/blog/1f883a6b/#查找域名对应IP地址" class="header_2">查找域名对应IP地址</a><br><a href="/blog/1f883a6b/#添加IP和域名到hosts文件" class="header_2">添加IP和域名到hosts文件</a><br><a href="/blog/1f883a6b/#保存更新DNS" class="header_2">保存更新DNS</a><br><a href="/blog/1f883a6b/#测试git-clone" class="header_2">测试git clone</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 原文链接
[https://blog.csdn.net/shahuhu000/article/details/83965642#commentBox](https://blog.csdn.net/shahuhu000/article/details/83965642#commentBox)
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
