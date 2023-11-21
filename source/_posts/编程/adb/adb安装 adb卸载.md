---
title: adb安装 adb卸载
categories:
  - 编程
  - adb
abbrlink: 11d7c013
date: 2023-08-24 10:28:13
updated: 2023-08-24 10:28:13
---
# adb安装 apk到手机
从豌豆荚，或者其他应用市场，下载应用的apk文件到电脑上。然后在apk文件的目录下打开cmd，输入如下命令即可安装该应用
```
adb install 应用名称.apk
```
## 示例
把我电脑上的京东.apk安装到Android平板上：
```
adb install 京东.apk
```
命令输出如下：
```
D:\网络共享\可读可写\apk>adb install 京东.apk
Performing Streamed Install
```
此时命令会阻塞一阵子，需要等待命令把apk文件传输到Android设备中，等待一会后，Android设备上会弹出安装界面，点击继续安装即可。如下图所示：
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2023/08/20230824104405.png)
### 安装成功的输出
如果安装成功，命令会输出一个"Success"提示信息。如下所示：

```
D:\网络共享\可读可写\apk>adb install 京东.apk
Performing Streamed Install
Success

D:\网络共享\可读可写\apk>
```
### 安装失败的输出
输出不是"Success"，那就是安装失败了，安装失败的提示如下所示：
```
D:\网络共享\可读可写\apk>adb install 京东.apk
Performing Streamed Install
adb: failed to install 京东.apk: Failure [INSTALL_FAILED_ABORTED: User rejected permissions]

D:\网络共享\可读可写\apk>
```

# adb卸载
## 先获取APP的包名
打开APP，让APP显示在屏幕最上方。
然后输入如下命令获取屏幕最上方的APP的activity：
```
adb shell dumpsys window | findstr mCurrentFocus
```
命令输出如下：
```
D:\网络共享\可读可写\apk>adb shell dumpsys window | findstr mCurrentFocus
  mCurrentFocus=Window{9902caf u0 com.jingdong.app.mall/com.jingdong.app.mall.main.MainActivity}

D:\网络共享\可读可写\apk>
```
命令输出的`com.jingdong.app.mall/com.jingdong.app.mall.main.MainActivity`就是activity名称，activity名称斜杠`/`前面的就是包名`com.jingdong.app.mall`。
## 根据包名卸载APP
```
adb uninstall app_key 包名
```
## 示例
卸载刚才安装的京东APP：

```
adb uninstall com.jingdong.app.mall
```

卸载成功效果：
```
D:\网络共享\可读可写\apk>adb uninstall com.jingdong.app.mall
Success

D:\网络共享\可读可写\apk>
```

# 批量卸载第3方APP
## 使用批处理

应用包名文件：
### adbui.txt
这个文件保存了需要卸载的应用的包名，和应用名，其中包名是必须的，并且必须写在第一列。因为后面的批处理文件主要读取的是第一列的内容。
第二列写应用名，应用名不是必须的，可以不写，因为后面的批处理文件不会读取第2列的内容。
```txt adbui.txt
com.meta.box 233乐园
com.m4399.gamecenter 4399游戏盒
com.wuba
```
### 批处理文件
```bat adbui.bat
@echo off
:: 进入当前批处理所在的盘符
%~d0
:: 进入当前批处理文件所在目录
cd %~dp0
:: 遍历同目录下的adbui.txt文件，读取第一个字段到变量i中，对每一个变量i执行一次adb卸载命令。
for /f "tokens=1" %%i in (adbui.txt) do adb uninstall %%i
:: "tokens=1" 表示获取txt文件每行的第一列作为变量的值。
```
执行效果：
```
PS G:\dev2\idea_workspace\MyJavaTools\runable> adbui
Success
Success
Success
PS G:\dev2\idea_workspace\MyJavaTools\runable
```
如果Android设备中并没有安装这些应用，则卸载失败。


## 改进
### adb列出第三方apk
```
adb shell pm list packages -3
```
### adbui4.bat
先列出第三方应用，然后在第三方应用列表中查找 adbui.txt中的包名，如果找到，再使用adb卸载命令。
```bat adbui4.bat
@echo off
setlocal EnableExtensions
:: 进入当前盘符
%~d0
:: 进入当前文件所在目录
cd %~dp0
@REM 遍历adb命令的输出结果，以冒号作为分隔符，取命令输出的 每行分隔后得到的第2个字段作为
for /f "tokens=2 delims=:" %%i in ('adb shell pm list packages -3') do (
    echo %%i
    for /f "tokens=1" %%j in (adbui.txt) do (
        if %%i == %%j (
            echo %%j == %%i
            @REM 相等，执行卸载命令
            echo 卸载
            adb uninstall %%i
        )
    )
)
```
## 改进2
存在多个设备的情况

```bat
@echo off
setlocal EnableExtensions
@REM 进入当前盘符
%~d0
@REM 进入当前文件所在目录
cd %~dp0
@REM  遍历命令的输出结果，
@REM 第一行的输出没有我们需要的序列号，skip=1表示跳过第一行
@REM for默认以空白符分割每行，tokens=1表示在分割结果中取第1个字段作为循环变量的值

for /f "skip=1 tokens=1" %%i in ('adb devices -l') do (
    echo -----------------------------------------
    echo --------------------------
    echo current device: %%i
    echo --------------------------

@REM     使用文件中的第一个字符作为循环变量的值，
@REM     这个文件中的第一个字段保存我们需要卸载的APP的包名
@REM     从文件中读取要卸载的APP的包名

    for /f "tokens=1" %%k in (adbui.txt) do (

@REM      执行命令列出该设备上的第三方APP的包名，
@REM      遍历命令的输出结果，以冒号分割命令的每行输出

        for /f "tokens=2 delims=:" %%j in ('adb -s %%i shell pm list packages -3') do (
            
            if %%j == %%k (
                echo uninstall: %%j
                echo.
                echo code: adb -s %%i uninstall %%j
@REM            adb -s %%i uninstall %%j
                echo.
            ) else (
                echo no uninstall: %%j
            )

        )
    )

    echo -----------------------------------------
)
```











### 参考资料
https://www.w3cschool.cn/pclrmsc/yqaho0.html
https://www.w3cschool.cn/pclrmsc/gmjsnz.html
