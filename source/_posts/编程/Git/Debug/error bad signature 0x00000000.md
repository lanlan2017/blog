---
title: error bad signature 0x00000000
categories:
  - 编程
  - Git
  - Debug
abbrlink: 374f3750
date: 2020-01-06 01:27:43
updated: 2020-01-06 01:33:27
---
<div id='my_toc'><a href="/blog/374f3750/#error-bad-signature-0x00000000" class="header_1">error: bad signature 0x00000000</a>&nbsp;<br><a href="/blog/374f3750/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/374f3750/#解决方案" class="header_2">解决方案</a>&nbsp;<br><a href="/blog/374f3750/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# error: bad signature 0x00000000
## 问题描述
今天在写`git commit`的时候,电脑突然蓝屏了,重启后输入`git status`显示如下错误信息
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git status
error: bad signature 0x00000000
fatal: index file corrupt
```
## 解决方案
先删除index
```shell
rm -f .git/index
```
然后再重新创建index
```shell
git reset
```
运行效果:
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$  rm -f .git/index

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git reset
Unstaged changes after reset:
M       source/lover/index.md
M       source/todo/index.md

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git status
On branch src
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   source/lover/index.md
        modified:   source/todo/index.md

no changes added to commit (use "git add" and/or "git commit -a")

```
# 参考资料
[https://www.cnblogs.com/linga/p/10214955.html](https://www.cnblogs.com/linga/p/10214955.html)
[https://www.jianshu.com/p/58f306f0b8c5](https://www.jianshu.com/p/58f306f0b8c5)
