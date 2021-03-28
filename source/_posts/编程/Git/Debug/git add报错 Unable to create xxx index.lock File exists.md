---
title: git add报错 Unable to create xxx index.lock File exists
categories:
  - 编程
  - Git
  - Debug
abbrlink: e92f1b79
date: 2021-03-29 12:08:59
updated: 2021-03-29 12:12:44
---
<div id='my_toc'><a href="/blog/null/#git-add报错：fatal-Unable-to-create-'E/Blog/blogRoot/-git/index-lock'-File-exists" class="header_1">git add报错：fatal: Unable to create 'E:/Blog/blogRoot/.git/index.lock': File exists.</a>&nbsp;<br><a href="/blog/null/#解决方案：删除-git/index-lock文件" class="header_1">解决方案：删除.git/index.lock文件</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# git add报错：fatal: Unable to create 'E:/Blog/blogRoot/.git/index.lock': File exists.
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git status
On branch src
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .gitignore
        modified:   source/tools/Tools2.html
        modified:   source/tools/index.md

no changes added to commit (use "git add" and/or "git commit -a")

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git add .
fatal: Unable to create 'E:/Blog/blogRoot/.git/index.lock': File exists.

Another git process seems to be running in this repository, e.g.
an editor opened by 'git commit'. Please make sure all processes
are terminated then try again. If it still fails, a git process
may have crashed in this repository earlier:
remove the file manually to continue.

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
```
# 解决方案：删除.git/index.lock文件
删除E:/Blog/blogRoot/.git/index.lock文件即可
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ rm E:/Blog/blogRoot/.git/index.lock

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git status
On branch src
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .gitignore
        modified:   source/tools/Tools2.html
        modified:   source/tools/index.md

no changes added to commit (use "git add" and/or "git commit -a")

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git add .

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
$ git status
On branch src
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   .gitignore
        modified:   source/tools/Tools2.html
        modified:   source/tools/index.md


lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
```
