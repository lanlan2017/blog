---
title: 安装了多个java 如何切换java版本
categories: 
  - 编程
  - Java
  - Java 基础
  - 版本
date: 2019-10-06 10:42:44
updated: 2021-03-20 07:55:49
abbrlink: 957ae50e
---
# 安装了多个java 如何切换java版本
## 问题描述
平常用的是`java8`,最近在学习`java`的新特性。这就需要从`java8`往更高的`java`版本切换。由于还在使用`java8`,测试完新特性后我需要再切换回`java8`.
## 如何切换
安装`java`的时候我们会配置`JAVA_HOME`这个环境变量.所有要切换`java`版本,只需要修改`JAVA_HOME`即可,在`JAVA_HOME`里面写上`java8`的安装目录,那就使用的是`java8`,`JAVA_HOME`里面写上`java9`的安装目录,则使用的是`java9`。
# 解决方案
## 手动切换
手动修改,`JAVA_HOME`中的地址即可,这里不介绍。
## 在cmd中临时切换java版本
例如现在在cmd中,临时需要用到java9的jshell,可以输入如下命令进行设置:
```cmd
set path=E:\java\java9\jdk-9\bin;%path%
```
其中:
```
E:\java\java9\jdk-9\bin
```
是jdk9的安装路径.

## 批处理实现
因为手动修改`JAVA_HOME`,太过繁琐,所以通过一个批处理程序来实现.
### 新增环境变量
新增`JAVA_HOME_8`,`JAVA_HOME_9`,`JAVA_HOME_11`分别写入`java8`,`java9`,`java11`的安装目录,这和配置`JAVA_HOME`一样.
### 批处理脚本
创建一个名为`快捷方式`的目录。
#### TJava.bat
在这个`快捷方式`目录下新建`TJava.bat`,写入如下命令:
```bat
@echo off
java -version
pause
```
运行这个批处理就可以看到当前用的是哪个`java`版本了.这里使用批处理是为了快速运行这个`java -version`命令,不用手动操作。
#### CJavaBat.bat
然后在`快捷方式`下,创建批处理脚本`CJavaBat.bat`,开头的`C`是`change`的意思.
```bat
@echo off
@echo ------------------------------------------------
@echo 当前Java版本为:
call TJava.bat
@echo ------------------------------------------------
@echo 输入要使用的java版本对应的选项:
@echo 选项   含义
@echo 8      切换环境为JDK8
@echo 9      切换环境为JDK9
@echo 11     切换环境为JDK11
@echo ------------------------------------------------
set /P choose=请输入选择:
IF "%choose%" EQU "8" (
    REM 修改JAVA_HOME环境变量为%JAVA_HOME_8%,
    setx "JAVA_HOME" "%%JAVA_HOME_8%%" /m
    echo 已经修改 "JAVA_HOME" 为 %%JAVA_HOME_8%%
) ELSE IF "%choose%" EQU "9" (
    setx "JAVA_HOME" "%%JAVA_HOME_9%%" /m
    echo 已经修改 "JAVA_HOME" 为 %%JAVA_HOME_9%%
REM setx "Path" "%cd%;%path%" /m
) ELSE IF "%choose%" EQU "11" (
    setx "JAVA_HOME" "%%JAVA_HOME_11%%" /m
    echo 已经修改 "JAVA_HOME" 为 %%JAVA_HOME_11%%
)
pause
```
上面程序中的`setx`命令就是用来修改环境变量的.语法格式为:`setx 环境变量名 环境变量值 /m`。`setx`设置环境变量需要管理员权限,以管理员身份,运行上面的`CJavaBat.bat`就可以修改`JAVA_HOME`环境变量的内容,从而切换`Java`版本。
### 给`CJavaBat.bat`设置管理员权限
创建`CJavaBat.bat`的快捷方式,然后将这个`快捷方式`重命名为`CJava`,注意一定要修改名字。
然后在`快捷方式`上面右键。选择`属性`,在`快捷方式`选项卡上,点击`高级`,然后勾选上`用管理员身份运行`。
这样以后直接点击`CJava`这个快捷方式就可以以管理身份运行`CJavaBat.bat`这个批处理脚本了。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191006113119847.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20191006113329396.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx,size_16,color_FFFFFF,t_70)

### 配置CJava到Path环境变量
将这个`快捷方式`目录配置到`Path`环境变量中,这样系统会在这个目录下查找程序,
### 通过Win+R运行CJava
然后就可以按下`Win+R`来启动运行,结束输入`CJava`,即可启动程序。
### CJava程序说明
在`CJava`中输入选项:8,则切换到`Java8`,输入9,则切换到`Java9`,输入11则切换到`java11`,依次类推,可以拓展上面的程序,以支持切换更多的`java`版本。
### CJava运行效果
```
------------------------------------------------
当前Java版本为:
java version "1.8.0_221"
Java(TM) SE Runtime Environment (build 1.8.0_221-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.221-b11, mixed mode)
请按任意键继续. . .
------------------------------------------------
输入要使用的java版本对应的选项:
选项   含义
8      切换环境为JDK8
9      切换环境为JDK9
11     切换环境为JDK11
------------------------------------------------
请输入选择:11
成功: 指定的值已得到保存。
已经修改 "JAVA_HOME" 为 %JAVA_HOME_11%
请按任意键继续. . .

```
可以看到切换之前是`Java8`,切换后为`Java11`
### 查看是否切换成功
运行上面创建`TJava.bat`,查看运行效果:
```
java version "11.0.4" 2019-07-16 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.4+10-LTS)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.4+10-LTS, mixed mode)
请按任意键继续. . .
```
可以看到现在已经成功切换为`Java11`了
