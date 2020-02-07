---
title: 在eclipse项目路径下启动cmd并解决乱码
categories: 
  - Java
  - IDE
  - eclipse
date: 2019-08-29 22:34:38
updated: 2019-12-25 01:16:51
abbrlink: ced73660
---
<div id='my_toc'><a href="/blog/ced73660/#在eclipse项目路径下启动cmd并解决乱码" class="header_1">在eclipse项目路径下启动cmd并解决乱码</a>&nbsp;<br><a href="/blog/ced73660/#在eclipse中启动cmd" class="header_2">在eclipse中启动cmd</a>&nbsp;<br><a href="/blog/ced73660/#选择cmd的编码为GBK" class="header_2">选择cmd的编码为GBK</a>&nbsp;<br><a href="/blog/ced73660/#启动cmd-exe" class="header_2">启动cmd.exe</a>&nbsp;<br><a href="/blog/ced73660/#操作过程" class="header_2">操作过程</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 在eclipse项目路径下启动cmd并解决乱码 #
## 在eclipse中启动cmd ##
依次点击菜单栏上的`Run`，`External tools`，这样会弹出的`External Tools Configurations`对话框,在该对话框左边的`Program`上右键,选择`New Configuration`,然后:
1. 在`name:`输入框中输入名字`cmd`。
2. 在`Location:`输入框中输入`cmd.exe`的路径:`C:\Windows\System32\cmd.exe`
3. 在`Working Directory`输入框输入:`${project_loc}`,这两个可以点击右边的`Variables…`按钮进行选择.这个`${project_loc}`的意思就是当前项目的路径.

## 选择cmd的编码为GBK ##
点击最右边的`Common`选项卡,然后在`Encoding`选择框里面选择`GBK`即可。
## 启动cmd.exe ##
在`Package Explorer`中点击要打开的项目或者项目中的文件,这样`${workspace_loc}${project_path}`才能正确定位到项目路径.然后接着点击`Run`，`External Tools`，`cmd`即可在该项目下启动`cmd`.
## 操作过程 ##
如下`gif`所示:
![这是一个gif文件](https://image-1257720033.cos.ap-shanghai.myqcloud.com/gif/IDE/eclipse/cmd/1.gif)
