---
title: eclipse导入的动态JavaWeb项目前面后红叉号
categories: 
  - IDE
  - eclipse
abbrlink: 95562e14
date: 2021-08-12 22:51:34
updated: 2022-04-04 00:51:45
---
# 问题1：Buildpath不对
JRE和Tomcat的不对
重新导入即可

# 问题2：eclipse项目配置问题
# 删除eclipse配置文件，重新导入项目即可
项目结构如下:
```
.classpath
.project
.settings/
WebContent/
build/
src/
```
删除eclipse的配置文件和build目录：
```
.classpath
.project
.settings/
build/
```
剩下如下目录：
```
WebContent/
src/
```
然后在重新导入该项目即可。
