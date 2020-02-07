---
title: Git SSH配置过程
categories: 
  - Git
date: 2019-11-13 16:22:20
updated: 2019-12-17 05:18:51
abbrlink: 8d23490d
---
<div id='my_toc'><a href="/blog/8d23490d/#Git-SSH配置过程" class="header_1">Git SSH配置过程</a>&nbsp;<br><a href="/blog/8d23490d/#配置邮箱和用户名" class="header_2">配置邮箱和用户名</a>&nbsp;<br><a href="/blog/8d23490d/#配置邮箱" class="header_3">配置邮箱</a>&nbsp;<br><a href="/blog/8d23490d/#配置用户名" class="header_3">配置用户名</a>&nbsp;<br><a href="/blog/8d23490d/#查看效果" class="header_3">查看效果</a>&nbsp;<br><a href="/blog/8d23490d/#生成密钥对" class="header_2">生成密钥对</a>&nbsp;<br><a href="/blog/8d23490d/#生成默认长度的密钥对" class="header_3">生成默认长度的密钥对</a>&nbsp;<br><a href="/blog/8d23490d/#生成指定长度的密钥对" class="header_3">生成指定长度的密钥对</a>&nbsp;<br><a href="/blog/8d23490d/#添加key到SSH" class="header_2">添加key到SSH</a>&nbsp;<br><a href="/blog/8d23490d/#解决-Could-not-open-a-connection-to-your-authentication-agent" class="header_3">解决 Could not open a connection to your authentication agent</a>&nbsp;<br><a href="/blog/8d23490d/#添加成功效果" class="header_3">添加成功效果</a>&nbsp;<br><a href="/blog/8d23490d/#将公钥添加到Github上" class="header_2">将公钥添加到Github上</a>&nbsp;<br><a href="/blog/8d23490d/#测试链接是否成功" class="header_2">测试链接是否成功</a>&nbsp;<br><a href="/blog/8d23490d/#使用SSH推送远程仓库" class="header_2">使用SSH推送远程仓库</a>&nbsp;<br><a href="/blog/8d23490d/#你可能没有开启ssh-agent" class="header_3">你可能没有开启ssh-agent</a>&nbsp;<br><a href="/blog/8d23490d/#你可能的远程仓库地址时HTTPS的不是SSH地址" class="header_3">你可能的远程仓库地址时HTTPS的不是SSH地址</a>&nbsp;<br><a href="/blog/8d23490d/#查看远程仓库地址" class="header_4">查看远程仓库地址</a>&nbsp;<br><a href="/blog/8d23490d/#删除远程仓库地址" class="header_4">删除远程仓库地址</a>&nbsp;<br><a href="/blog/8d23490d/#重新添加SSH地址" class="header_4">重新添加SSH地址</a>&nbsp;<br><a href="/blog/8d23490d/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Git SSH配置过程 #
## 配置邮箱和用户名 ##
### 配置邮箱 ###
```shell
git config --global user.email "your_email@example.com"
```
例如我的邮箱:
```shell
git config --global user.email "18251956727@163.com"
```
### 配置用户名 ###
```shell
git config --global user.name "your_name"
```
```shell
git config --global user.name "lanlan2017"
```
### 查看效果 ###
```shell
git config --global  --list
```
```shell
Administrator@DESKTOP-8ISAT6B MINGW64 /e/Blog
$ git config --global  --list
core.quotepath=false
user.email=18251956727@163.com
user.name=lanlan2017
```
## 生成密钥对 ##
### 生成默认长度的密钥对 ###
```shell
ssh-keygen -t rsa -C "18251956727@163.com"
```
### 生成指定长度的密钥对 ###
```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
## 添加key到SSH  ##
```shell
ssh-add 私钥文件名
```
```shell
ssh-add id_rsa
```
### 解决 Could not open a connection to your authentication agent ###
如果出现如下错误:
```shell
lan@DESKTOP-8ISAT6B MINGW64 ~/.ssh
$ ssh-add id_rsa
Could not open a connection to your authentication agent.
```
则先执行如下命令
```shell
ssh-agent bash
```
然后再次执行:
```shell
ssh-add id_rsa
```
即可
### 添加成功效果 ###
```shell
$ ssh-add id_rsa
Identity added: id_rsa (xxxxxxx@xxxx.com)
```
## 将公钥添加到Github上 ##
```shell
cat id_rsa.pub
```
然后复制,设置到GitHub上.省略。
## 测试链接是否成功 ##
```shell
ssh -T git@github.com
```
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog9 (master)
$ ssh -T git@github.com
Hi xxx! You've successfully authenticated, but GitHub does not provide shell access.
```
## 使用SSH推送远程仓库 ##
```shell
git add .
git commit -m '测试SSH推送'
git push origin master
```
这个时候就可以直接推送到远程仓库了.不再需要输入用户名和密码.

如果这个时候还需要输入密码,这表示上面的步骤有问题.
### 你可能没有开启ssh-agent
你可以先需要输入如下命令
```shell
ssh-agent bash
```
再试着推送
```java
git push origin master
```
### 你可能的远程仓库地址时HTTPS的不是SSH地址
如果`ssh-agent`也开启了,密钥设置的也没有问题,`push`的时候还是要求登录密码，那你可能用的时`HTTPS`的仓库地址
#### 查看远程仓库地址 ####
```shell
git remote -v
```
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog10 (master)
$ git remote -v
origin  https://github.com/lanlan2017/JavaReadingNotes.git (fetch)
origin  https://github.com/lanlan2017/JavaReadingNotes.git (push)
```
#### 删除远程仓库地址 ####
```shell
git remote rm origin
```
#### 重新添加SSH地址 ####
```shell
git remote add origin git@github.com:lanlan2017/JavaReadingNotes.git
```
这样就可以直接push了:
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog10 (master)
$ git push origin master
Enumerating objects: 18, done.
Counting objects: 100% (18/18), done.
Delta compression using up to 4 threads
Compressing objects: 100% (11/11), done.
Writing objects: 100% (11/11), 6.94 KiB | 3.47 MiB/s, done.
Total 11 (delta 6), reused 0 (delta 0)
remote: Resolving deltas: 100% (6/6), completed with 6 local objects.
To github.com:lanlan2017/JavaReadingNotes.git
   58370ef..1f87f16  master -> master

```
如果还不行,则按上面的步骤重新操作一遍。

# 参考资料 #
[https://blog.csdn.net/hx1298234467/article/details/53576826](https://blog.csdn.net/hx1298234467/article/details/53576826)
[https://www.cnblogs.com/yangshifu/p/9919817.html](https://www.cnblogs.com/yangshifu/p/9919817.html)
[https://www.cnblogs.com/e-cat/p/10862208.html](https://www.cnblogs.com/e-cat/p/10862208.html)
