---
title: Git 如何处理敏感配置文件
categories: 
  - 编程
  - Git
  - 命令
date: 2020-06-24 04:41:17
updated: 2020-06-24 05:24:22
abbrlink: 548b8a6
---
<div id='my_toc'><a href="/blog/548b8a6/#问题描述" class="header_1">问题描述</a>&nbsp;<br><a href="/blog/548b8a6/#解决方案" class="header_1">解决方案</a>&nbsp;<br><a href="/blog/548b8a6/#先只提交key" class="header_2">先只提交key</a>&nbsp;<br><a href="/blog/548b8a6/#填写value" class="header_2">填写value</a>&nbsp;<br><a href="/blog/548b8a6/#忽略修改" class="header_2">忽略修改</a>&nbsp;<br><a href="/blog/548b8a6/#添加到-gitignore" class="header_2">添加到.gitignore</a>&nbsp;<br><a href="/blog/548b8a6/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 问题描述
配置文件中保存有软件的APP_ID和秘钥,为了别人能使用这个文件,我把它加入了版本库中,当然里面只有key,没有秘钥:
```
APP_ID=
SECURITY_KEY=
```
我现在希望这个配置文件提交之后,就再也不再被Git追踪到了。
这样我自己才能把APP_ID和秘钥填进去,自己使用。

# 解决方案
## 先只提交key
第一次提交只有key没有value的配置文件,
## 填写value
然后在配置文件中填写上value
## 忽略修改
使用命令:
```cmd
git update-index --assume-unchanged filename
```
忽略对配置文件的修改。
这样我填写上秘钥后,只能再本地起作用。
## 添加到.gitignore
别人使用这个项目的时,配置文件依然只有key,没有value
# 参考资料
[https://www.liuin.cn/2017/11/16/Git-%E5%81%9C%E6%AD%A2%E8%BF%BD%E8%B8%AA%E6%96%87%E4%BB%B6/](https://www.liuin.cn/2017/11/16/Git-%E5%81%9C%E6%AD%A2%E8%BF%BD%E8%B8%AA%E6%96%87%E4%BB%B6/)
