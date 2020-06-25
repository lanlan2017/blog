---
title: windows搜狗输入法自定义短语转安卓讯飞输入法个性短语
categories: 
  - Windows
  - 软件
  - Win10设置
date: 2019-12-06 11:57:15
updated: 2020-06-25 09:02:32
abbrlink: 8da2248a
---
<div id='my_toc'><a href="/blog/8da2248a/#搜狗输入法个性短语格式" class="header_1">搜狗输入法个性短语格式</a>&nbsp;<br><a href="/blog/8da2248a/#单行格式" class="header_2">单行格式</a>&nbsp;<br><a href="/blog/8da2248a/#多行格式" class="header_2">多行格式</a>&nbsp;<br><a href="/blog/8da2248a/#讯飞输入法个性短语格式" class="header_1">讯飞输入法个性短语格式</a>&nbsp;<br><a href="/blog/8da2248a/#单行格式" class="header_2">单行格式</a>&nbsp;<br><a href="/blog/8da2248a/#搜狗输入法Windows版本个性短语转讯飞输入法安卓版个性短语" class="header_1">搜狗输入法Windows版本个性短语转讯飞输入法安卓版个性短语</a>&nbsp;<br><a href="/blog/8da2248a/#单行短语转换" class="header_2">单行短语转换</a>&nbsp;<br><a href="/blog/8da2248a/#匹配正则" class="header_3">匹配正则</a>&nbsp;<br><a href="/blog/8da2248a/#替换正则" class="header_3">替换正则</a>&nbsp;<br><a href="/blog/8da2248a/#讯飞输入法安卓版转搜狗输入法Windows版" class="header_1">讯飞输入法安卓版转搜狗输入法Windows版</a>&nbsp;<br><a href="/blog/8da2248a/#单行短语转换" class="header_2">单行短语转换</a>&nbsp;<br><a href="/blog/8da2248a/#匹配正则" class="header_3">匹配正则</a>&nbsp;<br><a href="/blog/8da2248a/#替换正则" class="header_3">替换正则</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 搜狗输入法个性短语格式
## 单行格式
```
字符串,词频=短语
```
## 多行格式
```
字符串,词频=
短语1
短语2
短语2
```
# 讯飞输入法个性短语格式
## 单行格式
```
字符串=词频,短语1
短语2
短语3
```
# 搜狗输入法Windows版本个性短语转讯飞输入法安卓版个性短语
## 单行短语转换
### 匹配正则
```
^([a-zA-z]+?),(\d+)=(.+)
```
### 替换正则
```
$1=$2,$3
```

# 讯飞输入法安卓版转搜狗输入法Windows版
## 单行短语转换
### 匹配正则
```
^([a-zA-z]+?)=(\d+),(.+)
```
### 替换正则
```
$1,$2=$3
```
有的命令PC上有,有的命令手机上有,合并的话.工作量比较大,先搁置.
