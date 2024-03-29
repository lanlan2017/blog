---
title: mathjax公式删除线
categories: 
  - 其他
  - latex
  - LaTex语法
abbrlink: f88b012c
date: 2019-02-18 21:39:42
updated: 2022-04-04 15:13:22
mathjax: true
---
# mathjax公式添加删除线
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

## 例子
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
\verb|y+\cancel{x}| & y+\cancel{x}\\\\
\verb|\cancel{y+x}| & \cancel{y+x}\\\\
\verb|y+\bcancel{x}| & y+\bcancel{x}\\\\
\verb|y+\xcancel{x}| & y+\xcancel{x}\\\\
\verb|y+\cancelto{0}{x}| & y+\cancelto{0}{x}\\\\
\verb+\frac{1\cancel9}{\cancel95} = \frac15+& \frac{1\cancel9}{\cancel95} = \frac15 \\\\
\end{array}
$$

# 参考资料
[https://blog.csdn.net/qq_30717203/article/details/81139708#t29](https://blog.csdn.net/qq_30717203/article/details/81139708#t29)
