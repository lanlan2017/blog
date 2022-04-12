---
title: Linux vim取消搜索高亮
categories: 
  - Linux
  - 通用
  - vi编辑器及乱码问题
abbrlink: b066b617
date: 2021-06-02 16:29:47
updated: 2022-04-04 00:51:45
---
<!-- Blog/Programmin/Linux/General/VIEditorAndGarbledIssues/CancelSearchHighlight -->
# 问题：vim搜索的关键字不会自动取消高亮显示
在vim中使用正则表达式搜索时，匹配的关键字会高亮显示。但当我们不需要搜索时，这些匹配的关键字还是高亮。退出文件后再次用vim打开该文件，还是会高亮显示。
# 解决方案
在末行模式下输入：
```
:noh
```
或者
```
:nohlsearch
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Programmin/Linux/General/VIEditorAndGarbledIssues/CancelSearchHighlight/1.png)
# 参考资料
<https://www.jianshu.com/p/d0a287a26866>
<https://blog.csdn.net/k7arm/article/details/77370181>
