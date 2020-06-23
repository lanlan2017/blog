---
title: CSS选择器
categories:
  - 编程
  - CSS
abbrlink: b6981f1b
date: 2018-12-12 23:44:41
updated: 2019-12-17 05:18:51
---
<div id='my_toc'><a href="/blog/b6981f1b/#基础" class="header_1">基础</a>&nbsp;<br><a href="/blog/b6981f1b/#CSS选择器分类" class="header_2">CSS选择器分类</a>&nbsp;<br><a href="/blog/b6981f1b/#CSS-元素选择器" class="header_2">CSS 元素选择器</a>&nbsp;<br><a href="/blog/b6981f1b/#类型选择器" class="header_2">类型选择器</a>&nbsp;<br><a href="/blog/b6981f1b/#参考链接" class="header_2">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 基础 #
> 简而言之，选择器是 CSS 规则的一部分且位于 CSS 声明块前。
## CSS选择器分类 ##

选择器可以被分为以下类别：
- **简单选择器**（Simple selectors）：通过`元素类型`、`class` 或 `id` 匹配一个或多个元素。
- **属性选择器**（Attribute selectors）：通过 属性 / 属性值 匹配一个或多个元素。
- **伪类**（Pseudo-classes）：匹配处于确定状态的一个或多个元素，比如被鼠标指针悬停的元素，或当前被选中或未选中的复选框，或元素是DOM树中一父节点的第一个子节点。
- **伪元素**（Pseudo-elements）:匹配处于相关的确定位置的一个或多个元素，例如每个段落的第一个字，或者某个元素之前生成的内容。 
- **组合器**（Combinators）：这里不仅仅是选择器本身，还有以有效的方式组合两个或更多的选择器用于非常特定的选择的方法。例如，你可以只选择divs的直系子节点的段落，或者直接跟在headings后面的段落。
- **多重选择器**（Multiple selectors）：这些也不是单独的选择器；这个思路是将以逗号分隔开的多个选择器放在一个CSS规则下面， 以将一组声明应用于由这些选择器选择的所有元素。


## CSS 元素选择器 ##
最常见的 CSS 选择器是元素选择器。换句话说，文档的元素就是最基本的选择器。
如果设置 HTML 的样式，选择器通常将是某个 HTML 元素，比如 p、h1、em、a，甚至可以是 html 本身：
```css
html {color:black;}
h1 {color:blue;}
h2 {color:silver;}
```
可以将某个样式从一个元素切换到另一个元素。
假设您决定将上面的段落文本（而不是 h1 元素）设置为灰色。只需要把 h1 选择器改为 p：
```css
html {color:black;}
p {color:gray;}
h2 {color:silver;}
```
## 类型选择器 ##

待续...
## 参考链接 ##
[https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Introduction_to_CSS/Selectors](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Introduction_to_CSS/Selectors)
[http://www.w3school.com.cn/css/css_selector_type.asp](http://www.w3school.com.cn/css/css_selector_type.asp)
