---
title: mathjax公式删除线
categories: 
  - 其他
  - latex
  - LaTex语法
date: 2019-02-18 21:39:42
updated: 2019-12-15 10:01:44
abbrlink: f88b012c
mathjax: true
---
<div id='my_toc'><a href="/blog/f88b012c/#mathjax公式添加删除线" class="header_2">mathjax公式添加删除线</a><br><a href="/blog/f88b012c/#例子" class="header_3">例子</a><br><a href="/blog/f88b012c/#参考资料" class="header_2">参考资料</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## mathjax公式添加删除线 ##
使用`\require{cancel}`声明,来允许片段删除线 的显示,即写成如下形式:
```latex
$$
\require{cancel}
......
$$
```
声明片段删除线后，使用如下代码:
- `\cancel{字符}`斜线(`/`)、
- `\bcancel{字符}`反斜线(`\`)、
- `\xcancel{字符}`打叉(`x`)
- `\cancelto{字符}`带箭头斜线

### 例子 ###
```mathjax
$$
\require{cancel}
\begin{array}{rl}
\verb|y+\cancel{x}| & y+\cancel{x}\\
\verb|\cancel{y+x}| & \cancel{y+x}\\
\verb|y+\bcancel{x}| & y+\bcancel{x}\\
\verb|y+\xcancel{x}| & y+\xcancel{x}\\
\verb|y+\cancelto{0}{x}| & y+\cancelto{0}{x}\\
\verb+\frac{1\cancel9}{\cancel95} = \frac15+& \frac{1\cancel9}{\cancel95} = \frac15 \\
\end{array}
$$
```
显示效果：
$$
\require{cancel}
\begin{array}{rl}
\verb|y+\cancel{x}| & y+\cancel{x}\\
\verb|\cancel{y+x}| & \cancel{y+x}\\
\verb|y+\bcancel{x}| & y+\bcancel{x}\\
\verb|y+\xcancel{x}| & y+\xcancel{x}\\
\verb|y+\cancelto{0}{x}| & y+\cancelto{0}{x}\\
\verb+\frac{1\cancel9}{\cancel95} = \frac15+& \frac{1\cancel9}{\cancel95} = \frac15 \\
\end{array}
$$
## 参考资料 ##
[https://blog.csdn.net/qq_30717203/article/details/81139708#t29](https://blog.csdn.net/qq_30717203/article/details/81139708#t29)


