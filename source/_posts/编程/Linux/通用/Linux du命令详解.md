---
title: Linux du命令详解
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: a13f1d41
date: 2021-03-23 10:28:31
updated: 2021-04-03 18:15:19
---
<div id='my_toc'><a href="/blog/a13f1d41/#du命令" class="header_1">du命令</a>&nbsp;<br><a href="/blog/a13f1d41/#常用参数" class="header_1">常用参数</a>&nbsp;<br><a href="/blog/a13f1d41/#文档" class="header_1">文档</a>&nbsp;<br><a href="/blog/a13f1d41/#示例" class="header_1">示例</a>&nbsp;<br><a href="/blog/a13f1d41/#du-hs-目录：获取目录的总大小" class="header_2">du -hs 目录：获取目录的总大小</a>&nbsp;<br><a href="/blog/a13f1d41/#参数说明" class="header_3">参数说明</a>&nbsp;<br><a href="/blog/a13f1d41/#du-h：获取每个目录的大小" class="header_2">du -h：获取每个目录的大小</a>&nbsp;<br><a href="/blog/a13f1d41/#du-hs-目录-*：获取每个目录的摘要" class="header_2">du -hs 目录/*：获取每个目录的摘要</a>&nbsp;<br><a href="/blog/a13f1d41/#du-hS：获取每个目录的不含子目录的大小" class="header_2">du -hS：获取每个目录的不含子目录的大小</a>&nbsp;<br><a href="/blog/a13f1d41/#du-h-max-depth=1：仅获取一级子目录的大小" class="header_2">du -h --max-depth=1：仅获取一级子目录的大小</a>&nbsp;<br><a href="/blog/a13f1d41/#du-hsc：统计" class="header_2">du -hsc：统计</a>&nbsp;<br><a href="/blog/a13f1d41/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# du命令
du命令的英文全称是“Disk Usage”，即用于查看磁盘占用空间的意思。但是与df命令不同的是,**du命令是对文件和目录磁盘使用的空间的查看**，而不是某个分区。

du 命令 表示 磁盘使用率Disk Usage。这是一个标准的 Unix 程序，用于估计当前工作目录中的文件空间使用情况。
它使用递归方式总结磁盘使用情况，以获取目录及其子目录的大小。
如同我说的那样, 使用 ls 命令时，目录大小仅显示 4KB。参见下面的输出。

# 常用参数

|du参数|描述|
|:---|:---|
|-a|显示目录中所有文件大小|
|-k|以KB为单位显示文件大小|
|-m|以MB为单位显示文件大小|
|-g|以GB为单位显示文件大小|
|-h|以易读方式显示文件大小|
|-s|仅显示总计|

# 文档
```
man du
```
或者
```
du --help
```
# 示例
## du -hs 目录：获取目录的总大小
使用以下 du 命令格式获取给定目录的总大小。
```
du -hs 目录
```
在该示例中，我们将得到 /root/blog/ 目录的总大小。
```
[root@localhost blog]# du -hs /root/blog/
93M	/root/blog/
[root@localhost blog]#
```
或者：
```
[root@localhost blog]# du -h --max-depth=0 /root/blog/
93M	/root/blog/
[root@localhost blog]# 
```
### 参数说明

|du命令参数|描述|
|:---|:---|
|-h|以易读的格式显示大小 (例如 1K 234M 2G)|
|-s|仅显示每个参数的总数|
|--max-depth=N|目录的打印深度|


## du -h：获取每个目录的大小
使用以下 du 命令格式获取每个目录（包括子目录）的总大小。

在该示例中，我们将获得每个 /home/daygeek/Documents 目录及其子目录的总大小。
```
du -h /home/daygeek/Documents/ | sort -rh | head -20
```
```
[root@localhost blog]# pwd
/root/blog
[root@localhost blog]# du -h |sort -rh|head -20
93M	.
66M	./node_modules
7.3M	./.git
7.0M	./.git/objects
5.5M	./.git/objects/pack
5.2M	./node_modules/moment
5.0M	./node_modules/hexo-generator-baidu-sitemap/node_modules
5.0M	./node_modules/hexo-generator-baidu-sitemap
4.9M	./node_modules/lodash
4.4M	./node_modules/core-js
3.4M	./source
3.3M	./source/_posts
3.2M	./node_modules/prismjs
3.0M	./node_modules/hexo-deployer-git/node_modules
3.0M	./node_modules/hexo-deployer-git
3.0M	./node_modules/hexo-abbrlink
2.9M	./node_modules/hexo-generator-sitemap/node_modules
2.9M	./node_modules/hexo-generator-sitemap
2.9M	./node_modules/hexo-abbrlink/node_modules
2.7M	./node_modules/hexo-generator-sitemap/node_modules/highlight.js
[root@localhost blog]# 
```
## du -hs 目录/*：获取每个目录的摘要
使用如下 du 命令格式仅获取每个目录的摘要。
```
du -hs 目录/* | sort -rh | head -10
```
例如：
```
[root@localhost blog]# pwd
/root/blog
[root@localhost blog]#  du -hs /root/blog/* | sort -rh | head -10
66M	/root/blog/node_modules
14M	/root/blog/db.json
3.4M	/root/blog/source
2.4M	/root/blog/themes
168K	/root/blog/package-lock.json
16K	/root/blog/scaffolds
4.0K	/root/blog/StartWriting.bat
4.0K	/root/blog/package.json
4.0K	/root/blog/KillBlog.sh
4.0K	/root/blog/HexoSTest.bat
[root@localhost blog]# 
```

## du -hS：获取每个目录的不含子目录的大小
使用如下 du 命令格式来展示每个目录的总大小，不包括子目录。
```
du -hS 目录 | sort -rh | head -20
```
例如：
```
[root@localhost blog]# du -hS /root/blog/ |sort -rh |head -20
14M	/root/blog/
5.5M	/root/blog/.git/objects/pack
3.3M	/root/blog/node_modules/lodash
2.4M	/root/blog/node_modules/prismjs/components
2.2M	/root/blog/node_modules/moment/min
1.7M	/root/blog/node_modules/lodash/fp
1.7M	/root/blog/node_modules/hexo-generator-sitemap/node_modules/highlight.js/lib/languages
1.7M	/root/blog/node_modules/hexo-deployer-git/node_modules/highlight.js/lib/languages
1.7M	/root/blog/node_modules/hexo-abbrlink/node_modules/highlight.js/lib/languages
1.5M	/root/blog/node_modules/nunjucks/browser
1.5M	/root/blog/node_modules/highlight.js/lib/languages
1.2M	/root/blog/node_modules/hexo-generator-baidu-sitemap/node_modules/acorn/dist
1.2M	/root/blog/node_modules/acorn/dist
916K	/root/blog/node_modules/core-js/modules
900K	/root/blog/node_modules/moment-timezone/builds
880K	/root/blog/node_modules/core-js/library/modules
824K	/root/blog/node_modules/core-js/client
740K	/root/blog/node_modules/moment/locale
660K	/root/blog/node_modules/css/node_modules/source-map/dist
652K	/root/blog/node_modules/moment/src/locale
[root@localhost blog]#
```
## du -h --max-depth=1：仅获取一级子目录的大小
如果要获取 Linux 上给定目录的一级子目录（包括其子目录）的大小，请使用以下命令格式。
```
[root@localhost blog]# du -h --max-depth=1 /root/blog/
7.3M	/root/blog/.git
16K	/root/blog/scaffolds
3.4M	/root/blog/source
2.4M	/root/blog/themes
66M	/root/blog/node_modules
93M	/root/blog/
[root@localhost blog]#
```
## du -hsc：统计
如果要在 du 命令输出中获得总计，请使用以下 du 命令格式。
```
du -hsc 目录/* | sort -rh | head -10
```
例如：
```
[root@localhost blog]# du -hsc /root/blog/* | sort -rh
86M	总用量
66M	/root/blog/node_modules
14M	/root/blog/db.json
3.4M	/root/blog/source
2.4M	/root/blog/themes
168K	/root/blog/package-lock.json
16K	/root/blog/scaffolds
4.0K	/root/blog/StartWriting.bat
4.0K	/root/blog/package.json
4.0K	/root/blog/KillBlog.sh
4.0K	/root/blog/HexoSTest.bat
4.0K	/root/blog/hexos.sh
4.0K	/root/blog/HexoS.bat
4.0K	/root/blog/HexoD.bat
4.0K	/root/blog/FM.properties
4.0K	/root/blog/_config.yml
[root@localhost blog]# 
```

# 参考资料
[https://linux.cn/article-11503-1.html](https://linux.cn/article-11503-1.html)
[https://www.yiibai.com/linux/du.html](https://www.yiibai.com/linux/du.html)
[https://www.runoob.com/linux/linux-comm-du.html](https://www.runoob.com/linux/linux-comm-du.html)
[https://www.linuxcool.com/du](https://www.linuxcool.com/du)
可以替代du的一些命令
[https://linux.cn/article-10239-1.html](https://linux.cn/article-10239-1.html)
