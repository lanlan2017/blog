---
title: java中BufferedImage类的用法
categories: 
  - Java
  - java GUI
  - java 图片操作
date: 2018-10-22 08:37:16
updated: 2019-12-17 05:17:09
abbrlink: d819de9c
---
<div id='my_toc'></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
首先必须明确的是：**要想操作一张图片，首先必须将其从磁盘加载到内存中，然后才能对图片做进一步的处理**。
**继承关系**
```
java.lang.Object
    |----> java.awt.Image
        |----> java.awt.image.BufferedImage
```

BufferedImage是Image的一个子类，Image和BufferedImage的主要作用就是将一副图片加载到内存中。BufferedImage生成的图片在内存里有一个图像缓冲区，利用这个缓冲区我们可以很方便的操作这个图片，通常用来做图片修改操作如大小变换、图片变灰、设置图片透明或不透明等。Java将一副图片加载到内存中的方法是：
1
    
BufferedImage bufferedImage = ImageIO.read(new FileInputStream(filePath));  
