---
title: JavaScirpt 解决 正则表达式匹配HTML标签 的错误问题
categories: 
  - JavaScript
  - 正则表达式
date: 2019-12-02 22:40:18
updated: 2019-12-17 05:17:09
abbrlink: 2b78c799
---
<div id='my_toc'><a href="/blog/2b78c799/#问题描述" class="header_1">问题描述</a><br><a href="/blog/2b78c799/#解决方案" class="header_1">解决方案</a><br><a href="/blog/2b78c799/#更新" class="header_1">更新</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
JS中当在正则表达式中写HTML标签时,浏览器可能会错误的将正则表达式中的HTML标签当成HTML标签解析,而不是正则表达式,例如,对于如下JS代码:
```html
<script>
    ...
    var regexs=/<div id='my_toc'>\n\n(.+\n)+\n</div>\n<script>.+</script>\n/m;
    text=text.replace(regexs,toc);
    ...
</script>
```
浏览器可能会解析成:
```html
<script>
    ...
    var regexs=/<div id='my_toc'>\n\n(.+\n)+\n</div>\n<script>.+</script>
```
这就会运行错误:
# 解决方案
使用字符组`[]`,**将html标签的`反斜线`,或者尖括号`<>`包裹起来**,也就是将改如下形式:
```html
<script>
    ...
    var regexs=/[<]div id='my_toc'>\n\n(.+\n)+\n<[/]div>\n[<]script>.+<[/]script>\n/m;
    text=text.replace(regexs,toc);
    ...
</script>
```
这样`<[/]script>`依然匹配`</script>`,浏览器也不会解析错误.
# 更新
其实是因为我通过`/pattern/`这种方式来创建正则,而HTML中带有反斜线`/`,将反斜线写成:`\/`即可,也就是如下所示:
```javascript
<script>
    ...
    var regexs=/<div id='my_toc'>\n\n(.+\n)+\n<\/div>\n<script>.+<\/script>\n/m;
    text=text.replace(regexs,toc);
    ...
</script>                
```
不过还是使用上面的那种方式比较严格,这种方式`<script>`可能依旧被解析成`html`标签.
