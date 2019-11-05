---
title: git bash中使用多个github用户
categories: 
  - Git
  - GitBash
date: 2018-11-20 20:19:24
updated: 2019-11-04 17:02:00
abbrlink: 4190ffbf
---
- [问题描述](/blog/4190ffbf/#问题描述)
    - [生成新ssh key](/blog/4190ffbf/#生成新ssh-key)
    - [添加新ssh key](/blog/4190ffbf/#添加新ssh-key)
    - [添加公钥到github上](/blog/4190ffbf/#添加公钥到github上)
    - [配置config文件](/blog/4190ffbf/#配置config文件)
    - [测试是否配置成功](/blog/4190ffbf/#测试是否配置成功)
    - [使用新用户时修改远程仓库的地址](/blog/4190ffbf/#使用新用户时修改远程仓库的地址)
    - [下面是个人的操作](/blog/4190ffbf/#下面是个人的操作)
- [参考链接](/blog/4190ffbf/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 问题描述 ##
我在github注册了两个账号，想在在git-bash上同时使用这两个github账号。前提是现在github上注册好账号了。
### 生成新ssh key ###
在git-bash中,cd到一个目录下(/e/Blog)，输入命令`ssh-keygen -t rsa -C 新用户的邮箱`,然后在该命令的第一个输入项时，为生成的秘钥换个名字，我这里是`id_rsa_lanlan233`,其他的直接回车即可。
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog
$ ssh-keygen -t rsa -C xxxxxxxxxxx@qq.com
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/lan/.ssh/id_rsa): id_rsa_lanlan233
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in id_rsa_lanlan233.
Your public key has been saved in id_rsa_lanlan233.pub.
The key fingerprint is:
SHA256:sFQcPwt2pzC2kzkclvjA5TCklu60+YdTh/QhlKFMQZ8 1819091040@qq.com
The key's randomart image is:
+---[RSA 2048]----+
|     oBo=+       |
|     * X++       |
|    + O.E + .    |
|   o . XoX.=     |
|    o ..S+o.     |
|   o o  ooo      |
|    +  o .       |
|     .o .        |
|      .o         |
+----[SHA256]-----+
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog

```
然后，复制生成的私钥`id_rsa_lanlan233`，和公钥`id_rsa_lanlan233.pub`到`~/.ssh/`目录下。接下来用新的github账号登录github。把公钥`id_rsa_lanlan233.pub`添加到上面。
### 添加新ssh key ###
默认SSH只会读取`id_rsa`，所以为了让SSH识别新的私钥，需要将其添加到`SSH agent`
使用命令：`ssh-add ~/.ssh/id_rsa_lanlan233`
如果报错：`Could not open a connection to your authentication agent.`无法连接到ssh agent
可执行`ssh-agent bash`命令后再执行`ssh-add ~/.ssh/id_rsa_lanlan233`命令。
```
lan@DESKTOP-8ISAT6B MINGW64 ~/.ssh
$ ls
id_rsa  id_rsa.pub  id_rsa_lanlan233  id_rsa_lanlan233.pub  known_hosts
lan@DESKTOP-8ISAT6B MINGW64 ~/.ssh
$ ssh-add id_rsa_lanlan233
Could not open a connection to your authentication agent.
lan@DESKTOP-8ISAT6B MINGW64 ~/.ssh
$ ssh-agent bash
lan@DESKTOP-8ISAT6B MINGW64 ~/.ssh
$ ssh-add id_rsa_lanlan233
Identity added: id_rsa_lanlan233 (id_rsa_lanlan233)

```
### 添加公钥到github上 ###
复制公钥,粘贴到`github`之中.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/git/GitBash/MoreAccont/1.png)
### 配置config文件 ###
查看`~/.ssh/`目录中是否存在`config`文件

如果已存在则直接编辑config文件。如果不存在则需要创建config文件，命令：`touch config`，再对config文件进行编辑，如下所示：
```
#Default 第一个账号(18251956727@163.com)
Host default
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
#second 第二个账号（1819091040@qq.com）
Host lanlan233
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_lanlan233
```
其中Host 后的名字可以随意方便自己记忆，但`HostName必须为github.com(或者其它git地址)`。
### 测试是否配置成功 ###
使用命令：`ssh -T git@lanlan233`,如果看到下面的命令表示配置成功了。
```
lan@DESKTOP-8ISAT6B MINGW64 ~/.ssh
$ ssh -T git@lanlan233
Hi xiaolan233! You've successfully authenticated, but GitHub does not provide shell access.

```
如果命令输出如下,则表示你没有在github上添加公钥:
```cmd
$ ssh -T git@blueblue233
git@github.com: Permission denied (publickey).

```
### 使用新用户时修改远程仓库的地址 ###
配置完成后，在连接Host不是github.com的github仓库时，远程库的地址要对应地做一些修改:

例如对于地址
```cmd
git@github.com:xiaolan233/xiaolan233.github.io.git
```
修改为:
```cmd
git@lanlan233:xiaolan233/xiaolan233.github.io.git
```
如下所示：

```
lan@DESKTOP-8ISAT6B MINGW64 /E/Blog
$ git clone git@lanlan233:xiaolan233/xiaolan233.github.io.git
Cloning into 'xiaolan233.github.io'...
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (6/6), done.

```
到这里就可以了

### 下面是个人的操作 ###
我还是用来写东西的，所以懒得再配置主题了。使用的是hexo+next.这里我直接把之前的博客文件夹`bolg5`，复制一份到新的站点目录`xuexi`下即可。
```
cp -r bolg5/ xuexi
```
复制完毕后，进入学习，修改站点配置文件中的远程仓库地址即可。

## 参考链接 ##

[多个git账号之间的切换](https://www.cnblogs.com/williamjie/p/9145570.html)

>原文链接: [git bash中使用多个github用户](https://lanlan2017.github.io/blog/4190ffbf/)
