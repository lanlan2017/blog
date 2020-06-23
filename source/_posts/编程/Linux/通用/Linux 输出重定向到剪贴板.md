---
title: Linux 输出重定向到剪贴板
categories:
  - 编程
  - Linux
  - 通用
abbrlink: 9ed0e635
date: 2019-11-27 00:18:09
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/9ed0e635/#xsel" class="header_1">xsel</a>&nbsp;<br><a href="/blog/9ed0e635/#安装xsel" class="header_2">安装xsel</a>&nbsp;<br><a href="/blog/9ed0e635/#输出到剪贴板中" class="header_2">输出到剪贴板中</a>&nbsp;<br><a href="/blog/9ed0e635/#读取剪贴板内容" class="header_2">读取剪贴板内容</a>&nbsp;<br><a href="/blog/9ed0e635/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# xsel #
## 安装xsel ##
```shell
sudo apt-get install xsel
```
## 输出到剪贴板中 ##
```shell
cat file | xsel -i -b
```

```shell
echo HelloWorld | xsel -i -b
```
## 读取剪贴板内容 ##
```shell
xsel -o -b
```
运行效果:
```
blue@blue-VirtualBox:~$ echo HelloWorld | xsel -i -b
blue@blue-VirtualBox:~$ xsel -o -b
HelloWorld
blue@blue-VirtualBox:~$ echo HelloWorld! | xsel -i -b
blue@blue-VirtualBox:~$ xsel -o -b
HelloWorld!
blue@blue-VirtualBox:~$
```
# 参考资料 #
[https://blog.csdn.net/aka_xingwenpeng/article/details/8776779](https://blog.csdn.net/aka_xingwenpeng/article/details/8776779)
[https://blog.csdn.net/mosesmo1989/article/details/51094957](https://blog.csdn.net/mosesmo1989/article/details/51094957)
