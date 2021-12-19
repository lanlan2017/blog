---
title: Linux find命令详解
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: 8c3bbfbb
date: 2021-04-13 23:49:09
updated: 2021-04-14 21:07:56
---
# 不递归查找 find -maxdepth 1
例如只查找当前目录下的文件：
（比StartWriting.bat新，比HexoS.bat旧的文件）
```
find . -maxdepth 1 -newer StartWriting.bat \! \( -newer HexoS.bat \)
```
运行效果：
```
[root@localhost exam]# ls -ltr --full-time
总用量 3640
-rw-r--r--.   1 root root     422 2021-03-19 21:12:12.566962591 +0800 StartWriting.bat
drwxr-xr-x.   2 root root    4096 2021-03-19 21:12:12.566962591 +0800 scaffolds
-rw-r--r--.   1 root root     817 2021-03-19 21:12:12.566962591 +0800 package.json
-rw-r--r--.   1 root root     376 2021-03-19 21:12:12.566962591 +0800 HexoSTest.bat
-rw-r--r--.   1 root root     576 2021-03-19 21:12:12.566962591 +0800 HexoD.bat
-rw-r--r--.   1 root root     158 2021-03-19 21:12:12.566962591 +0800 FM.properties
-rw-r--r--.   1 root root    3093 2021-03-19 21:12:12.566962591 +0800 _config.yml
drwxr-xr-x.   3 root root    4096 2021-03-19 21:12:12.636962591 +0800 themes
drwxr-xr-x.   9 root root    4096 2021-03-19 21:12:12.636962591 +0800 source
-rwxr--r--.   1 root root     174 2021-03-19 21:16:37.816962490 +0800 hexos.sh
drwxr-xr-x. 308 root root    8192 2021-03-19 21:19:12.036962431 +0800 node_modules
-rw-r--r--.   1 root root  170424 2021-03-19 21:19:12.746962431 +0800 package-lock.json
-rw-r--r--.   1 root root 3498022 2021-03-22 20:29:10.927984900 +0800 db.json
-rw-r--r--.   1 root root     431 2021-03-22 20:52:44.997984360 +0800 HexoS.bat
[root@localhost exam]# find . -maxdepth 1 -newer StartWriting.bat \! \( -newer HexoS.bat \)
./HexoS.bat
./source
./themes
./hexos.sh
./node_modules
./db.json
./package-lock.json
[root@localhost exam]# 
```
