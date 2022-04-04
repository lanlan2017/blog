---
title: Java Swing系统托盘程序
categories: 
  - Java
  - Swing
abbrlink: 57f9f8bc
date: 2020-09-15 10:11:36
updated: 2022-04-04 00:51:44
---
# Java Swing系统托盘程序

## 项目结构
<details><summary>展开/折叠</summary><pre>
E:\workspacne_JDK8Tomcat8.5\SystemTrayDemo
└─src\
  ├─com\
  │ └─lan\
  │   ├─networking.png
  │   ├─SystemTrayDemo.java
  │   └─SystemTrayFrame.java
  └─sun.png
</pre></details>

## 托盘图标
### networking.png
到[https://www.iconfont.cn/search/index?q=network](https://www.iconfont.cn/search/index?q=network)下载一个图标,和.java文件放在同一个包下即可.
### sun.png
到[https://www.iconfont.cn/search/index?searchType=icon&q=sun](https://www.iconfont.cn/search/index?searchType=icon&q=sun)下载一个图标,放在src目录下。
## SystemTrayDemo.java
```java
package com.lan;

import java.awt.Image;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.URL;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

public class SystemTrayDemo
{
    public static void main(String[] args)
    {
        // 判断是否支持系统托盘
        if (SystemTray.isSupported())
        {
            // 获取图片所在的URL,请把图片放在同一个包下
            URL url = SystemTrayDemo.class.getResource("networking.png");
            // 实例化图像对象
            ImageIcon icon = new ImageIcon(url);
            // 获得Image对象
            Image image = icon.getImage();
            // 创建托盘图标
            TrayIcon trayIcon = new TrayIcon(image);
            // 为托盘添加鼠标适配器
            trayIcon.addMouseListener(new MouseAdapter() {
                // 鼠标事件
                public void mouseClicked(MouseEvent e)
                {
                    // 判断是否双击了鼠标
                    if (e.getClickCount() == 2)
                    {
                        JOptionPane.showMessageDialog(null, "SystemTrayDemo");
                    }
                }
            });
            // 添加工具提示文本
            trayIcon.setToolTip("本地连接\r\n速度：100.0 Mbps\r\n状态：已连接上");
            // 创建弹出菜单
            PopupMenu popupMenu = new PopupMenu();
            popupMenu.add(new MenuItem("禁用(D)"));
            popupMenu.add(new MenuItem("状态(S)"));
            popupMenu.add(new MenuItem("修复(P)"));
            popupMenu.addSeparator();
            popupMenu.add(new MenuItem("更改 Windows 防火墙设置(C)"));
            popupMenu.addSeparator();
            popupMenu.add(new MenuItem("打开网络连接(O)"));

            // 为托盘图标加弹出菜弹
            trayIcon.setPopupMenu(popupMenu);
            // 获得系统托盘对象
            SystemTray systemTray = SystemTray.getSystemTray();
            try
            {
                // 为系统托盘加托盘图标
                systemTray.add(trayIcon);
            } catch (Exception e)
            {
                e.printStackTrace();
            }
        } else
        {
            JOptionPane.showMessageDialog(null, "not support");
        }
    }
}
```
### 运行效果
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/Java/Swing/SwingSystemTrayProgram/1.png)

## 乱码解决
### 1. 设置项目的编码为GBK
在项目上右键,选择`Properties`,然后在对话框的右侧中的`Text file encoding`选择框中选择`Other`,然后选择`GBK`。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/Java/Swing/SwingSystemTrayProgram/3.png)

### 2. 添加运行参数-Dfile.encoding=GBK
在编辑区域,右键,`Run As`,`Run Configurations...`,然后在弹出的对话框的左侧列表中展开`Java Application`,选择`SystemTrayDemo`,然后点击右边的`Arguments`选项卡,在`VM arguments`:文本框中输入`-Dfile.encoding=GBK`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/Java/Swing/SwingSystemTrayProgram/2.png)

## SystemTrayFrame.java
```java
package com.lan;

import java.awt.AWTException;
import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class SystemTrayFrame extends JFrame {
    private static final long serialVersionUID = 6708808934167400534L;
    private JPanel contentPane;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        // 启动窗体
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    // 创建窗体
                    SystemTrayFrame frame = new SystemTrayFrame();
                    // 显示窗体
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the frame.
     */
    public SystemTrayFrame() {
        setTitle("测试系统面板");
        setBounds(100, 100, 450, 300);
        contentPane = new JPanel();
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        contentPane.setLayout(new BorderLayout(0, 0));
        setContentPane(contentPane);
        // 初始化系统托盘
        initSystemTray();
    }

    /**
     * 初始化系统托盘，复用方法，把该方法复制其他Frame中，然后调用使用系统托盘。
     */
    private void initSystemTray() {
        // 判断系统是否支持托盘图标
        if (SystemTray.isSupported()) {
            // 获取托盘图标,图片请放在src目录下
            URL resource = this.getClass().getResource("/sun.png");
            // 创建图标
            ImageIcon icon = new ImageIcon(resource);
            // 创建弹出式菜单
            PopupMenu pop = new PopupMenu();
            // 创建 显示菜单项
            MenuItem displayJFrameItem = new MenuItem("显示");
            // 给 显示窗体菜单项 添加事件处理程序
            displayJFrameItem.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    setVisible(true);
                }
            });
            // 显示菜单项 添加到 弹出式菜单中
            pop.add(displayJFrameItem);

            // 创建 退出菜单项
            MenuItem exitItem = new MenuItem("退出");
            // 给 退出菜单项 添加事件监听器，单击时退出系统
            exitItem.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    System.exit(0);
                }
            });
            // 添加 退出菜单项 到弹出框中
            pop.add(exitItem);

            // 创建托盘图标程序
            TrayIcon tray = new TrayIcon(icon.getImage(), "HelloWorld", pop);
            // 获得系统托盘对象
            SystemTray systemTray = SystemTray.getSystemTray();
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
关闭窗体后,程序并不会退出,在系统托盘上的太阳图标上右键,
- 选择**显示**,可以重新显示窗体;
- 选择**退出**,则退出程序;

## 参考资料
[https://blog.csdn.net/jianggujin/article/details/50577491](https://blog.csdn.net/jianggujin/article/details/50577491)
[https://blog.csdn.net/qq_36761831/article/details/81516535](https://blog.csdn.net/qq_36761831/article/details/81516535)
[https://www.docs4dev.com/docs/zh/java/java8/tutorials/uiswing-misc-systemtray.html](https://www.docs4dev.com/docs/zh/java/java8/tutorials/uiswing-misc-systemtray.html)
[https://blog.csdn.net/xietansheng/article/details/78389278](https://blog.csdn.net/xietansheng/article/details/78389278)

<!-- 
Blog/programming/Java/Swing/SwingSystemTrayProgram/3
Blog/programming/Java/Swing/SwingSystemTrayProgram/4
Blog/programming/Java/Swing/SwingSystemTrayProgram/5
Blog/programming/Java/Swing/SwingSystemTrayProgram/6
Blog/programming/Java/Swing/SwingSystemTrayProgram/7
Blog/programming/Java/Swing/SwingSystemTrayProgram/8
-->
