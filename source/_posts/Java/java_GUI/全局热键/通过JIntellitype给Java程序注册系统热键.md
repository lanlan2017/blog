---
title: 通过JIntellitype给Java程序注册系统热键
categories: 
  - Java
  - java_GUI
  - 全局热键
date: 2018-09-13 15:17:26
updated: 2019-11-14 11:39:29
abbrlink: 9d991fe9
---
参考:[https://blog.csdn.net/iteye_11213/article/details/81886200](https://blog.csdn.net/iteye_11213/article/details/81886200)

JIntellitype提供了简单的调用方法去注册系统热键。操作简单，示例明确，下载后阅读一下readme.txt文档，就可以使用了。

使用时首先要定义一个实现了HotkeyListener接口的类，实现其onHotKey(int)方法，这个方法接收一个数字，作为标志

然后就可以使用JIntellitype.getInstance().registerHotKey(int,int,int)方法注册需要的热键了，其中第一个参数将是触发时传递个onHotKey方法的参数，所以两者要保持统一，第二个参数为ctrl、alt、shift等的组合结果，第三个一般为组合键的字母。
示例代码：
```java
package com.iflysse.swing;
import com.melloware.jintellitype.HotkeyListener;
import com.melloware.jintellitype.JIntellitype;
/**
* @author ZYWANG
*/
public class HotkeyTest 
{
    public static void main(String[] args) throws InterruptedException 
    {
        //注册一个ctrl+alt+a的热键
        JIntellitype.getInstance().registerHotKey(100, JIntellitype.MOD_CONTROL+JIntellitype.MOD_ALT, (int)'T');
        //添加热键监听器
        JIntellitype.getInstance().addHotKeyListener(new HotkeyListener() 
        {
            @Override
            public void onHotKey(int arg0) 
            {
                System.out.println(arg0);//打印参数
                //JIntellitype.getInstance().unregisterHotKey(arg0);//用于移除热键注册的方法
                System.exit(0);
            }
        });
        Thread.sleep(10000000);
    }
}

```
JIntellitype下载地址：[http://melloware.com/download/](http://melloware.com/download/) （打开页面，找到JIntellitype）
下载地址：[https://code.google.com/archive/p/jintellitype/downloads](https://code.google.com/archive/p/jintellitype/downloads),注意需要科学上网。
附件中提供了一个jintellitype-1.3.4-dist版本备用

>原文链接: [通过JIntellitype给Java程序注册系统热键](https://lanlan2017.github.io/blog/9d991fe9/)
