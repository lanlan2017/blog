---
title: python截取字符串子串
categories:
  - 编程
  - Python
abbrlink: 36f97261
date: 2022-05-23 16:16:39
updated: 2022-05-23 16:16:39
---
# python截取字符串子串
在python中没有类似sub()或者类似Java的subString()的方法来截取字符串。

不过在Python中字符串的截取操作更加简单，可以用`string[indexA:indexB]`来截取字符串
<!-- more -->
## 示例1
```py D:\Desktop\test\Python\String\SubStringDemo.py
str = "0123456789"
print str[0:3] #截取第一位到第三位的字符
print str[:] #截取字符串的全部字符
print str[6:] #截取第七个字符到结尾
print str[:-3] #截取从头开始到倒数第三个字符之前
print str[2] #截取第三个字符
print str[-1] #截取倒数第一个字符
print str[::-1] #创造一个与原字符串顺序相反的字符串
print str[-3:-1] #截取倒数第三位与倒数第一位之前的字符
print str[-3:] #截取倒数第三位到结尾
print str[:-5:-3] #逆序截取，具体啥意思没搞明白？
```
运行结果：
```
012
0123456789
6789
0123456
2
9
9876543210
78
789
96
```
# 示例2
```py D:\Desktop\test\Python\String\SubStringDemo2.py
img1 ="\YueDu_JieSuoZhangJie.png"
img2 ="\YueDu_KanWanShiPinZaiLing.png"
img3 ="\YueDu_LiJiLingQu.png"

img4 ="\YueDu_TianJiangHongBao.png"
img5 ="\YueDu_TianJiangHongBao1.png"
imgs = [img1, img2, img3, img4, img5]

for x in imgs:
    lastIndex = str(x).rfind("_")
    print(x[lastIndex+1:])
```
运行结果：
```
JieSuoZhangJie.png
KanWanShiPinZaiLing.png
LiJiLingQu.png
TianJiangHongBao.png
TianJiangHongBao1.png
```