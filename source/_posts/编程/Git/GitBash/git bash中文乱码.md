---
title: git bash中文乱码
categories: 
  - 编程
  - Git
  - GitBash
date: 2019-11-13 16:05:01
updated: 2021-03-20 10:08:32
abbrlink: ad35763b
---
<div id='my_toc'><a href="/blog/ad35763b/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/ad35763b/#解决方案" class="header_1">解决方案</a>&nbsp;<br><a href="/blog/ad35763b/#成功效果" class="header_1">成功效果</a>&nbsp;<br><a href="/blog/ad35763b/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
使用`git add`添加要提交的文件的时候，如果文件名是中文，会显示形如`274\232\350\256\256\346\200\273\347\273\223`的乱码。 
```shell
Administrator@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog9 (master)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   "source/_posts/Hexo\346\220\255\345\273\272/Hexo\346\220\255\345\273\272.md"
        modified:   "source/_posts/\347\275\221\347\253\231\347\233\256\345\275\225.md"

no changes added to commit (use "git add" and/or "git commit -a")

```
# 解决方案
在bash提示符下输入： 
```shell
git config --global core.quotepath false
```
`core.quotepath`设为`false`的话，就不会对`0x80`以上的字符进行`quote`。中文显示正常。
# 成功效果
这样中文就显示正常了:
```shell
Administrator@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog9 (master)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   source/_posts/Hexo搭建/Hexo搭建.md
        modified:   source/_posts/网站目录.md

```
# 参考资料
[https://www.cnblogs.com/EasonJim/p/8403587.html](https://www.cnblogs.com/EasonJim/p/8403587.html)
