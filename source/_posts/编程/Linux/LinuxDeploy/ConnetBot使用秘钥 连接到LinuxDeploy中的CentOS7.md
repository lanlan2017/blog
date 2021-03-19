---
title: ConnetBot使用秘钥 连接到LinuxDeploy中的CentOS7
categories: 
  - 编程
  - Linux
  - LinuxDeploy
date: 2021-03-19 10:16:21
updated: 2021-03-19 10:44:21
abbrlink: '8177e030'
---
<div id='my_toc'><a href="/blog/8177e030/#下载安装ConnectBot-app" class="header_1">下载安装ConnectBot app</a>&nbsp;<br><a href="/blog/8177e030/#ConnectBot中生成秘钥" class="header_1">ConnectBot中生成秘钥</a>&nbsp;<br><a href="/blog/8177e030/#复制ConnectBot生成的公钥" class="header_1">复制ConnectBot生成的公钥</a>&nbsp;<br><a href="/blog/8177e030/#添加主机" class="header_1">添加主机</a>&nbsp;<br><a href="/blog/8177e030/#添加公钥到/root/-ssh/authorized_keys文件中" class="header_1">添加公钥到/root/.ssh/authorized_keys文件中</a>&nbsp;<br><a href="/blog/8177e030/#ConnectBot连接服务器" class="header_1">ConnectBot连接服务器</a>&nbsp;<br><a href="/blog/8177e030/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 下载安装ConnectBot app
GooglePlay Store:[https://play.google.com/store/apps/details?id=org.connectbot&hl=zh&gl=US](https://play.google.com/store/apps/details?id=org.connectbot&hl=zh&gl=US)

# ConnectBot中生成秘钥
点击app右上角的**竖直三点按钮**,选择**管理秘钥**，然后点击右上角的**加号**，输入秘钥的**昵称**（随意），选择**转发类型**（默认选RSA,默认就好），输入位数（默认2048默认就好），秘钥的密码（默认不设置，默认就好）然后勾选**启动时载入秘钥**。最后点击最下方的**生成**按钮，此时会弹出一个方框，在方框上面随意滑动，app会根据你的滑动生成随机数来生成秘钥。滑动到提示100%即可生产秘钥对。

# 复制ConnectBot生成的公钥
长按生成的公钥，选择**复制公钥**。

# 添加主机
点击右下角的**加号**来添加主机，在协议输入框中输入**用户名@主机名:端口号**，例如`root@192.168.1.3:22`.
选择**使用秘钥验证**， 其他默认即可

# 添加公钥到/root/.ssh/authorized_keys文件中
进入CentOS,进入/root/.ssh目录:
```
[root@localhost ~]# cd /root/.ssh/
[root@localhost .ssh]# ls
id_rsa  id_rsa.pub  known_hosts
```
可以看到目录下没有authorized_keys文件，先创建该文件：
```
[root@localhost .ssh]# touch authorized_keys
[root@localhost .ssh]# ls
authorized_keys  id_rsa  id_rsa.pub  known_hosts
```
编辑authorized_keys文件
```
[root@localhost .ssh]# vim authorized_keys
```
把复制到的公钥添加在文件末尾,添加效果：
```
[root@localhost .ssh]# cat authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCufeexdUy0gbKFczV9AedZPGaiidpWx8rh0UEcfCuSW6NJTVjEUvEiFGW5CR24g3Jf+rnX5cbffU+DwdT6nQJRdS3XnGqfpyrtef+98+rNAmoWk0nB1Uiby6BEgFZ8wUkqs5zO159BkoYRvsUjn51SomEgqsOXo52x50nvW0vgO445aohTYYQzm7h7UX5x/ZEJvHujf0pVjE0RMfDP/n3piQTVZwyuO064mR5YnDLs6Skg8klQX/iknYWxSkCYXGStKDbpUoGyvy3CvwJJHvtP4DhUcmnEi87u/UuFc/PTXK8hAnKS/a/hKDPm1b0jRGt0UFQJpws5ZAmcuKNgyr9L connerbot
[root@localhost .ssh]# 
```
# ConnectBot连接服务器
完成以上步骤以后，使用ConnectBot连接服务器时就不需要输入密码了。
在ConnectBot中点击主机即可连接。如果没有连上，可能你的ConnectBot中的秘钥还没载入内存，长按秘钥，将秘钥载入内存，然后再次连接主机即可。
# 参考资料
[http://zduo.me/blog/?p=610](http://zduo.me/blog/?p=610)