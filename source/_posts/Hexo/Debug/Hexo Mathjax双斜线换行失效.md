---
title: Hexo Mathjax双斜线换行失效
categories: 
  - Hexo
  - Debug
date: 2019-12-09 17:31:25
updated: 2020-06-24 08:10:06
abbrlink: eb86e892
mathjax: true
---
<div id='my_toc'><a href="/blog/eb86e892/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/eb86e892/#解决方案-更换引擎" class="header_1">解决方案 更换引擎</a>&nbsp;<br><a href="/blog/eb86e892/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
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
