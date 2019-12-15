---
title: 常用cmd命令
categories: 
  - Windows
  - CMD 批处理
  - 语法
  - 构建程序相关命令
date: 2018-12-28 15:38:46
updated: 2019-12-09 19:45:23
abbrlink: 8d229e40
---
## 创建文件 copy con命令 ##
`copy con`是一个功能简单、易于使用的创建文本文件命令,命令中`con`代表计算机屏幕。**`copy con`最初的意思就是`将计算机屏幕上输入的内容存放到指定的文本文件中`**

在命令行输入`copy con file_exist.bat`命令,按回车键,进入屏幕编辑状态。根据需要输入批处理命令,每一行输入一条命令,然后`按回车键进入下一行`。输入所有批处理命令后`按【Ctrl+Z】键,接着再按回车键即可退出编辑状态`,此时已经在当前目录下创建了个名为`file_exist. bat`批处理文件。
## 浏览文件 type命令 ##
type命令主要用来显示文本文件的内容。
语法格式：
```cmd
TYPE [drive:][path]filename
```
例如浏览上面创建的`hello.txt`文件:`type hello.txt`。
## echo命令 ##
`echo`命令可用于在屏幕显示相关的文字信息,还可用于控制批处理文件在执行的过程中是否回显。
命令格式:
```cmd
echo[{on|off)][message]
```
参数说明如下:
- on:允许批处理文件在执行的过程中回显命令。
- off:禁止批处理文件在执行的过程中回显命令。
- message:表示需要显示在屏幕上的信息。
- /?:在命令提示符显示帮助。

创建`echo_test.bat`,然后写入下面的内容：
```cmd
echo on
type hello.txt
echo 现在关闭命令显示!!!!
echo off
type hello.txt
```
直接输echo_test.bat运行该批处理脚本，显示效果如下：
```cmd
D:\学习9\书籍\批处理>echo_test.bat
D:\学习9\书籍\批处理>echo on
D:\学习9\书籍\批处理>type hello.txt
helloworld!
D:\学习9\书籍\批处理>echo 现在关闭命令显示!!!!
现在关闭命令显示!!!!
D:\学习9\书籍\批处理>echo off
helloworld!
D:\学习9\书籍\批处理>
```
可以看到`echo_test.bat`，使用`echo on`打开回显是，执行到第二行的命令`type hello.txt`时,该命令会显示在cmd的输入位置。接着才显示`type hello.txt`这条命令的运行结果。
而使用`echo off`关闭回显之后，`type hello.txt`命令不会显示在命令输入位置，直接显示该命令的运行结果。

**一句话：关闭回显则只显示命令的运行结果，不显示该命令本身。打开回显则先显示该命令本身，然后显示命令运行结果。**

## @命令 ##
**`@`是一个非常简单的命令,用于`禁止当前执行的命令回显在屏幕上`**。`@`不受`echo`命令设置效果的影响,且命令本身不会回显在屏幕上
命令格式:
```bat
@[command]
```
参数说明：
- command:要屏蔽回显的命令。
- 当命令不加任何参数执行时,将不产生任何效果。

在上面echo的例子中，我们可以看到虽然，echo off命令可以关闭其他命令的回显，但是该命令本身还是回显了，可以在前面加上`@`命令，也就是`@echo off`这样就关闭其他命令的回显，也关闭当前命令的回显。
```cmd
@echo on                 
type hello.txt
@echo 现在关闭命令显示!!!! 
@echo off                 
type hello.txt
```
运行结果：
```cmd
D:\学习9\书籍\批处理>type hello.txt
helloworld!现在关闭命令显示!!!!
helloworld!
D:\学习9\书籍\批处理>
```
### 两个关闭回显命令的区别 ###
`@`与`echo`的主要区别在于:
`@`只对当前命令行起作用,且不受`echo`命令的影响;
`echo`命令则影响设置之后的所有命令,一直到出现另一个`echo`命令改变状态为止。
## 流程控制转向命令 goto命令 ##
goto是一个流程控制转向命令,用于控制批处理中的命令执行流程。
命令格式: `goto label`
label:表示批处理文件中某行,该行表示批处理文件新的执行点。
```bat
@echo off
echo 跳过中间命令,直接执行最后一条命令
goto last
echo 中间命令...
:last
echo 已经执行到最后了
```
执行效果：
```cmd
D:\学习9\书籍\批处理>goto_test.bat
跳过中间命令,直接执行最后一条命令
已经执行到最后了
D:\学习9\书籍\批处理>
```
批处理中的标号通常单独占一行,标号行以“`:`”号开头并紧跟标识符,这个标识符将用在“goto”语句后。`标识符中不能含有逗号、冒号等,但可以使用空格`。`标识符的有效长度为最多8个字符`,如果多于8个字符则只识别前8个字符。

## 调用另一个批处理程序 call命令##
从批处理程序调用另一个批处理程序。
**语法格式：**
```
call [drive:][path]filename [batch-parameters] [:label arguments]
```
参数说明：
- `[drive:][path]filename`:指定被调用的批处理文件名,当被调用的批处理文件与
- `label:`用于指定调用位置的标签`,与goto语句中使用的标签类似`。
- `arguments`:对于以``:label``开头的批处理子程序,指定要传送给其新实例的命令行信息,包括命令行选项、文件名、批处理参数或者变量。
**实例:**
创建`called.bat`,写入如下内容：
```bat
echo     开始执行called.bat
echo     ...
echo     执行完毕called.bat
```
这里echo后面写入多个空格是为了显示美观。
然后创建`call_test.bat`,在其中调用`called.bat`,如下所示：
```cmd
@echo off 
echo 开始执行call_test.bat
echo ...
call called.bat
echo ...
call :flag
echo 执行完毕call_test.bat
:flag
echo     执行:flag标号的内容...

```
运行`call_test.bat`,效果如下：
```bat
D:\学习9\书籍\批处理>call_test.bat
开始执行call_test.bat
...
    开始执行called.bat
    ...
    执行完毕called.bat
...
    执行:flag标号的内容...
执行完毕call_test.bat
    执行:flag标号的内容...

D:\学习9\书籍\批处理>
```
当`call_test. bat`批处理执行到`call called.bat`命令时,便转向执行`called.bat`批处理文件中的内容。
`called.bat`文件执行完毕后继续执行`call called.bat`后的命令。

批处理执行到`call :flag`命令后,便开始执行`flag`标号后的语句一直到批处理文件的结尾。**当执行到批处理文件结尾后,执行流程将返回到`call`,并执行后面所有的命令一直到文件结束**,这也是显示两次`执行:flag标号的内容...`的原因。

### call 和goto的区别 ###
- call命令在使用标号时,标识符前必须加上`:`号,而`goto`命令中则不需要加。
- 此外,使用`call`命令转向标号并执行到文件结束时,会返回调用处继续运行下面的命令,
- 而`goto`语句跳转后不再返回。

## 重新启用一个单独的命令行窗口 start命令 ##
“ start”命令用于重新启用一个单独的命令行窗口,然后在新窗口中执行指定的程序或命令
命令格式：
```bat
start ["title"] [/d path] [/i] [/min] [/max] [/separate | /shared]
      [/low | /normal | /high | /realtime | /abovenormal | /belownormal]
      [/node <numa node>] [/affinity <hex affinity mask>] [/wait] [/b]
      [command/program] [parameters]
```
- tite:指定在“命令提示符”窗口标题栏中显示的`标题`。
- **`/d Path`**:指定启动目录。
- **`/i`**:将Cmd,exe启动环境传送到新的“命令提示符”窗口。
- /min:启动新的最小化“命令提示符”窗口。
- /max:启动新的最大化“命令提示符”窗口。
- /separate:在单独的内存空间启动16位程序。
- /shared:在共享的内存空间启动16位程序。

优先级相关参数：

- /low:以空闲优先级启动应用程序。
- /normal:以一般优先级启动应用程序
- /high:以高优先级启动应用程序。
- /realtime:以实时优先级启动应用程序。
- /abovenormal:以超出常规优先级的方式启动应用程序。
- /belownormal:以低出常规优先级的方式启动应用程序。

- **`/wait`**:启动应用程序,并等待其结束。
- **`/b`**:启动应用程序时不必打开新的“命令提示符”窗口。除非应用程序启用【 Ctrl+C组合键操作,否则将忽略【 Ctrl+C】操作。按【Crl+ Break】键可中断应用程序。
- **`command/program`**:先窗口中执行的命令或程序
-** `/parameters:`**指定要传送给命令或程序的参数。

**实例:**

```bat
@echo off
echo 启动新窗口...
start "hello.txt内容" /wait type hello.txt
echo 已经从新窗口返回...
```
运行该文件，会启动一个标题为`hello.txt内容`的新窗口，该窗口中显示的是 `type hello.txt`命令的执行结果
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/cmd/start/new%20console.png)
新打开的“hello.txt内容”窗口中显示了运行的结果,由于“ start”命令中使用了“/wait”参数,所以需要在新窗口中输入“exit”并按回车键,正常退出新打开命令行窗口,“ start_test. bat程序将继续执行“ start”以后的命令:
```cmd
D:\学习9\书籍\批处理>start_test.bat
启动新窗口...
已经从新窗口返回...
D:\学习9\书籍\批处理>
```
如果加上`/b`参数会怎样呢,如下所示：
```bat
@echo off
echo 启动新窗口...
start "hello.txt内容" /wait /b type hello.txt
echo 已经从新窗口返回...
```
运行之后发现，不会弹窗(`/b`的作用),然后旧窗口也会直接运行结束，不会等待。
## 注释 ##

“rem”是一个注释命令,用于在批处理中加入相应的说明信息,这些说明信息可以帮助读者理解批处理的功能。
语法格式: `rem 注释内容...`
实例：
```bat
@echo off
echo 程序运行中...
rem 这是注释
echo 程序运行结束...
```
## set命令 ##
set”专门用来创建、设置、查看或删除环境变量。对于一些功能复杂的批处理程序,自定义变量是不可缺少的。
语法格式：
```bat
set [/a [expression]] [/p [variable=]]string]
```
**实例:**
```bat
@echo off
rem 设置当前目录为环境变量
set var="."
rem 显示目录结果
dir %var%
```
运行结果：
```cmd
D:\学习9\书籍\批处理>set_test.bat
 驱动器 D 中的卷是 原来D盘
 卷的序列号是 E454-E2B9
 D:\学习9\书籍\批处理 的目录
2018/12/20  22:07    <DIR>          .
2018/12/20  22:07    <DIR>          ..
2018/12/20  21:24                72 called.bat
2018/12/20  15:29               157 call_test.bat
2018/12/20  14:52               114 echo_test.bat
2018/12/20  21:13               108 goto_test.bat
2018/12/20  14:30                11 hello.txt
2018/12/20  22:01                65 rem_test.bat
2018/12/20  22:40                79 set_test.bat
2018/12/20  21:55               104 start_test.bat
2018/12/20  14:03        46,773,570 批处理命令在Windows操作中的典型应用.pdf
               9 个文件     46,774,280 字节
               2 个目录 28,290,183,168 可用字节
D:\学习9\书籍\批处理>
```
批处理文件中使用变量时,应该`在变量名前后分别加上一个百分号`,否则无法正确使用变量。
### 批处理脚本中获取用户输入 ###
语法格式:
```cmd
set /p 变量名=提示信息
```
例如，当用户输入y是执行一些指令：
```bat
set /p isCommit=是否提交?(y/n):
if %isCommit%==y (
    一些命令...
)
```
具体如下：
```bat
@echo off
::切换盘符
D:
::进入项目目录
cd D:\dev\workspace\LatexTools
::查看信息
git status
echo.
::让用户来判断是否提交
set /p isCommit=是否提交?(y/n):
if %isCommit%==y (
    set /p message=提交说明:
    git add .
    git commit -m "message"
)
echo.
::让用户来判断是否推送到Github
set /p isPush=是否push到Github?(y/n):
if %isPush%==y (
    git push origin master
)
```
之前项目管理我一直手动来输入git命令，刚开始是为了熟悉命令，后面久了难免繁琐浪费时间，于是写了以上的bat脚本来完成。
**运行效果如下**：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/cmd/set/git_tools.png)
## 设置本地临时环境变量 setlocal ##

`setlocal`命令可在批处理程序运行时设置自身的临时变量环境,且不会影响到系统变量环境设置。