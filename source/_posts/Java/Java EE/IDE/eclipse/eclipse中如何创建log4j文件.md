---
title: eclipse中如何创建log4j文件
categories: 
  - Java
  - Java EE
  - IDE
  - eclipse
date: 2019-06-12 22:26:13
updated: 2019-12-09 20:34:55
abbrlink: 2f2a13a0
---
<div id='my_toc'><a href="/blog/2f2a13a0/#eclipse中如何创建log4j文件">eclipse中如何创建log4j文件</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# eclipse中如何创建log4j文件 #
在项目`src`目录上右键,然后依次选择`new`,`other`...,`XML`,`XML File`,然后点击`next`,
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/log4j/newLog4jXmlFile/1.png)
然后选择要创建的路径,输入文件名`log4j.xml`,然后点击`next`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/log4j/newLog4jXmlFile/2.png)
选择`Create XML file from a DTD file`,点击`next`。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/log4j/newLog4jXmlFile/3.png)
选择`Select XML Catalog entry`,选中`key`为`-//LOG4J//DTD LOG4J//EN`的选项,然后点击`next`,
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/log4j/newLog4jXmlFile/4.png)
最后点击`finish`即可。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/log4j/newLog4jXmlFile/5.png)
最后创建得到的`xml`代码如下:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE log4j:configuration PUBLIC "-//LOG4J//DTD LOG4J//EN" "https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd" >
<log4j:configuration></log4j:configuration>
```
