---
title: JavaScript innerText与innerHtml与value的区别
categories: 
  - JavaScript
  - DOM
date: 2019-02-13 00:12:44
updated: 2019-12-09 19:45:22
abbrlink: 37c4f730
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/37c4f730/#JavaScript-innerText与innerHtml与value的区别">JavaScript innerText与innerHtml与value的区别</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/37c4f730/#实例">实例</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/37c4f730/#参考链接">参考链接</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## JavaScript innerText与innerHtml与value的区别 ##
- `innerHtml`是标签内的文本,`输入输出到该DOM内部纯HTML代码`，也就是说使用innerHTML,可以在标签里面添加html代码  也就是设置一个元素里面的HTML代码;
- `innerText`是id为object的闭合标签内的文本,`输入输出的是转义文本(字符串)`。也就是说使用innerText可在控件中添加文本，或者读入文本。
- `value`是`**表单元素特有**的属性`,`输入输出的是转义文本(字符串)`;**非表单元素没有value属性**，如div，span等；value在不同表单元素里有不同的意义，如button中为按钮中的文本，input（text）为默认文本，textarea为默认文本。

所以**操作`表单元素`的`文本内容`用value**；而`innerHTML`与`innerText`用于操作非表单元素的内容或文本内容。


## 实例 ##
```html
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <center>
        <!-- 没有value属性 -->
        <div id="20181126161922">
            <h3>123</h3>
        </div>
        <input type="button" onclick="setID20181126161922()" value="showDIV">
    </center>
    <script>
        // id="20181126161922" onclick="setID20181126161922()"
        function setID20181126161922() {
            var id = document.getElementById("20181126161922");
            var str = "innerHTML:" + id.innerHTML +
                "\ninnerText:" + id.innerText +
                "\nvalue:" + id.value;
            alert(str);
        }
    </script>
</body>
</html>
```
**运行结果**
```
innerHTML:
            <h3>123</h3>
innerText:123
value:undefined
```
div中时没有value属性的，所以这里返回的是`undefined`

## 参考链接 ##
[https://m.baidu.com/mip/c/www.360doc.cn/mip/564782394.html](https://m.baidu.com/mip/c/www.360doc.cn/mip/564782394.html)
[https://blog.csdn.net/qq_30567891/article/details/60466455](https://blog.csdn.net/qq_30567891/article/details/60466455)
[http://www.cnblogs.com/zhang-jiao/p/9589967.html](http://www.cnblogs.com/zhang-jiao/p/9589967.html)
[https://www.jianshu.com/p/2f7942af4acb?utm_campaign=haruki&utm_content=note&utm_medium=reader_share&utm_source=qq](https://www.jianshu.com/p/2f7942af4acb?utm_campaign=haruki&utm_content=note&utm_medium=reader_share&utm_source=qq)
>原文链接: [JavaScript innerText与innerHtml与value的区别](https://lanlan2017.github.io/blog/37c4f730/)
