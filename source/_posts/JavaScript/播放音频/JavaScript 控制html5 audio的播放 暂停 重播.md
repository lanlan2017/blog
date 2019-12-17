---
title: JavaScript 控制html5 audio的播放 暂停 重播
categories: 
  - JavaScript
  - 播放音频
date: 2019-04-27 11:27:54
updated: 2019-12-15 10:01:44
abbrlink: ff5ef3ed
---
<div id='my_toc'><a href="/blog/ff5ef3ed/#实例代码" class="header_2">实例代码</a><br><a href="/blog/ff5ef3ed/#压缩的代码" class="header_2">压缩的代码</a><br><a href="/blog/ff5ef3ed/#运行效果" class="header_2">运行效果</a><br><a href="/blog/ff5ef3ed/#参考资料" class="header_2">参考资料</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 实例代码 ##
```html
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>javascript audio 播放 暂停 重播Demo</title>
</head>
<body> 
    <audio src="http://audio.xmcdn.com/group58/M07/C0/DC/wKgLglzBws3ydc59AAQFZSpj3Eo398.m4a" controls="controls" preload id="music1"
        hidden></audio>
    <input type="button" value="播放" id=play_stop onclick="playOrPause();">
    <input type="button" value="重播" id="replay" onclick="replay();">
    <script>
        //重新播放
        function replay() {
            var audio = document.getElementById('music1');
            audio.currentTime = 0;
            //不管是否播放或者暂停都直接播放
            audio.play();
        }
        //播放或者暂停
        function playOrPause() {
            var audio = document.getElementById('music1');
            var play_stop=document.getElementById('play_stop');
            if (audio !== null) {
                //检测播放是否已暂停
                //audio.paused在播放器播放时返回false.
                //如果已经暂停了,那就播放
                if (audio.paused) {
                    play_stop.value="暂停";
                    //这个就是播放
                    audio.play();
                } else {
                    //如果已经播放了,那就暂停
                    play_stop.value="播放";
                    audio.pause();// 这个就是暂停
                }
            }
        }
    </script>
</body>
</html>
```
## 压缩的代码 ##
```html
<audio src="http://audio.xmcdn.com/group58/M07/C0/DC/wKgLglzBws3ydc59AAQFZSpj3Eo398.m4a" controls="controls" preload id="m" hidden></audio><input type="button" value="播放" id=p_s onclick="ps();"><input type="button" value="重播" id="rp" onclick="rp();">
<script>
function rp(){var a = document.getElementById('m'); a.currentTime = 0; a.play();}
function ps() {var a = document.getElementById('m');var p_s=document.getElementById('p_s');if (a !== null) {if (a.paused) {p_s.value="暂停";a.play();} else {p_s.value="播放";a.pause();}}}
</script>
```
## 运行效果 ##

<audio src="http://audio.xmcdn.com/group58/M07/C0/DC/wKgLglzBws3ydc59AAQFZSpj3Eo398.m4a" controls="controls" preload id="m" hidden></audio><input type="button" value="播放" id=p_s onclick="ps();"><input type="button" value="重播" id="rp" onclick="rp();">
<script>
function rp(){var a = document.getElementById('m'); a.currentTime = 0; a.play();}
function ps() {var a = document.getElementById('m');var p_s=document.getElementById('p_s');if (a !== null) {if (a.paused) {p_s.value="暂停";a.play();} else {p_s.value="播放";a.pause();}}}
</script>

## 参考资料 ##
[https://www.cnblogs.com/kingplus/p/5587441.html](https://www.cnblogs.com/kingplus/p/5587441.html)
