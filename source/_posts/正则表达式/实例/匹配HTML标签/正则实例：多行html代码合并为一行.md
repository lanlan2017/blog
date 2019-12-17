---
title: 正则实例：多行html代码合并为一行
categories: 
  - 正则表达式
  - 实例
  - 匹配HTML标签
date: 2018-10-14 22:51:59
updated: 2019-12-17 05:17:09
abbrlink: 72162c39
---
<div id='my_toc'></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
有下面这样一段HTML代码：
```html
    <span style="cursor:auto">
        Auto</span>
        <br />
    <span style="cursor:crosshair">
        Crosshair</span>
    <br />
    <span style="cursor:default">
        Default</span>
    <br />
    <span style="cursor:pointer">
        Pointer</span>
    <br />
    <span style="cursor:move">
        Move</span>
    <br />
    <span style="cursor:e-resize">
        e-resize</span>
    <br />
    <span style="cursor:ne-resize">
        ne-resize</span>
    <br />
    <span style="cursor:nw-resize">
        nw-resize</span>
    <br />
    <span style="cursor:n-resize">
        n-resize</span>
    <br />
    <span style="cursor:se-resize">
        se-resize</span>
    <br />
    <span style="cursor:sw-resize">
        sw-resize</span>
    <br />
    <span style="cursor:s-resize">
        s-resize</span>
    <br />
    <span style="cursor:w-resize">
        w-resize</span>
    <br />
    <span style="cursor:text">
        text</span>
    <br />
    <span style="cursor:wait">
        wait</span>
    <br />
    <span style="cursor:help">
        help</span>
```
例如第一句：
```html
    <span style="cursor:auto">
        Auto</span>
        <br />
```
改成：
```html
    <span style="cursor:auto">Auto</span><br />
```
当然我是不可能一行行的来改的。使用正则表达式来做比较方便。匹配表达式：
```
(<span.*?>)\n\s+(.*</span>)\n\s+
```
匹配效果(VScode中)：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F/%E5%BA%94%E7%94%A8/%E5%8C%B9%E9%85%8DHTML/%E5%A4%9A%E8%A1%8Chtml%E5%90%88%E5%B9%B6%E4%B8%BA%E4%B8%80%E8%A1%8C.png)
html代码，会被括号捕获到，而换行符和空白符就不会被捕获，使用捕获到的html代码替换掉原来匹配的文本即可。所以替换的正则表达式为：
```
$1$2
```
`$1`表示第一个捕获组，`$2`表示第二个捕获组。捕获组不同的软件(体系)中的表示方式不同。VScode中是使用$1,$2,... 而NotePad++中使用的是`\1,\2,\3...`。
使用上述正则表达式是进行替换即可。替换后的结果为：
```html
    <p>请把鼠标移动到单词上，可以看到鼠标指针发生变化：</p>
    <span style="cursor:auto">Auto</span><br />
    <span style="cursor:crosshair">Crosshair</span><br />
    <span style="cursor:default">Default</span><br />
    <span style="cursor:pointer">Pointer</span><br />
    <span style="cursor:move">Move</span><br />
    <span style="cursor:e-resize">e-resize</span><br />
    <span style="cursor:ne-resize">ne-resize</span><br />
    <span style="cursor:nw-resize">nw-resize</span><br />
    <span style="cursor:n-resize">n-resize</span><br />
    <span style="cursor:se-resize">se-resize</span><br />
    <span style="cursor:sw-resize">sw-resize</span><br />
    <span style="cursor:s-resize">s-resize</span><br />
    <span style="cursor:w-resize">w-resize</span><br />
    <span style="cursor:text">text</span><br />
    <span style="cursor:wait">wait</span><br />
    <span style="cursor:help">
        help</span>
```
当然最后一句，并没有能够成功匹配到。但这样的效果。还算满意,因为现在我只需要修改最后一行的效果。当然最佳的方式，应该是现在VScode中看匹配的结果。编写更好的正则表达式，尽可能匹配到所有的内容。完美的正则表达式为：
```
(<span.*?>)\n\s+(.*</span>)(:?\n\s+)?
```
这样所有的span标签都会被匹配到。替换后的效果为：
```html
    <p>请把鼠标移动到单词上，可以看到鼠标指针发生变化：</p>
    <span style="cursor:auto">Auto</span><br />
    <span style="cursor:crosshair">Crosshair</span><br />
    <span style="cursor:default">Default</span><br />
    <span style="cursor:pointer">Pointer</span><br />
    <span style="cursor:move">Move</span><br />
    <span style="cursor:e-resize">e-resize</span><br />
    <span style="cursor:ne-resize">ne-resize</span><br />
    <span style="cursor:nw-resize">nw-resize</span><br />
    <span style="cursor:n-resize">n-resize</span><br />
    <span style="cursor:se-resize">se-resize</span><br />
    <span style="cursor:sw-resize">sw-resize</span><br />
    <span style="cursor:s-resize">s-resize</span><br />
    <span style="cursor:w-resize">w-resize</span><br />
    <span style="cursor:text">text</span><br />
    <span style="cursor:wait">wait</span><br />
    <span style="cursor:help">help</span>
```
