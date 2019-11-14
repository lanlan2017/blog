---
title: eclipse报错
categories: 
  - Java
  - IDE
  - eclipse
date: 2019-05-13 14:57:10
updated: 2019-11-05 10:32:10
abbrlink: 4499badc
---
- [错误信息](/blog/4499badc/#错误信息)
- [解决方案](/blog/4499badc/#解决方案)
- [参考资料](/blog/4499badc/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 错误信息 #
springmvc配置文件报错如下:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/SpringMVCError/1.png)
```
Multiple annotations found at this line:
	- Referenced file contains errors (http://www.springframework.org/schema/context/spring-context.xsd). For more information, right click on the 
	 message in the Problems View and select "Show Details..."
	- Referenced file contains errors (http://www.springframework.org/schema/mvc/spring-mvc.xsd). For more information, right click on the message 
	 in the Problems View and select "Show Details..."
```
# 解决方案 #
依次打开:`Window>Preferences>XML>XML Files >Validation`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/SpringMVCError/2.png)
取消勾选:`Honour all XML schema locations`,它将禁用指向不同schema位置相同命名空间引用的验证，仅以第一次找到的可验证的XML文件为结果。 
然后点击`Apply and Close`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/SpringMVCError/3.png)
接下来选择`是`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/SpringMVCError/4.png)
这样就不会报错了，如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/SpringMVCError/5.png)
# 参考资料 #

>原文链接: [eclipse报错](https://lanlan2017.github.io/blog/4499badc/)
