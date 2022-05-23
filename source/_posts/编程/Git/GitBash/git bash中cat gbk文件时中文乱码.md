---
title: git bash中cat gbk文件时中文乱码
categories:
  - 编程
  - Git
  - GitBash
abbrlink: 97a36506
date: 2022-05-03 23:24:51
updated: 2022-05-03 23:27:05
---
# git bash中cat gbk文件时中文乱码
```
cat input_id_honor.bat|iconv -f GBK -t UTF-8
```
<!-- more -->
平时仓库中的文件都使用的是utf-8编码的，没怎么遇到乱码。

最近我在写批处理脚本，用的是gbk编码。我发现在git-bash.exe中，cat gbk文件时出现中文乱码，如下所示：
```
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
$ cat input_id_honor.bat
@echo off
echo -------------------▒▒ȡID ▒▒ʼ----------------------
echo     A:U8ENW18117021408
echo     B:192.168.10.4:5555
echo     C:▒▒▒▒ID
echo -----------

choice /c:abc /t 6 /d a /M "▒▒▒▒ѡ▒▒:"
    if %errorlevel% == 3 goto choose_c
    if %errorlevel% == 2 goto choose_b
    if %errorlevel% == 1 goto choose_a

:choose_a
    echo     ѡ▒▒A
    set phone_id=U8ENW18117021408
    goto get_id_end
:choose_b
    echo     ѡ▒▒B
    set phone_id=192.168.10.4:5555
    goto get_id_end
:choose_c
    echo     ѡ▒▒C
    @REM ▒鿴▒▒ǰ▒▒▒ӵ▒▒▒▒▒▒ϵ▒▒ֻ▒▒▒ID
    adb devices -l
    set /p phone_id=▒▒▒▒▒▒▒ֻ▒ID:
    goto get_id_end

:get_id_end
    echo     ▒ֻ▒ID=%phone_id%
echo -------------------▒▒ȡID ▒▒▒▒----------------------
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
```

## 解决方案
在cat命令后后面追加`| iconv -f GBK -t UTF-8`
运行效果：
```
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
$ cat input_id_honor.bat|iconv -f GBK -t UTF-8
@echo off
echo -------------------获取ID 开始----------------------
echo     A:U8ENW18117021408
echo     B:192.168.10.4:5555
echo     C:输入ID
echo -----------

choice /c:abc /t 6 /d a /M "输入选择:"
    if %errorlevel% == 3 goto choose_c
    if %errorlevel% == 2 goto choose_b
    if %errorlevel% == 1 goto choose_a

:choose_a
    echo     选择A
    set phone_id=U8ENW18117021408
    goto get_id_end
:choose_b
    echo     选择B
    set phone_id=192.168.10.4:5555
    goto get_id_end
:choose_c
    echo     选择C
    @REM 查看当前连接到电脑上的手机的ID
    adb devices -l
    set /p phone_id=请输入手机ID:
    goto get_id_end

:get_id_end
    echo     手机ID=%phone_id%
echo -------------------获取ID 结束----------------------
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
```


# 参考资料
https://blog.csdn.net/qq_17046291/article/details/98843295
# 相关链接
https://tcore.cloud/2019/04/24/resolve-git-for-windows-chinese-garbled/