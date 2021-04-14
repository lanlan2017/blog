---
title: Linux ls命令详解
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: 3283dcaa
date: 2021-03-23 05:11:29
updated: 2021-04-13 23:31:08
---
<div id='my_toc'><a href="/blog/3283dcaa/#ls命令含义" class="header_1">ls命令含义</a>&nbsp;<br><a href="/blog/3283dcaa/#语法" class="header_1">语法</a>&nbsp;<br><a href="/blog/3283dcaa/#参数" class="header_2">参数</a>&nbsp;<br><a href="/blog/3283dcaa/#实例" class="header_1">实例</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-a" class="header_2">ls -a</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-A" class="header_2">ls -A</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-F" class="header_2">ls -F</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-l" class="header_2">ls -l</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-l各列含义" class="header_3">ls -l各列含义</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-lh" class="header_3">ls -lh</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-l-full-time显示完整时间-显示年月日" class="header_2">ls -l --full-time显示完整时间 显示年月日</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-t-按时间排序列出-时间越近越在前" class="header_2">ls -t 按时间排序列出 时间越近越在前</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-tr-按时间排序-时间越远越在前" class="header_2">ls -tr 按时间排序 时间越远越在前</a>&nbsp;<br><a href="/blog/3283dcaa/#ls-R" class="header_2">ls -R</a>&nbsp;<br><a href="/blog/3283dcaa/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# ls命令含义
Linux ls（英文全拼：list files）命令用于显示指定工作目录下之内容（列出目前工作目录所含之文件及子目录)。
# 语法
```bash
ls [-alrtAFR] [name...]
```
## 参数

|参数|描述|
|:---|:---|
|-a|显示所有文件及目录 (. 开头的隐藏文件也会列出)|
|-A|同 -a ，但不列出 "." (目前目录) 及 ".." (父目录)|
|-F|在列出的文件名称后加一符号；例如可执行档则加 "*", 目录则加 "/"|
|-l|除文件名称外，亦将文件型态、权限、拥有者、文件大小等资讯详细列出|
|-r|将文件以相反次序显示(原定依英文字母次序)|
|-t|将文件依建立时间之先后次序列出(时间越近越在前面)|
|-R|若目录下有文件，则以下之文件亦皆依序列出|

# 实例
列出根目录(\)下的所有目录：
```
[root@localhost exam]# ls /
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
## ls -a
```
[root@localhost exam]# ls -a /
.  ..  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
## ls -A
```
[root@localhost exam]# ls -A /
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```
## ls -F
```
[root@localhost exam]# ls
_config.yml  FM.properties  HexoS.bat  HexoSTest.bat  package.json       scaffolds  StartWriting.bat
db.json      HexoD.bat      hexos.sh   node_modules   package-lock.json  source     themes
[root@localhost exam]# ls -F
_config.yml  FM.properties  HexoS.bat  HexoSTest.bat  package.json       scaffolds/  StartWriting.bat
db.json      HexoD.bat      hexos.sh*  node_modules/  package-lock.json  source/     themes/
[root@localhost exam]# 
```
## ls -l
```
[root@localhost exam]# ls -l
总用量 3640
-rw-r--r--.   1 root root    3093 3月  19 21:12 _config.yml
-rw-r--r--.   1 root root 3498022 3月  22 20:29 db.json
-rw-r--r--.   1 root root     158 3月  19 21:12 FM.properties
-rw-r--r--.   1 root root     576 3月  19 21:12 HexoD.bat
-rw-r--r--.   1 root root     431 3月  22 20:52 HexoS.bat
-rwxr--r--.   1 root root     174 3月  19 21:16 hexos.sh
-rw-r--r--.   1 root root     376 3月  19 21:12 HexoSTest.bat
drwxr-xr-x. 308 root root    8192 3月  19 21:19 node_modules
-rw-r--r--.   1 root root     817 3月  19 21:12 package.json
-rw-r--r--.   1 root root  170424 3月  19 21:19 package-lock.json
drwxr-xr-x.   2 root root    4096 3月  19 21:12 scaffolds
drwxr-xr-x.   9 root root    4096 3月  19 21:12 source
-rw-r--r--.   1 root root     422 3月  19 21:12 StartWriting.bat
drwxr-xr-x.   3 root root    4096 3月  19 21:12 themes
[root@localhost exam]#
```
### ls -l各列含义

|列数|描述|
|:---|:---|
|第一列|共10位，第1位表示文档类型，d表示目录，-表示文件，l表示链接文件，d表示可随机存取的设备，如U盘等，c表示一次性读取设备，如鼠标、键盘等。后9位，依次对应三种身份所拥有的权限，身份顺序为：owner、group、others，权限顺序为：readable、writable、excutable。如：-r-xr-x---的含义为当前文档是一个文件，拥有者可读、可执行，同一个群组下的用户，可读、可写，其他人没有任何权限。|
|第二列|表示链接数，表示有多少个文件链接到inode号码。|
|第三列|表示拥有者|
|第四列|表示所属群组|
|第五列|表示文档容量大小，单位字节|
|第六列|表示文档最后修改时间，注意不是文档的创建时间哦|
|第七列|表示文档名称。以点(.)开头的是隐藏文档|
|
### ls -lh
参考资料：[https://www.cnblogs.com/sparkdev/p/7476005.html](https://www.cnblogs.com/sparkdev/p/7476005.html)
在 Linux 命令中，涉及到文件大小的地方，一般默认是以**字节**为单位显示的。这样可读性就不是很好。所以有了 -h 选项！这个选项的全称是`--human-readable`(给人读的)。也就是以 K, M, G 等单位来显示文件的大小：
```
[root@localhost exam]# ls -lh
总用量 3.6M
-rw-r--r--.   1 root root 3.1K 3月  19 21:12 _config.yml
-rw-r--r--.   1 root root 3.4M 3月  22 20:29 db.json
-rw-r--r--.   1 root root  158 3月  19 21:12 FM.properties
-rw-r--r--.   1 root root  576 3月  19 21:12 HexoD.bat
-rw-r--r--.   1 root root  431 3月  22 20:52 HexoS.bat
-rwxr--r--.   1 root root  174 3月  19 21:16 hexos.sh
-rw-r--r--.   1 root root  376 3月  19 21:12 HexoSTest.bat
drwxr-xr-x. 308 root root 8.0K 3月  19 21:19 node_modules
-rw-r--r--.   1 root root  817 3月  19 21:12 package.json
-rw-r--r--.   1 root root 167K 3月  19 21:19 package-lock.json
drwxr-xr-x.   2 root root 4.0K 3月  19 21:12 scaffolds
drwxr-xr-x.   9 root root 4.0K 3月  19 21:12 source
-rw-r--r--.   1 root root  422 3月  19 21:12 StartWriting.bat
drwxr-xr-x.   3 root root 4.0K 3月  19 21:12 themes
[root@localhost exam]# 
```
## ls -l --full-time显示完整时间 显示年月日


## ls -t 按时间排序列出 时间越近越在前
```
[root@localhost exam]# ls -t
HexoS.bat  package-lock.json  hexos.sh  themes       FM.properties  HexoSTest.bat  scaffolds
db.json    node_modules       source    _config.yml  HexoD.bat      package.json   StartWriting.bat
[root@localhost exam]#
```
## ls -tr 按时间排序 时间越远越在前
```
[root@localhost 专项练习]# ls -lt --full-time
总用量 36
drwxr-xr-x. 5 root root 4096 2021-04-12 23:05:19.448995210 +0800 Linux
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 操作系统
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 计算机网络
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 数据库
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 智力题
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 JavaScript
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 加密和安全
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:00.987846496 +0800 HTML CSS
drwxr-xr-x. 5 root root 4096 2021-03-19 21:12:12.596962591 +0800 Java
[root@localhost 专项练习]# ls -ltr --full-time
总用量 36
drwxr-xr-x. 5 root root 4096 2021-03-19 21:12:12.596962591 +0800 Java
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:00.987846496 +0800 HTML CSS
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 加密和安全
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.017846496 +0800 JavaScript
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 智力题
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 数据库
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 计算机网络
drwxr-xr-x. 2 root root 4096 2021-04-03 18:10:01.027846496 +0800 操作系统
drwxr-xr-x. 5 root root 4096 2021-04-12 23:05:19.448995210 +0800 Linux
[root@localhost 专项练习]# 
```
## ls -R
`ls Java`:
```
[root@localhost 专项练习]# pwd
/root/exam/source/_posts/牛客网/专项练习
[root@localhost 专项练习]# ls
HTML CSS  Java  JavaScript  Linux  操作系统  计算机网络  加密和安全  数据库  智力题
[root@localhost 专项练习]# ls Java
2019年10月  2019年11月  2019年12月
```
`ls -R Java`:
```
[root@localhost 专项练习]# ls -R Java
Java:
2019年10月  2019年11月  2019年12月

Java/2019年10月:
2019年10月28日 java 1.md  2019年10月29日 Java 1.md  2019年10月29日 java 3.md  2019年10月29日 java 5.md  2019年10月30日 java 2.md  2019年10月30日 java 4.md
2019年10月28日 java 2.md  2019年10月29日 java 2.md  2019年10月29日 java 4.md  2019年10月30日 java 1.md  2019年10月30日 java 3.md  2019年10月30日 java 5.md

Java/2019年11月:
2019年11月10日 Java1.md  2019年11月14日 java2.md  2019年11月22日 java1.md  2019年11月28日 java2.md  2019年11月5日 Java 2.md  2019年11月8日 Java1.md
2019年11月11日 java1.md  2019年11月15日 java1.md  2019年11月23日 java1.md  2019年11月29日 java1.md  2019年11月5日 java3.md   2019年11月8日 java2.md
2019年11月11日 Java2.md  2019年11月15日 java2.md  2019年11月23日 java2.md  2019年11月2日 java 1.md  2019年11月6日 java1.md   2019年11月9日 java1.md
2019年11月13日 java1.md  2019年11月15日 java3.md  2019年11月24日 java1.md  2019年11月4日 java 1.md  2019年11月6日 java2.md   2019年11月9日 java2.md
2019年11月14日 java1.md  2019年11月16日 java1.md  2019年11月28日 java1.md  2019年11月5日 Java 1.md  2019年11月7日 java3.md

Java/2019年12月:
2019年12月10日 java1.md  2019年12月11日 java2.md  2019年12月13日 java2.md  2019年12月17日 java1.md  2019年12月25日 java1.md
2019年12月10日 java2.md  2019年12月12日 java1.md  2019年12月14日 java1.md  2019年12月23日 java1.md  2019年12月30日 java1.md
2019年12月10日 java3.md  2019年12月13日 java1.md  2019年12月16日 java1.md  2019年12月24日 java1.md  2019年12月8日 java2.md
[root@localhost 专项练习]#
```
# 参考资料
[https://www.runoob.com/linux/linux-comm-ls.html](https://www.runoob.com/linux/linux-comm-ls.html)
