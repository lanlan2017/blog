---
title: 更新git版本
categories: 
  - 编程
  - Git
  - GitBash
abbrlink: 8ba9a94e
date: 2021-12-19 11:54:52
updated: 2021-12-19 11:54:52
---
# 下载git-for-windows.exe覆盖安装
https://git-scm.com/download

# 命令安装
## 查看git版本 git version
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog
$ git version
git version 2.32.0.windows.1

```
## 更新git版本
## git update
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog
$ git update
Warning! `git update` has been deprecated;
Please use `git update-git-for-windows` instead.
Git for Windows 2.32.0.windows.1 (64-bit)
Update 2.34.1.windows.1 is available
Download and install Git for Windows 2.34.1 [N/y]? N

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog

```
`git update`已经不推荐使用了，应该使用：`git update-git-for-windows`

## git update-git-for-windows

```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog
$ git update-git-for-windows
Git for Windows 2.32.0.windows.1 (64-bit)
Update 2.34.1.windows.1 is available
Download and install Git for Windows 2.34.1 [N/y]? y

```

## 参考链接
https://segmentfault.com/q/1010000011704285
https://stackoverflow.com/questions/13790592/how-to-upgrade-git-on-windows-to-the-latest-version

