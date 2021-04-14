---
title: Linux passwd命令
categories: 
  - 编程
  - Linux
  - 通用
abbrlink: 10d66fa9
date: 2021-04-20 22:17:41
updated: 2021-04-20 23:07:47
---
<div id='my_toc'><a href="/blog/10d66fa9/#passwd更换口令" class="header_1">passwd更换口令</a>&nbsp;<br><a href="/blog/10d66fa9/#普通用户" class="header_2">普通用户</a>&nbsp;<br><a href="/blog/10d66fa9/#超级用户root" class="header_2">超级用户root</a>&nbsp;<br><a href="/blog/10d66fa9/#修改root的口令后不要急于退出当前终端" class="header_2">修改root的口令后不要急于退出当前终端</a>&nbsp;<br><a href="/blog/10d66fa9/#口令的设置与验证" class="header_2">口令的设置与验证</a>&nbsp;<br><a href="/blog/10d66fa9/#口令信息的保存" class="header_3">口令信息的保存</a>&nbsp;<br><a href="/blog/10d66fa9/#口令的验证过程" class="header_3">口令的验证过程</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# passwd更换口令
## 普通用户
使用 passwd 命令更改自己 的口令，在更改之前，系统会先验证原来的口令，通过口令之后才能修改口令。

## 超级用户root
修改口令之前不验证旧的口令。
root用户可修改自己的口令，还可强迫设置其它用户口令

例如root用户命令执行如下命令：
```
passwd liu
```
可以将用户liu的口令强迫设置为某一已知口令。

超级用户无法读取其它用户的口令
当普通用户忘记口令时，超级用户是无法帮该普通用户查出他原先的口令的，此时可请求超级用户把该用户的口令强制设置为一个新的口令。该普通用户使用新的口令登录后，再修改成更新的口令即可，以免让超级用户知道自己的口令。

## 修改root的口令后不要急于退出当前终端
修改超级用户root的口令后，先不要急于退出当前的终端，先尝试从别的终端登录root用户，如果发现无法登录，则表示设置的口令有误。此时在当前终端重设root用户的口令即可。
如果修改root的口令后直接退出当前终端，然后再重新登录，如果无法登录，那么将无法再次修改root的口令。

## 口令的设置与验证
### 口令信息的保存
不保存明码口令
设置口令的时候系统会生成一个随机序列，然后把该随机序列和用户输入的口令通过哈希算法进行计算。得到一个固定长度的哈希值。
系统保存的是生成的这个随机序列，以及计算后的哈希值A。
这样即使你知道随机序列和计算后的哈希值A,也是无法反推出用户的口令的。

![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/Linux/General/Passwd/1.png)

### 口令的验证过程
当用户登录的时候，再次把随机序列和用户口令通过哈希算法进行计算，得到一个哈希值B,然后把这个哈希值B与保存的哈希值A进行比较。如果两个哈希值一样，则表示口令正确。
这样做是安全的，因为无法根据随机值和哈希值，倒推出用户的口令。

这种方式也可以用在其他的软件设计中

<!-- Blog/Programming/Linux/General/Passwd/ -->
