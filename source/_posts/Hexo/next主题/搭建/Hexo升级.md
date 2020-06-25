---
title: Hexo升级
categories: 
  - Hexo
  - next主题
  - 搭建
date: 2020-06-09 11:59:05
updated: 2020-06-24 08:17:43
abbrlink: ff1c9b2c
---
<div id='my_toc'><a href="/blog/ff1c9b2c/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/ff1c9b2c/#npm-check" class="header_1">npm-check</a>&nbsp;<br><a href="/blog/ff1c9b2c/#npm-check安装" class="header_2">npm-check安装</a>&nbsp;<br><a href="/blog/ff1c9b2c/#查看项目依赖包更新-npm-check" class="header_2">查看项目依赖包更新 npm-check</a>&nbsp;<br><a href="/blog/ff1c9b2c/#选择更新" class="header_2">选择更新</a>&nbsp;<br><a href="/blog/ff1c9b2c/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
最近推送到GitHub后,无法自动部署.GitHub上的错误报告说是某个依赖版本过低.
# npm-check
npm-check是一个npm包更新工具。它还可以检查项目的npm依赖包是否有更新，缺失，错误以及未使用等情况。其 几大主要优势如下：
1. 提供图形化界面，还有emoji，点个赞（不用对着黑白界面简直良心啊！我也想用emoji写啊！:-)）
2. 批量更新依赖包，还兼职检测包使用情况
3. 项目下更新支持自动检测包的 "dependencies" 和"devDependencies"并更新"package.json"信息  

## npm-check安装
```cmd
npm install -g npm-check //全局安装。项目下安装可自行选择
npm install npm-check    //项目下安装，项目根目录执行
```
## 查看项目依赖包更新 npm-check
```cmd
npm-check
```
查看包更新信息，会有小黄脸提示你包的相关情况（需更新，缺失，错误以及未使用等）
## 选择更新
```cmd
npm-check -u
```
这个命令会列出可以更新的选项
在选项列表中,使用上下箭头进行选择,使用空格确认，然后enter开始更新。自动更新package.json内的相关包信息
# 参考资料
[https://segmentfault.com/a/1190000011085967](https://segmentfault.com/a/1190000011085967)
