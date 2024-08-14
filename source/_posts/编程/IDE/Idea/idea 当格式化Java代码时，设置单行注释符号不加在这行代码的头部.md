---
title: idea 当格式化Java代码时，设置单行注释符号不加在这行代码的头部
categories:
  - 编程
  - IDE
  - Idea
abbrlink: 56e00ca8
date: 2024-08-05 14:01:32
updated: 2024-08-05 14:01:32
---
## 问题描述

重新安装idea之后，我之前的Java代码的格式化风格没有了。

特别是在格式化Java代码的时候，单行注释的符号添加在这行代码的行首，这样的代码看起来特别的乱，不符合我的习惯。

```java
    if (length == 3) {
        // ......
        this.date = dateStr.substring(dateStartFlag.length());
//        System.out.println("date = " + date);
        // ......
    }
```

## 不勾选comment at first column

依次打开Setting，Editor，Code Style，Java。

然后点击右侧的Wrapping and Braces选项卡。

展开Keep when reformatting下拉选项

取消Comment at first column选项后面的勾选即可。
