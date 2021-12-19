---
title: HTML转义字符
categories: 
  - 编程
  - HTML
  - 转义字符
date: 2019-03-28 12:54:08
updated: 2021-03-20 10:35:40
abbrlink: c14b29da
---
# 下面列举了让我出现问题的HTML转义符

|字符|英文代码|数字代码|名称|
|:--|:--|:--|:--|
|`{`||`&#123;`|左大括号|
|`}`||`&#125;`|右大括号|
|`@`||`&#64;`|at,邮箱符号|
|`<`|`&lt;`|`&#60;`|小于号|
|`>`|`&gt;`|`&#62;`|大于号|
|`#`||`&#35;`|井号|
|` `|`&nbsp;`||不断行的空格符|
|`:`||`&#58;`|冒号|
|`&`|`&amp;`|`&#62;`|取地址符|
|`"`|`&quot;`|`&#34;`|双引号|
|`©`|`&copy;`|`&#169;`|版权符号|
|`×`|`&times;`|`&#215;`|乘号|
|`÷`|`&divide;`|`&#247;`|除号|
|<code>&#124;</code>或<code>&verbar;</code>|`&verbar`|`&#124;`|竖线|
|<code>&brvbar;</code>或<code>&#166;</code>|`&brvbar;`|`&#166;`|断竖线|

就这么多,后面遇到再更新.
# Unicode编码转义
找到一些在线的Unicode编码转换网站，例如：[https://www.sojson.com/unicode.html](https://www.sojson.com/unicode.html)
把遇到的特殊字符，转换成Unicode编码即可，转换得到的Unicode同样可以直接放在HTML中显示。

# 参考链接
[http://www.fly63.com/article/detial/4916](http://www.fly63.com/article/detial/4916)
[http://www.cnblogs.com/xcsn/p/3559624.html](http://www.cnblogs.com/xcsn/p/3559624.html)
[https://www.cnblogs.com/zhxhdean/archive/2011/11/17/2252975.html](https://www.cnblogs.com/zhxhdean/archive/2011/11/17/2252975.html)
[https://tool.oschina.net/commons?type=2](https://tool.oschina.net/commons?type=2)

> [https://en.wikipedia.org/wiki/Vertical_bar#Unicode_code_points](https://en.wikipedia.org/wiki/Vertical_bar#Unicode_code_points)
> U+007C | VERTICAL LINE (HTML `&#124;` · `&verbar;`, `&vert;`, `&VerticalLine;`) (single vertical line)
> U+00A6 ¦ BROKEN BAR (HTML `&#166;` · `&brvbar;`) (single broken line)
