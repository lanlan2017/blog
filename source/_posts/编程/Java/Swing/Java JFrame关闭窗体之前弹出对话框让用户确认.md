---
title: Java JFrame关闭窗体之前弹出对话框让用户确认
categories:
  - 编程
  - Java
  - Swing
abbrlink: 9a2728d1
date: 2023-10-16 15:49:46
updated: 2023-10-16 15:49:46
---

# 步骤
1.  先设置DO_NOTHING_ON_CLOSE：`frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);`。
2.  然后再调用frame.addWindowListener方法，重写windowClosing方法，在windowClosing方法里面弹出确认对话框。



# 示例
```java
import javax.swing.*;  
import java.awt.event.*;  
  
public class CloseConfirmation {  
  
    public static void main(String[] args) {  
        JFrame frame = new JFrame("Close Confirmation Example");  
        frame.setSize(300, 200);  


        frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);  
        frame.addWindowListener(new WindowAdapter() {  
            @Override  
            public void windowClosing(WindowEvent e) {  
                int confirm = JOptionPane.showConfirmDialog(frame, "Are you sure you want to close?");  
                if (confirm == JOptionPane.YES_OPTION) {  
                    frame.dispose();  
                }  
            }  
        });  
        frame.setVisible(true);  
    }  
}
```

# 示例2
```java
private void frameSettings() {
    // 取消默认关闭操作
    frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
    // 自己实现windowClosing
    frame.addWindowListener(new WindowAdapter() {
        @Override
        public void windowClosing(WindowEvent e) {
            // int result = JOptionPane.showConfirmDialog(contentPane, "确认关闭");
            int result = JOptionPane.showConfirmDialog(contentPane, "确定关闭", "是否关闭窗体", JOptionPane.YES_NO_OPTION);


            switch (result) {
                case JOptionPane.OK_OPTION:
                    super.windowClosing(e);
                    // adbJPanels.getStopBtn().doClick();
                    universalPanels.getBtnStop().doClick();
                    scrcpyJPanels.getBtnKillScrcpy().doClick();
                    System.out.println("窗体正在关闭。。。。。。。。。。。。");
                    // ThreadSleep.seconds(5);
                    System.exit(0);
                    break;
                // default:
                //     frame.pack();
                //     break;
            }
        }
    });
    // 永远置顶
    frame.setAlwaysOnTop(true);
    // 调整窗体到最佳大小
    frame.pack();
    // 显示窗体
    frame.setVisible(true);
}
```