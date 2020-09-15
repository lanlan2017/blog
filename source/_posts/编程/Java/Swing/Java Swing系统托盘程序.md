---
title: Java Swing系统托盘程序
categories:
  - 编程
  - Java
  - Swing
abbrlink: 57f9f8bc
date: 2020-09-15 10:11:36
updated: 2020-09-15 10:11:36
---
# Java Swing系统托盘程序

## 项目结构
<details><summary>展开/折叠</summary><pre>
E:\workspacne_JDK8Tomcat8.5\SystemTrayDemo
└─src\
  └─com\
    └─lan\
      ├─networking.png
      └─SystemTrayDemo.java
</pre></details>

## 托盘图标 networking.png
到[https://www.iconfont.cn/search/index?q=network](https://www.iconfont.cn/search/index?q=network)下载一个图标,和.java文件放在同一个包下即可.
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
## 运行效果
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/Java/Swing/SwingSystemTrayProgram/1.png)
## 乱码解决
### 1. 设置项目的编码为GBK
在项目上右键,选择`Properties`,然后在对话框的右侧中的`Text file encoding`选择框中选择`Other`,然后选择`GBK`。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/Java/Swing/SwingSystemTrayProgram/3.png)

### 2. 添加运行参数-Dfile.encoding=GBK
在编辑区域,右键,`Run As`,`Run Configurations...`,然后在弹出的对话框的左侧列表中展开`Java Application`,选择`SystemTrayDemo`,然后点击右边的`Arguments`选项卡,在`VM arguments`:文本框中输入`-Dfile.encoding=GBK`
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/Java/Swing/SwingSystemTrayProgram/2.png)

## 参考资料
[https://blog.csdn.net/jianggujin/article/details/50577491](https://blog.csdn.net/jianggujin/article/details/50577491)

<!-- 
Blog/programming/Java/Swing/SwingSystemTrayProgram/3
Blog/programming/Java/Swing/SwingSystemTrayProgram/4
Blog/programming/Java/Swing/SwingSystemTrayProgram/5
Blog/programming/Java/Swing/SwingSystemTrayProgram/6
Blog/programming/Java/Swing/SwingSystemTrayProgram/7
Blog/programming/Java/Swing/SwingSystemTrayProgram/8
-->