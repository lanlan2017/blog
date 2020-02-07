---
title: hexo博客中 使用javascirpt和jqurey播放audio
categories: 
  - HTML
  - 音视频
date: 2019-02-13 00:24:14
updated: 2019-12-17 05:18:52
abbrlink: 4f1b06ea
---
<div id='my_toc'><a href="/blog/4f1b06ea/#前言" class="header_2">前言</a>&nbsp;<br><a href="/blog/4f1b06ea/#方式0-使用原生的audio播放音频" class="header_2">方式0 使用原生的audio播放音频</a>&nbsp;<br><a href="/blog/4f1b06ea/#方式1-使用javascript播放音频" class="header_2">方式1 使用javascript播放音频</a>&nbsp;<br><a href="/blog/4f1b06ea/#方式2-使用javascript播放音频-简写" class="header_2">方式2 使用javascript播放音频 简写</a>&nbsp;<br><a href="/blog/4f1b06ea/#方式2-使用jquery播放音频" class="header_2">方式2 使用jquery播放音频</a>&nbsp;<br><a href="/blog/4f1b06ea/#总结" class="header_2">总结</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 前言 ##
markdown中可以插入html标签，所以可以插入audio标签来播放音频。
## 方式0 使用原生的audio播放音频 ##
```html
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=focus&spd=5&source=web" controls="controls"></audio>
```
显示效果：
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=focus&spd=5&source=web" controls="controls"></audio>

但是原生的audio标签控件太大了，占用文章太多空间,在电脑端，看起来还勉强凑合，但是在手机端的原生的audio控件会超出屏幕之外很不美观。所以我想着不用原生的audio,而是使用其他方式来打开音频。
## 方式1 使用javascript播放音频 ##
```html
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=document&spd=3&source=web" id="audio0"></audio>
<input type="button" onclick="paly_audio0();" value="使用JS播放" />
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
显示效果：

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=document&spd=3&source=web" id="audio0"></audio>
<input type="button" onclick="paly_audio0();" value="使用JS播放" />
<script>
    function paly_audio0() {
        //找到音频
        var audio0 = document.getElementById("audio0");
        if (audio0 != null) {
            audio0.play();
        }
    }
</script>

## 方式2 使用javascript播放音频 简写 ##
```html
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=hello world&spd=3&source=web"  id="audio1"></audio>
<input type="button" onclick="document.getElementById('audio1').play();" value="播放"/>
```
这种方式，直接写在html中是可以播放的，但是写到在这里hexo 无法渲染。我用的是next主题，也不知道是hexo的原因，还是next主题的原因 。总之不要在文章中使用这种简写的方式就行了。

## 方式2 使用jquery播放音频 ##
跟使用javascript方式，也可以使用jquery来播放：
```html
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=document&spd=3&source=web" id="documentAudio"></audio>
<input type="button" id="documentPlay" value="播放document" />
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>
    $('#documentPlay').click(function () {
        //找到音频
        var documentAudio = document.getElementById('documentAudio');
        if (documentAudio != null) {
            documentAudio.play();
        }
    })
</script>
```
效果如下：

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=document&spd=3&source=web" id="documentAudio"></audio>
<input type="button" id="documentPlay" value="播放document" />
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>
    $('#documentPlay').click(function () {
        //找到音频
        var documentAudio = document.getElementById('documentAudio');
        if (documentAudio != null) {
            documentAudio.play();
        }
    })
</script>

## 总结 ##
还是直接使用javascript来播放音频的好，这样还少几行代码，也不用引入jqurey库。
