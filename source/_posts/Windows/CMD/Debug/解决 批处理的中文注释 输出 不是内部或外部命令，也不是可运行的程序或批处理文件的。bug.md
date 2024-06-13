---
title: 解决 批处理的中文注释 输出 不是内部或外部命令，也不是可运行的程序或批处理文件的。bug
categories:
  - Windows
  - CMD
  - 批处理
abbrlink: '91359636'
date: 2023-08-24 17:23:04
updated: 2023-08-24 17:23:19
---
# 问题描述
最近我在用idea写批处理脚本的时候遇到了一个很无语的bug。

我使用`@REM`在.bat文件中写了**中文注释**。在我运行的时候，程序会莫名其妙的输出一些乱码，并且提示这些乱码 不是内部或外部命令，也不是可运行的程序
或批处理文件。


# 批处理 中文注释 引起 "不是内部或外部命令，也不是可运行的程序或批处理文件。"bug

## 源代码

```bat adbui5.bat
@echo off
setlocal EnableExtensions
@REM 进入当前盘符
%~d0
@REM 进入当前文件所在目录
cd %~dp0
@REM 执行命令，遍历命令的输出结果
@REM 命令的输出的第一行没有我们需要的设备序列号.
@REM 遍历的时候跳过第一行.
@REM 对遍历的每行以空白符进行分隔,取分隔得到的第1个字段作为循环变量的值.
@REM 如果存在多个设备的话,第1个字段就是该设备的序列号.
for /f "skip=1 tokens=1" %%i in ('adb devices -l') do (
    echo -----------------------------------------
    echo --------------------------
    @REM 输出设备的序列号.
    echo current device: %%i
    echo --------------------------
    @REM 遍历文件中的没一行,以空白符作为分隔符来分隔每一行,取每行的分割得到的一个字段作为循环变量的值.
    @REM 文件中每行的第一个字段保存有我们要写在的APP的包名
    for /f "tokens=1" %%k in (adbui.txt) do (
    @REM 执行adb命令获取该设备上安装的所有第三方APP的包名.
    @REM 遍历命令的输出结果,以冒号作为分割符来分割每一行,取分割后的第2段字符串作为循环变量的值.
        for /f "tokens=2 delims=:" %%j in ('adb -s %%i shell pm list packages -3') do (
            @REM 比较文件中的保存的第三方APP包名和设备中的安装的第三方APP的包名.
            @REM 如果两者相等,则说明该包名的APP需要卸载。
            if %%j == %%k (
                echo uninstall: %%j
                echo.
                echo code: adb -s %%i uninstall %%j
                @REM 执行adb命令，从该设备上根据包名卸载这个APP。
                @REM 等真正执行的时候取消下面的注释即可。
                @REM adb -s %%i uninstall %%j
                echo.
            ) else (
                echo no uninstall: %%j
            )

        )
    )

    echo -----------------------------------------
)

```

## 运行结果
运行的部分结果如下所示：

```
PS G:\dev2\idea_workspace\MyJavaTools> adbui5
-----------------------------------------
--------------------------
current device: QWXNU18B27101030
--------------------------
no uninstall: com.quark.browser
no uninstall: com.jooan.qiaoanzhilian
uninstall: com.meta.box

code: adb -s QWXNU18B27101030 uninstall com.meta.box
'姝ｆ墽琛岀殑鏃跺€欏彇娑堜笅闈㈢殑娉ㄩ噴鍗冲彲銆?' 不是内部或外部命令，也不是可运行的程序
或批处理文件。

no uninstall: com.tencent.mobileqq
no uninstall: com.hunantv.imgo.activity
uninstall: com.m4399.gamecenter

code: adb -s QWXNU18B27101030 uninstall com.m4399.gamecenter
'姝ｆ墽琛岀殑鏃跺€欏彇娑堜笅闈㈢殑娉ㄩ噴鍗冲彲銆?' 不是内部或外部命令，也不是可运行的程序
或批处理文件。

no uninstall: com.android.chrome
no uninstall: com.tencent.qqlivepad
uninstall: com.wuba

code: adb -s QWXNU18B27101030 uninstall com.wuba
'姝ｆ墽琛岀殑鏃跺€欏彇娑堜笅闈㈢殑娉ㄩ噴鍗冲彲銆?' 不是内部或外部命令，也不是可运行的程序
或批处理文件。

no uninstall: com.microsoft.emmx
no uninstall: cn.wps.moffice_eng
-----------------------------------------
PS G:\dev2\idea_workspace\MyJavaTools>
```
## 解决：乱码
乱码的问题，是因为我用的编码是UTF-8编码，和Windows的编码不一致造成的，把文件的编码换成GBK后就可以解决。

## 解决：不是内部或外部命令，也不是可运行的程序或批处理文件。
经过都反复确认，我的语法并没有问题。删掉上面的注释后，乱码就消失的。可见问题出现在的注释上。

换成英文的注释，没有乱码，可见出现在中文的注释上。

### 解决方法:使用英文的标点符号
经过我的反复试错，我发现在注释中如果最后一个字符是中文，或者中文的标点符号，当你在末尾按下回车之后，接着写下一条注释的时候就会出现上述的问题。

**把中文注释末尾的中文标点符号删掉，换成英文的标点符号就可以解决这个问题。**

我把中文注释末尾的中文句号，换成英文的点号后就不会出现“不是内部或外部命令，也不是可运行的程序或批处理文件。”这样的提示信息了。

### 修改后的代码

```bat adbui5.bat
@echo off
setlocal EnableExtensions
@REM 进入当前盘符
%~d0
@REM 进入当前文件所在目录
cd %~dp0
@REM 执行命令，遍历命令的输出结果
@REM 命令的输出的第一行没有我们需要的设备序列号.
@REM 遍历的时候跳过第一行.
@REM 对遍历的每行以空白符进行分隔,取分隔得到的第1个字段作为循环变量的值.
@REM 如果存在多个设备的话,第1个字段就是该设备的序列号.
for /f "skip=1 tokens=1" %%i in ('adb devices -l') do (
    echo -----------------------------------------
    echo --------------------------
    @REM 输出设备的序列号.
    echo current device: %%i
    echo --------------------------
    @REM 遍历文件中的没一行,以空白符作为分隔符来分隔每一行,取每行的分割得到的一个字段作为循环变量的值.
    @REM 文件中每行的第一个字段保存有我们要写在的APP的包名
    for /f "tokens=1" %%k in (adbui.txt) do (
    @REM 执行adb命令获取该设备上安装的所有第三方APP的包名.
    @REM 遍历命令的输出结果,以冒号作为分割符来分割每一行,取分割后的第2段字符串作为循环变量的值.
        for /f "tokens=2 delims=:" %%j in ('adb -s %%i shell pm list packages -3') do (
            @REM 比较文件中的保存的第三方APP包名和设备中的安装的第三方APP的包名.
            @REM 如果两者相等,则说明该包名的APP需要卸载。
            if %%j == %%k (
                echo uninstall: %%j
                echo.
                echo code: adb -s %%i uninstall %%j
                @REM 执行adb命令，从该设备上根据包名卸载这个APP.
                @REM 等真正执行的时候取消下面的注释即可.
                @REM adb -s %%i uninstall %%j
                echo.
            ) else (
                echo no uninstall: %%j
            )

        )
    )

    echo -----------------------------------------
)

```
