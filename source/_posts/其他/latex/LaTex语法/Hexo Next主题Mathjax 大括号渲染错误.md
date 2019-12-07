---
title: Hexo Next主题Mathjax 大括号渲染错误
categories: 
  - 其他
  - latex
  - LaTex语法
date: 2019-12-07 22:23:13
updated: 2019-12-07 22:23:55
abbrlink: 14ee6880
mathjax: true
---
<div id='my_toc'>

- [问题描述](/blog/14ee6880/#问题描述)
- [解决方案](/blog/14ee6880/#解决方案)
- [示例](/blog/14ee6880/#示例)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 问题描述
今天在Hexo的NexT主题的自带的Mathjax公式是,我发现渲染的时候**大括号消失了**:

```
$U=\{ A_1,A_2,\cdots,A_n \} $
```
$U=\{ A_1,A_2,\cdots,A_n \} $

# 解决方案
不要使用:
```
\{ \}
```
而是使用:
```
\lbrace \rbrace
```
来写大括号.
# 示例
```
$U=\lbrace A_1,A_2,\cdots,A_n \rbrace $
```
$U=\lbrace A_1,A_2,\cdots,A_n \rbrace $
