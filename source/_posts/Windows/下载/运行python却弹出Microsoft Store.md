---
title: 运行python却弹出Microsoft Store
categories:
  - Windows
  - 下载
abbrlink: be9b7855
date: 2022-05-06 22:52:55
updated: 2022-05-07 13:23:09
---
# 运行python却弹出Microsoft Store
今天安装好python之后，我在cmd中输入python,但是并没有运行python，而是弹出了Microsoft Store，并跳转到python的安装下载界面。

![image-20220506230809031](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220506230809.png)

然后我查找了一下，居然有两个python:

```
D:\Desktop\test\CMD\phone>python

D:\Desktop\test\CMD\phone>where python
C:\Users\HellloWorld\AppData\Local\Microsoft\WindowsApps\python.exe
C:\Users\HellloWorld\AppData\Local\Programs\Python\Python310\python.exe

D:\Desktop\test\CMD\phone>
```
# 解决方案
打开**设置**，进入**应用执行别名**，关掉python.exe即可。
<!-- more -->
## 进入 设置-应用执行别名
点击任务栏上的搜索按钮，输入`app exec`。

![image-20220506230119548](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220506230521.png)

## 关掉python.exe和python3.exe即可

![image-20220506230205262](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220506230205.png)

这样再次输入python,就不会跳转到python安装界面了：

```
D:\Desktop\test\CMD\phone>where python
C:\Users\18190\AppData\Local\Programs\Python\Python310\python.exe

D:\Desktop\test\CMD\phone>python
Python 3.10.4 (tags/v3.10.4:9d38120, Mar 23 2022, 23:13:41) [MSC v.1929 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

# 参考资料
https://shuhari.dev/blog/2019/11/win10-store-python
