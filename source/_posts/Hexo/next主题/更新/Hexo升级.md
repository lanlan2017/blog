---
title: Hexo升级
categories: 
  - Hexo
  - next主题
  - 更新
abbrlink: ff1c9b2c
date: 2020-06-09 11:59:05
updated: 2022-04-12 16:14:48
---
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
