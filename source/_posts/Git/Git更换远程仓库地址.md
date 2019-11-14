---
title: Git更换远程仓库地址
categories: 
  - Git
date: 2019-05-02 10:56:15
updated: 2019-11-05 10:32:10
abbrlink: 7469a3b7
---
- [问题描述](/blog/7469a3b7/#问题描述)
- [在github上创建项目](/blog/7469a3b7/#在github上创建项目)
- [修改远程仓库的地址](/blog/7469a3b7/#修改远程仓库的地址)
    - [查看当前远程仓库](/blog/7469a3b7/#查看当前远程仓库)
    - [修改远程仓库的地址为github的](/blog/7469a3b7/#修改远程仓库的地址为github的)
    - [查看修改效果](/blog/7469a3b7/#查看修改效果)
    - [push到新的远程仓库地址](/blog/7469a3b7/#push到新的远程仓库地址)
- [参考资料](/blog/7469a3b7/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 问题描述 #
之前我在码云上创建来一个用来放一些个人工具类的项目(`Tools)`,但是最近`push`不上去,错误输出如下:
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/Tools (master)
$ git push origin master
git@gitee.com: Permission denied (publickey).
fatal: Could not read from remote repository.

```
应该是秘钥的问题,不过我还是习惯用`Github`,所以我准备换到`github`上.
# 在github上创建项目 #
我重新在`Github`上创建一个名为`MyJavaTools`的仓库,得到SSL地址为:
```
git@github.com:lanlan2017/MyJavaTools.git
```
下面就把远程仓库改为这个地址.
# 修改远程仓库的地址 #
## 查看当前远程仓库 ##
```cmd
git remote -v
```
命令输出如下:
```
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/Tools (master)
$ git remote -v
origin  git@gitee.com:XiaoLan223/Tools.git (fetch)
origin  git@gitee.com:XiaoLan223/Tools.git (push)
```
## 修改远程仓库的地址为github的 ##
```cmd
 git remote set-url origin git@github.com:lanlan2017/MyJavaTools.git
```
## 查看修改效果 ##
再次输入`git remote -v`命令查看远程仓库的地址,如下:
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/Tools (master)
$ git remote -v
origin  git@github.com:lanlan2017/MyJavaTools.git (fetch)
origin  git@github.com:lanlan2017/MyJavaTools.git (push)

```
可以看到远程仓库的地址已经修改过来了.
## push到新的远程仓库地址 ##
输入`git push origin master`推送到新的远程仓库即可.
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/Tools (master)
$ git push origin master
Counting objects: 133, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (105/105), done.
Writing objects: 100% (133/133), 59.98 KiB | 203.00 KiB/s, done.
Total 133 (delta 23), reused 0 (delta 0)
remote: Resolving deltas: 100% (23/23), done.
To github.com:lanlan2017/MyJavaTools.git
 * [new branch]      master -> master

```
# 参考资料 #
[https://blog.csdn.net/chaiyu2002/article/details/80898474](https://blog.csdn.net/chaiyu2002/article/details/80898474)
>原文链接: [Git更换远程仓库地址](https://lanlan2017.github.io/blog/7469a3b7/)
