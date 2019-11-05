---
title: JavaScript 控制html5 audio的播放 暂停 重播
categories: 
  - JavaScript
  - 播放音频
date: 2019-04-27 11:27:54
updated: 2019-11-04 17:02:02
abbrlink: ff5ef3ed
---
- [实例代码](/blog/ff5ef3ed/#实例代码)
- [压缩的代码](/blog/ff5ef3ed/#压缩的代码)
- [运行效果](/blog/ff5ef3ed/#运行效果)
- [参考资料](/blog/ff5ef3ed/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

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

>原文链接: [JavaScript 控制html5 audio的播放 暂停 重播](https://lanlan2017.github.io/blog/ff5ef3ed/)
