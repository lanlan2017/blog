---
title: idea导出可执行jar包是，没有导出依赖的第三方jar包
categories: 
  - IDE
  - Idea
abbrlink: 2ee17d2f
date: 2021-08-23 22:27:00
updated: 2022-04-04 00:51:45
---
# 问题描述
我的项目中使用了第三方的jar包，在idea中运行正常，但是导出的可执行jar包运行不正常，经过我的查找，发现是因为，导出可执行jar的时候，没有把第三方的jar中内内容解压到可执行jar中。

# 解决方案
引入第三方jar的时候，不要引入该文件本身，而是引用该第三方jar所在的目录。
这样导出可执行jar的时候，就会解压这些第三方的jar包中的内容到可执行jar中，这样就不会运行出错了。

## 正确的导入第三方jar方式

也就是引入第三方jar的时候使用如下形式：
![image-20210823222915600](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210823222915.png)

### 错误的导入第三方jar方式

![image-20210823223519983](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210823223520.png)

## 查看导入的jar是否解压到可执行jar中

![image-20210823223835983](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210823223836.png)
