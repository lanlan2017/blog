---
title: git rebase命令
categories: 
  - 编程
  - Git
  - 命令
date: 2019-12-09 12:15:47
updated: 2021-03-20 10:05:16
abbrlink: edcdf022
---
# git rebase的作用
当你完成比较复杂的一个任务的时候,你可能提交了多次commit,经过一系列的commit后,你最终完成了任务,然后你想推送到远程仓库中.
但是如果你此时直接push到远程仓库中,这样远程仓库中就有了好多冗余的commit,所以在push到远程仓库之前,应该将这些中间的commit合并成一个commit,然后再推送到远程仓库上,这样你的的commit记录就比较简洁清爽.
# 注意
不要通过rebase对任何已经提交到公共仓库中的commit进行修改(除非是你)
还有就是使用rebase的过程中不要在更改本地仓库中的任何内容,以免需要再次合并,或者再次提交.
# 压缩多个commit为一个新的commit
要合并commit的话,前提是要有多个commit,如果只是超前一个commit的话,直接push就行了,不需要合并
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
可以看到现在超前了3个commit,这3个commit其实做的是同一件事情,应该压缩成一个分支.
## 合并当前到远程之间的commit
先获取远程commit记录上的commit_id:
```shell
92bf7d32990a43ca242e3b0a40b2e0f199ad1dd2
```
然后输入如下命令,进行压缩:
```shell
git rebase -i 92bf7d32990a43ca242e3b0a40b2e0f199ad1dd2
```
## 保留第一个pick 后面的pick改为squash
记下来,会在vim中弹出如下内容:
```shell
    pick b82a12c 更新文章
    pick 1fcec38 更新文章
    pick dce93fd 更新文章

    &#35; Rebase 92bf7d3..dce93fd onto 92bf7d3 (3 commands)
    &#35;
    &#35; Commands:
    &#35; p, pick &lt;commit&gt; = use commit
    &#35; r, reword &lt;commit&gt; = use commit, but edit the commit message
    &#35; e, edit &lt;commit&gt; = use commit, but stop for amending
    &#35; s, squash &lt;commit&gt; = use commit, but meld into previous commit
    &#35; f, fixup &lt;commit&gt; = like "squash", but discard this commit's log message
    &#35; x, exec &lt;command&gt; = run command (the rest of the line) using shell
    &#35; b, break = stop here (continue rebase later with 'git rebase --continue')
    &#35; d, drop &lt;commit&gt; = remove commit
    &#35; l, label &lt;label&gt; = label current HEAD with a name
    &#35; t, reset &lt;label&gt; = reset HEAD to a label
    &#35; m, merge [-C &lt;commit&gt; | -c &lt;commit&gt;] &lt;label&gt; [&#35; &lt;oneline&gt;]
    &#35; .       create a merge commit using the original merge commit's
    &#35; .       message (or the oneline, if no original merge commit was
    &#35; .       specified). Use -c &lt;commit&gt; to reword the commit message.
    &#35;
    E:/Blog/blog/.git/rebase-merge/git-rebase-todo [unix] (13:12 09/12/2019)2,1 顶端
    "E:/Blog/blog/.git/rebase-merge/git-rebase-todo" [unix] 29L, 1214C

```
我们要修改其中的内容:按下`i`,进入**vim**的**插入模式**,将第一个pick保留,后面的pick全部改成s:
```shell
    pick b82a12c 更新文章
    s 1fcec38 更新文章
    s dce93fd 更新文章

    &#35; Rebase 92bf7d3..dce93fd onto 92bf7d3 (3 commands)
    &#35;
    &#35; Commands:
    &#35; p, pick &lt;commit&gt; = use commit
    &#35; r, reword &lt;commit&gt; = use commit, but edit the commit message
    &#35; e, edit &lt;commit&gt; = use commit, but stop for amending
    &#35; s, squash &lt;commit&gt; = use commit, but meld into previous commit
    &#35; f, fixup &lt;commit&gt; = like "squash", but discard this commit's log message
    &#35; x, exec &lt;command&gt; = run command (the rest of the line) using shell
    &#35; b, break = stop here (continue rebase later with 'git rebase --continue')
    &#35; d, drop &lt;commit&gt; = remove commit
    &#35; l, label &lt;label&gt; = label current HEAD with a name
    &#35; t, reset &lt;label&gt; = reset HEAD to a label
    &#35; m, merge [-C &lt;commit&gt; | -c &lt;commit&gt;] &lt;label&gt; [&#35; &lt;oneline&gt;]
    &#35; .       create a merge commit using the original merge commit's
    &#35; .       message (or the oneline, if no original merge commit was
    &#35; .       specified). Use -c &lt;commit&gt; to reword the commit message.
    &#35;

```
修改好了之后,按下**ESC**,然后输入`:wq`进行保存,这样会将上面的三个commit压缩到一个新的分支上.
## 写上新的commit的描述
然后还会在vim中弹出如下内容,让你写上**压缩得到的新的分支的描述信息**.
```shell
    # This is a combination of 3 commits.
    # This is the 1st commit message:

    更新文章

    # This is the commit message #2:

    更新文章

    # This is the commit message #3:

    更新文章

    &#35; Please enter the commit message for your changes. Lines starting
    &#35; with '&#35;' will be ignored, and an empty message aborts the commit.
    &#35;
    &#35; Date:      Mon Dec 9 13:08:03 2019 +0800
    &#35;
    &#35; interactive rebase in progress; onto 92bf7d3
    &#35; Last commands done (3 commands done):
    &#35;    squash 1fcec38 更新文章
    &#35;    squash dce93fd 更新文章

```
这个地方按你的实际情况书写即可,为了演示方便,我改成如下内容:
```shell
    # This is a combination of 3 commits.
    # This is the 1st commit message:

    更新文章_压缩得到的新的commit的描述信息

    # This is the commit message #2:

    更新文章_之前的commit描述1

    # This is the commit message #3:

    更新文章_之前的commit描述2

    &#35; Please enter the commit message for your changes. Lines starting
    &#35; with '&#35;' will be ignored, and an empty message aborts the commit.
    &#35;
    &#35; Date:      Mon Dec 9 13:08:03 2019 +0800
    &#35;
    &#35; interactive rebase in progress; onto 92bf7d3
    &#35; Last commands done (3 commands done):
    &#35;    squash 1fcec38 更新文章
    &#35;    squash dce93fd 更新文章

```
然后再次**保存退出即可**.
## 压缩效果
这样就压缩好了,压缩得到的分支如下:
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
这三条commit都**压缩成一个新的commit**:
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

    &#35; Please enter the commit message for your changes. Lines starting
    &#35; with '&#35;' will be ignored, and an empty message aborts the commit.
    &#35;
    &#35; Date:      Mon Dec 9 13:08:03 2019 +0800
    &#35;
    &#35; On branch master
    &#35; Your branch is ahead of 'origin/master' by 1 commit.
    &#35;   (use "git push" to publish your local commits)
    &#35;
    &#35; Changes to be committed:
    &#35;       modified:   source/_posts/Git/git rebase命令.md
    &#35;
```
修改为如下内容:
```shell
    更新文章_压缩得到的新的commit的描述信息

    更新文章_之前的commit描述1

    更新文章_之前的commit描述2

    &#35; Please enter the commit message for your changes. Lines starting
    &#35; with '&#35;' will be ignored, and an empty message aborts the commit.
    &#35;
    &#35; Date:      Mon Dec 9 13:08:03 2019 +0800
    &#35;
    &#35; On branch master
    &#35; Your branch is ahead of 'origin/master' by 1 commit.
    &#35;   (use "git push" to publish your local commits)
    &#35;
    &#35; Changes to be committed:
    &#35;       modified:   source/_posts/Git/git rebase命令.md
    &#35;
```
```shell
    更新文章
    &#35; Please enter the commit message for your changes. Lines starting
    &#35; with '&#35;' will be ignored, and an empty message aborts the commit.
    &#35;
    &#35; Date:      Mon Dec 9 13:08:03 2019 +0800
    &#35;
    &#35; On branch master
    &#35; Your branch is ahead of 'origin/master' by 1 commit.
    &#35;   (use "git push" to publish your local commits)
    &#35;
    &#35; Changes to be committed:
    &#35;       modified:   source/_posts/Git/git rebase命令.md
    &#35;
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
