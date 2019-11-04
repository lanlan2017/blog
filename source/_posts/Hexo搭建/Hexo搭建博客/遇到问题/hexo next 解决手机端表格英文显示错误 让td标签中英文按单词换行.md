---
title: hexo next 解决手机端表格英文显示错误 让td标签中英文按单词换行
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 遇到问题
date: 2018-11-06 11:24:16
updated: 2019-10-30 11:55:39
abbrlink: 200a993a
---
- [问题描述](/blog/html/200a993a/#问题描述)
- [修改next主题样式文件](/blog/html/200a993a/#修改next主题样式文件)
- [写表格时用空格分隔每个单词](/blog/html/200a993a/#写表格时用空格分隔每个单词)
    - [实例 错误写法](/blog/html/200a993a/#实例-错误写法)
    - [实例 正确写法](/blog/html/200a993a/#实例-正确写法)
- [css word-break属性](/blog/html/200a993a/#css-word-break属性)
- [white-space、word-wrap、word-break的区别](/blog/html/200a993a/#white-space、word-wrap、word-break的区别)
- [参考链接](/blog/html/200a993a/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 问题描述 ##
最近写完文章后部署后，在手机端查看的时候，我发现英文显示不正确了，其他栏目特别大，英文行压缩成小小的一列，看起来很别扭.
## 修改next主题样式文件 ##
修改样式文件,打开**next主题样式文件**：`E:\Blog\bolg5\themes\next\source\css\_custom\custom.styl`,在其中添加下面的CSS代码：
```css
td{
    word-break: normal;
}
```
然后`hexo clean&&hexo g&&hexo d`部署，在手机端打开就可以正常显示了。
## 写表格时用空格分隔每个单词 ##
在表格太长的英文单词不要写成一串，中间用空格分隔开，这样手机端就能更好的从空格处换行。例如对于函数:`fontcolor(colorValue)`这种写法所有的单词写成一串，浏览器会把它当成一个单词,这样移动端显示的时候，无法拆分这个几个单词，这样就会显示在一行,从而让这一列特别大，挤占其他列的空间。
应该用空格把单词分开写成`fontcolor( colorValue )`，这样就可以正确的换行了。
### 实例 错误写法 ###
```
|方法|描述|结果|
|:--|:--|
|`fontcolor(colorValue)`|字符串设置颜色|在字符串首尾加上 HTML的&lt;font color="colorValue"&gt;&lt;/font&gt; 标记对, 设置 color属性的值为参数colorValuer， color属性可以是颜色的十六进制值,也可以是颜色的预定义名|
|`fontsize(sizeValue)`|字符串设置大小|在字符串首尾加上 HTML的&lt;font size="sizeValue"&gt;&lt;/font&gt; 标记对,并设置size属性的值为参数sizeValue|
|`anchor(name)`|创建 HTML 锚|在字符串首尾加上 HTML的 &lt;a name="name"&gt;&lt;/a&gt; 标记对|
|`link(url)`|创建HTML超链接|在字符串首尾加上 HTML的 &lt;a href="url"&gt;&lt;/a&gt; 标记对|
```
显示效果(注意用手机打开这篇文章)：

|方法|描述|结果|
|:--|:--|
|`fontcolor(colorValue)`|字符串设置颜色|在字符串首尾加上 HTML的&lt;font color="colorValue"&gt;&lt;/font&gt; 标记对, 设置 color属性的值为参数colorValuer， color属性可以是颜色的十六进制值,也可以是颜色的预定义名|
|`fontsize(sizeValue)`|字符串设置大小|在字符串首尾加上 HTML的&lt;font size="sizeValue"&gt;&lt;/font&gt; 标记对,并设置size属性的值为参数sizeValue|
|`anchor(name)`|创建HTML锚|在字符串首尾加上 HTML的 &lt;a name="name"&gt;&lt;/a&gt; 标记对|
|`link(url)`|创建HTML超链接|在字符串首尾加上 HTML的 &lt;a href="url"&gt;&lt;/a&gt; 标记对|
### 实例 正确写法 ###
```
|方法|描述|结果|
|:--|:--|
|`fontcolor( colorValue )`|字符串设置颜色|在字符串首尾加上 HTML的&lt;font color="colorValue"&gt;&lt;/font&gt; 标记对, 设置 color属性的值为参数colorValuer， color属性可以是颜色的十六进制值,也可以是颜色的预定义名|
|`fontsize( sizeValue )`|字符串设置大小|在字符串首尾加上 HTML的&lt;font size="sizeValue"&gt;&lt;/font&gt; 标记对,并设置size属性的值为参数sizeValue|
|`anchor( name )`|创建 HTML 锚|在字符串首尾加上 HTML的 &lt;a name="name"&gt;&lt;/a&gt; 标记对|
|`link( url )`|创建HTML超链接|在字符串首尾加上 HTML的 &lt;a href="url"&gt;&lt;/a&gt; 标记对|
```
显示效果：

|方法|描述|结果|
|:--|:--|
|`fontcolor( colorValue )`|字符串设置颜色|在字符串首尾加上 HTML的 &lt;font color="colorValue"&gt;&lt;/font&gt;  标记对, 设置 color属性的值为参数colorValuer， color属性可以是颜色的十六进制值,也可以是颜色的预定义名|
|`fontsize( sizeValue )`|字符串设置大小|在字符串首尾加上 HTML的&lt;font size="sizeValue"&gt;&lt;/font&gt; 标记对,并设置size属性的值为参数sizeValue|
|`anchor( name )`|创建HTML锚|在字符串首尾加上 HTML的 &lt;a name="name"&gt;&lt;/a&gt; 标记对|
|`link(url)`|创建HTML超链接|在字符串首尾加上 HTML的 &lt;a href="url"&gt;&lt;/a&gt; 标记对|

## css word-break属性 ##
word-break属性用来规定自动换行的处理方式，它不仅可以让浏览器在半角空格或连字符的后面换行，也可以实现在任意位置换行，可选值有 `normal | keep-all | break-all`，默认值为 normal。
- `normal` 表示根据语言自身的换行规则，确定换行方式，**中文将容器边界处的汉字换到下一行，西方文字则将整个单词换到下一行**；
- `keep-all` 表示不允许把单词截断，**只能在半角空格或连字符处换行**；
- `break-all` 允许**把单词截断，在单词内换行**。

## white-space、word-wrap、word-break的区别 ##

- `white-space: nowrap` 让一段文本不换行，在一行内显示。
- `word-wrap: normal` 使一个单词或URL不折行，在一行内显示。
- `word-wrap: break-word` 在容器边界自动换行，会把整个长单词看成一个整体放到下一行，而不会把单词截断。
- `word-break: break-all` 在行末宽度不够显示整个单词时，会把单词截断。

## 参考链接 ##
[td自动换行时不切断英文单词](https://blog.csdn.net/qq_26702601/article/details/78497609#commentBox)
[CSS 单词换行 word-break属性](https://blog.csdn.net/ixygj197875/article/details/79326788)

>原文链接: [hexo next 解决手机端表格英文显示错误 让td标签中英文按单词换行](https://lanlan2017.github.io/blog/200a993a/)