---
title: eclipse如何移动一个方法到另一个方法后面
categories: 
  - IDE
  - eclipse
abbrlink: efb8bd0
date: 2021-07-13 14:50:26
updated: 2022-04-04 00:51:45
---
# 两个一前一后被被调用的方法 也应该一前一后的写在一起。
设想一下如下的情况：
- 主方法中，先调用了方法A,然后调用方法B.
- 或者方法A中调用了方法B

这种情况下，我们在阅读程序时，也是先阅读方法A，然后再阅读方法B。
所以我希望这两个方法按调用的顺序写在一起，这样我阅读的时候，就不需要上下翻动页面去查找方法。
直接往下阅读即可看到，下一个被调用的方法。

# eclipse中拖动方法的位置
在Outline中长按方法，并拖动其他方法的前面或后面即可：
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/programming/Idea/Eclipse/EclipseMoveMethodLocation/1.png)
![图片](https://gitee.com/XiaoLan223/images/raw/master/Blog/programming/Idea/Eclipse/EclipseMoveMethodLocation/2.png)

<!-- Blog/programming/Idea/Eclipse/EclipseMoveMethodLocation -->
