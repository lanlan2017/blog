---
title: 重装系统后如何恢复原来的pyautogui环境
categories:
  - 编程
  - Python
  - pyautogui
abbrlink: 69e43b30
date: 2024-06-24 10:15:13
updated: 2024-06-24 10:15:13
---
## 问题描述

我的电脑固态硬盘坏掉了，原来的Python是装在这个固态硬盘上的，现在重装系统后原来的Python和pyautogui库都没有了，需要重新安装。

为了和我原来的代码保持一致，避免因为版本升级可能造成的麻烦，我要安装我之前用过的Python和pyautogui版本。万幸的是，只是我平时用来写代码的电脑A坏掉了。我另一台电脑B上的pyautogui环境是好的。

所以，在我的电脑A上，安装和电脑B上一模一样的Python和pyautogui版本就行。

## 安装同版本的Python

从电脑B上复制原来的安装包，点击安装即可。这次就不默认安装了，把Python安装到机械硬盘上。

### 安装相同版本的Python

我电脑B上安装的Python版本是

```cmd
D:\Tools\runnable>python --version
Python 3.10.4

D:\Tools\runnable>
```

对应的安装包是：

```cmd
D:\网络共享\只读\软件\代码\python-3.10.4-amd64.exe
```

把这个安装包从电脑B复制到电脑A上，然后在电脑A上安装这个版本的Python就行了。

## 安装相同版本的pyautogui及其依赖库

在电脑B查看安装的库

```cmd
pip list
```

命令输出结果如下：

```cmd
D:\Tools\runnable>pip list
Package       Version
------------- --------
MouseInfo     0.1.3
numpy         1.22.3
opencv-python 4.5.5.64
Pillow        9.1.0
pip           22.0.4
PyAutoGUI     0.9.50
PyGetWindow   0.0.9
PyMsgBox      1.0.9
pyperclip     1.8.2
PyRect        0.2.0
PyScreeze     0.1.28
pytweening    1.2.0
setuptools    58.1.0
```

## 安装指定版本的库

### Pillow

安装Pillow的9.1.0版本：

```cmd
pip install Pillow==9.1.0
```

### PyGetWindow

安装PyGetWindow的0.0.9版本：

```cmd
pip install PyGetWindow==0.0.9
```

### PyMsgBox

安装PyMsgBox的1.0.9版本：

```cmd
pip install PyMsgBox==1.0.9
```

### PyScreeze

安装PyScreeze的0.1.28版本：

```cmd
pip install PyScreeze==0.1.28
```

### pytweening

安装pytweening的1.2.0版本：

```cmd
pip install pytweening==1.2.0
```

### pyperclip

```cmd
pip install pyperclip==1.8.2
```

### numpy

```cmd
pip install numpy==1.22.3
```

### opencv-python

```cmd
pip install opencv-python==4.5.5.64
```

### PyAutoGUI

安装PyAutoGUI的0.9.50版本：

```cmd
pip install PyAutoGUI==0.9.50
```

## 测试能否进行图片识别

从电脑B上复制可以正常进行图片识别的Python文件到电脑A上，然后运行这个Python文件，看看能否正常进行图片定位操作。

```cmd
E:\dev\java\code\MyJavaTools_1\AdbToolsPythons\h9\Taobao>python 1.py
click_sousuo.png Point(x=591, y=220)

E:\dev\java\code\MyJavaTools_1\AdbToolsPythons\h9\Taobao>
```

好的程序可以正常运行,并且定位到图片的位置，运行成功。
