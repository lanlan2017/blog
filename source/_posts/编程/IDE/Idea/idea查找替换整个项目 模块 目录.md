---
title: idea查找替换整个项目 模块 目录
categories: 
  - IDE
  - Idea
abbrlink: b02ac37c
date: 2021-04-03 14:47:47
updated: 2022-04-04 00:51:45
---

# 格式化其他模板设置错误
我发现原来项目中我的日期格式化设置错误了
```java
private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
```
这里的hh表示的是12小时制的小时数，这样会造成下午的时间比上午的实现小的情况。应该改成24小时制
也就是修改成如下的代码：
```java
private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
```
但是项目下的代码比较多，我已经记不得到底是哪个类中有这样的错误。所以需要对整个项目进行全局替换
# idea搜索整个项目
点击Edit菜单，然后依次选择：Find，Search Structurally...；即可进入全局查找功能

在Search template:文本域中输入要查找的字符串，然后点击下方的find按钮即可。

# idea替换整个项目
点击Edit菜单，然后依次选择：Find，Replace Structurally...；
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/IDE/Idea/GlobalSearchReplacement/1.png)
在Search template中输入要查找的字符串，
在Replace template中输入要替换的字符串，
然后点击find按钮即可
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programming/IDE/Idea/GlobalSearchReplacement/2.png)

<!-- Blog/Programming/IDE/Idea/GlobalSearchReplacement/ -->
