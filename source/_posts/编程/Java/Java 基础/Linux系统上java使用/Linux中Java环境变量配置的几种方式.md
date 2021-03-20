---
title: Linux中Java环境变量配置的几种方式
categories: 
  - 编程
  - Java
  - Java 基础
  - Linux系统上java使用
date: 2018-08-11 14:25:09
updated: 2021-03-20 08:07:37
abbrlink: 73224a52
---
<div id='my_toc'><a href="/blog/73224a52/#永久修改，对所有用户有效" class="header_1">永久修改，对所有用户有效</a>&nbsp;<br><a href="/blog/73224a52/#永久修改，对单一用户有效" class="header_1">永久修改，对单一用户有效</a>&nbsp;<br><a href="/blog/73224a52/#只对当前bash/shell-生效" class="header_1">只对当前bash /shell 生效</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 永久修改，对所有用户有效
```shell
$vi /etc/profile
```
在`/etc/profile`文件`最后`添加下面的内容:
```
#set Java environment
export JAVA_HOME=/usr/lib/java/jdk1.8.0_171
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
```
修改文件后如果想马上生效，执行命令：`source /etc/profile`
最后重启：`shutdown -r -t 0`
#  永久修改，对单一用户有效
修改用户目录下的`.bash_profile`文件
```
cd ~
vi .bash_profile
```
在文件`最后`添加下面的内容
```
#set Java environment
export JAVA_HOME=/usr/lib/java/jdk1.8.0_171
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
```
此时如果想要马上生效执命令：`source .bash_profile`
最后重启：`shutdown -r -t 0`

# 只对当前bash /shell 生效
直接在`shell`中输入：
```
export JAVA_HOME=/usr/lib/java/jdk1.8.0_171
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
```
这个只对当前`shell/bash`有效重新打开一个`shell`就没有用了。


原文：[https://blog.csdn.net/jillliang/article/details/8216308](https://blog.csdn.net/jillliang/article/details/8216308)
