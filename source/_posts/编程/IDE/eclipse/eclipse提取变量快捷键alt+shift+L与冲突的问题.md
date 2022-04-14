---
title: eclipse提取变量快捷键alt+shift+L与冲突的问题
categories: 
  - IDE
  - eclipse
abbrlink: 956009f0
date: 2021-08-23 19:53:00
updated: 2022-04-04 00:51:45
---
# 操作注册表，添加内容
## 备份注册表
Win+R打开运行，输入如下命令打开注册表：
```
regedit
```

然后按文件，导出，

![image-20210823200124636](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210823200131.png)

导出范围选择全部：

![image-20210823200153678](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210823200153.png)

## 管理员身份打开CMD

输入如下命令，来添加信息：
```
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SynTP\Parameters\Debug /v DumpKernel /d 00000000 /t REG_DWORD /f
```
## 重启电脑

输入上述命令后会提示添加成功，然后此时按Alt+Shift+L依然有问题。要重启后才不会有问题。

## 操作成功效果

重启电脑之后，按下ALT+Shift+L就可以很方便的提取变量了，也不会有那个烦人的弹窗。

可以打开注册表查看效果：

![image-20210823200429194](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210823200429.png)

如果你怕上述命令有问题，也可以在注册表编辑区里面，手动创建上述内容。

# 参考资料
https://blog.csdn.net/lzxomg/article/details/53230871
https://jitwxs.blog.csdn.net/article/details/78774156
https://blog.csdn.net/yuanlaijike/article/details/78774156
https://demo.tc/post/820
http://www.pipimp3.com/jiaocheng/11925.html
