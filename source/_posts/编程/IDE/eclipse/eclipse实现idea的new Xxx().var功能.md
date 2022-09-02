---
title: eclipse实现idea的new Xxx().var功能
categories:
  - 编程
  - IDE
  - eclipse
abbrlink: d844b728
date: 2022-07-11 07:50:54
updated: 2022-07-11 07:50:54
---
# Idea的.var功能
idea的`.var`功能可以很方便的进行变量声明：
在idea中输入如下命令:
```java
new String().var
```
会自动生成如下代码:
```java
String string=new String();
```

# Eclipse的.var功能

依次点击Window，Preference，Java，Editor，Context Assist，Advanced。勾选右侧的Java Postfix Template Proposals即可开启.var功能

<!-- more -->

## 查看.var功能

eclipse也是有.var功能的，点击Window，Preference，Java，Editor，Template，然后点击右侧的Context进行排序，向下滚动鼠标中间，找到Java postfix,里面有.var功能：

![image-20220716105008124](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716105008.png)

## 开启Java postfix功能

如果没有找到，则没有勾选Java postfix，依次点击Window，Preference，Java，Editor，Context Assist，Advanced。勾选右侧的Java Postfix Template Proposals即可:

![image-20220716105203903](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716105204.png)

# Eclipse的Extract Local Variable来实现.var功能

Eclipse中是没有`.var`功能的，但是可以有类似的功能：`Extract Local Variable`。

在代码编辑器中，**选中代码**，按**右键**，选择`Refactor`,然后选择`Extract Local Variable`。

![image-20220711095847866](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220711095848.png)

输入变量名：

![image-20220711095912933](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220711095913.png)

效果：

![image-20220711095930621](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220711095930.png)