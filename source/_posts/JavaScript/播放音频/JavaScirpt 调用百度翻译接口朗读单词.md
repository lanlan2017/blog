---
title: JavaScirpt 调用百度翻译接口朗读单词
categories: 
  - JavaScript
  - 播放音频
date: 2019-12-11 16:47:26
updated: 2019-12-17 05:17:09
abbrlink: 9c369915
---
<div id='my_toc'><a href="/blog/9c369915/#百度翻译音频的下载链接格式" class="header_1">百度翻译音频的下载链接格式</a><br><a href="/blog/9c369915/#示例" class="header_1">示例</a><br><a href="/blog/9c369915/#升级" class="header_1">升级</a><br><a href="/blog/9c369915/#示例" class="header_2">示例</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 百度翻译音频的下载链接格式
```
http://fanyi.baidu.com/gettts?lan=en&text=单词&spd=5&source=web
```
其中spd表示速度,数值越大朗读越快.
# 示例
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

# 升级
为了使用方便,我封装成如下JS方法:
```javascript
function sst(text) {
    // 创建<audio></audio>元素
    var audio = document.createElement("audio");
    // 设置音频地址
    audio.src = "http://fanyi.baidu.com/gettts?lan=en&text=" + text + "&spd=5&source=web";
    // audio.src = "http://fanyi.baidu.com/gettts?lan=en&text=omega&spd=5&source=web";
    // 添加到body元素中
    document.body.appendChild(audio);
    console.log(audio.src);
    audio.loop = false;
    // 播放
    audio.play();
    // 监听播放结束
    audio.addEventListener('ended', function () {
        // alert('play ended');
        // 从body元素中移除掉,以便下次使用
        document.body.removeChild(audio);
    }, false);
}
```
## 示例
```html
<button onclick="sst('omega')">omega</button><button onclick="sst('audio')">audio</button>
<script>
    function sst(text) {
        // 创建<audio></audio>元素
        var audio = document.createElement("audio");
        // 设置音频地址
        audio.src = "http://fanyi.baidu.com/gettts?lan=en&text=" + text + "&spd=5&source=web";
        // audio.src = "http://fanyi.baidu.com/gettts?lan=en&text=omega&spd=5&source=web";
        // 添加到body元素中
        document.body.appendChild(audio);
        // console.log(audio.src);
        audio.loop = false;
        // 播放
        audio.play();
        // 监听播放结束
        audio.addEventListener('ended', function () {
            // alert('play ended');
            // 从body元素中移除掉,以便下次使用
            document.body.removeChild(audio);
        }, false);
    }
</script>
```

<button onclick="sst('omega')">omega</button><button onclick="sst('audio')">audio</button>
<script>
    function sst(text) {
        var audio = document.createElement("audio");
        audio.src = "http://fanyi.baidu.com/gettts?lan=en&text=" + text + "&spd=5&source=web";
        document.body.appendChild(audio);
        audio.loop = false;
        audio.play();
        audio.addEventListener('ended', function () {
            document.body.removeChild(audio);
        }, false);
    }
</script>
