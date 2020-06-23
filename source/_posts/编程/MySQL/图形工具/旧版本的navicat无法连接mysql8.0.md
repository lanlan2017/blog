---
title: 旧版本的navicat无法连接mysql8.0
categories:
  - 编程
  - MySQL
  - 图形工具
abbrlink: 4f42ffba
date: 2019-10-18 17:01:51
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/4f42ffba/#旧版本的navicat无法连接mysql8-0" class="header_1">旧版本的navicat无法连接mysql8.0</a>&nbsp;<br><a href="/blog/4f42ffba/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/4f42ffba/#原因" class="header_2">原因</a>&nbsp;<br><a href="/blog/4f42ffba/#解决方案" class="header_2">解决方案</a>&nbsp;<br><a href="/blog/4f42ffba/#参考链接" class="header_1">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 旧版本的navicat无法连接mysql8.0 #
## 问题描述 ##
最新安装了最新的MySQL8.0,但是使用navicat9.1无法连接,报错如下:
```cmd
Client does not support authentication protocol requested by server; consider upgrading MySQL client
```
## 原因 ##
应该是`MySQL8.0`的加密方式改变了，但是比较老版本的`navicate`没有来得及支持，因此需要将`mysql`设置为支持传统的那种密码加密。
## 解决方案 ##
登入`MySQL`的命令行界面，然后输入：
```cmd
 ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'you_password';
 FLUSH PRIVILEGES;
```
修改上面的`you_password`为你数据库`root`用户的密码即可.
# 参考链接 #
[https://blog.csdn.net/m_amazing/article/details/84313789](https://blog.csdn.net/m_amazing/article/details/84313789)
