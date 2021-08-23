---
title: win10环境变量以列表显示
categories:
  - Windows
  - 软件
  - Win10设置
abbrlink: cfefe5ea
date: 2021-07-29 12:19:35
updated: 2021-07-29 12:19:35
---
# 问题描述
今天我调整了Path环境变量的顺序，当我想再次编辑Path环境变量的时候，显示的不是列表，而是一个文本框：

![image-20210729123502151](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210729123509.png)

# 原因：第一个地址以%开头造成的
这是因为Path环境变量的第一个地址以%开头造成的

# 解决方案：让第一个地址以盘符开头
## 赋值path的值
全选，复制path的值。
```
%JAVA_HOME%\bin;%NVM_HOME%;%NVM_SYMLINK%;%NVM_HOME%\nodejs\node_global;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Users\18190\AppData\Local\Microsoft\WindowsApps;F:\Program Files (x86)\NetSarang\Xshell 7\;E:\dev2\mysql5.58\mysql5.5.8\bin;E:\快捷方式;F:\Program Files (x86)\NetSarang\Xftp 7\;F:\Program Files\scrcpy-win64-v1.18;F:\Program Files\Graphviz\bin;G:\Program Files\Microsoft VS Code\bin;G:\Program Files\Git;G:\dev2\idea_workspace\HexoTools\runable;G:\Program Files\Git\cmd;G:\apache-tomcat-8.5.35\bin;
```
## 调整path变量的顺序
### 拆分成多行显示
打开一个文本编辑软件，把`;`替换成`;\n`，然后把百分号开头的移动到最后面：
```
C:\Windows\system32;
C:\Windows;
C:\Windows\System32\Wbem;
C:\Windows\System32\WindowsPowerShell\v1.0\;
C:\Windows\System32\OpenSSH\;
C:\Users\18190\AppData\Local\Microsoft\WindowsApps;
F:\Program Files (x86)\NetSarang\Xshell 7\;
E:\dev2\mysql5.58\mysql5.5.8\bin;
E:\快捷方式;
F:\Program Files (x86)\NetSarang\Xftp 7\;
F:\Program Files\scrcpy-win64-v1.18;
F:\Program Files\Graphviz\bin;
G:\Program Files\Microsoft VS Code\bin;
G:\Program Files\Git;
G:\dev2\idea_workspace\HexoTools\runable;
G:\Program Files\Git\cmd;
G:\apache-tomcat-8.5.35\bin;
%JAVA_HOME%\bin;
%NVM_HOME%;
%NVM_SYMLINK%;
%NVM_HOME%\nodejs\node_global;
```
### 调整顺序后再合并成一行
最后再把`;\n`,替换成`;`：
```
C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Users\18190\AppData\Local\Microsoft\WindowsApps;F:\Program Files (x86)\NetSarang\Xshell 7\;E:\dev2\mysql5.58\mysql5.5.8\bin;E:\快捷方式;F:\Program Files (x86)\NetSarang\Xftp 7\;F:\Program Files\scrcpy-win64-v1.18;F:\Program Files\Graphviz\bin;G:\Program Files\Microsoft VS Code\bin;G:\Program Files\Git;G:\dev2\idea_workspace\HexoTools\runable;G:\Program Files\Git\cmd;G:\apache-tomcat-8.5.35\bin;%JAVA_HOME%\bin;%NVM_HOME%;%NVM_SYMLINK%;%NVM_HOME%\nodejs\node_global;
```
### 粘贴回path变量值
再粘贴会path的文本框即可。

还需要注意的是，直接粘贴，可能不会改变Path的值，应该**先删除path的值，清空里面的内容，再进行粘贴**。

### 列表形式
这样再次编辑path显示的就是列表形式的了：
![image-20210729123536129](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210729123536.png)
