---
title: Java Swing JButton释放焦点
categories:
  - 编程
  - Java
  - Swing
abbrlink: a94d6ee
date: 2022-06-08 12:28:14
updated: 2022-06-08 12:28:14
---
# 前言
最近写了个Swing的工具程序，点击按钮时，按钮没有释放焦点。

这样下次切换到该程序时，容易误触发到上次点击的按钮。
# jb.setFocusPainted(false);
调用JButton的setFocusPainted方法，并传入false作为参数即可释放该按钮的焦点。

```java
JButton jb;
//去焦点
jb.setFocusPainted(false);
```
<!-- more -->

# 封装成工具类
```java G:\dev2\idea_workspace\MyJavaTools\AdbTools\src\adbs\buttons\JButtons.java
public class JButtons {
    /**
     * 释放触发ActionEvent事件的按键的焦点。
     *
     * @param e ActionEvent事件
     */
    public static void setFocusPainted(ActionEvent e) {
        AbstractButton openBtn = (AbstractButton) e.getSource();
        // 释放焦点
        openBtn.setFocusPainted(false);
    }
}
```

# 参考资料
https://blog.csdn.net/qq_37614259/article/details/72854547