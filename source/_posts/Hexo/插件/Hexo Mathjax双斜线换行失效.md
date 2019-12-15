---
title: Hexo Mathjax双斜线换行失效
categories: 
  - Hexo
  - 插件
date: 2019-12-09 17:31:25
updated: 2019-12-09 20:39:05
mathjax: true
abbrlink: eb86e892
---
# 问题描述
这是是hexo使用的markdown引擎造成的.
```
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
# 解决方案 更换引擎
卸载原来的hexo引擎:
```shell
npm uninstall --save hexo-renderer-marked
```
使用另一个hexo引擎
```shell
npm install --save hexo-renderer-kramed
```
还需要注意的是使用\\只在多行公式内有效:
也就是要写成如下形式:
```shell
$$
\begin{align}
a &=1  &  b &=2   & c &=3   \\
d &=-1 &  e &=-2  & f &=-5
\end{align}
$$
```
$$
\begin{align}
a &=1  &  b &=2   & c &=3   \\
d &=-1 &  e &=-2  & f &=-5
\end{align}
$$
行内公式是不换行的:
```shell
测试:$
\begin{align}
a &=1  &  b &=2   & c &=3   \\
d &=-1 &  e &=-2  & f &=-5
\end{align}
$
```
测试:$
\begin{align}
a &=1  &  b &=2   & c &=3   \\
d &=-1 &  e &=-2  & f &=-5
\end{align}
$



# 参考资料
[https://segmentfault.com/a/1190000007261752](https://segmentfault.com/a/1190000007261752)
