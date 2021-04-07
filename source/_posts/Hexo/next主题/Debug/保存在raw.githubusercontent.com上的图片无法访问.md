---
title: 保存在raw.githubusercontent.com上的图片无法访问
categories: 
  - Hexo
  - next主题
  - Debug
abbrlink: 9a6c2fdf
date: 2020-06-26 01:24:06
updated: 2021-04-07 23:31:47
---
<div id='my_toc'><a href="/blog/9a6c2fdf/#保存在raw-githubusercontent-com上的图片无法访问" class="header_1">保存在raw.githubusercontent.com上的图片无法访问</a>&nbsp;<br><a href="/blog/9a6c2fdf/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/9a6c2fdf/#解决方案" class="header_2">解决方案</a>&nbsp;<br><a href="/blog/9a6c2fdf/#找到raw-githubusercontent-com真正的IP地址" class="header_3">找到raw.githubusercontent.com真正的IP地址</a>&nbsp;<br><a href="/blog/9a6c2fdf/#site-ip138-com" class="header_4">site.ip138.com</a>&nbsp;<br><a href="/blog/9a6c2fdf/#https-www-ipaddress-com" class="header_4">https://www.ipaddress.com/</a>&nbsp;<br><a href="/blog/9a6c2fdf/#修改hosts" class="header_3">修改hosts</a>&nbsp;<br><a href="/blog/9a6c2fdf/#Win10电脑上修改" class="header_4">Win10电脑上修改</a>&nbsp;<br><a href="/blog/9a6c2fdf/#刷新DNS" class="header_5">刷新DNS</a>&nbsp;<br><a href="/blog/9a6c2fdf/#安卓手机上修改hosts" class="header_4">安卓手机上修改hosts</a>&nbsp;<br><a href="/blog/9a6c2fdf/#编辑hosts文件" class="header_5">编辑hosts文件</a>&nbsp;<br><a href="/blog/9a6c2fdf/#下载修改hosts的软件" class="header_4">下载修改hosts的软件</a>&nbsp;<br><a href="/blog/9a6c2fdf/#Hosts-Go添加hosts" class="header_5">Hosts Go添加hosts</a>&nbsp;<br><a href="/blog/9a6c2fdf/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 保存在raw.githubusercontent.com上的图片无法访问
## 问题描述
最近,Github的raw文件读取地址(raw.githubusercontent.com)遭受DNS污染，导致文件下载困难。
而我文章中的图片,保存在github上.导致无法显示图片.
## 解决方案
### 找到raw.githubusercontent.com真正的IP地址
通过搜索引擎,找一个查询IP地址的网站,然后在网站中输入`raw.githubusercontent.com`进行查询即可得到对应的IP地址
```
https://site.ip138.com/raw.githubusercontent.com/
http://ip.tool.chinaz.com/ipbatch
https://githubusercontent.com.ipaddress.com/raw.githubusercontent.com
```
#### site.ip138.com
例如,[https://site.ip138.com/raw.githubusercontent.com/](https://site.ip138.com/raw.githubusercontent.com/) 这个网站查询到如下IP:
```
日本 东京 151.101.108.133
美国 151.101.64.133
美国 151.101.0.133
美国 51.101.192.133
保留地址 0.0.0.0
日本 东京 151.101.228.133
美国 151.101.128.133
中国 香港 151.101.76.133
```
在IP地址后吗添加raw.githubusercontent.com得到:
```
151.101.108.133 raw.githubusercontent.com
151.101.64.133 raw.githubusercontent.com
151.101.0.133 raw.githubusercontent.com
51.101.192.133 raw.githubusercontent.com
151.101.228.133 raw.githubusercontent.com
151.101.128.133 raw.githubusercontent.com
151.101.76.133 raw.githubusercontent.com
```
#### https://www.ipaddress.com/
[https://githubusercontent.com.ipaddress.com/raw.githubusercontent.com](https://githubusercontent.com.ipaddress.com/raw.githubusercontent.com)
查询到的地址为：
> raw.githubusercontent.com resolves to the following 4 IPv4 addresses:
> 185.199.108.133
> 185.199.109.133
> 185.199.110.133
> 185.199.111.133

在IP地址后吗添加raw.githubusercontent.com得到:
```
185.199.108.133 githubusercontent.com
185.199.109.133 githubusercontent.com
185.199.110.133 githubusercontent.com
185.199.111.133 githubusercontent.com
```
### 修改hosts
#### Win10电脑上修改
进入目录:C:\Windows\System32\drivers\etc,打开hosts文件,在**末尾**,填入上述地址即可.
```
151.101.108.133 raw.githubusercontent.com
151.101.64.133 raw.githubusercontent.com
151.101.0.133 raw.githubusercontent.com
51.101.192.133 raw.githubusercontent.com
151.101.228.133 raw.githubusercontent.com
```
##### 刷新DNS
打开cmd,输入:
```
ipconfig /flushdns
```
运行效果
```
C:\Users\lan>ipconfig /flushdns

Windows IP 配置

已成功刷新 DNS 解析缓存。

C:\Users\lan>
```
这样你电脑上就可以访问到保存在github raw上面的图片了.
#### 安卓手机上修改hosts
##### 编辑hosts文件
这要求你的手机root过,具体可以查找其他教程进行设置.
#### 下载修改hosts的软件
- [Hosts Go
](https://play.google.com/store/apps/details?id=dns.hosts.server.change&hl=en_US)
##### Hosts Go添加hosts
点击**HOSTS设置**按钮,然后点击顶部的 **+** (加号),分别输入ip地址和域名,最后点击**启动**即可

# 参考资料
https://www.jianshu.com/p/bbd79e0444ea
