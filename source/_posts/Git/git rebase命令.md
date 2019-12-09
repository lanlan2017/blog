---
title: git rebase命令
categories: 
  - Git
date: 2019-12-09 10:26:01
updated: 2019-12-09 10:26:01
---
<div id='my_toc'>

- [压缩最近n次提交](/blog/null/#压缩最近n次提交)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 压缩最近n次提交
```shell
git rebase -i HEAD~次数
```
例如要压缩最近两次提交:
```shell
git rebase -i HEAD~2
```
这会打开vim,显示类似如下信息
```shell
    pick bd071a4 增加一些搜狗输入法windows版个性短语
    pick 7efbfdb 增加一些搜狗输入法windows版个性短语

    # Rebase 6b3fb81..7efbfdb onto 6b3fb81 (2 commands)
    #
    # Commands:
    # p, pick <commit> = use commit
    # r, reword <commit> = use commit, but edit the commit message
    # e, edit <commit> = use commit, but stop for amending
    # s, squash <commit> = use commit, but meld into previous commit
    # f, fixup <commit> = like "squash", but discard this commit's log message
    # x, exec <command> = run command (the rest of the line) using shell
    # b, break = stop here (continue rebase later with 'git rebase --continue')
    # d, drop <commit> = remove commit
    # l, label <label> = label current HEAD with a name
    # t, reset <label> = reset HEAD to a label
    # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
    # .       create a merge commit using the original merge commit's
    # .       message (or the oneline, if no original merge commit was
    # .       specified). Use -c <commit> to reword the commit message.
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    #
    # However, if you remove everything, the rebase will be aborted.
    #
    # Note that empty commits are commented out

```




其中,**最新提交的在最下方显示**,修改前面的参数可以
git提交记录如下,可以看到提交的内容都差不多,可以不显示这些信息.
```shell
    lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blogRoot (src)
    $ git log -20 --pretty=oneline
    64e9514c0075d572f5b6054b370cb3416a8801da (HEAD -> src) 更新tools页面
    d6fe96cf476df67a6fd6161d4ec0eb341c603502 修复tools页面显示错乱的问题
    f51bfff817f6b51db992aad991cb91aeaffc407a 解决冲突
    c048569e367041e364492581a09622019c9d5e5c 更新todo页面,更新links页面
    2fb7220f4b46e6703310c458fdb5a917e87ccda7 更新links页面
    ca02eb93f1b1162c6e6d5cc7f5ccc6077427819b 更新todo页面
    681faf8012176aa87635b0ca3e5377b97a9de701 备份讯飞输入法自定义短语
    4bb617cae21b6a7cc83ae95c9ecc7abba6be23ff 更新todo页面,增加一些搜狗输入法windows版个性短语
    8f5c6ad8eaccf4700c0596d69b4479ed6e73592c 增加一些搜狗输入法windows版个性短语,更新todo页面
    d78a1e9a1c345ee5ad6592b3aaad9ed8a01daebb 更新todo页面
    82bcc9f9be7cb1f5d3cd3e7224f051e5e6e1afbd 更新todo页面
    50d0b4c1b1f8aa7dd0d5138f91efc5c48a268e00 增加一些搜狗输入法windows版个性短语
    7bf3ceaa18950d078a2131148807f5380750cb8c 增加一些搜狗输入法windows版个性短语,更新links页面,更新todo页面
    513b759aed9da18eda91d71787ec219c19106dbf 备份讯飞输入法安卓版自定义短语
    aad78f3bcdf216d308a74787993ee326da1cf0b9 更新todo页面
    4dc424414f89c12a05d60f03e65cc7a1d13d8343 更新todo页面
    aa1714e4e1d6bf1bf149674b92477b97a8681e74 增加一些搜狗输入法windows版个性短语
    9656b813bfef1b78e6cf5913fcc03f26223a566e 增加一些搜狗输入法windows版个性短语
    f25d46766d7133ee4af7352457ce17c330eb1cad 增加一些搜狗输入法windows版个性短语
    84461dc843a0905cd8e500aabde88e1a48f4dd1f 增加一些搜狗输入法windows版个性短语,更新links页面
```
现在我想从当前分支(HEAD),压缩到:
```shell
    4dc424414f89c12a05d60f03e65cc7a1d13d8343 更新todo页面
```
这个分支,则输入如下命令:
```shell
git rebase -i 4dc424414f89c12a05d60f03e65cc7a1d13d8343
```
然后显示如下内容:
```shell
    pick aad78f3 更新todo页面
    pick 513b759 备份讯飞输入法安卓版自定义短语
    pick 7bf3cea 增加一些搜狗输入法windows版个性短语,更新links页面,更新todo页面
    pick 50d0b4c 增加一些搜狗输入法windows版个性短语
    pick 82bcc9f 更新todo页面
    pick d78a1e9 更新todo页面
    pick 8f5c6ad 增加一些搜狗输入法windows版个性短语,更新todo页面
    pick 4bb617c 更新todo页面,增加一些搜狗输入法windows版个性短语
    pick c048569 更新todo页面,更新links页面
    pick 681faf8 备份讯飞输入法自定义短语
    pick ca02eb9 更新todo页面
    pick 2fb7220 更新links页面
    pick d6fe96c 修复tools页面显示错乱的问题
    pick 64e9514 更新tools页面

    # Rebase 4dc4244..64e9514 onto 2fb7220 (14 commands)
    #
    # Commands:
    # p, pick <commit> = use commit
    # r, reword <commit> = use commit, but edit the commit message
    # e, edit <commit> = use commit, but stop for amending
    # s, squash <commit> = use commit, but meld into previous commit
    # f, fixup <commit> = like "squash", but discard this commit's log message
    # x, exec <command> = run command (the rest of the line) using shell
    # b, break = stop here (continue rebase later with 'git rebase --continue')
    # d, drop <commit> = remove commit
    # l, label <label> = label current HEAD with a name
    # t, reset <label> = reset HEAD to a label
    # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
    # .       create a merge commit using the original merge commit's
    # .       message (or the oneline, if no original merge commit was
    # .       specified). Use -c <commit> to reword the commit message.
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    #
    E:/Blog/blogRoot/.git/rebase-merge/git-rebase-todo [unix] (11:02 09/12/2019)     
```
先来看最前面的内容:
```shell
    pick aad78f3 更新todo页面
    pick 513b759 备份讯飞输入法安卓版自定义短语
    pick 7bf3cea 增加一些搜狗输入法windows版个性短语,更新links页面,更新todo页面
    pick 50d0b4c 增加一些搜狗输入法windows版个性短语
    pick 82bcc9f 更新todo页面
    pick d78a1e9 更新todo页面
    pick 8f5c6ad 增加一些搜狗输入法windows版个性短语,更新todo页面
    pick 4bb617c 更新todo页面,增加一些搜狗输入法windows版个性短语
    pick c048569 更新todo页面,更新links页面
    pick 681faf8 备份讯飞输入法自定义短语
    pick ca02eb9 更新todo页面
    pick 2fb7220 更新links页面
    pick d6fe96c 修复tools页面显示错乱的问题
    pick 64e9514 更新tools页面
```
首先
```shell
4dc424414f89c12a05d60f03e65cc7a1d13d8343
```
这个分支的前一个分支是`aad78f3`,它现在显示在**最上方**,而最下方的分支是`64e9514`,表示**当前分支**.
好的现在来看命令的意思
```shell
 # Commands:
    # p, pick <commit> = use commit
    # r, reword <commit> = use commit, but edit the commit message
    # e, edit <commit> = use commit, but stop for amending
    # s, squash <commit> = use commit, but meld into previous commit
    # f, fixup <commit> = like "squash", but discard this commit's log message
    # x, exec <command> = run command (the rest of the line) using shell
    # b, break = stop here (continue rebase later with 'git rebase --continue')
    # d, drop <commit> = remove commit
    # l, label <label> = label current HEAD with a name
    # t, reset <label> = reset HEAD to a label
    # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
    # .       create a merge commit using the original merge commit's
    # .       message (or the oneline, if no original merge commit was
    # .       specified). Use -c <commit> to reword the commit message.
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
```

|命令|描述|
|:---|:---|
|pick|表示保留这次提交的内容|
|reword|表示保留这次提交的内容,但是重新修改分支的提交信息.|
|e|表示保留这次提交的内容,但是停止修改,这个我还没试过|
|s|**表示保留这次提交,但是合并到前一个分支上**|
|f|保留这次提交的修改,不适用这次提交的描述信息.|

现在讲命令改为如下形式:
```shell
pick aad78f3 更新todo页面
s 513b759 备份讯飞输入法安卓版自定义短语
s 7bf3cea 增加一些搜狗输入法windows版个性短语,更新links页面,更新todo页面
s 50d0b4c 增加一些搜狗输入法windows版个性短语
s 82bcc9f 更新todo页面
s d78a1e9 更新todo页面
s 8f5c6ad 增加一些搜狗输入法windows版个性短语,更新todo页面
s 4bb617c 更新todo页面,增加一些搜狗输入法windows版个性短语
s c048569 更新todo页面,更新links页面
s 681faf8 备份讯飞输入法自定义短语
s ca02eb9 更新todo页面
s 2fb7220 更新links页面
s d6fe96c 修复tools页面显示错乱的问题
s 64e9514 更新tools页面
```
然后保存.这样中间的分支全部被压缩掉