---
title: 删除弹窗广告ff新鲜事(FlashHelperService.exe)
categories: 
  - 其他
  - Windows相关
date: 2019-07-15 14:30:04
updated: 2019-11-14 11:39:32
abbrlink: d4d344ff
---
<div id='my_toc'>

- [删除弹窗广告ff新鲜事(FlashHelperService.exe)](/blog/d4d344ff/#删除弹窗广告ff新鲜事-FlashHelperService-exe)
- [删除掉之后有些网站打不开](/blog/d4d344ff/#删除掉之后有些网站打不开)
- [参考资料](/blog/d4d344ff/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

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
