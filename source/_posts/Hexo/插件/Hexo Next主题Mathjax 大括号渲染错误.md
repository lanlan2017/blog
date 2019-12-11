---
title: Hexo Next主题Mathjax 大括号渲染错误
categories: 
  - Hexo
  - 插件
date: 2019-12-07 22:23:13
updated: 2019-12-09 20:39:05
mathjax: true
abbrlink: 14ee6880
---
<div id='my_toc'><a href="/blog/14ee6880/#问题描述">问题描述</a><br/><a href="/blog/14ee6880/#解决方案">解决方案</a><br/><a href="/blog/14ee6880/#示例">示例</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

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
这两个**Latex定界符**来写**大括号**.
# 示例
```
$U=\lbrace A_1,A_2,\cdots,A_n \rbrace $
```
$U=\lbrace A_1,A_2,\cdots,A_n \rbrace $
