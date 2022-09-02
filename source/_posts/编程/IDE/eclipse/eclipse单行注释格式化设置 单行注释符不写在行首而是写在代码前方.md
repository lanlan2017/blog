---
title: eclipse单行注释格式化设置 单行注释符不写在行首而是写在代码前方
categories:
  - 编程
  - IDE
  - eclipse
abbrlink: 2b67159b
date: 2022-07-16 08:17:34
updated: 2022-07-16 08:17:34
---
# 前言

今天我使用Eclipse时，我发现在Java中使用单行注释时，注释符写字行首：

![image-20220716090237095](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716090237.png)

我以前的Eclipse生成的注释符，都是写在原来代码的正前方的：

![image-20220716100556742](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716100556.png)
这让我很不习惯，接下来就介绍如何设置单行注释的格式化样式。
<!-- more -->
# Java单行注释格式化设置

## Eclipse如何设置Java格式化
默认情况下，Eclipse有自己的格式化配置，如果你想自定义格式化，可以新建一个配置。

依次点击Window，Preference，在搜索框中输入Formatter，然后点击Java，Code Style下的Formatter，然后点击右侧的Edit...按钮，
![image-20220716084519480](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716084519.png)

![image-20220716085037203](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716085037.png)

然后把原来的"Eclipse 2.1 [built-in]"修改为自定义名字，

![image-20220716085815278](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716085815.png)

我这里修改为my:

![image-20220716085910558](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716085910.png)

这样就在原来Eclipse默认的格式化上新建了一个配置

## 注释格式化的设置
然后展开Comments,把：

### 单行注释设置
```
Enable line comment formatting
   Format line comments on first column
```

#### 两个都勾选上时

都勾选选上：

![image-20220716090954159](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716090954.png)

格式化效果：

格式化前：

![image-20220716090237095](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716090237.png)

格式化后：

![image-20220716091304435](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716091304.png)

#### 只勾选父选项 只勾选第1项

![image-20220716091935086](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716091935.png)

单行注释前：

![image-20220716092008639](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716092008.png)

再加一层单行注释后：

![image-20220716092043744](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716092043.png)

格式化后：

![image-20220716092043744](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716092043.png)

可以看到好像格式化之后并没有效果，这是因为我们没有勾选第二个选项，也就是当单行注释符在行首的时候，就不会格式化这个单行注释，如果还是想格式化，则让单行注释符不再行首即可，把这些单行注释符都选中，然后按一下tab键：

![image-20220716095148577](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716095201.png)

此时单行注释符不在行首，格式文件后，这些单行注释就会被格式化了：

![image-20220716095348890](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220716095348.png)







