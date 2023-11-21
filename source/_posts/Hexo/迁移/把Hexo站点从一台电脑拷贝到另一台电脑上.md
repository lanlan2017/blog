---
title: 把Hexo站点从一台电脑拷贝到另一台电脑上
categories: 
  - Hexo
  - 迁移
abbrlink: c45a49fc
date: 2023-07-05 21:07:21
updated: 2023-07-06 00:13:09
---
# 需求1：部署Hexo站点到另一台电脑上
最近买了个台式机，我想把我的Hexo站点部署到台式机上。因为这个台式机我打算二十四小时都开着，当服务器使用。这样我就可以随时访问我的Hexo站点了。

# 做法
## 复制整个博客站点的的文件夹到台式机上

我在笔记本上开启网络共享功能，然后在台式机上访问我的笔记本，把Hexo站点的整个文件夹复制到台式机上。

这个时候Hexo站点就已经迁移(复制)完成了，但是还不能开启本地服务器。
为什么呢，因为还没安装好Hexo所需要的依赖软件

## 安装Hexo站点需要的软件
### 安装Git
略
### 安装nodejs
略
#### 使用nvm管理nodejs
略
### 安装hexo
略
## 本地部署Hexo
安装好上述软件之后，就可以在台式机上部署hexo站点了，执行hexo s命令，不出意外的话可以成功部署。

# 需求2：同一个账户在两台电脑上协作

我习惯在笔记本上编写Hexo站点文章，不过Hexo站点我部署在台式机上了。
所以我需要在两台电脑之间进行协作。

# 做法
我先在笔记本上写好Hexo站点的文章，然后我推送到github上。
接着，我在台式机上拉取GitHub上的文章，然后在台式机上本地部署即可。

## 在台式机上重新 配置Git SSH
因为我直接把整个Hexo站点（git仓库）复制到台式机上了，此时台式机上的远程仓库链接已经设置好了，我不用重新init仓库。

不过，此时是不可以直接拉取Github上的仓库，这是因为在台式机上还没配置好Git SSH的缘故。此时执行`git push origin master`命令，将会输出如下的错误信息：

```
lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
$ git pull origin master
ssh: connect to host github.com port 22: Connection refused
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
```
## 配置git的邮箱和用户名
### 配置邮箱
```
git config --global user.email "your_email@example.com"
```
### 配置用户名
```
git config --global user.name "your_name"

```
## 查看效果
```
git config --global  --list
```
```
lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
$ git config --global  --list
user.email=xxxxxxx@163.com
user.name=xyzabc

lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
```

## 从旧电脑上复制私钥和known_hosts文件到到新电脑上
在笔记本上进入用户目录下的.ssh目录中，.ssh目录结构如下代码块所示：
```
C:\Users\xyzabc\.ssh>dir
 驱动器 C 中的卷没有标签。
 卷的序列号是 FA82-C79F

 C:\Users\xyzabc\.ssh 的目录

2023.07.04  19:46    <DIR>          .
2023.07.04  19:46    <DIR>          ..
2021.10.11  09:23                 0 config
2021.07.12  09:13             2,610 id_rsa
2021.07.12  09:13               573 id_rsa.pub
2023.07.04  19:46               919 known_hosts
2022.04.12  15:40               747 known_hosts.old
               5 个文件          4,849 字节
               2 个目录 59,848,286,208 可用字节

C:\Users\xyzabc\.ssh>
```
其中的id_rsa文件就是我们需要的私钥文件，id_rsa.pub是公钥文件，这个公钥我们之前已经放到GitHub上了


### 复制id_rsa和known_hosts到新电脑上的.ssh目录中
在台式机上同样进入用户目录，
- 如果有.ssh目录，则进入.ssh目录，然后把 私钥文件id_rsa和known_hosts文件 粘贴到.ssh目录。
- 如果没有.ssh目录，则创建一个.ssh目录。然后把 私钥文件id_rsa和known_hosts文件 粘贴到.ssh目录中。

不过，为了方便起见，你把旧电脑上.ssh目录下的所有文件都复制到新电脑的.ssh目录下也可以。

我之所以说复制私钥文件和known_hosts就可以了，是因为在我的操作中，复制私钥文件id_rsa和known_hosts文件之后，就可以通过SSH访问GitHub了。
```
C:\Users\abc\.ssh>dir
 驱动器 C 中的卷没有标签。
 卷的序列号是 4A1D-5B3F

 C:\Users\abc\.ssh 的目录

2023/07/05  23:23    <DIR>          .
2023/07/05  23:23    <DIR>          ..
2023/07/05  22:59             2,610 id_rsa
2023/07/05  23:23               919 known_hosts
               2 个文件          3,529 字节
               2 个目录 11,805,638,656 可用字节

C:\Users\abc\.ssh>
```

## 添加私钥到SSH

### 开启ssh服务
在台式机上的.ssh目录中打开git-bash。
输入如下命令启动SSH服务：
```
ssh-agent bash
```
这条命令没有输出：
```
lan@DESKTOP-731NAOL MINGW64 ~/.ssh
$ ssh-agent bash
```
### 添加私钥
```
ssh-add id_rsa
```
命令输出如下：
```
lan@DESKTOP-731NAOL MINGW64 ~/.ssh
$ ssh-add id_rsa
Identity added: id_rsa (xxxxxxx@163.com)
```
## 测试链接是否成功
因为之前在旧电脑的Git SSH配置中我们已经把公钥保存到github上了，所以现在我们就不用再重新布置了。

git-bash**进入Hexo站点目录**，然后执行如下命令，测试是否能成功连接到github上。
```
ssh -T git@github.com
```
如果有如下的输出，则表示成功连接到GitHub上：
```
lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
$ ssh -T git@github.com
Hi githbubUseName! You've successfully authenticated, but GitHub does not provide shell access.

lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
```
### 解决：ssh: connect to host github.com port 22: Connection refused
我测试的时候并没有成功连接到GitHub上而是输出如下信息：
```
lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
$ ssh -T git@github.com
ssh: connect to host github.com port 22: Connection refused

lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
```
我这里应该是被墙了，安装Steam++，加速GitHub之后即可正常连接。

## 解决The authenticity of host 'github.com (127.0.0.1)' can't be established.
如果出现如下的输出：
```
an@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
$ ssh -T git@github.com
The authenticity of host 'github.com (127.0.0.1)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?

lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
```
这说明你只复制了秘钥文件到新电脑上，忘了从旧电脑上把known_hosts文件复制到新电脑的.ssh目录中。

从旧电脑上把known_hosts文件复制到新电脑的.ssh目录中，然后在重新测试连接即可。此时应该就能正常连接了。

# 拉取GitHub上的仓库到新电脑
```
lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)
$ git pull origin master
remote: Enumerating objects: 23, done.
remote: Counting objects: 100% (23/23), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 12 (delta 8), reused 12 (delta 8), pack-reused 0
Unpacking objects: 100% (12/12), 2.29 KiB | 3.00 KiB/s, done.
From github.com:githbubUseName/JavaReadingNotes
 * branch              master     -> FETCH_HEAD
   d1bf8037..cd1954fe  master     -> origin/master
Updating d1bf8037..cd1954fe
Fast-forward
 ...277\220\350\241\214\346\234\272\345\210\266.md" | 17 +++--
 ...221Java\347\232\204\345\207\206\345\244\207.md" | 79 +++++++++++++---------
 ...200\344\270\252Java\347\250\213\345\272\217.md" | 61 ++++++++++-------
 3 files changed, 91 insertions(+), 66 deletions(-)

lan@DESKTOP-731NAOL MINGW64 /e/Tools/Blog/JavaReadingNotes_new (master)

```
## git文件名乱码 gitbash文件名乱码
此时可以成功拉取更新了，不过文件名是乱码的，输入如下命令解决：

```
git config --global core.quotepath false

```

# 参考资料
[Git SSH配置过程](blog/8d23490d/)
[git bash中文乱码](blog/ad35763b/)
