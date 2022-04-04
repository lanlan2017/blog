---
title: gitbook发布到github pages
categories: 
  - NodeJS
abbrlink: c3c2965c
date: 2020-10-12 10:36:57
updated: 2022-04-04 00:51:45
---
# gitbook发布到github pages
## 初始化git
```bash
git init
```
## 创建仓库和gh-pages分支
登录到Github，创建一个新的仓库，名称我们就命令为book，这样我就就得到了一个book的空仓库。
克隆仓库到本地：git clone git@github.com:USER_NAME/book.git。
创建一个新分支：git checkout -b gh-pages，注意，分支名必须为gh-pages。
将分支push到仓库：git push -u origin gh-pages。
切换到主分支: git checkout master。

经过这一步处理，我们已经创建好gh-pages分支了，有了这个分支，Github会自动为你分配一个访问网址：
你可以在项目页面右下settings中看到：

## 构建
```bash
gitbook build
```
这样会在项目根目录下生成_book目录,将这个目录清空
## 同步静态网站代码到分支

下面我们就可以将build好的静态网站代码同步到gh-pages分支中去了：
切换出master分支目录。我们需要将gh-pages分支内容存放到另一个目录中去。
克隆gh-pages分支：git clone -b gh-pages git@github.com:USERNAME/book.git book-end。这步我们只克隆了gh-pages分支，并存放在一个新的目录book-end里面。

## 手动部署
清空本地gh-pages分支文件夹:
```bash
rm -rf /e/Blog/MyGitBook_GithubPages/*
```
复制_book目录下的所有文件到gh-pages分支文件夹
```bash
cp -r /e/Blog/MyGitBook/_book/* /e/Blog/MyGitBook_GithubPages
```
查看
```bash
git status
```
QQ输入法短语:
```txt gitbookfabu
rm -rf /e/Blog/MyGitBook_GithubPages/*$(CRLF)cp -r /e/Blog/MyGitBook/_book/* /e/Blog/MyGitBook_GithubPages$(CRLF)git status$(CRLF)
```
添加
```bash
git add .
```
提交
```bash
git commit
```
推送
```bash
git push origin
```

cd /e/Blog/MyGitBook/
gitbook build
cd /e/Blog/MyGitBook_GithubPages/
rm -rf *
cp -r /e/Blog/MyGitBook/_book/* ./
git status



cd /e/Blog/MyGitBook/ && gitbook build && cd /e/Blog/MyGitBook_GithubPages/ && rm -rf * && cp -r /e/Blog/MyGitBook/_book/* ./ && git status
