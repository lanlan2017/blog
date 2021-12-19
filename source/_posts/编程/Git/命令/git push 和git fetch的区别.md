---
title: git push 和git fetch的区别
categories: 
  - 编程
  - Git
  - 命令
date: 2019-12-03 19:40:41
updated: 2020-04-11 09:21:19
abbrlink: bd41df27
---
# git push和git fetch的区别
- git fetch只下载不合并,然后需要手动合并.
- git push先下载然后自动合并.

# 推荐使用git fetch
git fetch比较安全,推荐使用git fetch来更新远程仓库代码:
## git fetch更新流程
首先先下载远程的分支到一个本地的临时分支上.
```shell
git fetch origin master:tmp
```
然后比较两个分支的区别.
```shell
git diff tmp 
```
如果没有问题的话再合并临时分支大当前分支(master)上:
```shell
git merge tmp
```
如果不需要tmp分支的话可以再接着吧tmp分支删除掉:
```shell
git branch -d tmp
```

# 参考资料
[https://blog.csdn.net/weixin_41975655/article/details/82887273](https://blog.csdn.net/weixin_41975655/article/details/82887273)
[https://blog.csdn.net/qq_35014708/article/details/93062231](https://blog.csdn.net/qq_35014708/article/details/93062231)
