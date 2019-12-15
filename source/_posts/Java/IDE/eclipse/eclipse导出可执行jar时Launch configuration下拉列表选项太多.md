---
title: eclipse导出可执行jar时Launch configuration下拉列表选项太多
categories: 
  - Java
  - IDE
  - eclipse
date: 2018-10-25 16:45:17
updated: 2019-12-09 20:34:55
abbrlink: 956cc103
---
如果想要删除`Launch configuration`下拉列表的主类历史记录，只要进入到要打包的这个`工程所在的目录`，也就是`工作空间目录`找到这个：
```
\.metadata\.plugins\org.eclipse.debug.core\.launches
```
文件夹，清空里面的内容，然后重启eclipse即可：![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDE%E4%BD%BF%E7%94%A8/eclipse%E5%AF%BC%E5%87%BA%E5%8F%AF%E6%89%A7%E8%A1%8Cjar%E6%97%B6Launch%20configuration%E9%80%89%E9%A1%B9%E5%A4%AA%E5%A4%9A/qingli_launch.png)
参考：[http://coderlxl201209164551.iteye.com/blog/2126652](http://coderlxl201209164551.iteye.com/blog/2126652)
