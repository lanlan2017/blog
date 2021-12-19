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
