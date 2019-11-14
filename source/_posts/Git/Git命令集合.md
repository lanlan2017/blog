---
title: Git命令集合
categories: 
  - Git
date: 2018-10-29 20:55:48
updated: 2019-11-05 10:32:10
abbrlink: 504e809a
---
- [分支相关](/blog/504e809a/#分支相关)
    - [查询分支](/blog/504e809a/#查询分支)
    - [创建分支](/blog/504e809a/#创建分支)
    - [查看当前分支](/blog/504e809a/#查看当前分支)
    - [切换分支](/blog/504e809a/#切换分支)
    - [合并分支](/blog/504e809a/#合并分支)
    - [删除分支](/blog/504e809a/#删除分支)
- [忽略文件](/blog/504e809a/#忽略文件)
    - [忽略文件的便捷写法](/blog/504e809a/#忽略文件的便捷写法)
    - [忽略已加入版本控制的文件](/blog/504e809a/#忽略已加入版本控制的文件)
        - [1.清除该文件的缓存](/blog/504e809a/#1-清除该文件的缓存)
            - [1.清除该文件的缓存](/blog/504e809a/#1-清除该文件的缓存)
        - [2.重新添加提交](/blog/504e809a/#2-重新添加提交)
            - [2.重新添加提交](/blog/504e809a/#2-重新添加提交)
    - [克隆的仓库中 忽略已经加入文件的更新](/blog/504e809a/#克隆的仓库中-忽略已经加入文件的更新)
- [远程仓库](/blog/504e809a/#远程仓库)
    - [添加远程仓库](/blog/504e809a/#添加远程仓库)
    - [查看远程仓库](/blog/504e809a/#查看远程仓库)
    - [推送到远程仓库](/blog/504e809a/#推送到远程仓库)
- [版本回退](/blog/504e809a/#版本回退)
    - [查看版本日志](/blog/504e809a/#查看版本日志)
    - [撤销添加](/blog/504e809a/#撤销添加)
    - [回退到某次commit](/blog/504e809a/#回退到某次commit)
    - [撤销修改](/blog/504e809a/#撤销修改)
- [冲突](/blog/504e809a/#冲突)
    - [产生冲突的情况](/blog/504e809a/#产生冲突的情况)
    - [查找冲突的文件](/blog/504e809a/#查找冲突的文件)
    - [修改冲突的文件](/blog/504e809a/#修改冲突的文件)
    - [再次提交](/blog/504e809a/#再次提交)
    - [切换分支合并修改](/blog/504e809a/#切换分支合并修改)
    - [显示分支的合并情况](/blog/504e809a/#显示分支的合并情况)
- [git rebase 进行 git 压缩](/blog/504e809a/#git-rebase-进行-git-压缩)
    - [压缩最近的分支](/blog/504e809a/#压缩最近的分支)
- [强制覆盖远程仓库](/blog/504e809a/#强制覆盖远程仓库)
- [查看分支时间](/blog/504e809a/#查看分支时间)
- [参考链接](/blog/504e809a/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 分支相关 ##
### 查询分支 ###
`git branch`
### 创建分支 ###
```
git checkout -b dev
```
`git checkout`命令加上-b参数表示创建并切换，相当于以下两条命令：
```
git branch dev
git checkout dev
```
### 查看当前分支 ###
用`git branch`命令查看当前分支：
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/dev/workspace/HexoTools (dev)
$ git branch
* dev
  master
```
`git branch`命令会列出所有分支，当前分支前面会标一个`*`号。
### 切换分支 ###
在dev分支的工作完成后，我们就可以切换回master分支：
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/dev/workspace/HexoTools (dev)
$ git checkout master
Switched to branch 'master'
lan@DESKTOP-8ISAT6B MINGW64 /D/dev/workspace/HexoTools (master)
```
### 合并分支 ###
使用`git merge 指定分支`命令合并指定分支到当前分支。现在，把dev分支的工作成果合并到master分支上,
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/dev/workspace/HexoTools (master)
$ git merge dev
Updating ec6d299..616432d
Fast-forward
 src/front/matter/tools/AddFrontMatter.java         | 198 ---------
......
 .../to/this_article/CurrentArticlesHyperlinks.java | 194 ++++++++
 25 files changed, 1842 insertions(+), 1446 deletions(-)
 delete mode 100644 src/front/matter/tools/AddFrontMatter.java
......
 delete mode 100644 src/markdown/add/horizontal/line/AddHorizontalLine.java
......
 create mode 100644 src/useless/generate/links/to/this_article/CurrentArticlesHyperlinks.java
```
注意到上面的`Fast-forward`信息，Git告诉我们，这次合并是“`快进模式`”，也就是直接把master指向dev的当前提交，所以合并速度非常快。
### 删除分支 ###
和并到主分支后，就可以删除dev分支了:
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/dev/workspace/HexoTools (master)
$ git branch -d dev
Deleted branch dev (was 616432d).
```
删除后，查看branch，就只剩下master分支了：
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/dev/workspace/HexoTools (master)
$ git branch
* master

```
## 忽略文件 ##
### 忽略文件的便捷写法 ###
在`.gitignore`文件中，写入想要忽略的文件或者目录的相对地址即可。下面介绍一个快速写`.gitignore`文件的技巧：
打开git-bash，输入`touch .gitignore`创建.gitignore文件。然后输入：`ls -ah >.gitignore`命令把当前目录下所有的文件以及目录都写入到.gitignore文件中。这表示忽略项目中所有的目录以及文件。可以输入`cat .gitignore`命令所有忽略的文件或目录，如下所示：
```
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/Coding (master)
$ cat .gitignore
./
../
.classpath
.git/
.gitignore
.project
.settings/
bin/
res/
src/
```
最后使用`vim .gitigonre`命令编辑文件，删除(按下`dd`)你要加入版本管理的文件以及目录,想要忽略的就保留。这样比我们手动的往里面写要快的多：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/git/git%20cmd/delete_gitignore.png)
### 忽略已加入版本控制的文件 ###
#### 问题描述 ####
`.gitignore`中已经标明忽略某个文件或目录,但是这个文件还是默认加到版本库中.
#### 原因 ####
**如果某些文件已经被纳入了版本管理中，就算是在`.gitignore`中已经声明了忽略路径也是不起作用的**,**因为.gitignore只对还没有加入版本库的文件有效.**
这个使用使用`git rm`命令可以从版本库中删除文件.
#### 查看要从版本库中删除的文件 ####
```cmd
git rm -n --cached 文件
```
#### 查看要从版本库中删除的目录 ####
```cmd
git rm -r -n --cached 目录
```
注意不要使用`git rm -r --cached .`这个命令很危险,有可能把`IDE`的配置文件给删掉,免得到时候打不开又得重新建工程。
#### 实例:从版本库中移除一个文件 ####
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ cat .gitignore
bin/
.settings/
*.txt
.project
.classpath
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git status
On branch dev
        ...
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
        modified:   HexoFrontMatter.txt
        ...
```
##### 1.清除该文件的缓存 #####
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git rm -n --cached HexoFrontMatter.txt
rm 'HexoFrontMatter.txt'
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git rm --cached HexoFrontMatter.txt
rm 'HexoFrontMatter.txt'
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git status
On branch dev
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
        deleted:    HexoFrontMatter.txt
        ......
```
加上`-n`参数表示显示要即将要删除的文件,并不会真正则删除.这个参数用来验证自己删除的对不对,以免误删。
##### 2.重新添加提交 #####
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git add .
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git status
On branch dev
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
        deleted:    HexoFrontMatter.txt
        ......
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git commit -m '
> 从版本库中移除日志文件(txt)'
[dev 191c3cd] 从版本库中移除日志文件(txt)
 8 files changed, 134 insertions(+), 28 deletions(-)
 delete mode 100644 HexoFrontMatter.txt
 create mode 100644 src/find/not/fm/FindNotFM.java
 rename src/tools/readlastlineinbigfile/{LastLineInFileTools.java => LastLineReader.java} (94%)
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
$ git status
On branch dev
nothing to commit, working tree clean

lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/HexoTools (dev)
```
这个时候该`txt`文件已经从版本库中删除掉了,不过并不会删除工作区的文件,可以用ls命令查看:
```cmd
$ ls
bin/  HexoFrontMatter.txt  lib/  README.md  res/  runable/  src/
```
#### 实例:从版本库中移除目录 ####
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/XunFeiTTS (dev)
$ git status
On branch dev
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
        modified:   .settings/org.eclipse.core.resources.prefs
        .......
no changes added to commit (use "git add" and/or "git commit -a")
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/XunFeiTTS (dev)
$ git rm -r -n --cached .settings/
rm '.settings/org.eclipse.core.resources.prefs'
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/XunFeiTTS (dev)
$ git rm -r --cached .settings/
rm '.settings/org.eclipse.core.resources.prefs'
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/XunFeiTTS (dev)
$ git add .
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/XunFeiTTS (dev)
$ git commit -m '
> 1.支持输入字符串合成音频
> 2.从版本库中移除IDE的配置文件目录.
> '
[dev bfd69df] 1.支持输入字符串合成音频 2.从版本库中移除IDE的配置文件目录.
 5 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 .settings/org.eclipse.core.resources.prefs
lan@DESKTOP-8ISAT6B MINGW64 /e/workspace/XunFeiTTS (dev)
```
### 克隆的仓库中 忽略已经加入文件的更新 ###
#### 问题描述 ####
经过上一步,我已经从本地仓库中把一个文件彻底移除了，然后我用`git push`命令推送到远程仓库中,这样远程仓库也没有了该文件.

但是我之间在另一个目录中已经克隆了这个仓库,现在我叫这个仓库为`克隆的仓库`。
我想在`克隆的仓库`中使用`git pull`进行更新,但是更新之后,`克隆的仓库`中还是存在这个文件(这是因为在克隆仓库中我修改了这个文件),那又怎么删除呢？
我这里不知道其他方法,最后我现在先删除本地克隆仓库，然后再从远程仓库中克隆。这样克隆的仓库中也就没有了这个文件了。
#### 删除本地仓库 ####
```cmd
rm -rf MD/
```
#### 重新克隆 ####
现在重新克隆到本地仓库中,并重名为`MD`
```cmd
 git clone git@github.com:lanlan2017/markdown-command-line-generator.git MD
```

## 远程仓库 ##
### 添加远程仓库 ###
语法：`git remote add 远程仓库别名 远程仓库地址`
如下所示：
```git
git remote add origin git@github.com:lanlan2017/GetWiFiPassWord.git
```
### 查看远程仓库 ###
```git
git remote -v
```
### 推送到远程仓库 ###
推送到master分支：
```git
git push origin master
```
如果是远程仓库是空的,第一次推送master分支时，则在push后面加上参数`-u`:
```shell
git push -u origin master
```
## 版本回退 ##
### 查看版本日志 ###
```git
 git log --pretty=oneline
```
显示效果如下：
```git
$ git log --pretty=oneline
c8f251788d8cc9dd69b8622dd1bba0384f2a6d48 (HEAD -> master) 修改README.md文件
8304fffa30f0fd96d317244daaa327ada7f1af6d (origin/master, origin/HEAD) 修改代码输出文件使用相对路径
8f3abbee855216adfd92e7727e4c91204fd451c2 获取所有连接过的wifi密码.
931319f6d7f157fef8558662c5a23693cbf8178c Initial commit
```
这里可以看到远程仓库和本地仓库的信息。
### 撤销添加 ###
使用`git add`命令之后,可以输入:
```cmd
git reset HEAD
```
撤销本次添加,也可以输入:
```cmd
git reset HEAD filename
```
撤销添加某个文件,例如要撤销添加`src/mainclass/MMD.java`这个文件可以输入:
```cmd
git reset HEAD src/mainclass/MMD.java
```
### 回退到某次commit ###
```cmd
git reset --hard commit_id  
```
### 撤销修改###
有时候会把代码写蹦了，这个时候就要撤销这次的修改。
#### 撤销一个文件的修改 ####
```git
git checkout -- filename
```
#### 撤销所有修改 ####
有时候，可能修改了不止一个文件，一个个的修改比较麻烦，所以要，撤销所有的修改：
```git
git checkout .
```
#### 删除新增文件 ####
上面的撤销修改只能对已经修改的文件有效,但是如果你新创建了一些新的文件的话,这些文件没有添加到版本库中,是不会自动删除掉的,使用如下命令删除这些新增的文件:
```cmd
 git clean -df
```
## 冲突 ##
### 产生冲突的情况 ###
当`两个分支``都`分别`有新的提交`的时候,在合并的时候就会出现冲突.
### 查找冲突的文件 ###
使用`git status`可以看到发生冲突的文件:
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (master|MERGING)
$ git status
On branch master
Your branch is up to date with 'origin/master'.
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)
Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   src/delete/Delete.java
no changes added to commit (use "git add" and/or "git commit -a")
```
注意其中的这两个提示:
```cmd
        both modified:   src/delete/Delete.java
```
这说明`src/delete/Delete.java`这个文件冲突了。
### 修改冲突的文件 ###
首先不要慌张.`git`已经合并了没有冲突的地方,我们只需要修改上面两个文件中发生冲突的地方即可.现在打开冲突的文件`src/delete/Delete.java`然后修改`git`提示的有冲突的地方,如下所示:
```java
	public static String deleteSpacesBetweenChinese(String text)
	{
		// 删除英文空格
		text = text.replaceAll("([\\u4e00-\\u9fa5])\\s+([\\u4e00-\\u9fa5])",
				"$1$2");
		// 删除中文空格
		text = text.replaceAll("[ ]+", "");
<<<<<<< HEAD
=======
		text = text.replaceAll("　", "");
>>>>>>> dev
		return text;
	}
```
Git用`<<<<<<<`，`=======`，`>>>>>>>`标记出不同分支的中有冲突的地方如下所示:
```java
<<<<<<< HEAD
=======
		text = text.replaceAll("　", "");
>>>>>>> dev
```
等号分割了两个分支,上面的是HEAD分支的新内容,这里为空,等号下面的是dev分支上的新内容。修改这部分内容,然后删掉`<<<<<<< HEAD`这些提示符就行了。这步叫做`手动解决冲突`。
### 再次提交 ###
然后`再次添加,`然后`再次提交`.
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (master|MERGING)
$ git add .
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (master|MERGING)
$ git commit -m '
> 合并冲突'
[master 7d0e456] 合并冲突
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (master)
```
### 切换分支合并修改 ###
这样master分支上就没有冲突了,接着切换到dev分支,然后dev分支合并没有冲突的master分支,这样两者就都没有冲突了。
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (master)
$ git checkout dev
Switched to branch 'dev'
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (dev)
$ git merge master
Updating 9d7c83e..7d0e456
Fast-forward
 M.jar                  | Bin 25388 -> 25372 bytes
 src/add/Add.java       |   2 +-
 src/delete/Delete.java |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (dev)
$ git status
On branch dev
nothing to commit, working tree clean

```

### 显示分支的合并情况 ###
```cmd
git log --graph --pretty=oneline --abbrev-commit
```
如果提交过多的,可以加上`-n`参数指定显示提交的次数.例如下面指定显示提交最近8个分支.
```cmd
lan@DESKTOP-8ISAT6B MINGW64 /d/dev/workspace/MarkdownTools (dev)
$ git log -8 --graph --pretty=oneline --abbrev-commit
*   7d0e456 (HEAD -> dev, master) 合并冲突
|\
| * 9d7c83e `dsbc`参数对应的方法中加入移除中文全角空格的功能.
* |   87ef36d (origin/master) 修改`dsbc`参数对应方法中匹配中文空格的正则表达式,支持匹配多个中文空格.
|\ \
| |/
| * cfef0c2 在dsbc参数对应的方法中,添加删除中文空格的功能.^
* | d5527e8 修改参数 enhl对应的方法.\r\n支持\xxxx格式的linux格式路径.
|/
* c51cc3b 修改 enhl参数方法,支持后缀名.xxx以及路径/xxxx的高亮.
* 1c18026 update .gitignore
* bd63151 update .gitignore

```
## git rebase 进行 git 压缩 ##
### 压缩最近的分支 ###
这个命令不是很熟悉,后面再了解了解.
## 强制覆盖远程仓库 ##
```cmd
git push origin master --force
```
## 查看分支时间 ##
```cmd
git reflog show --date=iso <branch name>
```
运行效果:
```cmd
$ git reflog show --date=iso master
bfd69df (HEAD -> dev, origin/master, origin/HEAD, master) master@{2019-05-25 00:24:04 +0800}: merge dev: Fast-forward
0dab55b master@{2019-05-23 13:49:04 +0800}: merge dev: Fast-forward
...
```
## 参考链接 ##
[Pro Git](https://git-scm.com/book/zh/v2)
[创建与合并分支|廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001375840038939c291467cc7c747b1810aab2fb8863508000)
[.gitignore忽略已加入版本控制的文件](https://blog.csdn.net/seikenwu/article/details/81025711)
[添加远程库](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/0013752340242354807e192f02a44359908df8a5643103a000)
[Git 合并多次 commit 、 删除某次 commit](https://blog.csdn.net/Al_assad/article/details/81145856#t0)
[git如何移除某文件夹的版本控制](https://www.cnblogs.com/dhcn/p/7125099.html)

>原文链接: [Git命令集合](https://lanlan2017.github.io/blog/504e809a/)
