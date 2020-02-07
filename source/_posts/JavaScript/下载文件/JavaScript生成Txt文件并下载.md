---
title: JavaScript生成Txt文件并下载
categories: 
  - JavaScript
  - 下载文件
date: 2019-12-08 22:39:01
updated: 2019-12-17 05:18:52
abbrlink: 4c49ec32
---
<div id='my_toc'><a href="/blog/4c49ec32/#JS代码" class="header_1">JS代码</a>&nbsp;<br><a href="/blog/4c49ec32/#示例" class="header_1">示例</a>&nbsp;<br><a href="/blog/4c49ec32/#效果" class="header_1">效果</a>&nbsp;<br><a href="/blog/4c49ec32/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# JS代码
```javascript
// 启动浏览器下载,文件名为filename,文件内容text中的内容
function download(filename, text) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);
    element.style.display = 'none';
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
}
```
# 示例
```html
<button onclick="download('helloworld.txt','HelloWorld')">下载</button>
<script>
// 启动浏览器下载,文件名为filename,文件内容text中的内容
function download(filename, text) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);
    element.style.display = 'none';
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
}
</script>
```
# 效果
点击如下的**下载按钮**会下载**helloworld.txt**到**浏览器中设置的下载位置**.

<button onclick="download('helloworld.txt','HelloWorld')">下载</button>
<script>
// 启动浏览器下载,文件名为filename,文件内容text中的内容
function download(filename, text) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);
    element.style.display = 'none';
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
}
</script>

# 参考资料
[https://www.jianshu.com/p/e856f564e44c](https://www.jianshu.com/p/e856f564e44c)
