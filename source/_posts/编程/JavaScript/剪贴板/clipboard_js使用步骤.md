---
title: clipboard_js使用步骤
categories: 
  - JavaScript
  - 剪贴板
abbrlink: c78d87f4
date: 2019-02-13 00:16:32
updated: 2022-04-04 00:51:45
---
# 使用步骤
使用`clipboard.js`来可分为以下三个步骤：
- 定义相关的html标签
- 引入clisboard.js库，引入方式：
    - 可以使用CDN:
        - 到这里选择一个CDN:[https://github.com/zenorocha/clipboard.js/wiki/CDN-Providers](https://github.com/zenorocha/clipboard.js/wiki/CDN-Providers)
    - 也可以先下载到本地，然后引入本地。
    - 下载可以：
        - 直接下载压缩包[download a ZIP ](https://github.com/zenorocha/clipboard.js/archive/master.zip)，
        - 或者使用npm方式安装：`npm install clipboard --save`
- 实例化ClipboardJS对象
    - 实例化之后可以加上监听复制成功或失败。以便给用户一些提示信息。

# 属性说明
- data-clipboard-text：复制的静态内容
- data-clipboard-target：设置为其他元素的选择器，将复制该选择器中元素的内容
- data-clipboard-action: 复制的方式，
    - data-clipboard-action="copy" ：复制方式。默认
    - data-clipboard-action="cut": 剪切方式。

# 使用实例
使用的区别主要在引入方式和ClipboardJS对象的实例化上。

## 使用HTML DOM选择器实例化
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>constructor-selector</title>
</head>
<body>
    <!-- 1.定义一些标签 -->
    <button class="btn" data-clipboard-text='静态文本1'>Copy</button>
    <button class="btn" data-clipboard-text='静态文本2'>Copy</button>
    <button class="btn" data-clipboard-text='静态文本3'>Copy</button>
    <!-- 2. 导入clipboard.min.js -->
    <!-- 通过cdn导入 -->
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
    <!-- 导入本地 -->
   <!-- <script src="file:///E:\Blog\gongzuo\themes\next\source\js\src\clipboard.min.js"></script> -->
    <!-- 3. js中使用class选择器进行实例化 -->
    <script>
        //使用类选择器实例化,不可忽略
        var clipboard = new ClipboardJS('.btn');
        //监听事件给出提示,可忽略
        clipboard.on('success', function (e) {
            alert("复制成功");
        });
        clipboard.on('error', function (e) {
            alert("复制失败");
        });
    </script>
</body>
</html>
```
点击按钮会把`data-clipboard-text`这个属性的值文本复制到剪贴板中，这种方式使用无复制静态的文本。
## 使用HTML元素实例化
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>constructor-node</title>
</head>
<body>
    <!-- 1. Define some markup -->
    <div id="btn" data-clipboard-text='静态文本'>
        <span>Copy</span>
    </div>
    <!-- 2. Include library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>
    <!-- 3. Instantiate clipboard by passing a HTML element -->
    <script>
    var btn = document.getElementById('btn');
    var clipboard = new ClipboardJS(btn);
    clipboard.on('success', function(e) {
        console.log(e);
    });
    clipboard.on('error', function(e) {
        console.log(e);
    });
    </script>
</body>
</html>
```

## 使用html元素列表实例化
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>constructor-nodelist</title>
</head>
<body>
    <!-- 1. Define some markup -->
    <button data-clipboard-text='静态文本1'>Copy</button>
    <button data-clipboard-text='静态文本2'>Copy</button>
    <button data-clipboard-text='静态文本3'>Copy</button>
    <!-- 2. Include library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>
    <!-- 3. Instantiate clipboard by passing a list of HTML elements -->
    <script>
        //使用标签选择器获取列表
        var btns = document.querySelectorAll('button');
        var clipboard = new ClipboardJS(btns);
        clipboard.on('success', function (e) {
            alert("复制成功");
        });
        clipboard.on('error', function (e) {
            alert("复制失败");
        });
    </script>
</body>
</html>
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/javascript/cliborad/copyByHtmlList.png)
# 复制静态文本
上面的例子都是复制按钮自己属性中的静态文本中。但是如果想要点击按钮，复制文本框中的内容则不能这么写：
# 复制其他元素的内容
## 复制一个内容
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>constructor-selector</title>
</head>
<body>
    <!-- 1.定义输入框 -->
    <input type="text"  id="input">
    <!-- 2. 使用data-clipboard-target属性指定从文本框中复制 -->
    <button class="btn" data-clipboard-target="#input">Copy</button>
    <!-- 3. 导入clipboard.min.js -->
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
    <!-- 4. js中使用class选择器进行实例化 -->
    <script>
        //使用类选择器实例化,不可忽略
        var clipboard = new ClipboardJS('.btn');
        //监听事件给出提示,可忽略
        clipboard.on('success', function (e) {
            alert("复制成功");
        });
        clipboard.on('error', function (e) {
            alert("复制失败");
        });
    </script>
</body>
</html>
```
效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/javascript/cliborad/copyOther.png)
这里的按钮称为`触发元素`，被复制的元素称为目标元素。此时**data-clipboard-target的值为目标元素(文本框)的选择器**，**而data-clipboard-target的属性被设置在触发元素(按钮)**上
可以发现，复制完毕后文本框中的文本处于选中状态，可以使用` e.clearSelection();`方法取消选中状态。
```html
<script>
    //使用类选择器实例化,不可忽略
    var clipboard = new ClipboardJS('.btn');
    //监听事件给出提示,可忽略
    clipboard.on('success', function (e) {
        //取消选中状态
        e.clearSelection();
        alert("复制成功");
    });
    clipboard.on('error', function (e) {
        //取消选中状态
        e.clearSelection();
        alert("复制失败");
    });
</script>
```
这种方式，文本框中输入什么，就复制什么。复制的内容可以是动态的，目标元素的值发生变化，复制的值也发生变化。适用于，复制内容不固定的情况。
## 复制多个内容的情况
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>constructor-selector</title>
</head>
<body>
    <!-- 1.定义输入框 -->
    <textarea rows="1" cols="50" id="input-1" readonly>
文本框1
</textarea>
    <!-- 2. 使用data-clipboard-target属性指定从文本框中复制 -->
    <button class="btn" data-clipboard-target="#input-1">input-1</button>
    <br>
    <textarea rows="1" cols="50" id="input-2" readonly>
文本框2
</textarea>
    <button class="btn" data-clipboard-target="#input-2">input-2</button>
    <br>
    <textarea rows="1" cols="50" id="input-3" readonly>
文本框3
</textarea>
    <button class="btn" data-clipboard-target="#input-3">input-3</button>
    <br>
    <!-- 3. 导入clipboard.min.js -->
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
    <!-- 4. js中使用class选择器进行实例化 -->
    <script>
        //使用类选择器实例化,不可忽略
        var clipboard = new ClipboardJS('.btn');
        //监听事件给出提示,可忽略
        clipboard.on('success', function (e) {
            alert("复制成功");
        });
        clipboard.on('error', function (e) {
            alert("复制失败");
        });
    </script>
</body>
</html>
```

# 剪切方式
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>constructor-selector</title>
</head>
<body>
    <!-- 1.定义输入框 -->
    <input type="text"  id="input">
    <!-- 2. 使用data-clipboard-target属性指定从文本框中复制 -->
    <button class="btn" data-clipboard-target="#input">Copy</button>
    <button class="btn" data-clipboard-action="cut" data-clipboard-target="#input">cut</button>
    <!-- 3. 导入clipboard.min.js -->
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
    <!-- 4. js中使用class选择器进行实例化 -->
    <script>
        //使用类选择器实例化,不可忽略
        var clipboard = new ClipboardJS('.btn');
        //监听事件给出提示,可忽略
        clipboard.on('success', function (e) {
            //取消选中状态
            e.clearSelection();
            alert("复制成功");
        });
        clipboard.on('error', function (e) {
            //取消选中状态
            e.clearSelection();
            alert("复制失败");
        });
    </script>
</body>
</html>
```
# 参考链接
官网文档：[https://clipboardjs.com/](https://clipboardjs.com/)
使用HTML DOM选择器实例化：[https://github.com/zenorocha/clipboard.js/blob/master/demo/constructor-selector.html#L18](https://github.com/zenorocha/clipboard.js/blob/master/demo/constructor-selector.html#L18)
使用使用HTML元素实例化：[https://github.com/zenorocha/clipboard.js/blob/master/demo/constructor-node.html#L16-L17](https://github.com/zenorocha/clipboard.js/blob/master/demo/constructor-node.html#L16-L17)
使用html元素列表实例化：[https://github.com/zenorocha/clipboard.js/blob/master/demo/constructor-nodelist.html#L18-L19](https://github.com/zenorocha/clipboard.js/blob/master/demo/constructor-nodelist.html#L18-L19)
[https://www.jb51.net/article/125914.htm](https://www.jb51.net/article/125914.htm)
[https://www.cnblogs.com/yunser/p/7628031.html](https://www.cnblogs.com/yunser/p/7628031.html)
