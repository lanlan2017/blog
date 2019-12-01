---
title: git 强制推送到远程仓库
categories: 
  - Git
date: 2019-12-01 15:16:23
updated: 2019-12-01 15:24:02
abbrlink: 3f12657a
---
<div id='my_toc'>

- [问题描述](/blog/3f12657a/#问题描述)
- [解决方案](/blog/3f12657a/#解决方案)
- [格式1](/blog/3f12657a/#格式1)
- [格式2](/blog/3f12657a/#格式2)
- [参考资料](/blog/3f12657a/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 问题描述
今天我使用自动部署`Travis CI`自动部署的Hexo博客的时候,仓库名称不小心填错了,导致我的Github上的其他仓库被覆盖了.
# 解决方案
进入本地仓库,然后`强制推送`到被错误覆盖的仓库上.
# 格式1
```shell
git push 远程仓库名 分支名 --force
```
例如:
```shell
git push origin master --force
```
# 格式2
```shell
git push -f 远程仓库名 分支名
```
例如:
```shell
git push -f origin master
```
# 参考资料
[https://blog.csdn.net/WangJQ12/article/details/80974031](https://blog.csdn.net/WangJQ12/article/details/80974031)