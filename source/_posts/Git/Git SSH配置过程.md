---
title: Git SSH配置过程
categories: 
  - Git
date: 2019-11-13 16:22:20
updated: 2019-11-17 01:38:41
abbrlink: 8d23490d
---
- [Git SSH配置过程](/blog/8d23490d/#Git-SSH配置过程)
    - [配置邮箱和用户名](/blog/8d23490d/#配置邮箱和用户名)
        - [配置邮箱](/blog/8d23490d/#配置邮箱)
        - [配置用户名](/blog/8d23490d/#配置用户名)
        - [查看效果](/blog/8d23490d/#查看效果)
    - [生成密钥对](/blog/8d23490d/#生成密钥对)
        - [生成默认长度的密钥对](/blog/8d23490d/#生成默认长度的密钥对)
        - [生成指定长度的密钥对](/blog/8d23490d/#生成指定长度的密钥对)
    - [将公钥添加到Github上](/blog/8d23490d/#将公钥添加到Github上)
    - [添加密钥文件到本地SSH客户端](/blog/8d23490d/#添加密钥文件到本地SSH客户端)
    - [测试链接是否成功](/blog/8d23490d/#测试链接是否成功)
- [参考资料](/blog/8d23490d/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# Git SSH配置过程 #
## 配置邮箱和用户名 ##
### 配置邮箱 ###
```shell
git config --global user.email "your_email@example.com"
```

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
试试，如果还不许,则按上面的步骤重新操作一遍。

# 参考资料 #
[https://blog.csdn.net/hx1298234467/article/details/53576826](https://blog.csdn.net/hx1298234467/article/details/53576826)
[https://www.cnblogs.com/yangshifu/p/9919817.html](https://www.cnblogs.com/yangshifu/p/9919817.html)
[https://www.cnblogs.com/e-cat/p/10862208.html](https://www.cnblogs.com/e-cat/p/10862208.html)
