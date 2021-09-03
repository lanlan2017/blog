---
title: fatal：bad object HEAD解决
categories:
  - 编程
  - Git
  - Debug
abbrlink: a3c100ea
date: 2021-08-26 09:29:40
updated: 2021-08-26 09:29:40
---
# 问题描述
今天我打开电脑，执行git status命令的时候报错如下：
```
UserHelloWorld@DESKTOP-SH3MQPI MINGW64 /g/Blog/exam (master)
$ git status
fatal: bad object HEAD

UserHelloWorld@DESKTOP-SH3MQPI MINGW64 /g/Blog/exam (master)
```
# 原因
我不知道，可能是昨天电脑蓝屏了，可能是其他原因。
# 解决方案
我记得我昨天有推送到远程仓库，从远程仓库拉取即可：
```
git fetch origin master
```
运行结果：
```
UserHelloWorld@DESKTOP-SH3MQPI MINGW64 /g/Blog/exam (master)
$ git fetch origin master
error: refs/heads/master does not point to a valid object!
error: refs/remotes/origin/HEAD does not point to a valid object!
error: refs/remotes/origin/master does not point to a valid object!
remote: Enumerating objects: 2809, done.
remote: Counting objects: 100% (1031/1031), done.
remote: Compressing objects: 100% (508/508), done.
remote: Total 2809 (delta 672), reused 776 (delta 474), pack-reused 1778
Receiving objects: 100% (2809/2809), 1.14 MiB | 738.00 KiB/s, done.
Resolving deltas: 100% (1573/1573), done.
From github.com:lanlan2017/exam
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master

UserHelloWorld@DESKTOP-SH3MQPI MINGW64 /g/Blog/exam (master)
```
这样git status就正常了
```
UserHelloWorld@DESKTOP-SH3MQPI MINGW64 /g/Blog/exam (master)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean

UserHelloWorld@DESKTOP-SH3MQPI MINGW64 /g/Blog/exam (master)
```

# 参考资料
[httpsnewbedev.comgit-status-shows-fatal-bad-object-head](httpsnewbedev.comgit-status-shows-fatal-bad-object-head)