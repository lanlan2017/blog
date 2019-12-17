---
title: eclipse导入SpringMVC项目报错
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-05-14 22:21:07
updated: 2019-12-17 05:17:08
abbrlink: ced29b25
---
<div id='my_toc'><a href="/blog/ced29b25/#问题描述" class="header_1">问题描述</a><br><a href="/blog/ced29b25/#修改JRE版本" class="header_1">修改JRE版本</a><br><a href="/blog/ced29b25/#修改Spring-MVC配置文件的第一行" class="header_1">修改Spring MVC配置文件的第一行</a><br><a href="/blog/ced29b25/#解决方案" class="header_2">解决方案</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述 #
最近在看《Spring MVC+Mybatis企业项目实战(第2版)》这本书,但是,随书源码导入eclipse的时候总是会报错.下面来介绍怎么解决eclipse导入Spring MVC项目报错的问题。
# 修改JRE版本 #
# 修改Spring MVC配置文件的第一行 #
Spring MVC的配置文件的第一行是一个<beans>标签,里面有各种声明,报错的地方也是这个.如下图所示:
## 解决方案 ##
重新创建一个Spring MVC的配置文件,命名为`springmvc-config2.xml`,这个文件的文件名比原来的`springmvc-config.xml`多个一个`2`,如下图所示：
然后复制原来配置文件中<beans>标签之中的所有内容,粘贴到刚才新建的配置文件之中.如下图所示.
然后删除原来的配置文件。
然后把新的文件重命名为原来的文件.
最后引入声明即可.
