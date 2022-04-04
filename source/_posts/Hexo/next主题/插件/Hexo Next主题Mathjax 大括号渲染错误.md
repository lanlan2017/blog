---
title: Hexo Next主题Mathjax 大括号渲染错误
categories: 
  - Hexo
  - next主题
  - 插件
abbrlink: 14ee6880
date: 2019-12-07 22:23:13
updated: 2022-04-04 15:56:38
mathjax: true
---
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
这两个**Latex定界符**来写**大括号**.
# 示例
```
$U=\lbrace A_1,A_2,\cdots,A_n \rbrace $
```
$U=\lbrace A_1,A_2,\cdots,A_n \rbrace $
