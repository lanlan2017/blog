---
title: 批处理给Android设备批量卸载APP
categories: 
  - Windows
  - CMD
  - 应用
abbrlink: b3f4e072
date: 2023-08-24 17:49:16
updated: 2023-08-24 17:49:38
---
```bat adbui.bat
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
                adb -s %%i uninstall %%j
                echo.
            ) else (
                echo no uninstall: %%j
            )

        )
    )
    echo -----------------------------------------
)
```