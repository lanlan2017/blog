---
title: markdown表格中如何写竖线
categories: 
  - 其他
  - Markdown
  - 语法
  - 直接使用HTML
abbrlink: 3eef86f3
date: 2021-04-14 20:58:56
updated: 2021-04-14 21:14:03
---
<div id='my_toc'><a href="/blog/3eef86f3/#如何在markdown表格中填写Linux管道符号" class="header_1">如何在markdown表格中填写Linux管道符号</a>&nbsp;<br><a href="/blog/3eef86f3/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/3eef86f3/#错误示例" class="header_2">错误示例</a>&nbsp;<br><a href="/blog/3eef86f3/#使用html转义符" class="header_2">使用html转义符</a>&nbsp;<br><a href="/blog/3eef86f3/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 如何在markdown表格中填写Linux管道符号

## 问题描述
例如我想在表格中写命令：
```
last -f /var/log/btmp | more
```
但是命令中的管道符`|`和markdown表格的分隔符相同。
这就会造成，解析后的markdown把管道符错误的识别成单元格的分隔符的情况：

## 错误示例

|/var/log子目录|描述|
|:---|:---|
|**/var/log/alternatives.log**|更新替代信息都记录在这个文件中。|
|**/var/log/btmp**|记录所有失败登录信息。使用last命令可以查看btmp文件。例如，"last -f /var/log/btmp | more"。|
|**/var/log/user.log**|记录所有等级用户信息的日志。|

## 使用html转义符

解决方案，使用html转义符，竖线`|`的html转义符为`&#124;`。
也就是说把上面的命令改成如下即可：
```
last -f /var/log/btmp &#124; more
```

|/var/log子目录|描述|
|:---|:---|
|**/var/log/alternatives.log**|更新替代信息都记录在这个文件中。|
|**/var/log/btmp**|记录所有失败登录信息。使用last命令可以查看btmp文件。例如，"last -f /var/log/btmp &#124; more"。|
|**/var/log/user.log**|记录所有等级用户信息的日志。|

# 参考资料
[https://www.cnblogs.com/xcsn/p/3559624.html](https://www.cnblogs.com/xcsn/p/3559624.html)
