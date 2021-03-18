---
title: LinuxDeploy CentOS7 设置Git通过SSH连接Github
categories:
  - 编程
  - Linux
  - LinuxDeploy
abbrlink: a210aa10
date: 2021-03-17 11:31:54
updated: 2021-03-18 12:08:13
---
<div id='my_toc'><a href="/blog/null/#LinuxDeploy-CentOS7-设置Git通过SSH连接Github" class="header_1">LinuxDeploy CentOS7 设置Git通过SSH连接Github</a>&nbsp;<br><a href="/blog/null/#前言" class="header_2">前言</a>&nbsp;<br><a href="/blog/null/#生成秘钥" class="header_2">生成秘钥</a>&nbsp;<br><a href="/blog/null/#查看公钥" class="header_2">查看公钥</a>&nbsp;<br><a href="/blog/null/#进入github网站-填写公钥" class="header_2">进入github网站 填写公钥</a>&nbsp;<br><a href="/blog/null/#测试是否能够连接" class="header_2">测试是否能够连接</a>&nbsp;<br><a href="/blog/null/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# LinuxDeploy CentOS7 设置Git通过SSH连接Github
## 前言
[先安装好Git，并且配置好邮箱和用户名](https://lanlan2017.github.io/blog/21008dc5/)
```
[root@localhost .ssh]# git config --list
user.name=xxx
user.email=xxx@yyy.com
[root@localhost .ssh]#
```
## 生成秘钥
输入下面的命令,然后一直按回车键：
```shell
ssh-keygen -t rsa -C "你的邮箱"
```
运行效果：
```
[root@localhost ~]# ssh-keygen -t rsa -C "xxxxxxx@yyy.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:...... xxx@yyy.com
The key's randomart image is:
......
```
## 查看公钥
进入上面命令生成秘钥的路径(Your public key has been saved in **/root/.ssh/id_rsa.pub**.)：
```
cd /root/.ssh
```
```
[root@localhost .ssh]# ls
id_rsa  id_rsa.pub
[root@localhost .ssh]# cat id_rsa.pub 
ssh-rsa AAAAopuytC1yc2EAAAjkngfBAAABAQC4ABJjwlORTcIjU0mmCjGOSRYiF8MaKbQZLeF8Md46tgD2LhTLjOnlp09mcha/0uK8TpbWOO3Oq7u+5ageggsvcss3JItrKPEQn0OsXxDW9j7Du9PRAfyagagetvdbkIpxvxYmQ3flXdIG5YtZJHSuqmrKGOo+cZgj1PL4t2vnS2xKmbirdV5qndh3whadfgwertvgDAd57zFXzgWFxH09fI0Nq1oNQpk+MSDnIFyFNDO72VEQA/SYsk+92z056dEKvF1gHS92356478gfsM/JSPqmyJ+qwerfgtvdbd7JLLg6hzQ2LUjA0SGAsusBzHtM0SuxCoRTkdAd3vwwn9l xxx@yyy.com
[root@localhost .ssh]#
```
## 进入github网站 填写公钥
打开浏览器，登录github网站,然后点击右上角的头像的后面的三角按钮，选择Settings，然后点击SSH and GPG keys，点击SSH keys横栏右侧的[New SSH key](https://github.com/settings/ssh/new)按钮。输入各个公钥的名称,我这里为CentoSOnLinuxDeploy。然后输入公钥，点击Add SSH key按钮。此时可能会要求输入密码，按提示输入密码即可。

## 测试是否能够连接
回到Xshell,输入如下命令测试连接，然后输入yes回车。
```shell
ssh -T git@github.com
```
ssh连接成功效果：
```
[root@localhost .ssh]# ssh -T git@github.com
The authenticity of host 'github.com (52.74.223.119)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJjskgjghJhshsuiwoJkARLviKwJuhnb8.
RSA key fingerprint is MD5:23:45:rt:2g:56:31:7u:89:sd:3h:56::eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,52.74.223.119' (RSA) to the list of known hosts.
Hi xxx! You've successfully authenticated, but GitHub does not provide shell access.
[root@localhost .ssh]# 
```
这样就可以使用github的SSH连接了，省去输入密码的麻烦。

# 参考资料
https://blog.csdn.net/ngl272/article/details/70217107
