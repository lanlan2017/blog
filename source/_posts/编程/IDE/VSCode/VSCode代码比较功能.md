---
title: VSCode代码比较功能
categories: 
  - IDE
  - VSCode
abbrlink: ce242185
date: 2019-12-25 01:17:03
updated: 2022-04-04 00:51:45
---
# 问题描述
今天看书的时候,书上讲一段代码改成另一段代码,但是由于注释也改了,代码又比较多,肉眼难以看出来到底修改了哪个地方.
想起来VScode有代码比较的功能,可以帮助我看出到底就该了哪里.
这两段代码如下:
代码段1:
```java
//下面代码编译时有“ [unchecked]未经检査的转换”警告
List<String>[] lsa = new ArrayList[10];
// 将lsa向上转型为Object[]类型的变量
Object[] oa=lsa;
List<Integer> li = new ArrayList<>();
li.add(3);
oa[1] = li;
// 下面代码引起ClassCastException异常
String s = lsa[1].get(0);//①
```
代码段2:
```java
// 下面代码实际上是不允许的
List<String>[] lsa= new ArrayList<String>[10];// 1号代码
// 将lsa向上转型为Object[]类型的变量
Object[] oa = lsa;
List<Integer> li = new ArrayList<>();
li.add(3);
// 将List<Integer>对象作为oa的第二个元素
// 下面代码也不会有任何警告,但将引发ClassCastException异常
oa[1] = li;
// 下面代码引起ClassCastException异常
String s = lsa[1].get(0); // 2号代码
```
# 使用VSCode代码比较步骤
首先,为了杜绝注释的干扰,**先将所有的注释删除掉**,然后用VSCode中打开一个文件夹,在该文件夹下,创建**两个文件**来着分别两段代码.
然后在VSCode中打开这两个文件,在左侧**打开的编辑器**中按下shift键选择这两个文件,然后鼠标右键选择**将已选项进行比较**即可:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Java/IDE/VSCode/CompareFileDifferences/1.png)
这样就知道两个文件哪里不同了:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Java/IDE/VSCode/CompareFileDifferences/2.png)

<!-- Java/IDE/VSCode/CompareFileDifferences/ -->
# 参考资料
[https://www.cnblogs.com/dead-micky/p/8472647.html](https://www.cnblogs.com/dead-micky/p/8472647.html)
