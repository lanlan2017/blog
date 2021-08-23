---
categories:
  - 编程
  - Java
  - Swing
abbrlink: 13a6846b
---

# FlatLaf主题

## 下载FlatLaf主题
到maven仓库下载：[https://mvnrepository.com/artifact/com.formdev/flatlaf/1.5](https://mvnrepository.com/artifact/com.formdev/flatlaf/1.5)

## 如何使用
导入jar

> ### Getting started
> https://www.formdev.com/flatlaf/
> To enable FlatLaf, add following code to your main method before you create any Swing component:
> ```java
> FlatLightLaf.install();
> // create UI here...
> ```
> or
> ```java
> try {
>     UIManager.setLookAndFeel( new FlatLightLaf() );
> } catch( Exception ex ) {
>     System.err.println( "Failed to initialize LaF" );
> }
> // create UI here...
> ```

需要注意的是，如果你使用的是第一种方式`FlatLightLaf.install();`。install方法已经不适用了，应该使用`setup()`方法.也就是改成：
```java
FlatLightLaf.setup();
```
还有就是，如果光写这条语句而已，是不会起作用的，还需要给所有的组件都设置上该主题。


> ## 启动后更改外观
> https://www.docs4dev.com/docs/zh/java/java8/tutorials/uiswing-lookandfeel-plaf.html
> 即使程序的 GUI 可见，您也可以使用setLookAndFeel更改 L＆F。要使现有组件反映新的 L＆F，请对每个顶级容器调用一次SwingUtilities updateComponentTreeUI方法。然后，您可能希望调整每个顶级容器的大小，以反映其包含的组件的新大小。例如：
> ```java
> UIManager.setLookAndFeel(lnfName);
> SwingUtilities.updateComponentTreeUI(frame);
> frame.pack();
> ```

## 代码示例

我测试有效的方式如下：


在main方法中写上如下代码：

<pre>
public static void main(String[] args) {
    MainFrom mainFrom = new MainFrom();
    JFrame frame = new JFrame("MainFrom");
    // 设置面板到窗体上
    frame.setContentPane(mainFrom.panel);
    // // 设置关闭按钮功能
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    // frame.setType(Window.Type.NORMAL);
    // frame.setType(Window.Type.POPUP);
    // 不显示任务栏
    frame.setType(Window.Type.UTILITY);
    // 不显示标题栏，最小化，关闭按钮
    frame.setUndecorated(true);
    // 永远置顶
    frame.setAlwaysOnTop(true);
    // 设置初始界面
    mainFromSetting(mainFrom, frame);
    // 设置主题
    // FlatLightLaf.setup();
    <mark>FlatDarkLaf.setup();</mark>
    // 给所有的组件都使用该主题
    <mark>SwingUtilities.updateComponentTreeUI(frame);</mark>
    // 最合适的方式显示
    <mark>frame.pack();</mark>
    // 显示窗体
    frame.setVisible(true);
}
</pre>

## 成果示例
使用暗色主题成功效果：

![image-20210823220726108](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210823220726.png)

如果你没有写`SwingUtilities.updateComponentTreeUI(frame);`，虽然你使用的是暗色的主题，但是运行结果不会显示暗色主题，默认使用的是亮色的主题

<pre>
    public static void main(String[] args) {
        ......
        // 设置主题
        FlatDarkLaf.setup();
        // FlatLightLaf.setup();
        // 给所有的组件都使用该主题
        <mark>// SwingUtilities.updateComponentTreeUI(frame);</mark>
        // 最合适的方式显示
        frame.pack();
        // 显示窗体
        frame.setVisible(true);
    }
</pre>

此时显示的效果如下图所示：

![image-20210823221038003](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210823221038.png)



# 参考资料
https://www.docs4dev.com/docs/zh/java/java8/tutorials/uiswing-lookandfeel-plaf.html
https://github.com/JFormDesigner/FlatLaf
https://mvnrepository.com/artifact/com.formdev/flatlaf/1.5
