---
title: eclipse 按下syso没有自动提示
categories: 
  - Java
  - IDE
  - eclipse
date: 2019-04-23 21:49:49
updated: 2019-11-14 11:39:27
abbrlink: 3c99547f
---
<div id='my_toc'>

- [问题描述](/blog/3c99547f/#问题描述)
- [原因](/blog/3c99547f/#原因)
- [步骤](/blog/3c99547f/#步骤)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 问题描述 ##
在`eclipse`中按下`syso`时,没有出现`System.out.println()`的自动提示,按下`alt+/`也没有出现自动提示.
## 原因 ##
这是因为没有开启`Template Proposals`(模板建议)引起的,勾选上这个功能就行了。
## 步骤 ##
在`eclipse`中依次点击`Window->Preferences->Java->Editor->Content Assist->Advanced`,然后勾选上右边方框中的`Template Proposals`,最后点击`Apply and Close`即可,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/CanNotSYSO/1.png)

>原文链接: [eclipse 按下syso没有自动提示](https://lanlan2017.github.io/blog/3c99547f/)
