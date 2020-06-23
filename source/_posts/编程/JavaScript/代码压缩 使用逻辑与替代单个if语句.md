---
title: 代码压缩 使用逻辑与替代单个if语句
categories:
  - 编程
  - JavaScript
abbrlink: 4fd080c1
date: 2018-11-22 22:32:15
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/4fd080c1/#发现过程" class="header_2">发现过程</a>&nbsp;<br><a href="/blog/4fd080c1/#原理" class="header_2">原理</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 发现过程 ##
我的博客中使用了hexo-neat插件来压缩代码，我之前天真认为，压缩代码应该就是把html标签直接的中的空白(空白符，空白行)删除掉而已。但是，我今天发现用来播放音频的javascript代码有点奇怪，奇怪在和我之前写的不一样，经过压缩后，代码变精简了。
压缩之前的js代码为：
```html
<script>
    function paly_audio0() {
        //找到音频
        var audio0 = document.getElementById("audio0");
        if (audio0 != null) {
            audio0.play();
        }
    }
</script>
```
压缩后的代码为：
```html
<script>function paly_audio0(){var a=document.getElementById("audio0");null!=a&&a.play()}</script>
```
为了看清楚点,格式化一下:
```html
<script>
function paly_audio0()
{ 
    var a = document.getElementById("audio0");
    null != a && a.play();
}
</script>
```
可以看到空白符,换行符,注释都被删除掉的了，神奇的是但是代码也变了，if语句消失了！嗯，很棒，逻辑没变。代码精简了。
## 原理 ##
这是因为逻辑与(`表达式1&&表达式2`)有`短路`的功能，当前一个表达式为假的话，整个表达式的结果也就是假的了，程序不会就再去判断后面的表达式了。而是直接执行下一条语句,或者后面的表达式被`短路`掉了。
