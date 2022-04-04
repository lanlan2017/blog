---
title: 解决eclipse for JavaEE 配置Tomcat时 The Apache Tomcat installation at this directory is version 8.5.35.  A Tomcat 8.0 installation is expected.
categories: 
  - IDE
  - eclipse
abbrlink: b2fd10c5
date: 2018-12-02 00:24:04
updated: 2022-04-04 00:51:45
---
# 问题描述
今天`eclipse for JavaEE`中配置`Tomcat`时遇到下面问题:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/tomcat/bug/show.png)
```
The Apache Tomcat installation at this directory is version 8.5.35.  A Tomcat 8.0 installation is expected.
```
这是因为我的`Eclipse`版本比较老，只支持到`tomcat8.0`，还不支持`tomcat8.5`：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/tomcat/bug/notMatcher.png)
# 解决方案
## 方案1 下载最新版的eclipse for JavaEE
推荐使用这种方式。截止目前`2018/12/12`最新版的eclipse for JavaEE已经支持到`tomcat v9.0`了,直接下载最新版的就行了。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/show.png)
[[下载eclipse for JavaEE](https://www.lansheng.net.cn/blog/f9c8fc17/)]([下载eclipse for JavaEE](https://www.lansheng.net.cn/blog/f9c8fc17/))
## 方案 2 修改Apache源代码中的配置文件
参见：[https://jingyan.baidu.com/article/48a42057f8dfafa92525044d.html](https://jingyan.baidu.com/article/48a42057f8dfafa92525044d.html)
