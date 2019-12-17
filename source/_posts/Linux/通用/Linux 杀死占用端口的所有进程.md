---
title: Linux 杀死占用端口的所有进程
categories: 
  - Linux
  - 通用
date: 2019-11-25 23:26:06
updated: 2019-12-15 10:01:44
abbrlink: e2b78dd9
---
<div id='my_toc'><a href="/blog/e2b78dd9/#查找占用端口的程序" class="header_1">查找占用端口的程序</a><br><a href="/blog/e2b78dd9/#命令1" class="header_2">命令1</a><br><a href="/blog/e2b78dd9/#查找占用端口的程序的PID" class="header_2">查找占用端口的程序的PID</a><br><a href="/blog/e2b78dd9/#命令2" class="header_2">命令2</a><br><a href="/blog/e2b78dd9/#根据PID杀死进程" class="header_1">根据PID杀死进程</a><br><a href="/blog/e2b78dd9/#一条命令杀死占用端口的所有进程" class="header_1">一条命令杀死占用端口的所有进程</a><br><a href="/blog/e2b78dd9/#参考资料" class="header_1">参考资料</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 查找占用端口的程序 #
## 命令1 ##
```shell
lsof -i:端口号
```
例如查看4007端口是否被占用:
```shell
lsof -i:4007
```
```shell
blue@blue-VirtualBox:~/桌面/Blog/blog9$ lsof -i:4007
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
hexo    2564 blue   19u  IPv6  39809      0t0  TCP *:4007 (LISTEN)

```
## 查找占用端口的程序的PID ##
```shell
lsof -i:端口号 -t
```
效果如下:
```shell
blue@blue-VirtualBox:~/桌面$ lsof -i:4007
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
hexo    4924 blue   21u  IPv6  56489      0t0  TCP *:4007 (LISTEN)
blue@blue-VirtualBox:~/桌面$ lsof -i:4007 -t
4924

```
## 命令2 ##
```shell
netstat -tunlp | grep 端口号
```
例如
```shell
netstat -tunlp | grep 4007
```
```shell
blue@blue-VirtualBox:~/桌面/Blog/blog9$ netstat -tunlp | grep 4007
（并非所有进程都能被检测到，所有非本用户的进程信息将不会显示，如果想看到所有信息，则必须切换到 root 用户）
tcp6       0      0 :::4007                 :::*                    LISTEN      2564/hexo   
```
# 根据PID杀死进程 #
```shell
kill -s 9 PID
```
例如:
```shell
 kill -s 9 2564
```
```shell
blue@blue-VirtualBox:~/桌面/Blog/blog9$ lsof -i:4007
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
hexo    2564 blue   19u  IPv6  39809      0t0  TCP *:4007 (LISTEN)
blue@blue-VirtualBox:~/桌面/Blog/blog9$ kill -s 9 2564
```
# 一条命令杀死占用端口的所有进程 #
```shell
sudo kill -s 9 $(lsof -i:端口号 -t)
```
例如:
```shell
kill -s 9 $(lsof -i:4007 -t)
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Common/kill/port/1.png)
效果:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Common/kill/port/2.png)
# 参考资料 #
[https://www.cnblogs.com/showker/p/11567863.html](https://www.cnblogs.com/showker/p/11567863.html)
