---
title: eclipse把项目打成war包
categories:
  - 编程
  - IDE
  - eclipse
abbrlink: 12d011c8
date: 2022-07-27 21:47:38
updated: 2022-07-27 21:47:38
---
# eclipse把项目打成war包
选中要导出的项目，右键，选择Export，然后选择WAR file，即可把Java Web项目打包成war包

![image-20220727215524902](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220727215525.png)

<!-- more -->

此时会弹出Export对话框，在对话框的Destination输入框填写要导出的目录，可以点击右侧的Browse...进行选择。我这里填写的是tomcat的webapps目录：

![image-20220727215545166](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220727215545.png)

然后点击Finish按钮。这样就可以成功导出war包了。

进入tomcat的bin目录，运行startup.bat，启动tomcat.

tomcat启动时会自动解压war包，得到项目：

![image-20220727215554663](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220727215554.png)

在浏览器中输入项目地址即可访问：
```
http://localhost:8080/commands/
```
