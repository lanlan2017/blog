---
title: git安装初始化 Git SSH配置过程
categories: 
  - Git
  - 命令
abbrlink: 8d23490d
date: 2019-11-13 16:22:20
updated: 2022-04-04 00:51:45
---
# git安装
下载安装包，然后根据提示安装即可，默认安装就行。

# Git SSH配置过程
## 配置邮箱和用户名
### 配置邮箱
```shell
git config --global user.email "your_email@example.com"
```
例如我的邮箱:
```shell
git config --global user.email "18251956727@163.com"
```
### 配置用户名
```shell
git config --global user.name "your_name"
```
```shell
git config --global user.name "lanlan2017"
```
### 查看效果
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
## 生成密钥对
### 生成默认长度的密钥对
```shell
ssh-keygen -t rsa -C "18251956727@163.com"
```
### 生成指定长度的密钥对
```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
## 添加key到SSH 
```shell
ssh-add 私钥文件名
```
```shell
ssh-add id_rsa
```
### 解决 Could not open a connection to your authentication agent
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
### 添加成功效果
```shell
$ ssh-add id_rsa
Identity added: id_rsa (xxxxxxx@xxxx.com)
```
## 将公钥添加到Github上
```shell
cat id_rsa.pub
```
然后复制,然后浏览器上进入GitHub网站。
点击github网站右上方**头像**，然后选择**Setting**，在**Account settings**栏中选择**SSH and GPG keys**,然后点击右上方的**New SSH key**按钮。
然后在**Title**输入框中输入公钥的名称。在**Key文本域**中输入上面的公钥（id_rsa.pub）的内容
## 测试链接是否成功
进入一个之前的git本地仓库，输入如下命令测试连接：
```shell
ssh -T git@github.com
```
如果有如下输出，则表示公钥已经设置好，SSH连接正常。
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog9 (master)
$ ssh -T git@github.com
Hi xxx! You've successfully authenticated, but GitHub does not provide shell access.
```
## 使用SSH推送远程仓库
```shell
git add .
git commit -m '测试SSH推送'
git push origin master
```
这个时候就可以直接推送到远程仓库了.不再需要输入用户名和密码.
## SSH推送有问题
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
#### 查看远程仓库地址
```shell
git remote -v
```
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog10 (master)
$ git remote -v
origin  https://github.com/lanlan2017/JavaReadingNotes.git (fetch)
origin  https://github.com/lanlan2017/JavaReadingNotes.git (push)
```
#### 删除远程仓库地址
```shell
git remote rm origin
```
#### 重新添加SSH地址
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

# 参考资料
[https://blog.csdn.net/hx1298234467/article/details/53576826](https://blog.csdn.net/hx1298234467/article/details/53576826)
[https://www.cnblogs.com/yangshifu/p/9919817.html](https://www.cnblogs.com/yangshifu/p/9919817.html)
[https://www.cnblogs.com/e-cat/p/10862208.html](https://www.cnblogs.com/e-cat/p/10862208.html)
