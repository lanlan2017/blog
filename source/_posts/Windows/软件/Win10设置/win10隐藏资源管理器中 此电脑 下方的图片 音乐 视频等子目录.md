---
title: win10隐藏资源管理器中 此电脑 下方的图片 音乐 视频等子目录
categories:
  - Windows
  - 软件
  - Win10设置
abbrlink: 423658ce
date: 2022-04-18 22:38:20
updated: 2022-04-18 22:38:20
---
# 资源管理器中 此电脑 下方不常用的视频 图片 音乐等文件夹
如下图所示，资源管理器中，此电脑下方，有一些默认的文件夹。其中，视频，图片，音乐等文件夹，我不常用。这些文件夹显示在这里很占地方，我希望把他们都隐藏起来。
![image-20220419142510256](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220419142626.png)

这，可以通过修改注册表实现。

## 打开注册表
按win+R打开运行，然后输入regedit，按回车，即可进入注册表编辑器

## 隐藏 图片（Local Pictures）目录
在注册表编辑区的地址栏中输入
```
计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}
```

即可找到Local Pictures目录，当然，这`0ddd015d-b06c-45d5-8c4c-f59713854639`一串东西很复杂，可以通过右侧的Name的值来确定到底是不是Local Pictures

![image-20220418224031557](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220418224032.png)

然后点击下方的PropertyBag子项，修改右侧的ThisPCPolicy值，把Show改成Hide。

![image-20220418224530142](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220418224530.png)

这样Local Pictures目录就隐藏了，重新打开资源管理器即可看到效果。

<!-- more -->

## 隐藏音乐目录(Local Music)
```
计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag
```
的ThisPCPolicy值，由Show改成Hide

![image-20220418225635786](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220418225635.png)

## 隐藏视频目录(Local Videos)
```
计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag
```
的ThisPCPolicy值，由Show改成Hide

![image-20220418225536230](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220418225536.png)

## 隐藏效果

![image-20220419143514189](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220419143526.png)

# 参考资料
https://blog.csdn.net/lanshang_9/article/details/102806359
https://www.baiyunxitong.com/bangzhu/4409.html