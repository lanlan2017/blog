---
title: Java Swing 如何判断JSplitPane左侧面板是否折叠 如何判断右侧面板是否折叠
categories:
  - 编程
  - Java
  - Swing
abbrlink: 2589d62
date: 2022-05-15 20:12:22
updated: 2022-05-15 20:12:22
---
# Java Swing 如何判断JSplitPane左侧面板是否折叠 如何判断右侧面板是否折叠
相同问题：
- 如何判断JSplitPane顶部面板是否折叠 如何判断底部面板是否折叠
- 如何判断JSplitPane面板1是否折叠 如何判断面板2是否折叠

## 监听PropertyChangeEvent
可以通过判断分割条的位置来判断左右侧面板是否被折叠：
- **当分隔条的位置为0的时候，左侧面板被折叠**
- 但是由于窗体可大可小，折叠右侧面板时，分隔条的位置是不固定的。
  - 如果窗体大小时固定的话，我们可以尝试折叠右侧面板，记下此时分隔条的位置Xxx。
    - 当下次分隔条的位置为Xxx时，就说明右侧面板被折叠。
  - 不过我发现`jSplitPane.getMaximumDividerLocation()`和`jSplitPane.getMinimumDividerLocation()`相加起来的结果，就是折叠右侧面板时分隔条的坐标值。

<!-- more -->

# Demo
```java
// 省略对象创建过程
// JSplitPane jSplitPane=new JSplitPane....
// ......
jSplitPane.addPropertyChangeListener("dividerLocation", new PropertyChangeListener() {
    @Override
    public void propertyChange(PropertyChangeEvent evt) {

        int location = jSplitPane.getDividerLocation();
        int max = jSplitPane.getMaximumDividerLocation();
        int min = jSplitPane.getMinimumDividerLocation();

        System.out.println("\n 分隔条位置：" + location);
        System.out.println("Max分隔条位置：" + max);
        System.out.println("Min分隔条位置：" + min);
        System.out.println("Max+min分隔条位置：" + (max + min));

        // 如果分割条的位置为0，则说明分隔条左侧的组件被隐藏了
        if (location == 0) {
            System.out.println("--分隔条左侧面板被隐藏--\n");
        }
        if (location >= max + min) {
            System.out.println("--分隔条右侧面板被隐藏--\n");
        }
    }
});
```

## 运行效果

### 在中间拖动分隔条时

将分隔条拖动到中间，如下图所示：

![image-20220515203742042](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220515203743.png)

此时控制台输出如下：

```
 分隔条位置：104
Max分隔条位置：215
Min分隔条位置：24
Max+min分隔条位置：239
```

### 将左侧面板折叠时

用鼠标点击分割条上的向左箭头，将左侧面板折叠起来,如下图所示：

![image-20220515204125479](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220515204125.png)

此时控制台输出如下：

```
 分隔条位置：0
Max分隔条位置：215
Min分隔条位置：24
Max+min分隔条位置：239
--分隔条左侧面板被隐藏--
```

可以看到，当我们折叠左侧面板时，控制台也多输出了`--分隔条左侧面板被隐藏--`这条语句，

- 说明我们成功判断了左侧面板被折叠这种状态。
- 说明，分隔条为0的位置，就是左侧面板被折叠的状态。

### 右侧面板被折叠时

讲右侧面板折叠，如下图所示：

![image-20220515204624319](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220515204624.png)

控制台输出如下：

```
 分隔条位置：239
Max分隔条位置：215
Min分隔条位置：24
Max+min分隔条位置：239
--分隔条右侧面板被隐藏--
```

可以看到，在本程序中，当右侧面板被折叠时，分隔条的位置为`239`，而分隔条最大位置max，加上分隔条最小位置min的和max+min的值也正好是`239`。

由此可见，折叠右侧面板时，分隔条的位置为:
`jSplitPane.getMaximumDividerLocation()+jSplitPane.getMinimumDividerLocation()`

所以，当分隔条的坐标为`jSplitPane.getMaximumDividerLocation()+jSplitPane.getMinimumDividerLocation()`时，右侧面板被折叠。


# 参考资料

https://bbs.csdn.net/topics/320220439