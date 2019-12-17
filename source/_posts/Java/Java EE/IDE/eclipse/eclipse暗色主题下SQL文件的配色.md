---
title: eclipse暗色主题下SQL文件的配色
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-06-14 10:07:26
updated: 2019-12-16 02:39:07
abbrlink: 7198198c
---
<div id='my_toc'><a href="/blog/7198198c/#eclipse暗色主题下SQL文件的配色" class="header_1">eclipse暗色主题下SQL文件的配色</a><br><a href="/blog/7198198c/#问题描述" class="header_2">问题描述</a><br><a href="/blog/7198198c/#修改eclipse-sql文件代码配色" class="header_2">修改eclipse sql文件代码配色</a><br><a href="/blog/7198198c/#eclipse其他代码配色" class="header_2">eclipse其他代码配色</a><br></div>
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
# eclipse暗色主题下SQL文件的配色 #
## 问题描述 ##
`eclipse`的暗色主题下的`SQL`配色有问题,**代码颜色和背景色对比不明显**,看起来费神.如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/CodeColor/1.png)
## 修改eclipse sql文件代码配色 ##
`windows->Preferences`,然后在搜索框中输入`Syntax Colorin`,然后选择`Data Management->SQL Editor->Syntax Coloring`：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/CodeColor/2.png)
然后在右边`Syntax items`选择框中选择要修改的类型和`Color`选择框中选择对应的配色即可.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/CodeColor/4.png)
## eclipse其他代码配色 ##
同理:`windows->Preferences`,然后在搜索框中输入`Syntax Colorin`,然后选择对个的代码高亮设置即可.
