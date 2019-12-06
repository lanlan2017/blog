---
title: fatal refusing to merge unrelated histories
categories:
  - Git
  - Debug
abbrlink: '0'
---
# fatal: refusing to merge unrelated histories
今天拉取远程分支时报错如下:
````shell
~/blog/blogRoot   src  git pull origin master
remote: Enumerating objects: 81, done.
remote: Counting objects: 100% (81/81), done.
remote: Compressing objects: 100% (46/46), done.
remote: Total 81 (delta 18), reused 81 (delta 18), pack-reused 0
Unpacking objects: 100% (81/81), done.
From github.com:lanlan2017/lanlan2017.github.io
 * branch            master     -> FETCH_HEAD
 + c900694...4965db5 master     -> origin/master  (forced update)
fatal: refusing to merge unrelated histories
```

# 原因
这是因为我试图把远程的主分支上拉到src分支上。master分支我放的是pages，src分支放源码，这两个分支一开始就没有交集，无法合并。
我这是打错命令了，拉取src分支就好了:
```shell
 ✘  ~/blog/blogRoot   src  git pull origin src
remote: Enumerating objects: 108, done.
remote: Counting objects: 100% (108/108), done.
remote: Compressing objects: 100% (46/46), done.
remote: Total 97 (delta 52), reused 76 (delta 31), pack-reused 0
Unpacking objects: 100% (97/97), done.
From github.com:lanlan2017/lanlan2017.github.io
 * branch            src        -> FETCH_HEAD
   e293673..8ff9c26  src        -> origin/src
Updating e293673..8ff9c26
Fast-forward
 .travis.yml                           |   1 +
 FM.properties                         |   5 +
 HexoS.bat                             |  18 ++
 source/_posts/index.md                |   2 +
 .../政策/第三代社保卡.md      |  33 +++
 ...�国互联网企业100强名单.md | 150 +++++++++++++
 source/links/index.md                 |  16 +-
 source/todo/index.md                  |  30 ++-
 source/tools/index.md                 |  23 +-
 9 files changed, 263 insertions(+), 15 deletions(-)
 create mode 100644 FM.properties
 create mode 100644 HexoS.bat
 create mode 100644 source/_posts/政策/第三代社保卡.md
 create mode 100644 source/_posts/行业/2019年中国互联网企业100强名单.md
 ~/blog/blogRoot   src  git status
On branch src
Your branch is up to date with 'origin/src'.

nothing to commit, working tree clean
 ~/blog/blogRoot   src 
```
