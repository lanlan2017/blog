---
title: JavaScript生成Txt文件并下载
categories: 
  - 编程
  - JavaScript
  - 下载文件
date: 2019-12-08 22:39:01
updated: 2020-04-11 09:21:19
abbrlink: 4c49ec32
---
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
