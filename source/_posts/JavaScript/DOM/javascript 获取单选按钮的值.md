---
title: javascript 获取单选按钮的值
categories: 
  - JavaScript
  - DOM
date: 2019-03-18 16:14:30
updated: 2019-12-17 05:18:52
abbrlink: 4f225713
---
<div id='my_toc'><a href="/blog/4f225713/#测试代码" class="header_2">测试代码</a>&nbsp;<br><a href="/blog/4f225713/#运行效果" class="header_2">运行效果</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 测试代码 ##
```html
<div onchange="show();">
    <input type="radio" name="fruits" value="Apple" checked="checked" />Apple
    <br>
    <input type="radio" name="fruits" value="Banana" />Banana
    <br>
    <input type="radio" name="fruits" value="Strawberry" />Strawberry
    <br>
    <input type="radio" name="fruits" value="watermelon" />watermelon
    <br>
    <input type="text" id="show">
    <br>
</div>
<script>
    function show() {
        document.getElementById('show').value = '你选择了: ' + getRadioValueByName('fruits');
    }
    // 根据单选按钮的name属性来获取这一组单选按钮的值
    function getRadioValueByName(name) {
        var value = "";
        //某个单选按钮组
        var radio = document.getElementsByName(name);
        //遍历该组的单选按钮
        for (var i = 0; i < radio.length; i++) {
            //判断用户选了哪个按钮
            if (radio[i].checked == true) {
                //找到
                value = radio[i].value;
                //不用找了
                break;
            }
        }
        //返回选择的值
        return value;
    } 
</script>
```
## 运行效果 ##

<div onchange="show();"><input type="radio" name="fruits" value="Apple" checked="checked" />Apple<br><input type="radio" name="fruits" value="Banana" />Banana<br><input type="radio" name="fruits" value="Strawberry" />Strawberry<br><input type="radio" name="fruits" value="watermelon" />watermelon<br><input type="text" id="show"><br></div>
<script>
    function show() {
        document.getElementById('show').value = '你选择了: ' + getRadioValueByName('fruits');
    }
    function getRadioValueByName(name) {
        var value = "";
        //某个单选按钮组
        var radio = document.getElementsByName(name);
        //遍历该组的单选按钮
        for (var i = 0; i < radio.length; i++) {
            //判断用户选了哪个按钮
            if (radio[i].checked == true) {
                //找到
                value = radio[i].value;
                //不用找了
                break;
            }
        }
        //返回选择的值
        return value;
    } 
</script>

