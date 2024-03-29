---
title: Win10 设置开机启动项
categories: 
  - Windows
  - 软件
  - Win10设置
abbrlink: 3c180144
date: 2019-11-29 21:21:31
updated: 2022-04-04 00:51:44
---
# 查看当前用户的home目录
在Linux中当打开终端的时候一般会进入用的home目录,windows中的cmd也是如此.
windows中`%UserProfile%`这个变量保存了当前用户的主目录
```cmd
echo %UserProfile%
```
```cmd
C:\Users\lan>echo %UserProfile%
C:\Users\lan
```

# 用户开机启动文件夹路径
用户的开机启动目录格式如下:
```cmd
用户home目录路径\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
```
# 在用户的开机启动文件夹放置程序
打开cmd,然后输入如下命令,即可打开当前用户的**开机启动文件夹**:
```cmd
explorer.exe %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
```
然后将要运行的程序或程序的快捷方式复制到这个目录下,这样当该用户登陆系统时,就会启动这个程序.
例如,我现在想在开机时启动任务管理器(C:\Windows\System32\Taskmgr.exe),则创建任务管理器的一个快捷方式,然后粘贴到开机启动文件夹中即可:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Windows/Setting/Startup/0.png)

<div style='display:none'>
Windows/Setting/Startup/
</div>

# 参考资料
[https://blog.csdn.net/qq459080123/article/details/81392060](https://blog.csdn.net/qq459080123/article/details/81392060)
