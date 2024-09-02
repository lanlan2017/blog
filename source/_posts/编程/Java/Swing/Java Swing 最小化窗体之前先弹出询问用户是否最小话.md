---
title: Java Swing 最小化窗体之前先弹出询问用户是否最小话
categories:
  - 编程
  - Java
  - Swing
abbrlink: e0cdb80a
date: 2024-09-02 11:51:09
updated: 2024-09-02 11:51:09
---
## 说明

Java Swing的窗体最小化是操作系统控制的，也就是说在窗体最小化时，我们是无法控制的。

## 解决方案

在窗体最小化完成之后，检查窗体的状态，如果窗体时最小化的状态，我们先把窗体恢复到正常的转态，然后弹出一个对话框，询问用户是否最小化。如果用户选择是，则把窗体的窗体设置为最小化状态。

## 解决事件处理程序循环调用的问题

我们点击是之后，把窗体设置为最小化状态，又会触发添加的事件处理程序，造成循环调用的问题。

为了解决循环调用的问题，我们可以把事件处理程序给他移除掉。

```java
package adbs.main.window;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowEvent;
import java.awt.event.WindowStateListener;

public class ConfirmMinimizeExample_0 {
    private static WindowStateListener windowStateListener;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> createAndShowGUI());
    }

    private static void createAndShowGUI() {
        JFrame frame = new JFrame("Confirm Minimize Example");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 200);

        // 添加组件到窗口...
        frame.add(new JLabel("这是一个测试窗口"));

        // 添加WindowStateListener来监听窗口状态变化
        windowStateListener = new WindowStateListener() {
            @Override
            public void windowStateChanged(WindowEvent e) {
                if (e.getNewState() == Frame.ICONIFIED) {
                    // 先恢复窗口的正常状态
                    frame.setState(Frame.NORMAL);

                    // 显示确认对话框
                    int result = JOptionPane.showConfirmDialog(frame, "您确定要最小化窗口吗？", "确认", JOptionPane.YES_NO_OPTION);

                    if (result == JOptionPane.YES_OPTION) {
                        // 如果用户选择“是”，则最小化窗口
                        frame.setState(Frame.ICONIFIED);
                        frame.removeWindowStateListener(windowStateListener);
                    } else {
                        // 如果用户选择“否”，则保持窗口正常状态

                    }

                }
            }
        };
        frame.addWindowStateListener(windowStateListener);
        frame.setVisible(true);
    }
}
```

## 解决事件处理程序只响应一次的问题

虽然移除掉事件处理程序，可以解决这个事件处理程序被循环触发的问题。

但是，我们下次再最小化窗体时，这个事件处理程序就不会再响应了。程序不会再次弹窗询问用户，而是直接就最小化窗体。

为了解决这个问题，当用户点击是时，我们先移除事件处理程序，然后创建一个延迟线程来重新添加事件处理程序。

这样，在用户再次点击最小化窗体按钮时，因为已经重新添加了事件处理程序，程序就还会继续弹窗询问。

## 最终代码

```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.concurrent.TimeUnit;

public class ConfirmMinimizeExample_1 {

    private static WindowStateListener listener;
    private static JFrame frame;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> createAndShowGUI());
    }

    private static void createAndShowGUI() {
        frame = new JFrame("Confirm Minimize Example");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 200);

        // 添加组件到窗口...
        frame.add(new JLabel("这是一个测试窗口"));

        // 创建WindowStateListener实例
        listener = new WindowStateListener() {
            @Override
            public void windowStateChanged(WindowEvent e) {
                if (e.getNewState() == Frame.ICONIFIED) {
                    // 先恢复窗口的正常状态
                    frame.setState(Frame.NORMAL);

                    // 显示确认对话框
                    int result = JOptionPane.showConfirmDialog(frame,
                            "您确定要最小化窗口吗？", "确认",
                            JOptionPane.YES_NO_OPTION);

                    if (result == JOptionPane.YES_OPTION) {
                        // 如果用户选择“是”，则最小化窗口
                        frame.setState(Frame.ICONIFIED);
                        // 移除监听器
                        frame.removeWindowStateListener(this);

                        // 使用定时器在一定时间后重新添加监听器
                        new Thread(() -> {
                            try {
                                TimeUnit.SECONDS.sleep(1); // 等待1秒
                            } catch (InterruptedException ex) {
                                Thread.currentThread().interrupt();
                            }
                            SwingUtilities.invokeLater(() -> {
                                frame.addWindowStateListener(this);
                            });
                        }).start();
                    } else {
                        // 如果用户选择“否”，则保持窗口正常状态
                    }
                }
            }
        };

        // 添加WindowStateListener来监听窗口状态变化
        frame.addWindowStateListener(listener);

        frame.setVisible(true);
    }
}
```

这个版本的代码确保了以下几点：

- 确认对话框：当用户尝试最小化窗口时，会先显示一个确认对话框。
- 恢复窗口状态：在显示确认对话框之前，窗口状态先恢复为正常状态。
- 移除监听器：如果用户选择“是”，则最小化窗口，并且暂时移除监听器。
- 延时重新添加监听器：使用一个新线程，在短暂延迟后（本例中为1秒），重新添加监听器，以防止重复触发事件处理程序。

这种实现方式确保了用户在确认最小化后，不会立即再次触发相同的事件处理程序，同时也允许用户在稍后再次尝试最小化窗口时，仍然能够看到确认对话框。

## 优化版本

我们可以进一步简化代码结构，并确保其清晰易读。此外，我们还可以考虑使用 ScheduledExecutorService 来替代手动创建线程的方式，这样可以使代码更加简洁和易于维护。

以下是进一步优化后的代码：

- 使用 ScheduledExecutorService 来延迟重新添加监听器。
- 确保所有 GUI 相关的操作都在事件调度线程中执行。
- 代码结构更加清晰。

以下是优化后的完整代码：

```java
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ConfirmMinimizeExample_2 {

    private static WindowStateListener listener;
    private static ScheduledExecutorService executorService;
    private static JFrame frame;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> createAndShowGUI());
    }

    private static void createAndShowGUI() {
        frame = new JFrame("Confirm Minimize Example");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 200);

        // 添加组件到窗口...
        frame.add(new JLabel("这是一个测试窗口"));

        // 创建WindowStateListener实例
        listener = new WindowStateListener() {
            @Override
            public void windowStateChanged(WindowEvent e) {
                if (e.getNewState() == Frame.ICONIFIED) {
                    // 先恢复窗口的正常状态
                    frame.setState(Frame.NORMAL);

                    // 显示确认对话框
                    int result = JOptionPane.showConfirmDialog(frame,
                            "您确定要最小化窗口吗？", "确认",
                            JOptionPane.YES_NO_OPTION);

                    if (result == JOptionPane.YES_OPTION) {
                        // 如果用户选择“是”，则最小化窗口
                        frame.setState(Frame.ICONIFIED);

                        // 移除监听器
                        frame.removeWindowStateListener(this);

                        // 使用ScheduledExecutorService在一定时间后重新添加监听器
                        executorService.schedule(() -> {
                            SwingUtilities.invokeLater(() -> {
                                frame.addWindowStateListener(this);
                            });
                        }, 1, TimeUnit.SECONDS);
                    } else {
                        // 如果用户选择“否”，则保持窗口正常状态
                    }
                }
            }
        };

        // 添加WindowStateListener来监听窗口状态变化
        frame.addWindowStateListener(listener);

        // 初始化ScheduledExecutorService
        executorService = Executors.newSingleThreadScheduledExecutor();

        frame.setVisible(true);
    }
}
```

优化点说明：

- ScheduledExecutorService：
  - 使用 ScheduledExecutorService 替代手动创建线程的方式来延迟重新添加监听器。
  - executorService.schedule(Runnable command, long delay, TimeUnit unit) 方法可以按指定延迟执行任务。
- 确保在事件调度线程中执行 GUI 操作：
  - 使用 SwingUtilities.invokeLater() 确保 GUI 相关的操作（如添加监听器）在事件调度线程中执行。
- 代码结构清晰：
  - 代码结构更加简洁明了，易于阅读和维护。

通过使用 ScheduledExecutorService，我们避免了手动创建线程的复杂性，并且保证了延迟任务的可靠执行。同时，所有的 GUI 操作都在事件调度线程中执行，确保了安全性。这样的实现方式不仅提高了代码的可读性和可维护性，也使得代码更加健壮。