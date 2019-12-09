---
title: git rebase命令
categories: 
  - Git
date: 2019-12-09 12:15:47
updated: 2019-12-09 13:35:46
abbrlink: edcdf022
---
<div id='my_toc'>

- [git rebase的作用](/blog/edcdf022/#git-rebase的作用)
- [注意](/blog/edcdf022/#注意)
- [压缩多个commit为一个新的commit](/blog/edcdf022/#压缩多个commit为一个新的commit)
    - [先查看commit历史](/blog/edcdf022/#先查看commit历史)
    - [合并当前到远程之间的commit](/blog/edcdf022/#合并当前到远程之间的commit)
    - [保留第一个pick 后面的pick改为squash](/blog/edcdf022/#保留第一个pick-后面的pick改为squash)
    - [写上新的commit的描述](/blog/edcdf022/#写上新的commit的描述)
    - [压缩效果](/blog/edcdf022/#压缩效果)
    - [再次修改commit描述](/blog/edcdf022/#再次修改commit描述)
        - [效果](/blog/edcdf022/#效果)
- [测试](/blog/edcdf022/#测试)
- [参考资料](/blog/edcdf022/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# git rebase的作用
当你完成比较负载的一个任务的时候,你可能提交了多次commit,经过一系列的commit后,你最终完成了任务,然后你想推送到远程仓库中.
但是如果你此时直接push到远程仓库中,这样远程仓库中就有了好多冗余的commit,所以在push到远程仓库之前,应该讲这些中间的commit合并成一个commit,然后再推送到远程仓库上,这样的commit记录就会比较简洁美观.
# 注意
不要通过rebase对任何已经提交到公共仓库中的commit进行修改(除非是你)
# 压缩多个commit为一个新的commit
要合并commit的话,前提是要有多个commit,如果只相差一个commit的话直接push就行了,不需要合并
## 先查看commit历史
```shell
git log -10 --pretty=oneline
```
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ git log -10 --pretty=oneline
dce93fd66d8c01b3bb7e944ae43fe0165e5ae802 (HEAD -> master) 更新文章
1fcec380bdfe807de6ef6a36495683a5488b9f56 更新文章
b82a12ccc05de8d2e9ff162bf206b525e386d7fd 更新文章
92bf7d32990a43ca242e3b0a40b2e0f199ad1dd2 (origin/master, origin/HEAD) 更新 source/_posts/Git/git rebase命令.md
4cb6b92e18a0f9a1ce1d129523b6fe4ddfaac231 Merge branch 'master' of github.com:lanlan2017/blog into HEAD
4cc82482180152616e8cee8a6de919c7eb881053 删除文章中的无效图片,添加新的Git相关的文章,压缩commit
7dccad9a4db12c9a91c25b77ee941cc59e826614 压缩
1a31038c8c3b78e6675489d1af147d9ac2425d72 删除文章中的无效图片,添加新的Git相关的文章
bf682016607be6eabf1952ee9a2ca70c804442aa 添加新的Git相关的文章
9e845cfda2fa63dd4bb7f143a33a53c3308bccf7 删除文章中的无效图片
```
## 合并当前到远程之间的commit
```shell
git rebase -i 92bf7d32990a43ca242e3b0a40b2e0f199ad1dd2
```
## 保留第一个pick 后面的pick改为squash
```shell
    pick b82a12c 更新文章
    pick 1fcec38 更新文章
    pick dce93fd 更新文章

    # Rebase 92bf7d3..dce93fd onto 92bf7d3 (3 commands)
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
    E:/Blog/blog/.git/rebase-merge/git-rebase-todo [unix] (13:12 09/12/2019)2,1 顶端
    "E:/Blog/blog/.git/rebase-merge/git-rebase-todo" [unix] 29L, 1214C

```
```shell
    pick b82a12c 更新文章
    s 1fcec38 更新文章
    s dce93fd 更新文章

    # Rebase 92bf7d3..dce93fd onto 92bf7d3 (3 commands)
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

```
这样会将上面的三个commit压缩到一个新的分支上.
## 写上新的commit的描述
```shell
    # This is a combination of 3 commits.
    # This is the 1st commit message:

    更新文章

    # This is the commit message #2:

    更新文章

    # This is the commit message #3:

    更新文章

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Mon Dec 9 13:08:03 2019 +0800
    #
    # interactive rebase in progress; onto 92bf7d3
    # Last commands done (3 commands done):
    #    squash 1fcec38 更新文章
    #    squash dce93fd 更新文章

```
```shell
    # This is a combination of 3 commits.
    # This is the 1st commit message:

    更新文章_压缩得到的新的commit的描述信息

    # This is the commit message #2:

    更新文章_之前的commit描述1

    # This is the commit message #3:

    更新文章_之前的commit描述2

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Mon Dec 9 13:08:03 2019 +0800
    #
    # interactive rebase in progress; onto 92bf7d3
    # Last commands done (3 commands done):
    #    squash 1fcec38 更新文章
    #    squash dce93fd 更新文章

```
## 压缩效果
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ git log -10 --pretty=oneline
226d81dfa724d963ca387f40505df4cf11fd42c7 (HEAD -> master) 更新文章_压缩得到的新的commit的描述信息
92bf7d32990a43ca242e3b0a40b2e0f199ad1dd2 (origin/master, origin/HEAD) 更新 source/_posts/Git/git rebase命令.md
4cb6b92e18a0f9a1ce1d129523b6fe4ddfaac231 Merge branch 'master' of github.com:lanlan2017/blog into HEAD
4cc82482180152616e8cee8a6de919c7eb881053 删除文章中的无效图片,添加新的Git相关的文章,压缩commit
7dccad9a4db12c9a91c25b77ee941cc59e826614 压缩
1a31038c8c3b78e6675489d1af147d9ac2425d72 删除文章中的无效图片,添加新的Git相关的文章
bf682016607be6eabf1952ee9a2ca70c804442aa 添加新的Git相关的文章
9e845cfda2fa63dd4bb7f143a33a53c3308bccf7 删除文章中的无效图片
b9ab7facc769e575b28fefd74e2154fd16087e52 添加新的Git相关的文章
29a6e2b0240c71240146f9a19029d8736055eb5b 添加JS相关文章,更新Git相关文章

```
可以看到:
```shell
dce93fd66d8c01b3bb7e944ae43fe0165e5ae802 (HEAD -> master) 更新文章
1fcec380bdfe807de6ef6a36495683a5488b9f56 更新文章
b82a12ccc05de8d2e9ff162bf206b525e386d7fd 更新文章
```
这三条commit都**压缩成一个新的commit**了:
```shell
226d81dfa724d963ca387f40505df4cf11fd42c7 (HEAD -> master) 更新文章_压缩得到的新的commit的描述信息
```
## 再次修改commit描述
上面的commit描述,只是为了说明效果,可以输入如下命令,修改commit的内容:
```shell
git commit --amend
```
```shell
    更新文章_压缩得到的新的commit的描述信息

    更新文章_之前的commit描述1

    更新文章_之前的commit描述2

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Mon Dec 9 13:08:03 2019 +0800
    #
    # On branch master
    # Your branch is ahead of 'origin/master' by 1 commit.
    #   (use "git push" to publish your local commits)
    #
    # Changes to be committed:
    #       modified:   source/_posts/Git/git rebase命令.md
    #
```
修改为如下内容:
```shell
    更新文章_压缩得到的新的commit的描述信息

    更新文章_之前的commit描述1

    更新文章_之前的commit描述2

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Mon Dec 9 13:08:03 2019 +0800
    #
    # On branch master
    # Your branch is ahead of 'origin/master' by 1 commit.
    #   (use "git push" to publish your local commits)
    #
    # Changes to be committed:
    #       modified:   source/_posts/Git/git rebase命令.md
    #
```
```shell
    更新文章
    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Mon Dec 9 13:08:03 2019 +0800
    #
    # On branch master
    # Your branch is ahead of 'origin/master' by 1 commit.
    #   (use "git push" to publish your local commits)
    #
    # Changes to be committed:
    #       modified:   source/_posts/Git/git rebase命令.md
    #
```
### 效果
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ git log -10 --pretty=oneline
116161db01c2a19558da0c5b9360c979c46f1205 (HEAD -> master) 更新文章
92bf7d32990a43ca242e3b0a40b2e0f199ad1dd2 (origin/master, origin/HEAD) 更新 source/_posts/Git/git rebase命令.md
4cb6b92e18a0f9a1ce1d129523b6fe4ddfaac231 Merge branch 'master' of github.com:lanlan2017/blog into HEAD
4cc82482180152616e8cee8a6de919c7eb881053 删除文章中的无效图片,添加新的Git相关的文章,压缩commit
7dccad9a4db12c9a91c25b77ee941cc59e826614 压缩
1a31038c8c3b78e6675489d1af147d9ac2425d72 删除文章中的无效图片,添加新的Git相关的文章
bf682016607be6eabf1952ee9a2ca70c804442aa 添加新的Git相关的文章
9e845cfda2fa63dd4bb7f143a33a53c3308bccf7 删除文章中的无效图片
b9ab7facc769e575b28fefd74e2154fd16087e52 添加新的Git相关的文章
29a6e2b0240c71240146f9a19029d8736055eb5b 添加JS相关文章,更新Git相关文章
```
现在就可以push了
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ git push origin master
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 501 bytes | 501.00 KiB/s, done.
Total 6 (delta 5), reused 0 (delta 0)
remote: Resolving deltas: 100% (5/5), completed with 5 local objects.
remote:
remote: GitHub found 3 vulnerabilities on lanlan2017/blog's default branch (2 high, 1 moderate). To find out more, visit:
remote:      https://github.com/lanlan2017/blog/network/alerts
remote:
To github.com:lanlan2017/blog.git
   92bf7d3..116161d  master -> master

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ git log -10 --pretty=oneline
116161db01c2a19558da0c5b9360c979c46f1205 (HEAD -> master, origin/master, origin/HEAD) 更新文章
......
```
# 测试
# 参考资料
[https://www.jianshu.com/p/4a8f4af4e803](https://www.jianshu.com/p/4a8f4af4e803)
[https://git-scm.com/docs/git-rebase](https://git-scm.com/docs/git-rebase)
