---
title: LinuxDeploy CentOS7 安装java tomcat
categories: 
  - 编程
  - Linux
  - LinuxDeploy
date: 2021-03-17 09:36:50
updated: 2021-03-17 11:20:33
abbrlink: e5ce3c15
---
<div id='my_toc'><a href="/blog/e5ce3c15/#下载java" class="header_1">下载java</a>&nbsp;<br><a href="/blog/e5ce3c15/#下载Tomcat" class="header_1">下载Tomcat</a>&nbsp;<br><a href="/blog/e5ce3c15/#使用Xftp上传到手机中" class="header_1">使用Xftp上传到手机中</a>&nbsp;<br><a href="/blog/e5ce3c15/#Xftp如何连接到手机上的linux" class="header_2">Xftp如何连接到手机上的linux</a>&nbsp;<br><a href="/blog/e5ce3c15/#解压缩" class="header_1">解压缩</a>&nbsp;<br><a href="/blog/e5ce3c15/#解压java的压缩包" class="header_2">解压java的压缩包</a>&nbsp;<br><a href="/blog/e5ce3c15/#解压Tomcat的压缩包" class="header_2">解压Tomcat的压缩包</a>&nbsp;<br><a href="/blog/e5ce3c15/#配置环境" class="header_1">配置环境</a>&nbsp;<br><a href="/blog/e5ce3c15/#配置java环境" class="header_2">配置java环境</a>&nbsp;<br><a href="/blog/e5ce3c15/#获取JDK绝对路径" class="header_3">获取JDK绝对路径</a>&nbsp;<br><a href="/blog/e5ce3c15/#在/etc/profile文件中配置Java环境变量" class="header_3">在/etc/profile文件中配置Java环境变量</a>&nbsp;<br><a href="/blog/e5ce3c15/#java环境变量模板" class="header_4">java环境变量模板</a>&nbsp;<br><a href="/blog/e5ce3c15/#设置java环境变量" class="header_4">设置java环境变量</a>&nbsp;<br><a href="/blog/e5ce3c15/#使配置生效" class="header_4">使配置生效</a>&nbsp;<br><a href="/blog/e5ce3c15/#验证java是否配置成功" class="header_3">验证java是否配置成功</a>&nbsp;<br><a href="/blog/e5ce3c15/#配置Tomcat" class="header_2">配置Tomcat</a>&nbsp;<br><a href="/blog/e5ce3c15/#创建Tomcat安装目录的软链接" class="header_3">创建Tomcat安装目录的软链接</a>&nbsp;<br><a href="/blog/e5ce3c15/#启动Tomcat" class="header_3">启动Tomcat</a>&nbsp;<br><a href="/blog/e5ce3c15/#在电脑上的浏览器访问Tomcat" class="header_3">在电脑上的浏览器访问Tomcat</a>&nbsp;<br><a href="/blog/e5ce3c15/#确保手机和电脑在同一网络之下" class="header_4">确保手机和电脑在同一网络之下</a>&nbsp;<br><a href="/blog/e5ce3c15/#关闭Tomcat" class="header_3">关闭Tomcat</a>&nbsp;<br><a href="/blog/e5ce3c15/#无法访问Tomcat的Manager-App和Host-Manager页面" class="header_3">无法访问Tomcat的Manager App和Host Manager页面</a>&nbsp;<br><a href="/blog/e5ce3c15/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 下载java
上面安装的linux系统是aarch64架构的，所以需要下载aarch64对应的版本：

jdk8官方下载地址:[https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)

获得安装包：[jdk-8u281-linux-aarch64.tar.gz](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html#license-lightbox)

# 下载Tomcat
Tomcat8下载路径：[https://tomcat.apache.org/download-80.cgi](https://tomcat.apache.org/download-80.cgi)
下载[tar.gz](https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.64/bin/apache-tomcat-8.5.64.tar.gz)版本的Tomcat

# 使用Xftp上传到手机中
## Xftp如何连接到手机上的linux
启动centos,打开Xshell，连接到手机。然后点击上面**窗口**菜单，选择**传输新建文件**菜单项。即可打开Xftp.

Xftp有两个分栏，左边的是电脑的目录树，右边是手机上的linux的目录树，进入linux的`/opt`目录。然后把电脑上下载好的java和tomcat的压缩包拖动到Xftp上的右边的Linux分栏中。这样就可以上传文件到Linux中了。等待上传完毕即可。

# 解压缩
## 解压java的压缩包
切换到Xshell中，进入刚才上传文件的目录(/opt目录)，创建一个名为java的目录，然后把java压缩包解压到这个/opt/java目录中
```
[root@localhost ~]# cd /opt
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  jdk-8u281-linux-aarch64.tar.gz
[root@localhost opt]# tar -zxvf jdk-8u281-linux-aarch64.tar.gz -C java
tar: java：无法 open: 没有那个文件或目录
tar: Error is not recoverable: exiting now
[root@localhost opt]# mkdir java
[root@localhost opt]# tar -zxvf jdk-8u281-linux-aarch64.tar.gz -C java
```
## 解压Tomcat的压缩包
创建tomcat目录，然后将tomcat的压缩包解压到这个/opt/tomcat目录中：
```
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz
[root@localhost opt]# mkdir tomcat
[root@localhost opt]# tar -zxvf apache-tomcat-8.5.63.tar.gz -C tomcat/
apache-tomcat-8.5.63/conf/
apache-tomcat-8.5.63/conf/catalina.policy
......
apache-tomcat-8.5.63/bin/tool-wrapper.sh
apache-tomcat-8.5.63/bin/version.sh
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  tomcat
[root@localhost opt]# cd tomcat/
[root@localhost tomcat]# ls
apache-tomcat-8.5.63
```
# 配置环境
## 配置java环境
### 获取JDK绝对路径
进入jdk根目录，获取jdk根目录的绝对路径：
```
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  tomcat
[root@localhost opt]# cd java
[root@localhost java]# ls
jdk1.8.0_281
[root@localhost java]# cd jdk1.8.0_281/
[root@localhost jdk1.8.0_281]# ls
bin  COPYRIGHT  include  jre  legal  lib  LICENSE  man  README.html  release  src.zip  THIRDPARTYLICENSEREADME.txt
[root@localhost jdk1.8.0_281]# pwd
/opt/java/jdk1.8.0_281
```
### 在/etc/profile文件中配置Java环境变量
#### java环境变量模板
```
# java 环境变量
# JAVA_HOME路径根据你实际安装的路径填写
export JAVA_HOME=JDK目录的绝对地址
# 下面剩下的配置不需要更改
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:JAVA_HOME/lib:JRE_HOME/lib:${CLASSPATH}
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
```
上一步得到的jdk的绝对路径为：
```
/opt/java/jdk1.8.0_281
```
所以我的配置为
```
# java 环境变量
# JAVA_HOME路径根据你实际安装的路径填写
export JAVA_HOME=/opt/java/jdk1.8.0_281
# 下面剩下的配置不需要更改
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:JAVA_HOME/lib:JRE_HOME/lib:${CLASSPATH}
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
```
#### 设置java环境变量
打开/etc/profile文件，在文件末尾填写上面的配置即可：
```
[root@localhost jdk1.8.0_281]# vim /etc/profile
[root@localhost ~]# cat /etc/profile
# /etc/profile

# System wide environment and startup programs, for login setup
# Functions and aliases go in /etc/bashrc
......
unset i
unset -f pathmunge

# java 环境变量
# JAVA_HOME路径根据你实际安装的路径填写
export JAVA_HOME=/opt/java/jdk1.8.0_281
# 下面剩下的配置不需要更改
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:JAVA_HOME/lib:JRE_HOME/lib:${CLASSPATH}
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
[root@localhost ~]# 
```
#### 使配置生效
```shell
source /etc/profile
```
### 验证java是否配置成功
```
[root@localhost ~]# java -version
java version "1.8.0_281"
Java(TM) SE Runtime Environment (build 1.8.0_281-b09)
Java HotSpot(TM) 64-Bit Server VM (build 25.281-b09, mixed mode)
[root@localhost ~]# 
```
## 配置Tomcat
### 创建Tomcat安装目录的软链接
由于上面解压出来的Tomcat安装目录的名称太长了，为了后面启动或者关闭tomcat的时候输入命令方便一点。
```
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  tomcat
[root@localhost opt]# cd tomcat/
[root@localhost tomcat]# ls
apache-tomcat-8.5.63
[root@localhost tomcat]# cd apache-tomcat-8.5.63/
[root@localhost apache-tomcat-8.5.63]# ls
bin  BUILDING.txt  conf  CONTRIBUTING.md  lib  LICENSE  logs  NOTICE  README.md  RELEASE-NOTES  RUNNING.txt  temp  webapps  work
[root@localhost apache-tomcat-8.5.63]# pwd
/opt/tomcat/apache-tomcat-8.5.63
[root@localhost apache-tomcat-8.5.63]# ln -s /opt/tomcat/apache-tomcat-8.5.63 /opt/tomcat85
[root@localhost apache-tomcat-8.5.63]# cd /opt
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  java  jdk-8u281-linux-aarch64.tar.gz  tomcat  tomcat85
```
现在使用tomcat85这个软链接就可以替代“/tomcat/apache-tomcat-8.5.63”。
```
[root@localhost opt]# cd tomcat85
[root@localhost tomcat85]# ls
bin  BUILDING.txt  conf  CONTRIBUTING.md  lib  LICENSE  logs  NOTICE  README.md  RELEASE-NOTES  RUNNING.txt  temp  webapps  work
```
### 启动Tomcat
/opt/tomcat85/startup.sh
```
[root@localhost opt]# /opt/tomcat85/bin/startup.sh 
Using CATALINA_BASE:   /opt/tomcat85
Using CATALINA_HOME:   /opt/tomcat85
Using CATALINA_TMPDIR: /opt/tomcat85/temp
Using JRE_HOME:        /opt/java/jdk1.8.0_281/jre
Using CLASSPATH:       /opt/tomcat85/bin/bootstrap.jar:/opt/tomcat85/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
Tomcat started.
[root@localhost opt]# 
```
### 在电脑上的浏览器访问Tomcat
#### 确保手机和电脑在同一网络之下
使得电脑和手机在同一个网络之下，有如下几种：
(1) 电脑和手机连接同一个WIFI,并且该wifi没有设置防火墙。
(2) 手机开热点，电脑连接到手机的热点上。
(3) 电脑开热点，手机连接到电脑的热点上。
有的WIFI可能有防火墙，使得同一个WIFI下的电脑和手机不能相互访问。如果发现老是连不上，可以试着通过热点的方式进行连接。

Tomcat默认运行在8080端口，确保电脑和手机在同一个网络之下，然后在浏览器的地址栏中输入手机的`IP地址:8080`即可访问Tomcat.
LinuxDeploy上方的那四位数字就是IP地址。
此时我的IP地址为192.168.1.6，所以打开[http://192.168.1.6:8080/](http://192.168.1.6:8080/)即可访问Tomcat

### 关闭Tomcat
```
[root@localhost opt]# /opt/tomcat85/bin/startup.sh 
Using CATALINA_BASE:   /opt/tomcat85
Using CATALINA_HOME:   /opt/tomcat85
Using CATALINA_TMPDIR: /opt/tomcat85/temp
Using JRE_HOME:        /opt/java/jdk1.8.0_281/jre
Using CLASSPATH:       /opt/tomcat85/bin/bootstrap.jar:/opt/tomcat85/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
Tomcat started.
[root@localhost opt]# /opt/tomcat85/bin/shutdown.sh 
Using CATALINA_BASE:   /opt/tomcat85
Using CATALINA_HOME:   /opt/tomcat85
Using CATALINA_TMPDIR: /opt/tomcat85/temp
Using JRE_HOME:        /opt/java/jdk1.8.0_281/jre
Using CLASSPATH:       /opt/tomcat85/bin/bootstrap.jar:/opt/tomcat85/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
[root@localhost opt]# 
```
### 无法访问Tomcat的Manager App和Host Manager页面
解决办法：设置角色，设置Tomcat用户名和密码。
见：[https://lanlan2017.github.io/blog/5d0a8795/](https://lanlan2017.github.io/blog/5d0a8795/)

# 参考资料
[https://blog.csdn.net/yjl15517377095/article/details/102060442](https://blog.csdn.net/yjl15517377095/article/details/102060442)
