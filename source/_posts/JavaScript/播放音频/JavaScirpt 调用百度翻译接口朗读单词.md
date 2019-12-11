---
title: JavaScirpt 调用百度翻译接口朗读单词
categories: 
  - JavaScript
  - 播放音频
date: 2019-12-11 16:47:26
updated: 2019-12-11 16:51:22
abbrlink: 9c369915
---
<div id='my_toc'><a href="/blog/9c369915/#百度翻译音频的下载链接格式">百度翻译音频的下载链接格式</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/9c369915/#示例">示例</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 百度翻译音频的下载链接格式
```
http://fanyi.baidu.com/gettts?lan=en&text=单词&spd=5&source=web
```
其中spd表示速度,数值越大朗读越快.
## 示例
```html
点击播放(omega):<i class="fa fa-play" aria-hidden="true" onclick="play('audioID5JswJWS3')"></i>

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=omega&spd=5&source=web" id="audioID5JswJWS3"></audio>
<script>
  function play(id){
    if(id!=null){
    var audio=document.getElementById(id);audio.play();
    }
  }
</script>
```
点击播放(omega):<i class="fa fa-play" aria-hidden="true" onclick="play('audioID5JswJWS3')"></i>

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=omega&spd=5&source=web" id="audioID5JswJWS3"></audio>
<script>
  function play(id){
    if(id!=null){
    var audio=document.getElementById(id);audio.play();
    }
  }
</script>
