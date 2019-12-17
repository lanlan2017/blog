---
title: 正则实例：markdown文档中给HTML标记加反引号
categories: 
  - 正则表达式
  - 实例
  - 匹配HTML标签
date: 2018-09-27 22:00:53
updated: 2019-12-15 08:49:18
abbrlink: de8eb4f9
---
<div id='my_toc'></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
写到HTML这章的时候，在Markdown中添加了好多html标记，这样会引起文章渲染乱码。所以需要都让对一些HTML标记进行"转义"。我这里的做法是，使用反引号把HTML标记包裹起来。如下所示:
```
`<h1>`
```
这样渲染的时候就以代码的方式渲染，而不是渲染为HTML标记。我写文章用的是MarkdownPad2,因为MarkdownPad2的快捷键很好用。不过MarkdownPad2好像只支持正则表达查找，不能替换，更不支持正则表达式替换。后来发现**NotePad++支持正则表达式替换**。
所以，就用**NotePad++来完成正则表达式替换功能**。

匹配HTML标签的正则表达式:`(</?[a-zA_Z]*>)`。
在这个HTML标签两边加上反引号"转义"：
```
`\1`
```
这里使用括号捕获这个HTML标签。然后使用反向引用`\1`即可引用到这个刚匹配的文本，用反引号包裹起来，替换掉原来的文本即可实现我的要求。
具体设置如下图所示:
[https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java%20Web%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A/2/Notepad%2B%2B%E6%AD%A3%E5%88%99%E6%9B%BF%E6%8D%A2.png](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java%20Web%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A/2/Notepad%2B%2B%E6%AD%A3%E5%88%99%E6%9B%BF%E6%8D%A2.png)
最后，说一下，NotePad++打开替换的快捷键是:`ctrl+H`。当然，这个正则表达式并不严谨，但是对我来说已经够用了。
