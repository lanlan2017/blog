---
title: Java图形界面编程
categories: 
  - Java
  - java_GUI
date: 2018-09-13 14:26:54
updated: 2019-11-14 11:39:29
abbrlink: 795fc6f9
---
<div id='my_toc'>

- [AWT简介](/blog/795fc6f9/#AWT简介)
    - [GUI设计工具组件](/blog/795fc6f9/#GUI设计工具组件)
- [Swing简介](/blog/795fc6f9/#Swing简介)
- [容器类](/blog/795fc6f9/#容器类)
    - [JFrame类](/blog/795fc6f9/#JFrame类)
- [JDialog类](/blog/795fc6f9/#JDialog类)
    - [JDialog与Jframe的区别](/blog/795fc6f9/#JDialog与Jframe的区别)
- [JPanel类](/blog/795fc6f9/#JPanel类)
- [Swing常用基本组件](/blog/795fc6f9/#Swing常用基本组件)
    - [常用组件的共性操作](/blog/795fc6f9/#常用组件的共性操作)
    - [按钮( JButton)](/blog/795fc6f9/#按钮-JButton)
    - [文本框( JTextField)与密码输入框( JPasswordField)](/blog/795fc6f9/#文本框-JTextField-与密码输入框-JPasswordField)
    - [文本域( JTextArea)](/blog/795fc6f9/#文本域-JTextArea)
    - [标签( JLabel)](/blog/795fc6f9/#标签-JLabel)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## AWT简介 ##
Java1.0的出现带来了`抽象窗口工具箱(AWT)`。设计目标是希望构建一个通用的GUI,使得利用它编写的程序能够运行在所有的平台上,以实现Sun公司提出的口号“一次编写,随处运行”。 Java AWT中包含了许多类来支持GUI设计。AWT由Java的 Java.awt包提供,该包中有许多用来设计GU的组件类,如按钮、菜单、列表、文本框等组件类;同时还包含窗口、面板等容器类。AWT的具体层次结构如图16.1所示。
![](http://pefsyzdwh.bkt.clouddn.com/18-9-12/77483434.jpg)

Java提供了一系列AWT软件包,其中主要的包及包的描述如图16.2所示。
![](http://pefsyzdwh.bkt.clouddn.com/18-9-12/21263787.jpg)
- java.awt包:是AWT的核心包，包含用于创建用户界面和绘制图形图像的所有类

- java.awt包：
    - AWT的核心包,包含用于创建用户界面和绘制图形图像的所有类
- java.awt.color包：
    - 提供定义颜色及其空间
- java.awt.datatransfer包：
    - 提供在应用程序之间和在应用程序内部传输数据的接口和类
- java.awt.event包:
    - 提供处理由AWT组件所激发的各类事件的接口和类
- java.awt.font包:
    - 提供各种字体,包括类及接口
- java.awt.image包:
    - 用于图像处理,提供创建和修改图像的各种类
- java.awt.print包:
    - 2D图像的API包,为通用的打印API提供类和接口
java.awt包提供了基本的Java程序的GUI设计工具。主要包括`组件、容器和布局管理器`三个概念,其具体描述如下所示。

### GUI设计工具组件 ###
- 组件Component)：图形用户界面的最基本组成部分是组件,组件是`一个可以以图形化的方式显示在屏幕上并能与用户进行交互的对象`,例如个按钮,一个标签等
- 容器( Container)：是Component(组件)的子类,容器本身是一个组件具有组件的所有性质,但是其`主要功能是容纳其他组件和容器`
- 布局管理器(LayoutManager): 每个容器都有一个布局管理器,使用**布局管理器可以对容器中的某个组件进行定位或判断其大小尺寸**等

## Swing简介 ##

Swing是Java基础类库( Java Foundation Classes)中有关图形界面的类库。 `Swing扩展自AWT`。例如JFrame扩展自 Frame, JButton扩展自Component等。`基本上AWT中的每种控件都能在Swing中找到替代品`,比如AWT中的Button对应于 Swing中的 JButton,AWT中的 TextField对应于 Swing中的 JTextField等。

Swing包是JFC(Java Foundation Classes)的一部分,它由许多包组成,这些包的名称及描述如表16.1所示。
![](http://pefsyzdwh.bkt.clouddn.com/18-9-12/64122628.jpg)

## 容器类 ##
窗口( JFrame)、面板( JPanel)和对话框(J)是Swing中提供用来创建表示图形用户界面的类。该类的对象将被当作容器使用,所有的 Swing组件都必须被添加到容器中,才能被显示出来。
### JFrame类 ###
Jframe是一个窗口容器组件,可以被显示在用户桌面上,同时也是一个框架,在其中,可以添加需要的其他的Swing组件。 **Jframe是少数几个不`是通过绘制的方式显示的Swing组件`**。 Jframe类的构造方法如下所示
- public JFrame(String title)
    - 构造一个初始状态是不可见的、有指定标题的JFrame对象。参数 title指明了 JFrame对象的标题

Jframe类中还提供了一些与窗口有关的方法。其主要方法与方法描述如表16.2所示。
![](http://pefsyzdwh.bkt.clouddn.com/18-9-12/64122628.jpg)

## JDialog类 ##
JDialog是一个用来**创建对话框的类**,是 Dialog类的子类。创建的 **JDialog对象可以用来向用户返回信息,接收用户的输入,实现与用户的交互**。 
### JDialog与Jframe的区别 ###
JDialog对象需要依赖于其他的对话框(比如 Jframe)而存在,当它所依赖的对话框关闭或最小化的时候,该对话框也随之关闭或最小化。

JDialog类创建对话框对象的构造方法如图16.7所示。
- Dialog(JFrame frame,String s)
    - 创建一个对话框对象,初始状态为不可见。参数s用来设置对话框的名字
- Dialog(frame frame, String s, boolean b)
    - 创建一个对话框对象。参数s用来设置对话框的名字,参数b用来决定该对话框的模式

JDialog类中的主要方法及方法描述如表16.3所示。
![](http://pefsyzdwh.bkt.clouddn.com/18-9-12/6477777.jpg)

## JPanel类 ##
在得到了 JFrame的内容面板后我们就可以直接将其他的 Swing组件放在其中,或者直接在上面描绘图画或文字,但是习惯上一般不会这么做。**通常会将这些图画或文字信息描绘在名为JPanel的容器上,然后再将 JPanel实例放在内容面板上。这样可以使得面板上的布局更合理**。JPanel通常只作为纯粹的容器来使用,它不能像框架、窗口或者对话框那样独立存在。 JPanel的构造方法如下所示。
- JPanel()
    - 构造一个使用默认的布局管理器创建的面板
- JPanel(LayoutManager layout)
    - 构造一个使用指定布局管理器的面板

## Swing常用基本组件 ##
创建图形用户界面GUI,就是为了让计算机程序更好的和用户交互。 Java Swing提供了二十多种不同的用户界面组件。**所有的Swng组件都是从javax.swing.Jcomponent类中派生而来的,从而继承了组件所特有的属性和方法**。
### 常用组件的共性操作 ###
Swing类库中的组件都继承自 javax.swing.JComponent,因此都具有 JComponent的操作,包括`设置背景色`,`设置前景色`、`设置字体`以及`设置是否禁用`等。表16.4中是 JComponent中常用的方法及方法描述。
![](http://pefsyzdwh.bkt.clouddn.com/18-9-12/27250573.jpg)

### 按钮( JButton) ###
按钮是用户界面中常用的组件。用户使用 Swing按钮可以显示图像,将整个按钮设置为窗口默认图标,来处理鼠标在按钮上的事件。java.swing包中提供了标准的按压式按钮( JButton)。同时提供了选择式按钮:多选择( JCheckBox)、单选择( JRadioButton)等。我们在这里先来讲解 JButton的知识JButton的构造方法如图16.1所示。
- public JButton ()方法
    - 用于创建不带有设置文本或图标的按钮
- public JButton(Icon icon)方法
    - 用于创建一个带图标的按钮
- public JButton(String text)方法
    - 用于创建一个带文本的按钮
- public JButton(Action a)方法
    - 用于创建一个按钮,其属性从所提供的 Action中获取

### 文本框( JTextField)与密码输入框( JPasswordField) ###
**文本框( JTextField)**也是一种常见的组件**,用于处理一行文本**(中间没有回车符)。 JTextField是JTextComponent的子类。密码输入框是 JTextField的个子类。 JTextField和 PasswordField的构造函数形式和常用方法完全一样。这里只列出 JTextField的构造函数,如下所示。
- JTextField()
    - 构造一个空文本域
- JTextField(String text)
    - 构造一个显示指定字符串的文本域
- JTextField(int columns)
    - 构造一个显示指定列数的空文本域
- JTextField(String text,int columns)
    - 构造一个具有显示指定字符串,指定列数的文本域
### 文本域( JTextArea) ###
文本域( JTextArea)也是一种常用组件,**用于处理多行文本**。 JTextArea同 JTextField一样,都是JTextcomponent的子类,因此它们的很多操作都类似,我们不再赘述。 JTextArea的构造函数如下所示：
- JTextArea
- 构造一个空文本区
- JTextArea(String text)
    - 构造一个显示指定字符串的文本区
- JTextArea(int columns)
    - 构造一个显示指定列数的空文本区
- JTextArea(String text, int columns)
    - 构造一个具有显示指定字符串,指定列数的文本区

### 标签( JLabel) ###
标签( JLabel)用来显示一段文本,常用在 JTextField或者 JTextArea前面,提示用户要填写什么样的信息。JLabel用于显示文字,也可以同时显示文字和图标,一般不用于接收鼠标键盘的动作。 JLabel的构造方法如下所示。

- public JLabel (String text)
- 使用左对齐字符串来构造一个标签
- public JLabel (Icon icon)
    - 使用左对齐图标来构造一个标签 
- public JLabel (String text, int align)
    - 构造一个显示指定列数的空文本区
- public JLabel(String text, Icon icon, int align)
    - 构造一个具有显示指定字符串,指定列数的文本区

先搬运到这里,后面再看看。看了这么多还是没能达到我想要的结果:设置一个截图的软件，然后自动调用百度识图获取JSON数据，并去除识别的文字，复制到剪贴板中。

>原文链接: [Java图形界面编程](https://lanlan2017.github.io/blog/795fc6f9/)
