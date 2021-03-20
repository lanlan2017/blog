---
title: Git 更新推送流程
categories: 
  - 编程
  - Git
  - 命令
date: 2019-10-31 20:20:41
updated: 2020-04-11 09:21:19
abbrlink: 6a91baf
---
<div id='my_toc'><a href="/blog/6a91baf/#进入项目地址" class="header_1">进入项目地址</a>&nbsp;<br><a href="/blog/6a91baf/#拉取远程分支" class="header_1">拉取远程分支</a>&nbsp;<br><a href="/blog/6a91baf/#查看更新" class="header_1">查看更新</a>&nbsp;<br><a href="/blog/6a91baf/#一步到位" class="header_2">一步到位</a>&nbsp;<br><a href="/blog/6a91baf/#处理冲突或者其他操作" class="header_1">处理冲突或者其他操作</a>&nbsp;<br><a href="/blog/6a91baf/#添加所有文件" class="header_1">添加所有文件</a>&nbsp;<br><a href="/blog/6a91baf/#提交" class="header_1">提交</a>&nbsp;<br><a href="/blog/6a91baf/#提交语句开始" class="header_2">提交语句开始</a>&nbsp;<br><a href="/blog/6a91baf/#写入提交描述" class="header_2">写入提交描述</a>&nbsp;<br><a href="/blog/6a91baf/#描述结束符" class="header_2">描述结束符</a>&nbsp;<br><a href="/blog/6a91baf/#推送到指定分支" class="header_1">推送到指定分支</a>&nbsp;<br><a href="/blog/6a91baf/#输入GitHub用户名" class="header_1">输入GitHub用户名</a>&nbsp;<br><a href="/blog/6a91baf/#输入密码" class="header_1">输入密码</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 进入项目地址
```shell
cd blog/blog/
```
# 拉取远程分支
```git
git pull origin master
```
# 查看更新
```shell
git status
```
## 一步到位
```bash
cd blog/blog/ && git pull origin master && git status
```
# 处理冲突或者其他操作
省略....

# 添加所有文件
```shell
git add .^
git status
```
# 提交
## 提交语句开始
```shell
git commit -m '
```
## 写入提交描述
省略...
## 描述结束符
```shell
'
```
# 推送到指定分支
```shell
git push origin master
```
# 输入GitHub用户名
```shell
lanlan2017
```
# 输入密码
省略...
