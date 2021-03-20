---
title: java字符串数组去重复
categories: 
  - 编程
  - Java
  - 字符串处理
date: 2021-03-20 04:55:35
updated: 2021-03-20 08:53:10
abbrlink: 87cde06d
---
<div id='my_toc'><a href="/blog/87cde06d/#java字符串数组去重复-算法描述" class="header_1">java字符串数组去重复 算法描述</a>&nbsp;<br><a href="/blog/87cde06d/#实现方式" class="header_1">实现方式</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# java字符串数组去重复 算法描述
依次从原来的数组中取出元素，放入到缓存数组中。
每次放入之前先在缓存数组中查找该元素，如果缓存数组中已经有该元素了，就不放入缓存数组，如果没有，则放入缓存数组中。
# 实现方式
创建list集合，每次放入之前先在list里面查找，list里面没有则放入。
利用Set集合不能放入重复的元素的特性，直接放入Set集合。
