---
title: idea Java设置直接初始化数组时每个元素占一行
categories:
  - 编程
  - IDE
  - Idea
abbrlink: b0fab7fd
date: 2024-09-17 21:56:15
updated: 2024-09-17 21:56:15
---
## 问题描述

最近我的代码中用到了直接初始化的对象数组，但是idea格式化之后，整个对象数组都在一行中，如下所示：

```java
tasks.add(new AppTaskTimeSet("速度免费小说", new TaskTime[]{new TaskTime("签到"), new TaskTime("阅读"), new TaskTime("红包")}));
```

当数组中的元素比较多的时候，我们阅读起来就十分的不方便。

我希望格式化成如下的形式：

```java
tasks.add(new AppTaskTimeSet("速度免费小说", new TaskTime[]{
        new TaskTime("签到"),
        new TaskTime("阅读"),
        new TaskTime("红包")
}));
```

## Settings，Java，code style，Array initializer选择Wrap always，勾选子选项

`Settings`,`Editor`,`Java`,然后选中右侧的`Wrapping and Braces`选项卡。

下滑滚动条，找到 `Array initializer`，在Array initializer水平方向的右边，应该有`Do not wrap`这样的词语,点击它，然后选择 `Wrap always`。

然后展开Array initializer，勾选下面的`New line after '{'`，勾选`Place line after '}'`这两项。

点击Ok，或者`Apply`按钮，

最后，再重新格式化就行。
