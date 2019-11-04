---
title: 使用java上传图片到腾讯云对象存储并返回链接
categories: 
  - 我的软件
  - 腾讯云对象存储COS
date: 2018-10-10 22:03:14
updated: 2019-10-30 13:53:55
abbrlink: 5a1e201b
---

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
不需要签名的公共链接：
```
![](http://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg?sign=q-sign-algorithm%3Dsha1%26q-ak%3DAKIDQikX6SPUAcqqcAxaT8ZmjPpyrUqwuKei%26q-sign-time%3D1540294349%3B1540294649%26q-key-time%3D1540294349%3B1540294649%26q-header-list%3Dhost%26q-url-param-list%3D%26q-signature%3D1e368fb926c8858b9ed65b923a9030bb54234129)
```
显示效果：
![](http://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg?sign=q-sign-algorithm%3Dsha1%26q-ak%3DAKIDQikX6SPUAcqqcAxaT8ZmjPpyrUqwuKei%26q-sign-time%3D1540294349%3B1540294649%26q-key-time%3D1540294349%3B1540294649%26q-header-list%3Dhost%26q-url-param-list%3D%26q-signature%3D1e368fb926c8858b9ed65b923a9030bb54234129)
去掉签名的链接：
```
![](http://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg
```
显示效果：
![](http://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg)
https的图片链接：
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg)
```
显示效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg)
使用https的其他图片
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg)


最后的显示效果：
![](http://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/blue.jpg)

软件上传效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%B5%8B%E8%AF%95COS%E7%9A%84Java%20SDK/%E6%B5%8B%E8%AF%95%E4%BB%A3%E7%A0%81%E4%B8%8A%E4%BC%A0/%E6%88%91%E5%B0%86%E4%BC%9A%E4%B8%8A%E4%BC%A0%E5%88%B0%E8%85%BE%E8%AE%AF%E4%BA%91.png)

>原文链接: [使用java上传图片到腾讯云对象存储并返回链接](https://lanlan2017.github.io/blog/5a1e201b/)
