---
title: CommandsUI程序开发过程中遇到的问题以及解决方案
categories: 
  - 其他
  - 我的软件
  - Commands
abbrlink: 8917b2ab
date: 2021-08-27 18:38:53
updated: 2022-04-04 15:13:22
---
# 需求1：切换到其他程序之后，改变窗体的透明度
## 问题
问题，刚开始使用鼠标事件来实现，鼠标进入窗体时不透明，鼠标移出窗体时透明。
但是这种方式有问题，当鼠标进入文本框的时候，窗体也透明了。
这说明虽然文本框也是在窗体里面，但从鼠标从窗体移动到文本框的时候，java认为鼠标退出了窗体。
## 解决方案
鼠标进入窗体的时候，设置透明度为1.0f,或文本框得到焦点的时候设置透明度为1.0f
这样就做到了窗体不透明的效果。

然后加入一个线程来判断窗体是否在活动。
当从窗体，移动到其他程序时，窗体就不活动了，这个时候就可以让窗体透明了。


# 需求2：窗体不活动的时候收起文本域
虽然离开窗体之后，窗体会变得不透明，但是显示程序输出内容的文本域依然占据着空间，如果程序输出的内容过多，则会占据大量的显示区域。
所以我希望离开窗体之后就把把文本域收起。
如何实现，在线程体中，把textarea所在的滚动面板设置为不可见，然后再重绘窗体即可。

# 需求3:鼠标悬停在窗体上的时候不透明
此时并不是活动窗口，
