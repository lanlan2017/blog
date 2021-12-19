---
title: JS动态加载JS文件
categories: 
  - 编程
  - JavaScript
  - DOM
date: 2019-12-10 11:19:12
updated: 2020-04-11 09:21:19
abbrlink: 61c2129d
---
# 直接document.write
```html
<script language="javascript">
    document.write("<script src='test.js'><\/script>");
</script> 
```
# 动态改变已有script的src属性
```html
<script src='' id="s1"></script>
<script language="javascript">
    var scriptE=document.getElementById("s1");
    scriptE.src="test.js"
</script>
```
# 动态创建script元素
```html
<script>
    var headDom = document.getElementsByTagName('HEAD').item(0);
    var scriptDom= document.createElement("script");
    scriptDom.type = "text/javascript";
    scriptDom.src="test.js";
    headDom.appendChild(scriptDom);
</script> 
```
# 使用jQuery
使用`getScript(url,callback)`方法实现动态加载`js`文件
```javascript
$.getScript('test.js',function(){
    alert('done');
});
```
# 参考资料
[https://www.jb51.net/article/17992.htm](https://www.jb51.net/article/17992.htm)
[https://www.jb51.net/article/139481.htm](https://www.jb51.net/article/139481.htm)
