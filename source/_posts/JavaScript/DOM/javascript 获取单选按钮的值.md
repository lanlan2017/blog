---
title: javascript 获取单选按钮的值
categories: 
  - JavaScript
  - DOM
date: 2019-03-18 16:14:30
updated: 2019-12-09 19:45:22
abbrlink: 4f225713
---
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

