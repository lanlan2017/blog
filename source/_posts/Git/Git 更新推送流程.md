---
title: Git 更新推送流程
categories: 
  - Git
date: 2019-10-31 20:20:41
updated: 2019-12-09 19:55:22
abbrlink: 6a91baf
---
<div id='my_toc'><a href="/blog/6a91baf/#进入项目地址">进入项目地址</a><br/><a href="/blog/6a91baf/#拉取远程分支">拉取远程分支</a><br/><a href="/blog/6a91baf/#查看更新">查看更新</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/6a91baf/#一步到位">一步到位</a><br/><a href="/blog/6a91baf/#处理冲突或者其他操作">处理冲突或者其他操作</a><br/><a href="/blog/6a91baf/#添加所有文件">添加所有文件</a><br/><a href="/blog/6a91baf/#提交">提交</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/6a91baf/#提交语句开始">提交语句开始</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/6a91baf/#写入提交描述">写入提交描述</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/6a91baf/#描述结束符">描述结束符</a><br/><a href="/blog/6a91baf/#推送到指定分支">推送到指定分支</a><br/><a href="/blog/6a91baf/#输入GitHub用户名">输入GitHub用户名</a><br/><a href="/blog/6a91baf/#输入密码">输入密码</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

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

>原文链接: [Git更新推送流程](https://lanlan2017.github.io/blog/6a91baf/)
