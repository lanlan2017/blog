---
title: mathjax公式删除线
categories: 
  - 其他
  - latex
  - LaTex语法
date: 2019-02-18 21:39:42
updated: 2019-11-05 10:32:11
mathjax: true
abbrlink: f88b012c
---
- [mathjax公式添加删除线](/blog/f88b012c/#mathjax公式添加删除线)
    - [例子](/blog/f88b012c/#例子)
- [参考资料](/blog/f88b012c/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## mathjax公式添加删除线 ##
使用删除线功能必须使用行间公式:`$$...$$`。
在公式内使用 `\require{cancel}` 来允许 片段删除线 的显示,即写成如下形式:
```latex
$$
\require{cancel}
......
$$
```
声明片段删除线后，使用 `\cancel{字符}`、`\bcancel{字符}`、`\xcancel{字符} `和 `\cancelto{字符} `来实现各种片段删除线效果。
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

>原文链接: [mathjax公式删除线](https://lanlan2017.github.io/blog/f88b012c/)
