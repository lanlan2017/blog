---
title: gitee图床迁移到github
categories:
  - Hexo
  - next主题
  - 图床
abbrlink: 5f98afec
date: 2022-04-12 16:14:32
updated: 2022-04-12 16:14:32
---
# gitee图床迁移到github
gitee给图片加上外链了，搭建在gitee pages的文章可以访问gitee仓库中的图片。但是github pages上的文章就无法访问gitee仓库中的图片了。

之前把图片放到gitee中是因为gitee上的图片访问较快。github仓库中的图片经常被墙。

所以还是把gitee上的图床仓库迁移到github上吧，墙的话就修改hosts文件解决。

但现在的问题是，我有两个图床，一个是gitee上的images仓库，一个是GitHub上的images仓库。

这两个仓库中的内容不同，需要先合并。

# 下载gitee上的图床仓库。
我使用git clone发现只能下载.git目录。所以我使用压缩包的下载方式。

下载好压缩包后，解压到本地。

# git init
# git commit

到现在在master分支上已经有一次提交了。
# git remote add base 
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/images-master (master)
$ git remote add base git@github.com:lanlan2017/images.git

```
# 下载github上的仓库到新分支
