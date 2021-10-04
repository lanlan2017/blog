---
title: Swing使用FlatLaf主题详解 解决FlatDarkLaf暗色主题不生效的问题
categories: 
  - 编程
  - Java
  - Swing
abbrlink: 13a6846b
date: 2021-08-23 22:48:56
updated: 2021-08-23 22:48:56
---
# 常见设置Java Swing LookAndFeel方式
一般使用UIManager.setLookAndFeel()方法来设置外观，如下所示：
```java
// 设置外观
try {
    // 跨平台外观
    // UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
    // 和系统一样的外观
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());

} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (InstantiationException e) {
    e.printStackTrace();
} catch (IllegalAccessException e) {
    e.printStackTrace();
} catch (UnsupportedLookAndFeelException e) {
    e.printStackTrace();
}
```

经过我的测试，发现这种方式可以设置两种类型的外观。

一种是跨平台的外观，这是默认的外观。如果想使用这种方式，可以不设置。

```
UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
```

跨平台的外观如下图所示：

![image-20210910092750337](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210910092757.png)

另一种就是和系统一样的外观：

```
UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
```

如下图所示：

![image-20210910093214534](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210910093214.png)

这种方式比上面的跨平台外观要好看一些。

如果你想要界面更加美观，可以使用FlatLaf主题。

# FlatLaf主题

## 下载FlatLaf主题
到maven仓库下载：[https://mvnrepository.com/artifact/com.formdev/flatlaf/1.5](https://mvnrepository.com/artifact/com.formdev/flatlaf/1.5)

## 如何使用
导入jar

> ### Getting started
> https://www.formdev.com/flatlaf/
> To enable FlatLaf, add following code to your main method <mark>before you create any Swing component:</mark>
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
## 外观不生效或部分生效的问题
还有就是，如果光写这条语句而已，可能只是部分组件起作用的，有些组件还是原来的外观。还需要给所有的组件都设置上该主题。
**这是因为你先创建了组件，然后才使用这条语句来设置外观，造成的。**
### 方案1：先设置外观再创建组件
应该先设置外观，然后再创建组件
把`FlatLightLaf.setup();`写到静态代码块中，并把这个静态代码块定义在类的前面。
因为静态代码块最先加载，从而保证在创建UI组件时，外观已经设置好了，组件将会以我们事先创建好的外观显示。

#### 完美的使用FlatLaf外观方式
如下所示：
```java
public class MainFrom {
    static {
        // 先设置外观，再创建UI。
        // 为了保证创建UI时，已经实现设置好新外观，
        // 最好把设置外观的代码写在静态块中，
        // 并且把这个静态块写在类定义的最前面。
        FlatLightLaf.setup();
    }

    private JFrame frame;
    private JPanel panel;
    private JButton exitButton;
    private JTextField textField;
    private JTextArea textArea;
    private JLabel lable;
    private JScrollPane scrollPane;
    private JPanel scrollPaneFather;

    public MainFrom(JFrame frame) {
        // 记下Frame
        this.frame = frame;
        // 初始化系统托盘
        new ToolUiSystemTray(frame);
        // 程序刚开始，还没输入内容，不会有输出，隐藏用来显示输出的文本域
        // scrollPane.setVisible(false);
        scrollPaneFather.setVisible(false);
        // 设置退出按钮的功能
        exitButtonSetting();
        // 窗体功能
        frameSetting();
        // 文本框功能
        textFieldSetting();
        // 监听文本域鼠标事件，右键点击文本域，将会清空文本域。
        textArea.addMouseListener(new TextAreaMouseListener(frame, textArea));
    }
    // 省略后续代码
}
```
#### 美化后的外观如下

![image-20210910095538356](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210910095538.png)

这种方式比系统默认的要更加美观一些。



### 方案2：先创建组件再更改外观 不推荐使用这种方式
> https://www.docs4dev.com/docs/zh/java/java8/tutorials/uiswing-lookandfeel-plaf.html
> 即使程序的 GUI 可见，您也可以使用setLookAndFeel更改 L＆F。要使现有组件反映新的 L＆F，请对每个顶级容器调用一次SwingUtilities updateComponentTreeUI方法。然后，您可能希望调整每个顶级容器的大小，以反映其包含的组件的新大小。例如：
> ```java
> UIManager.setLookAndFeel(lnfName);
> SwingUtilities.updateComponentTreeUI(frame);
> frame.pack();
> ```

#### 代码示例

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

#### 成果示例
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

#### 为什么不推荐先创建组件再更改外观
先创建组件，然后再更改外观，可能会造成其他的奇奇怪怪的问题。
##### java.awt.IllegalComponentStateException: component must be showing on the screen to determine its location
这是使用这种方式造成的问题：
```
Exception in thread "AWT-EventQueue-0" java.awt.IllegalComponentStateException: component must be showing on the screen to determine its location
	at java.awt.Component.getLocationOnScreen_NoTreeLock(Component.java:2062)
	at java.awt.Component.getLocationOnScreen(Component.java:2036)
	at javax.swing.JPopupMenu.show(JPopupMenu.java:948)
	at javax.swing.plaf.basic.BasicComboPopup.show(BasicComboPopup.java:211)
	at javax.swing.plaf.basic.BasicComboBoxUI.setPopupVisible(BasicComboBoxUI.java:877)
	at javax.swing.JComboBox.setPopupVisible(JComboBox.java:816)
	at blue.commands.ui.event.textfield.TextFieldDocumentListener2.updateList(TextFieldDocumentListener2.java:60)
	at blue.commands.ui.event.textfield.TextFieldDocumentListener2.insertUpdate(TextFieldDocumentListener2.java:28)
	at javax.swing.text.AbstractDocument.fireInsertUpdate(AbstractDocument.java:201)
	at javax.swing.text.AbstractDocument.handleInsertString(AbstractDocument.java:748)
	at javax.swing.text.AbstractDocument.insertString(AbstractDocument.java:707)
......
```

#### 解决方案
使用第一种方案，也就是先设置外观，再创建UI组件，这样就不会有这样的问题。

# 参考资料
https://www.docs4dev.com/docs/zh/java/java8/tutorials/uiswing-lookandfeel-plaf.html
https://github.com/JFormDesigner/FlatLaf
https://mvnrepository.com/artifact/com.formdev/flatlaf/1.5
