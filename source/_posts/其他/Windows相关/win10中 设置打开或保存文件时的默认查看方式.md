---
title: win10中 设置打开或保存文件时的默认查看方式
categories: 
  - 其他
  - Windows相关
date: 2019-08-28 12:20:01
updated: 2019-11-05 10:32:11
abbrlink: fda3d857
---
- [win10中设置打开或保存文件时的默认查看方式](/blog/fda3d857/#win10中设置打开或保存文件时的默认查看方式)
- [分析](/blog/fda3d857/#分析)
- [Win10 设置资源管理器中的默认查看方式](/blog/fda3d857/#Win10-设置资源管理器中的默认查看方式)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# win10中设置打开或保存文件时的默认查看方式 #
最近我在编辑器中`保存文件到本地`或者`打开本地文件`时,弹出的资源管理器中的查看方式突然变成的`大图标`:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/windows/explorer/MoRenChaKanFangShi/0.png)
大图标的查看方式,**文件名不再一行上**,找一个文件,还要浪费精力去看文件名称,浪费时间.
所以我平时喜欢用`详细列表`这种查看方式.详细列表查看方式文件名在一行上,方便找出文件.每次保存文件时我都要调整一次查看方式,这让我很烦躁.
# 分析 #
经过排查,发现是默认的查看方式被修改成`大图标`导致的,重新改回`详细列表`即可.下面是操作步骤.
# Win10 设置资源管理器中的默认查看方式 #
先随意打开一个文件夹,切换到查看选项卡,可以发现现在的查看方式不是`详细列表`,而是`大图标`:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/windows/explorer/MoRenChaKanFangShi/1.png)
现在选择`详细列表`，然后`点击`右边的`选项`按钮:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/windows/explorer/MoRenChaKanFangShi/2.png)
在弹出的`文件夹选项`对话框中,点击`查看`选项卡,然后点击`应用到文件夹`按钮.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/windows/explorer/MoRenChaKanFangShi/3.png)
接着会弹出提示信息`是否让这种美型的所有文件夹与此文件奕的视图设置匹配?`,点击`是`即可
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/windows/explorer/MoRenChaKanFangShi/4.png)
这样在软件中打开文件时的视图就都按照详细列表方式进行排序了:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/windows/explorer/MoRenChaKanFangShi/5.png)


>原文链接: [win10中 设置打开或保存文件时的默认查看方式](https://lanlan2017.github.io/blog/fda3d857/)
