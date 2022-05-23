---
title: Java Swing 使用JPopupMenu+JDialog实现系统托盘弹出菜单 解决中文乱码问题
categories:
  - 编程
  - Java
  - Swing
abbrlink: 2b294c47
date: 2022-05-14 13:37:36
updated: 2022-05-14 14:55:03
---
# 使用JPopupMenu实现系统托盘中文弹出菜单
## TrayIcon构造函数

|方法|描述|
|:--|:--|
|`TrayIcon(Image image)`|Creates a TrayIcon with the specified image.|
|`TrayIcon(Image image, String tooltip)`|Creates a TrayIcon with the specified image and tooltip text.|
|`TrayIcon(Image image, String tooltip, PopupMenu popup)`|Creates a TrayIcon with the specified image, tooltip and popup menu.|

可以看到，我们可以使用`PopupMenu`作为系统托盘程序的弹出菜单。

## PopupMenu不支持中文
但是PopupMenu有如下问题：
- PopupMenu添加的菜单项MenuItem不支持图标，是awt级组件，没有提供paint函数，也就意味着不能重绘，去实现带图标的菜单；
- PopupMenu只支持英文,中文会乱码，如果确实需要支持中文的话，运行的jar时候，需要使用加上`-Dfile.encoding=GBK`参数，指定以GBK编码来运行，一般来说我们要处理的文件也通常是UTF-8编码的，如果使用这个GBK编码运行的jar来处理此文件，就会出现乱码问题。

## 基于JPopupMenu的解决方案
JPopupMenu是Swing组件，而且支持图标+文本，更美观。在标准API里，添加JPopupMenu的有两种方式：
1、Component组件调用setComponentPopuMenu(JPopupMenu)方法来绑定JPopupMenu；
2、JPopupMneu调用show(Component c,int x,int y)方法绑定至组件的(x,y)坐标上；

但问题是，**TrayIcon不是Component**，不能通过上述两种方法进行绑定。


### 弹出菜单的触发过程
在 鼠标点击或者按下快捷键 时 生成弹出菜单。

所以我们可以在点击系统托盘的时候，单独创建一个Component作为JPopupMenu的参考坐标。

这个Component，我们可选择Java现成的JWindow或者JDialog等等。经过测试JDialog来实现会更好一些。

## JPopupMenu实现系统托盘弹出菜单的步骤

获取鼠标点击的坐标值，在这个坐标值上创建一个JDialog，然后将JPopupMenu绑定到这个JDialog的（0,0）位置上，弹出菜单显示后再获取弹出菜单的尺寸，再根据尺寸回调JDialog的大小，这样JPopupMenu就完美的遮罩了JDialog，看不出JDialog的存在。
不过这样做，还有最后一个问题，那就是在弹出菜单消失后，JDialog依然存在；

这倒不用担心，JPopupMenu提供了：firePopupMenuCanceled()、firePopupMenuWillBecomeInvisible()、firePopupMenuWillBecomeVisible()，菜单消失、消失前、消失后，这三个回调函数。

所以，我们可以选择重写其中任意一个函数，在JPopupMenu消失之前关闭JPopupMenu的载体即可。

这样就可以完美实现系统托盘弹出菜单啦。
<!-- more -->

# demo
## 项目结构
```
G:\dev2\idea_workspace\MyJavaTools\RunableTools
└─src\
  ├─demo\
  │ └─ui\
  │   ├─SystemTrayCH.java
  │   └─SystemTrayEn.java
  └─工具_16.png
```
## 工具_16.png

![image-20220514140435825](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220514140435.png)

## PopupMenu实现的系统托盘弹出菜单不支持中文

### SystemTrayEn.java

```java G:\dev2\idea_workspace\MyJavaTools\RunableTools\src\demo\ui\SystemTrayEn.java
package demo.ui;

import javax.swing.*;
import java.awt.*;
import java.net.URL;

public class SystemTrayEn {
    public static void main(String[] args) {
        // 应用主窗口
        JFrame frame = new JFrame();
        frame.setBounds(500, 500, 200, 200);
        frame.setVisible(true);
        initSystemTray(frame);
    }
    /**
     * 初始化系统托盘
     */
    private static void initSystemTray(JFrame frame) {
        // 判断系统是否支持托盘图标
        if (java.awt.SystemTray.isSupported()) {

            // // 获取托盘图标,图片请放在 当前包 下
            URL resource = SystemTray.class.getResource("/工具_16.png");
            // 创建图标
            assert resource != null;
            ImageIcon icon = new ImageIcon(resource);
            // 创建弹出式菜单
            PopupMenu pop = new PopupMenu();

            String str = "显示主窗体";
            // String str = "show main form";
            // 创建 显示菜单项
            MenuItem displayJFrameItem = new MenuItem(str);
            // 给 显示窗体菜单项 添加事件处理程序
            displayJFrameItem.addActionListener(e -> frame.setVisible(true));
            // 显示菜单项 添加到 弹出式菜单中
            pop.add(displayJFrameItem);

            // 创建 退出菜单项
            String exitLabel = "退出";
            // String exitLabel = "exit";
            MenuItem exitItem = new MenuItem(exitLabel);
            // 给 退出菜单项 添加事件监听器，单击时退出系统
            exitItem.addActionListener(e -> System.exit(0));
            // 添加 退出菜单项 到弹出框中
            pop.add(exitItem);

            // 创建托盘图标程序
            TrayIcon tray = new TrayIcon(icon.getImage(), "CommandsUI", pop);
            // 获得系统托盘对象
            java.awt.SystemTray systemTray = java.awt.SystemTray.getSystemTray();
            try {
                // 将托盘图标添加到系统托盘中
                systemTray.add(tray);
            } catch (AWTException e1) {
                e1.printStackTrace();
            }
        }
    }
}
```
### 运行效果
中文菜单会乱码，如下图所示：

![image-20220514142009787](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220514142009.png)

讲上述代码的中文菜单注释掉，换成英文菜单，再次运行，可以看到英文菜单可以正常显示：

![image-20220514142129826](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220514142129.png)


## JPopupMenu+JDialog实现的系统托盘弹出式菜单支持中文菜单

### SystemTrayCH.java
```java G:\dev2\idea_workspace\MyJavaTools\RunableTools\src\demo\ui\SystemTrayCH.java
package demo.ui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.URL;

/**
 * 中文系统托盘弹出菜单不乱码。
 */
public class SystemTrayCH {

    public static void main(String[] args) throws FileNotFoundException {
        // 应用主窗口
        JFrame frame = new JFrame();
        // 启动程式时就设置系统托盘
        initSystemTrayUTF8(frame);

        //取消默认关闭事件，自定义使其放在右下角的系统托盘
        //frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.addWindowListener(new WindowAdapter() {
            // @SneakyThrows
            @Override
            public void windowClosing(WindowEvent e) {
                // 应用主窗口不可见 != 应用退出
                frame.setVisible(false);
                // systemTrayAdd(trayIcon);
            }
        });
        frame.setBounds(500, 500, 200, 200);
        frame.setVisible(true);
    }

    private static void initSystemTrayUTF8(JFrame frame) {
        //使用JDialog 作为JPopupMenu载体
        JDialog jDialog = new JDialog();
        //关闭JDialog的装饰器
        jDialog.setUndecorated(true);
        //jDialog作为JPopupMenu载体不需要多大的size
        jDialog.setSize(1, 1);

        //创建JPopupMenu
        //重写firePopupMenuWillBecomeInvisible
        //消失后将绑定的组件一起消失
        JPopupMenu jPopupMenu = new JPopupMenu() {
            @Override
            public void firePopupMenuWillBecomeInvisible() {
                jDialog.setVisible(false);
                System.out.println("JPopupMenu不可见时绑定载体组件jDialog也不可见");
            }
        };
        jPopupMenu.setSize(100, 30);

        //添加菜单选项
        // JMenuItem exit = new JMenuItem(getUTF8String("退出"));
        JMenuItem exit = new JMenuItem("退出");
        exit.addActionListener(e -> {
            System.out.println("点击了退出选项");
            System.exit(0);
        });
        // JMenuItem showMainFrame = new JMenuItem(getUTF8String("显示主窗体"));
        JMenuItem showMainFrame = new JMenuItem("显示主窗体");
        showMainFrame.addActionListener(e -> {
            System.out.println("显示主窗体");
            //显示窗口
            frame.setVisible(true);
        });

        jPopupMenu.add(showMainFrame);
        jPopupMenu.add(exit);

        URL resource = SystemTrayCH.class.getResource("/工具_16.png");
        // 创建托盘图标
        Image image = Toolkit.getDefaultToolkit().createImage(resource);
        // 创建系统托盘图标
        TrayIcon trayIcon = new TrayIcon(image);
        // 自动调整系统托盘图标大小
        trayIcon.setImageAutoSize(true);

        // 给托盘图标添加鼠标监听
        trayIcon.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                //左键点击
                if (e.getButton() == 1) {
                    //显示窗口
                    frame.setVisible(true);
                } else if (e.getButton() == 3 && e.isPopupTrigger()) {
                    // 右键点击弹出JPopupMenu绑定的载体以及JPopupMenu
                    jDialog.setLocation(e.getX() + 5, e.getY() - 5 - jPopupMenu.getHeight());
                    // 显示载体
                    jDialog.setVisible(true);
                    // 在载体的0,0处显示对话框
                    jPopupMenu.show(jDialog, 0, 0);
                }
            }
        });
        // 添加托盘图标到系统托盘
        systemTrayAdd(trayIcon);
    }

    /**
     * 添加托盘图标到系统托盘中。
     *
     * @param trayIcon 系统托盘图标。
     */
    private static void systemTrayAdd(TrayIcon trayIcon) {
        // 将托盘图标添加到系统的托盘实例中
        SystemTray tray = SystemTray.getSystemTray();
        try {
            tray.add(trayIcon);
        } catch (AWTException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 字符串转UTF-8字符串
     *
     * @param str 要转换的字符串
     * @return UTF-8编码的字符串
     */
    private static String getUTF8String(String str) {
        try {
            return new String(str.getBytes("UTF-8"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
```

### 运行效果

![image-20220514140339518](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220514140348.png)


# 参考资料
https://blog.csdn.net/TianYaZhongBieLi/article/details/102903765
