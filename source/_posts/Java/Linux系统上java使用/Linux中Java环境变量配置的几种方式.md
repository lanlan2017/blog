---
title: Linux中Java环境变量配置的几种方式
categories: 
  - Java
  - Linux系统上java使用
date: 2018-08-11 14:25:09
updated: 2019-11-05 10:32:11
abbrlink: 73224a52
---
- [永久修改，对单一用户有效](/blog/73224a52/#永久修改，对单一用户有效)
- [只对当前bash /shell 生效](/blog/73224a52/#只对当前bash-shell-生效)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
$vi /etc/profile
在`/etc/profile`文件`最后`添加下面的内容:
```
#set Java environment
export JAVA_HOME=/usr/lib/java/jdk1.8.0_171
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
```
修改文件后如果想马上生效，执行命令：`source /etc/profile`
最后重启：`shutdown -r -t 0`
##  永久修改，对单一用户有效 ##
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

## 只对当前bash /shell 生效 ##

直接在`shell`中输入：

```
export JAVA_HOME=/usr/lib/java/jdk1.8.0_171
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
```
这个只对当前`shell/bash`有效重新打开一个`shell`就没有用了。


参考：[https://blog.csdn.net/jillliang/article/details/8216308](https://blog.csdn.net/jillliang/article/details/8216308)

>原文链接: [Linux中Java环境变量配置的几种方式](https://lanlan2017.github.io/blog/73224a52/)
