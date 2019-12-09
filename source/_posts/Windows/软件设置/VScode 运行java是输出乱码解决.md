---
title: VScode 运行java是输出乱码解决
categories: 
  - Windows
  - 软件设置
date: 2019-09-28 10:27:21
updated: 2019-12-09 19:45:23
abbrlink: 7ab55f4
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/7ab55f4/#问题描述">问题描述</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/7ab55f4/#解决方案">解决方案</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/7ab55f4/#可能是编码的问题">可能是编码的问题</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/7ab55f4/#可能是VScode中的java环境版本太老">可能是VScode中的java环境版本太老</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/7ab55f4/#可能是PowerShell版本太老">可能是PowerShell版本太老</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 问题描述 ##
最近我在`VSCode`中运行`Java`代码,但是奇怪的的是中文输出的是乱码.
## 解决方案 ##
### 可能是编码的问题 ###
一般乱码时因为`java`文件的编码和终端的编码不一样导致的`.VScode`中的内置终端默认调用的是`PowerShell`,所以`java`文件的编码和`PowerShell`的默认编码一样即可,建议修改成`UTF-8`编码.
1. 修改`java`文件的编码为`UTF-8`
2. 修改终端(PowerShell)的编码为`UTF-8`

一般来说到这里就没有乱码了,但是奇怪的是,使用`System.out.println()`方法输出的时候`换行符是乱码的`,好奇怪啊,还得再猜一猜是什么原因。
## 可能是VScode中的java环境版本太老 ##
如果修改编码后,还是出现乱码,那么可能是`java`环境太老了,更新`java`环境试试:
1. 卸载掉`Java Extension Pack`,
2. 然后重启`VScode`,
3. 再重新安装`Java Extension Pack`。


## 可能是PowerShell版本太老 ##
如果更新了`java`环境之后还是出现问题,那可能是`PowerShell`的问题了,接下来重新安装`PowerShell`试试.
1. 打开`Microsoft store`
2. 点击搜索款,输入`PowerShell`,安装`PowerShell`即可.
3. 也可以安装`Windows Terminal`,`Windows Terminal`好像评价比较高.

我试到这一步乱码解决了,但是更新`java`环境后我没有测试乱码有没有解决,如果更新`java`环境后乱码解决了,也就不用更新`PowerShell`了(这是废话)。



>原文链接: [VScode 运行java是输出乱码解决](https://lanlan2017.github.io/blog/7ab55f4/)
