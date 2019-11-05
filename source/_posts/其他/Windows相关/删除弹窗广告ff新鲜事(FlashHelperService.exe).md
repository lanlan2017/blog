---
title: 删除弹窗广告ff新鲜事(FlashHelperService.exe)
categories: 
  - 其他
  - Windows相关
date: 2019-07-15 14:30:04
updated: 2019-11-04 17:02:02
abbrlink: d4d344ff
---
- [删除弹窗广告ff新鲜事(FlashHelperService.exe)](/blog/d4d344ff/#删除弹窗广告ff新鲜事-FlashHelperService-exe)
- [删除掉之后有些网站打不开](/blog/d4d344ff/#删除掉之后有些网站打不开)
- [参考资料](/blog/d4d344ff/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 删除弹窗广告ff新鲜事(FlashHelperService.exe) #
文件路径:
```cmd
C:\Windows\SysWOW64\Macromed\Flash\FlashHelperService.exe
```
删除这个垃圾玩意即可.
# 删除掉之后有些网站打不开 #
这是个取舍的问题,平时可以禁止这个进程:
```cmd
taskkill /im FlashHelperService.exe /f
```
# 参考资料 #
[https://blog.csdn.net/code_style/article/details/83348158](https://blog.csdn.net/code_style/article/details/83348158)

>原文链接: [删除弹窗广告ff新鲜事(FlashHelperService.exe)](https://lanlan2017.github.io/blog/d4d344ff/)
