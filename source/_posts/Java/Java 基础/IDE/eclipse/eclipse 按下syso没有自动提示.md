---
title: eclipse 按下syso没有自动提示
categories: 
  - Java
  - Java 基础
  - IDE
  - eclipse
date: 2019-04-23 21:49:49
updated: 2019-12-16 02:40:41
abbrlink: 3c99547f
---
<div id='my_toc'><a href="/blog/3c99547f/#问题描述" class="header_2">问题描述</a><br><a href="/blog/3c99547f/#原因" class="header_2">原因</a><br><a href="/blog/3c99547f/#步骤" class="header_2">步骤</a><br></div>
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
## 问题描述 ##
在`eclipse`中按下`syso`时,没有出现`System.out.println()`的自动提示,按下`alt+/`也没有出现自动提示.
## 原因 ##
这是因为没有开启`Template Proposals`(模板建议)引起的,勾选上这个功能就行了。
## 步骤 ##
在`eclipse`中依次点击`Window->Preferences->Java->Editor->Content Assist->Advanced`,然后勾选上右边方框中的`Template Proposals`,最后点击`Apply and Close`即可,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/CanNotSYSO/1.png)
