---
title: JavaScript响应键盘事件
categories: 
  - 编程
  - JavaScript
  - 事件
abbrlink: 5b7f1159
date: 2021-03-31 11:52:45
updated: 2021-04-03 15:42:52
---
<div id='my_toc'><a href="/blog/5b7f1159/#JavaScript响应键盘事件" class="header_1">JavaScript响应键盘事件</a>&nbsp;<br><a href="/blog/5b7f1159/#监听键盘弹起事件" class="header_2">监听键盘弹起事件</a>&nbsp;<br><a href="/blog/5b7f1159/#打印keyCode" class="header_2">打印keyCode</a>&nbsp;<br><a href="/blog/5b7f1159/#使用组合键" class="header_2">使用组合键</a>&nbsp;<br><a href="/blog/5b7f1159/#响应组合键" class="header_2">响应组合键</a>&nbsp;<br><a href="/blog/5b7f1159/#JS按键和keyCode的对应关系" class="header_2">JS按键和keyCode的对应关系</a>&nbsp;<br><a href="/blog/5b7f1159/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# JavaScript响应键盘事件
## 监听键盘弹起事件
```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <style type="text/css">
    </style>
    <script>
        监听键盘按下时间
        document.onkeyup=function(){
            console.log("键盘弹起");
        };
    </script>
</head>

<body>
</body>

</html>
```
## 打印keyCode
```javascript
// 打印键盘keyCode
document.onkeyup = function (event) {
    event = event || window.event;
    console.log("键盘弹起,keyCode=" + event.keyCode);
};
// 判断是否按下了某个按键
// keyCode
```
## 使用组合键
```javascript
// a=65,n=78,z=90
document.onkeyup = function (event) {
    event = event || window.event;
    if (event.keyCode === 78 && event.ctrlKey && event.altKey) {
        console.log('您按下了:ctrl+alt' + event.keyCode);
    }
    if ( event.altKey && event.keyCode === 78) {
        console.log('您按下了:alt' + event.keyCode);
    }
};
```
## 响应组合键
```html
<script>
    document.onkeyup = function (event) {
        // alt键
        if (event.altKey) {
            switch (event.keyCode) {
                // i键的keyCode
                case 73:
                    input.focus();
                    break;
                // n键的keyCode
                case 78:
                    niuke();
                    break;
            }
        }
    }
</script>
```
## JS按键和keyCode的对应关系


# 参考资料
[https://www.bilibili.com/video/BV1cs411u7qt](https://www.bilibili.com/video/BV1cs411u7qt)
