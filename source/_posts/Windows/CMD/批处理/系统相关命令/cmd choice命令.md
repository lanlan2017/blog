---
title: cmd choice命令
categories: 
  - Windows
  - CMD
  - 批处理
  - 系统相关命令
abbrlink: bb8611bd
date: 2019-12-22 11:20:19
updated: 2022-04-04 15:16:49
---
# cmd choice命令
## 帮助文档
```java
C:\Users\lan>choice /?

CHOICE [/C choices] [/N] [/CS] [/T timeout /D choice] [/M text]

描述:
    该工具允许用户从选择列表选择一个项目并返回所选项目的索引。

参数列表:
   /C    choices       指定要创建的选项列表。默认列表是 "YN"。

   /N                  在提示符中隐藏选项列表。提示前面的消息得到显示，
                       选项依旧处于启用状态。

   /CS                 允许选择分大小写的选项。在默认情况下，这个工具
                       是不分大小写的。

   /T    timeout       做出默认选择之前，暂停的秒数。可接受的值是从 0
                       到 9999。如果指定了 0，就不会有暂停，默认选项
                       会得到选择。

   /D    choice        在 nnnn 秒之后指定默认选项。字符必须在用 /C 选
                       项指定的一组选择中; 同时，必须用 /T 指定 nnnn。

   /M    text          指定提示之前要显示的消息。如果没有指定，工具只
                       显示提示。

   /?                  显示此帮助消息。

   注意:
   ERRORLEVEL 环境变量被设置为从选择集选择的键索引。列出的第一个选
   择返回 1，第二个选择返回 2，等等。如果用户按的键不是有效的选择，
   该工具会发出警告响声。如果该工具检测到错误状态，它会返回 255 的
   ERRORLEVEL 值。如果用户按 Ctrl+Break 或 Ctrl+C 键，该工具会返回 0
   的 ERRORLEVEL 值。在一个批程序中使用 ERRORLEVEL 参数时，将参数降
   序排列。

示例:
   CHOICE /?
   CHOICE /C YNC /M "确认请按 Y，否请按 N，或者取消请按 C。"
   CHOICE /T 10 /C ync /CS /D y
   CHOICE /C ab /M "选项 1 请选择 a，选项 2 请选择 b。"
   CHOICE /C ab /N /M "选项 1 请选择 a，选项 2 请选择 b。"
```

## choice命令的 选项
/c参数用来指定choice命令的选项
例如:
```
choice /c:abc
```
则有a,b,c三个选项,运行效果如下所示:
```
G:\Desktop\Vscode测试>choice /c:abc
[A,B,C]?
```
## 隐藏choice命令的 输出
```cmd
choice /c:abc /n
```
虽然输出的信息隐藏了,但是还是要输入选项的,运行效果:
```
G:\Desktop\Vscode测试>choice /c:abc /n
A

G:\Desktop\Vscode测试>
```

## choice命令的 提示信息
/m参数用来指定choice命令的提示信息,例如:
```bat
choice /c:abc /m 输入你的选择
```
运行效果:
```
E:\Blog\blog\source\_posts\Windows\CMD 批处理\语法\系统相关命令>choice /c:abc /m 输入你的选择
输入你的选择 [A,B,C]?
```

## choice命令的 选项 区分大小写
choice命令默认不区分大小写,如果加上/CS参数,则选项区分大小写,并且在输入选项的时候,用户是不可以按shift+字母来输入大写的,只能单独输入小写,例如:
```bat
choice /c:abc /m 输入你的选择 /cs
```
运行效果如下:
```
E:\Blog\blog\source\_posts\Windows\CMD 批处理\语法\系统相关命令>choice /c:abc /m 输入你的选择
输入你的选择 [A,B,C]?
E:\Blog\blog\source\_posts\Windows\CMD 批处理\语法\系统相关命令>choice /c:abc /m 输入你的选择 /cs
输入你的选择 [a,b,c]?a
```

## choice命令的 返回值
choice命令的返回值保存在变量errorlevel中,例如如下的choice命令
```cmd
choice /c:abc
```
- 如果选择的是a,则返回1
- 如果选择的是b,则返回2
- 如果选择的是c,则返回3
- 以此类推

### 控制语句
利用choice命令的返回值我们可以做一些分支程序:
```bat
@echo off
choice /c:abc /M 输入选择
if errorlevel 3 goto c
 REM 应先判断数值最高的错误码
if errorlevel 2 goto b
if errorlevel 1 goto a
 
:c
echo 进入程序段c
pause
goto end
 
:b
echo 进入程序段b
pause
goto end
 
:a
echo 进入程序段a
pause

:end
echo 程序结束
```

## 延时
choice命令还可以完成倒计时的功能,这个需要同时使用/c,/t,/d,三个参数,
- /c指定有哪些选项,当然/c参数可以省略,如果省略,则默认的选项是Y和N
- /t参数指定等待的时间
- /d参数指定超时的时候的默认的选项,这个选项必须在/c指定的选项中.如果省略的/c参数,则/d参数只能是Y或者N

### 多选项延时
```
choice /c abc /t 2 /d a
```

#### 程序 多选项延时分支
```bat
@echo off
choice /c:abc /M 输入选择 /t 5 /d c

IF ERRORLEVEL 3 (
    goto c
)
IF ERRORLEVEL 2 (
    goto b
)
IF ERRORLEVEL 1 (
    GOTO a
)

:c
    echo 你选择c    
    goto end
:b
    echo 你选择b
    goto end
:a
    echo 你选择a    
    goto end
:end
    pause
```
刚开始程序的运行效果如下:
```
G:\Desktop\Vscode测试>Delay.bat
输入选择 [A,B,C]?
```
现在什么都不要输入,程序将会延时五秒,然后**程序会自动选择/d指定的选项,也就c选项**:
```
G:\Desktop\Vscode测试>Delay.bat
输入选择 [A,B,C]?C
你选择c    
请按任意键继续. . .
```

### 默认延时
上面已经说过,如果省略/c则/d后面只能指定y或者n,与上面类似
```cmd
choice /t 秒数 /d [Y,N]
```
例如延时5秒:
```cmd
choice /t 5 /d y
```

#### 程序 两个选项的延时控制
```bat
@echo off
choice /t 5 /d n /m 是否进行下一步(默认:n)
IF ERRORLEVEL 2 (
    goto n
)
:n
    echo 你选择N
    goto end
:y
    echo 你选择Y
    goto end
:end
    echo 程序结束
```
运行结果:
```
G:\Desktop\Vscode测试>Delay2.bat
是否进行下一步(默认:n) [Y,N]?N
你选择N
程序结束
```
