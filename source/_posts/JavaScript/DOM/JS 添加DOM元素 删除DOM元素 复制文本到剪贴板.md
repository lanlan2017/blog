---
title: JS 添加DOM元素 删除DOM元素 复制文本到剪贴板
categories: 
  - JavaScript
  - DOM
date: 2019-11-28 15:26:51
updated: 2019-11-28 16:03:20
abbrlink: aee7c65a
---
<div id='my_toc'>

- [JS 添加DOM元素 删除DOM元素](/blog/aee7c65a/#JS-添加DOM元素-删除DOM元素)
    - [创建一个DOM对象](/blog/aee7c65a/#创建一个DOM对象)
    - [DOM对象添加一个子DOM](/blog/aee7c65a/#DOM对象添加一个子DOM)
    - [DOM删除一个子DOM](/blog/aee7c65a/#DOM删除一个子DOM)
    - [JS 复制到系统剪贴板](/blog/aee7c65a/#JS-复制到系统剪贴板)
    - [完整例子](/blog/aee7c65a/#完整例子)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# JS 添加DOM元素 删除DOM元素 #
## 创建一个DOM对象 ##
```javascript
document.createElement("标签名");
```
## DOM对象添加一个子DOM ##
```javascript
dom.appendChild(subDOM);
```
例如:
```javascript
function add() {
    var bodyDom = document.body;
    var inputText = document.createElement("input");
    inputText.value = '内容';
    inputText.id = 'generatedDom';
    bodyDom.appendChild(inputText);
}
```
## DOM删除一个子DOM ##
格式:
```javascript
dom.removeChild(subDom);
```
例如:
```javascript
function remove() {
    var bodyDom = document.body;
    var inputText = document.getElementById("generatedDom");
    bodyDom.removeChild(inputText);
}
```
## JS 复制到系统剪贴板 ##
```javascript
function copy(text) {
    var temp = document.createElement("textarea");
    temp.value = text;
    document.body.appendChild(temp);
    temp.select();
    alert('打断,看效果');
    document.execCommand('copy');
    document.body.removeChild(temp);
}
```
## 完整例子 ##
```html
<html>

<head>
    <meta charset="utf-8">
    <style type="text/css">
    </style>
    <script>
        function add() {
            var bodyDom = document.body;
            var inputText = document.createElement("input");
            inputText.value = '内容';
            inputText.id = 'generatedDom';
            bodyDom.appendChild(inputText);
        }

        function remove() {
            var bodyDom = document.body;
            var inputText = document.getElementById("generatedDom");
            bodyDom.removeChild(inputText);
        }

        function copy(text) {
            var temp = document.createElement("textarea");
            temp.value = text;
            document.body.appendChild(temp);
            temp.select();
            alert('打断,看效果');
            document.execCommand('copy');
            document.body.removeChild(temp);
        }
    </script>
</head>

<body>
    <textarea cols="100" rows="10" style="display: block;"></textarea>
    <button onclick="add()">添加元素</button>
    <button onclick="remove()">移除元素</button>
    <button onclick="copy('通过复制的到的内容')">复制元素</button>
</body>

</html>
```
