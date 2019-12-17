---
title: Linux 常用环境变量及作用和环境变量文件的详细介绍及其加载执行顺序
categories: 
  - Java
  - Java 基础
  - Linux系统上java使用
date: 2018-08-11 15:28:20
updated: 2019-12-17 05:17:09
abbrlink: 6249459e
---
<div id='my_toc'><a href="/blog/6249459e/#前言：" class="header_2">前言：</a><br><a href="/blog/6249459e/#一、环境变量文件介绍" class="header_2">一、环境变量文件介绍</a><br><a href="/blog/6249459e/#二、Linux的变量种类" class="header_2">二、Linux的变量种类</a><br><a href="/blog/6249459e/#三、Linux-环境变量文件" class="header_2">三、Linux 环境变量文件</a><br><a href="/blog/6249459e/#系统级：" class="header_3">系统级：</a><br><a href="/blog/6249459e/#/etc/environment" class="header_4">/etc/environment</a><br><a href="/blog/6249459e/#/etc/profile" class="header_4">/etc/profile</a><br><a href="/blog/6249459e/#/etc/bashrc" class="header_3">/etc/bashrc</a><br><a href="/blog/6249459e/#用户级：" class="header_2">用户级：</a><br><a href="/blog/6249459e/#-~/.profile" class="header_3">`~/.profile`</a><br><a href="/blog/6249459e/#~/.bashrc" class="header_3">~/.bashrc</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
Linux 常用环境变量及作用和环境变量文件的详细介绍及其加载执行顺序
原文：

## 前言： ##

1. 环境变量是操作系统环境设置的变量，适用于整个系统的用户进程；

2. 环境变量可以在命令中设置，但是用户注销的时候将会丢失这些设置值；

3. 若要重复适用，则**最好在.profile中定义**；环境变量的使用与本地变量的使用方法相同，

4. 但是在使用之前，必须用export命令导出。

## 一、环境变量文件介绍   ##

Linux中环境变量包括`系统级`和`用户级`。
- 系统级的环境变量是每个登录到系统的用户都要读取的系统变量，
- 而用户级的环境变量则是该用户使用系统时加载的环境变量，
所以管理环境变量的文件也分为系统级和用户级的。

## 二、Linux的变量种类 ##

按变量的生存周期来划分，Linux变量可分为两类：

- 永久的：需要修改配置文件，变量永久生效
- 临时的：使用export命令声明即可，变量在关闭shell时失效

## 三、Linux 环境变量文件 ##

linux变量文件有
- `/etc/environment `
-  `/etc/profile`
- `~/.profile`
- `/etc/bash.bashrc`
- `~/.bashrc`
- `~/.bash_profile(一般是用户在自己目录下新建的`）
- `~/.bash_logout.`

### 系统级： ###

#### /etc/environment ####
- 该文件是**系统在登录时读取的第一个文件**，该文件设置的是整个系统的环境变量，只要启动系统就会读取该文件，用于为所有进程设置环境变量。
- 系统使用此文件时**并不是执行此文件中的命令**，而是根据而是根据KEY=VALUE模式的代码，对KEY赋值以VALUE，因此文件中如果要定义PATH环境变量，只需加入一行形如 PATH=$PATH:/xxx/bin的代码即可
例如：
```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
```

#### /etc/profile ####
- 此文件是系统登录时执行的第二个文件。 为系统的每个用户设置环境信息，当用户第一次登录时，该文件被执行。并从`/etc/profile.d`目录的配置文件中搜集shell的设置。
- /etc/profile可以用于设定针对全系统所有用户的环境变量，环境变量周期是永久性，例如如果需要让所有用户可以使用java,把Java环境变量写在该文件中。

### /etc/bashrc ###

- 是针对所有用户的bash初始化文件，在此中设定的环境变量将应用于所有用户的shell中，此文件会在用户每次打开shell时执行一次。
- 即每次新开一个终端，都会执行/etc/bashrc

## 用户级： ##
这些文件处于(Home)家目录下`~`,用于定制`该用户的专属环境变量`。

### `~/.profile` ###

对应当前登录用户的profile文件，用于定制当前用户的个人工作环境(变量是永久性)，每个用户都可使用该文件输入专用于自己使用的shell信息,**当用户登录时,该文件仅仅执行一次**!默认情况下,他设置一些环境变量,执行用户的.bashrc文件。这里是推荐放置个人设置的地方

### ~/.bashrc ###

该文件包含专用于你的bash shell的bash信息，当登录时以及**每次打开新的shell时，该文件被读取**。(~/.bashrc只针对当前用户，变量的生命周期是永久的)，所以不推荐在这里设置常用的变量，因为每开一个shell，这个文件会读取一次，效率肯定有影响。


暂时整理到这里，我看作者写的有点乱。
