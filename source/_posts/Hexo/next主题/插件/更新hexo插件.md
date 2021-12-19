---
title: 更新hexo插件
categories: 
  - Hexo
  - next主题
  - 插件
date: 2021-03-19 08:21:34
updated: 2021-03-19 10:44:21
abbrlink: 542e0f6d
---
# 检查更新
```shell
npm outdated
```
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/exam (master)
$ npm outdated
Package                 Current  Wanted  Latest  Location
hexo                      4.2.1   4.2.1   5.4.0  hexo-site
hexo-deployer-git         2.1.0   2.1.0   3.0.0  hexo-site
hexo-generator-search     2.4.0   2.4.1   2.4.1  hexo-site
hexo-generator-sitemap    2.0.0   2.1.0   2.1.0  hexo-site
hexo-renderer-stylus      1.1.0   1.1.0   2.0.1  hexo-site
hexo-server               1.0.0   1.0.0   2.0.0  hexo-site
```
我这里的hexo是4.2.1这已经是hexo4的最高版本了，我之前有试过升级到hexo5,但是会打不开站点。所以我就升级插件就行了，hexo就不更新了。
如果需要用hexo5的话，可能要重新使用hexo init创建一个新的站点，然后将原来的文章复制过去才行。
# 修改package.json
更新要升级的插件的版本号：
```
$ git diff package.json
warning: LF will be replaced by CRLF in package.json.
The file will have its original line endings in your working directory
diff --git a/package.json b/package.json
index 499cb10..71c188c 100644
--- a/package.json
+++ b/package.json
@@ -15,17 +15,17 @@
     "hexo": "^4.2.1",
     "hexo-abbrlink": "^2.2.1",
     "hexo-auto-category": "^0.2.0",
-    "hexo-deployer-git": "^2.1.0",
+    "hexo-deployer-git": "^3.0.0",
     "hexo-generator-archive": "^1.0.0",
     "hexo-generator-baidu-sitemap": "^0.1.9",
     "hexo-generator-category": "^1.0.0",
     "hexo-generator-index-pin-top": "^0.2.2",
-    "hexo-generator-search": "^2.4.0",
-    "hexo-generator-sitemap": "^2.0.0",
+    "hexo-generator-search": "^2.4.1",
+    "hexo-generator-sitemap": "^2.1.0",
     "hexo-generator-tag": "^1.0.0",
     "hexo-renderer-ejs": "^1.0.0",
     "hexo-renderer-kramed": "^0.1.4",
-    "hexo-renderer-stylus": "^1.1.0",
-    "hexo-server": "^1.0.0"
+    "hexo-renderer-stylus": "^2.0.1",
+    "hexo-server": "^2.0.0"
   }
 }
```
# 安装更新
```shell
npm install --save
```
# 从Git版本库中删除已经添加的文件package-lock.json
这个文件是npm install命令生成的，里面存放有插件的地址，没有必要加入版本库，我之前不知道，没有将该文件排除在外。
## 在.gitignore添加该文件
打开.gitignore文件，把`package-lock.json`添加到其中。
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/exam (master)
$ git diff .gitignore
diff --git a/.gitignore b/.gitignore
index 122aa34..8b3df4c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -8,4 +8,5 @@ public/
 备份.md
 */测试.md
 */测试/*
+package-lock.json
\ No newline at end of file
```
## 使用git rm --cached命令删除已经添加过的文件
.gitignore只对新添加的文件有效，由于package-lock.json文件已经在版本库中。所以此时.gitignore对该文件没有影响。
现在接着使用git rm --cached删除该文件即可：
### git rm -n --cached
为了以防删错，可以多添加-n参数(git rm -n --cached)，这样会显示你要删除的文件，但不会真正的删除。
等确认是你要删除的文件后，再去掉-n参数，使用git rm --cached 删除即可。

删除效果：

```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/exam (master)
$ git rm -n --cached package-lock.json
rm 'package-lock.json'

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/exam (master)
$ git rm --cached package-lock.json
rm 'package-lock.json'

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/exam (master)
```
查看删除效果：
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/exam (master)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        deleted:    package-lock.json

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .gitignore
        modified:   package.json

```
