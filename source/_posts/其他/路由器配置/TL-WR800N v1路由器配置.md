---
title: TL-WR800N v1路由器配置
categories: 
  - 其他
  - 路由器配置
date: 2019-11-01 14:39:51
updated: 2020-01-12 09:28:17
abbrlink: f8d0ff32
---
<div id='my_toc'><a href="/blog/f8d0ff32/#TL-WR800N-v1路由器配置" class="header_1">TL-WR800N v1路由器配置 </a>&nbsp;<br><a href="/blog/f8d0ff32/#固定电脑IP地址" class="header_2">固定电脑IP地址</a>&nbsp;<br><a href="/blog/f8d0ff32/#连接路由器的WiFi" class="header_2">连接路由器的WiFi</a>&nbsp;<br><a href="/blog/f8d0ff32/#进入路由器后台" class="header_2">进入路由器后台</a>&nbsp;<br><a href="/blog/f8d0ff32/#AP模式" class="header_2">AP模式</a>&nbsp;<br><a href="/blog/f8d0ff32/#中继模式" class="header_2">中继模式</a>&nbsp;<br><a href="/blog/f8d0ff32/#取消固定电脑IP地址" class="header_2">取消固定电脑IP地址</a>&nbsp;<br><a href="/blog/f8d0ff32/#参考链接" class="header_1">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# TL-WR800N v1路由器配置 
## 固定电脑IP地址
**网络和internet设置**,**更改适配器选项**,然后在`WLAN`上右键,选择**属性(R)**,然后点击**internet协议版本4(TCP/IPv4)**选项,然后按下**属性(R)**按钮,在弹出的窗口上选择**使用下面的IP地址(S)**,
然后设置固IP为`192.168.1.200`,子网掩码为:`255.255.255.0`,最后选择**确定**即可

## 连接路由器的WiFi
在`WiFi`列表中链接`WiFi`,这个`WiFI`的格式为:`TP-LINK_xxxxxx`
## 进入路由器后台
[http://192.168.1.253/](http://192.168.1.253/)
后台用户名:`admin`,后台密码:`admin`

## AP模式
AP模式就是将有线信号转成无线信号
参见:[https://www.192ly.com/router-settings/tp-link/tl-wr800n-v1-ap.html](https://www.192ly.com/router-settings/tp-link/tl-wr800n-v1-ap.html)
## 中继模式
中继模式用来将弱的无线信号放大,以便扩大无线的覆盖范围
参见:[https://service.tp-link.com.cn/detail_article_1131.html](https://service.tp-link.com.cn/detail_article_1131.html)

## 取消固定电脑IP地址
重复[第一步](固定电脑IP地址)的步骤,然后选择**自动获得IP地址(O)**即可.

# 参考链接
[TL-WR800N v1 说明书](https://service.tp-link.com.cn/detail_download_621.html)
[TP-Link TL-WR800N V1路由器-AP模式设置](https://www.192ly.com/router-settings/tp-link/tl-wr800n-v1-ap.html)
[TP-Link TL-WR800N V1路由器中继设置](https://www.192ly.com/router-settings/tp-link/tl-wr800n-v1-repeater.html)
[TP-Link TL-WR800N V1路由器 其他设置](https://www.192ly.com/?s=TP-Link+TL-WR800N+V1%E8%B7%AF%E7%94%B1%E5%99%A8)
[[TL-WR800N V1] 中继放大无线信号-中继模式](https://service.tp-link.com.cn/detail_article_1131.html)
