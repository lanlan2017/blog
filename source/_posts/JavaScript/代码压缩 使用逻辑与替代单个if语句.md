---
title: 代码压缩 使用逻辑与替代单个if语句
categories: 
  - JavaScript
date: 2018-11-22 22:32:15
updated: 2019-10-30 11:55:40
abbrlink: 4fd080c1
---
- [发现过程](/blog/html/4fd080c1/#发现过程)
- [原理](/blog/html/4fd080c1/#原理)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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

>原文链接: [代码压缩 使用逻辑与替代单个if语句](https://lanlan2017.github.io/blog/4fd080c1/)