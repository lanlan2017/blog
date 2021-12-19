---
title: 正则应用：把Markdown中的加粗文本改为标题文本
categories:
  - 其他
  - 正则表达式
  - 实例
abbrlink: 1d153e30
date: 2018-10-11 09:12:13
updated: 2019-12-17 05:18:53
---
## 实现 ##
用notepad++打开该文章，按下ctrl+h打开替换，在查找模式选择框，选择正则表达式，然后输入查找正则表达式：
```
[*]{2}(\d+.+?)[*]{2}
```
输入替换正则表达式：
```
###\1###
```
如图所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/java/my_regex_example/ctrl_b3ctrl_3.png)
