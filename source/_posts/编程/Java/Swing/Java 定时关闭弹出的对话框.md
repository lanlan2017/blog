---
title: Java 定时关闭弹出的对话框
categories:
  - 编程
  - Java
  - Swing
abbrlink: 31d7fd61
date: 2023-09-20 17:58:34
updated: 2023-09-20 17:58:34
---
# 自动关闭JOptionPane弹窗
JOptionPane定时关闭。
```java
package adbs.main.ui.jpanels.auto;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.Timer;

public class AutoCloseJOption {

    private static final int TIME_VISIBLE = 3000;

    public static void main(String[] args) {

        final JFrame frame1 = new JFrame("My App");
        frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame1.setSize(100, 100);
        frame1.setLocation(100, 100);

        JButton button = new JButton("My Button");
        frame1.getContentPane().add(button);

        button.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane pane = new JOptionPane("Message", JOptionPane.INFORMATION_MESSAGE);
                JDialog dialog = pane.createDialog(null, "Title");
                dialog.setModal(false);
                dialog.setVisible(true);

                new Timer(TIME_VISIBLE, new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        dialog.setVisible(false);
                    }
                }).start();
            }
        });

        frame1.setVisible(true);

    }
}
```




# 参考资料
https://www.w3cschool.cn/java/codedemo-484052162.html
https://cloud.tencent.com/developer/ask/sof/102428944
