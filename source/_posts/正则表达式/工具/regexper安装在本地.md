---
title: regexper安装在本地
categories: 
  - 正则表达式
  - 工具
date: 2018-11-29 21:11:17
updated: 2019-12-17 05:17:09
abbrlink: 54be6c80
---
<div id='my_toc'><a href="/blog/54be6c80/#regexper本地安装" class="header_1">regexper本地安装</a><br><a href="/blog/54be6c80/#安装yarn" class="header_2">安装yarn</a><br><a href="/blog/54be6c80/#clone到本地" class="header_2">clone到本地</a><br><a href="/blog/54be6c80/#cd进入项目" class="header_2">cd进入项目</a><br><a href="/blog/54be6c80/#安装依赖" class="header_2">安装依赖</a><br><a href="/blog/54be6c80/#启动本地服务器" class="header_2">启动本地服务器</a><br><a href="/blog/54be6c80/#浏览器打开" class="header_2">浏览器打开</a><br><a href="/blog/54be6c80/#bat脚本快速启动" class="header_2">bat脚本快速启动</a><br><a href="/blog/54be6c80/#8080端口被占用了" class="header_2">8080端口被占用了</a><br><a href="/blog/54be6c80/#问题描述" class="header_3">问题描述</a><br><a href="/blog/54be6c80/#原因" class="header_3">原因</a><br><a href="/blog/54be6c80/#解决方案" class="header_3">解决方案</a><br><a href="/blog/54be6c80/#单词读音" class="header_2">单词读音</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# regexper本地安装 #
regexper在github上地址为：[https://github.com/javallone/regexper-static](https://github.com/javallone/regexper-static)
## 安装yarn ##
安装`regexper`的依赖和启动本地服务器需要使用`yarn`,所以要安装`yarn`。打开git-bash，输入`npm install -g yarn`安装`yarn`,如下所示：
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/GitHub
$ npm install -g yarn
F:\Program Files\nodejs\node_global\yarn -> F:\Program Files\nodejs\node_global\node_modules\yarn\bin\yarn.js
F:\Program Files\nodejs\node_global\yarnpkg -> F:\Program Files\nodejs\node_global\node_modules\yarn\bin\yarn.js
+ yarn@1.12.3
added 1 package in 3.03s

```
## clone到本地 ##
cd进入到一个目录，然后输入` git clone git@github.com:javallone/regexper-static.git`把项目复制到当前目录下。
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/GitHub
$ git clone git@github.com:javallone/regexper-static.git
Cloning into 'regexper-static'...
remote: Enumerating objects: 5036, done.
remote: Total 5036 (delta 0), reused 0 (delta 0), pack-reused 5036
Receiving objects: 100% (5036/5036), 1.02 MiB | 903.00 KiB/s, done.
Resolving deltas: 100% (3196/3196), done.

```
## cd进入项目 ##
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/GitHub
$ ls
regexper-static/
lan@DESKTOP-8ISAT6B MINGW64 /D/GitHub
$ cd regexper-static/
```
## 安装依赖 ##
进入项目目录后，输入`yarn install`安装依赖。
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/GitHub/regexper-static (master)
$ yarn install
yarn install v1.12.3
[1/4] Resolving packages...
[2/4] Fetching packages...
info fsevents@1.1.2: The platform "win32" is incompatible with this module.
info "fsevents@1.1.2" is an optional dependency and failed compatibility check. Excluding it from installation.
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
Done in 124.86s.
```
我这里安装可慢了，耐心等它安装完毕。
## 启动本地服务器 ##
输入`yarn start`启动服务器，启动成功的话如下所示:
```shell
lan@DESKTOP-8ISAT6B MINGW64 /D/GitHub/regexper-static (master)
$ yarn start
yarn run v1.12.3
$ gulp
[21:32:34] Using gulpfile D:\GitHub\regexper-static\gulpfile.js
......
[21:32:47] Server started http://localhost:8080
[21:32:47] LiveReload started on port 35729

```
## 浏览器打开 ##
浏览器打开[localhost:8080](http://localhost:8080)即可,运行成功效果如下:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F/webTools/localRegexPer.png)
以后每次使用都要到该目录`/D/GitHub/regexper-static`中使用`yarn start`启动服务器。


## bat脚本快速启动 ##
每次手动的来启动本地服务器还是挺麻烦的，这里我用批处理脚本来快速启动.
在桌面中新建`.bat`文件：`启动正则表达式.bat`，在启动写入如下的cmd命令：
```bat
@echo off
D:
cd D:\GitHub\regexper-static
yarn start
```
命令说明：
- `@echo off`：关闭回显
- `D:`--启动盘符，这个盘符以克隆到的本地项目的盘符为准 
- `cd D:\GitHub\regexper-static`--进入到本地项目路径，以自己的为准
- `yarn start`--启动本地服务器

这样直接点击桌面的`启动正则表达式.bat`文件即可启动本地服务器。然后浏览器打开[localhost:8080](http://localhost:8080)即可使用。

## 8080端口被占用了 ##
### 问题描述 ###
今天启动的时候遇到了下面的错误：
```
events.js:183
      throw er; // Unhandled 'error' event
      ^
Error: listen EADDRINUSE :::8080
    at Server.setupListenHandle [as _listen2] (net.js:1360:14)
......
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```
update user set password=password('root') WHERE User='root';
### 原因 ###
regexper用的是8080端口,而我用了tomcat，tomcat已经占用了8080端口。所以导致regexper无法启动。
### 解决方案 ###
我没有找到`regexper`中修改端口的办法，但是我知道怎么修改tomcat默认端口，所以修改tomcat的端口,把8080端口让给regexper就行了。
## 单词读音 ##
|列名|列名|
|:--|:--|
|<a href="https://fanyi.baidu.com/?#en/zh/gulp">gulp</a>|<input type="button" onclick="paly_audioID20181129214311();" value="播放" />|
|<a href="https://fanyi.baidu.com/?#en/zh/yarn">yarn</a>|<input type="button" onclick="paly_audioID20181129214218();" value="播放" />|

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=gulp&spd=3&source=web" id="audioID20181129214311"></audio>
<script>
    function paly_audioID20181129214311() {
        var audioID20181129214311 = document.getElementById("audioID20181129214311");
        if (audioID20181129214311 != null) {
            audioID20181129214311.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=yarn&spd=3&source=web" id="audioID20181129214218"></audio>
<script>
    function paly_audioID20181129214218() {
        var audioID20181129214218 = document.getElementById("audioID20181129214218");
        if (audioID20181129214218 != null) {
            audioID20181129214218.play();
        }
    }
</script>

