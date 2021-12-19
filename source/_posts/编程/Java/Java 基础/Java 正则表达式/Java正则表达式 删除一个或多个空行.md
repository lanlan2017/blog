---
title: Java正则表达式 删除一个或多个空行
categories: 
  - 编程
  - Java
  - Java 基础
  - Java 正则表达式
date: 2018-08-07 15:56:18
updated: 2021-03-20 07:44:27
abbrlink: 51e02fda
---
# 删除一个或多个空行
## 正则表达式
```
^\s*$(?:\n|\r\n)
```
`(?m)`表示开启多行匹配模式，`^`是行开始，`\\s*`代表任意个空格，`$`代表行结束。
所以这句话的意思是:
&emsp;&emsp;&emsp;&emsp;所有空行(包括有任意空格的行)都会被替换为空字符串，即空行被从字符串中移除。

但是这样还是存在一个问题，那就是如果最后一行如果是空行的话，上面的正则是无法删除的。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/regex/Examples/BlankLine/after.png)
所以还要再执行一步正则替换，把最后一行的换行符给删除掉:
## 匹配空行正则2
```
(?:\n|\r\n)^\s*$
```
匹配效果:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/regex/Examples/BlankLine/after2.png)
这两个正则一起使用就可以删除掉所有空行了，两个正则的顺序可以随意。
## 删除所有空行Java代码
```java
public static String deleteEmptyLine(String input)
{
    input=input.replaceAll("(?m)(?:\\n|\\r\\n)(?:^\\s*$)", "");
    input=input.replaceAll("(?m)(?:^\\s*$(?:\\n|\\r\\n))", "");
    return input;
}
```

# 移除多余的连续空格，只留下一个空格。

```
string.replaceAll("[ ]+", " ");
```
`[ ]+`表示一个或多个空格，`" "`表示一个空格。这句话的意思就是把多个空格替换为一个空格。
原文:[https://blog.csdn.net/kaukiyou/article/details/46829375](https://blog.csdn.net/kaukiyou/article/details/46829375)

# 在线正则图形化工具
[https://regexper.com/](https://regexper.com/)这个在线工具支持javascirpt类型的正则表达式。`(?:(?:^\s*$(?:\n|\r\n))|(?:(?:\n|\r\n)^\s*$))`的图形如下:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/regex/Examples/BlankLine/picture.png)
[https://www.debuggex.com/](https://www.debuggex.com/),这个在线工具支持javascript,python,pcre这三种方式，同时还支持在线匹配测试,`(?:(?:^\s*$(?:\n|\r\n))|(?:(?:\n|\r\n)^\s*$))`的图形如下:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/regex/Examples/BlankLine/picture1.png)
[https://jex.im/regulex/](https://jex.im/regulex/)这个在线工具和第一个差不多，也可以绘图。`(?:(?:^\s*$(?:\n|\r\n))|(?:(?:\n|\r\n)^\s*$))`的图形如下:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/regex/Examples/BlankLine/picture2.png)
