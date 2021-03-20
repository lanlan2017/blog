---
title: JavaIO流 节点流和处理流
categories: 
  - 编程
  - Java
  - Java IO流
  - 基础
date: 2018-08-21 22:26:21
updated: 2021-03-20 08:44:48
abbrlink: 2e0f7472
---
<div id='my_toc'><a href="/blog/2e0f7472/#常用处理流（关闭处理流使用关闭里面的节点流）" class="header_1">常用处理流（关闭处理流使用关闭里面的节点流）</a>&nbsp;<br><a href="/blog/2e0f7472/#流的关闭顺序" class="header_1">流的关闭顺序</a>&nbsp;<br><a href="/blog/2e0f7472/#注意：" class="header_2">注意：</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 常用处理流（关闭处理流使用关闭里面的节点流）

- 缓冲流：BufferedInputStrean BufferedOutputStream BufferedReader BufferedWriter---增加缓冲功能，避免频繁读写硬盘。
- 转换流：InputStreamReader OutputStreamReader实现字节流和字符流之间的转换。
- 数据流 DataInputStream DataOutputStream 等-提供将基础数据类型写入到文件中，或者读取出来.

# 流的关闭顺序

- 一般情况下是：先打开的后关闭，后打开的先关闭
- 另一种情况：看依赖关系，如果流a依赖流b，应该先关闭流a，再关闭流b。例如，处理流a依赖节点流b，应该先关闭处理流a，再关闭节点流b
- 可以只关闭处理流，不用关闭节点流。处理流关闭的时候，会调用其处理的节点流的关闭方法。

## 注意：

- 如果将节点流关闭以后再关闭处理流，会抛出IO异常。
- 如果关闭了处理流，在关闭与之相关的节点流，也可能出现IO异常。（hadoop编程文件流操作中遇到了。）

**总结：通常在IO的继承树中，`继承自Filter开头的流`或者转换流(InputStreamReader,OutputStreamReader)都是处理流，其他的都是节点流。**
