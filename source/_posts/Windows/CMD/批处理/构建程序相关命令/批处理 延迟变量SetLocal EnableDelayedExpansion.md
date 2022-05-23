---
title: 批处理 延迟变量SetLocal EnableDelayedExpansion
categories:
  - Windows
  - CMD
  - 批处理
  - 构建程序相关命令
abbrlink: 58cb8d9
date: 2022-05-08 11:01:24
updated: 2022-05-08 11:01:24
---
# 批处理 延迟变量SetLocal EnableDelayedExpansion
在cmd执行命令前会对脚本进行预处理，其中有一个过程是变量识别过程，在这个过程中，如果有两个%括起来的如%value%类似这样的变量，就会对其进行识别，并且查找这个变量对应的值，再而将值替换掉这个变量，这个替换值的过程,就叫做变量扩展，然后再执行命令。

## 示例0
```bat D:\Desktop\test\CMD\延迟变量\test0.bat
set value=kkkkkkk 
echo %value% 
```
将这段代码保存到`test0.bat`文件中。然后打开cmd，进到对应目录下，执行这个文件。

运行结果：
```
D:\Desktop\test\CMD\延迟变量>test0.bat

D:\Desktop\test\CMD\延迟变量>set value=kkkkkkk

D:\Desktop\test\CMD\延迟变量>echo kkkkkkk
kkkkkkk

```

最后一行是结果，但是在结果之前，还有两句，set value=kkkkkkk 和 echo kkkkkkk。
但是在test0.bat中，我们并没有写echo kkkkkkk这样的语句，这表明至少在执行到echo %value% 这句时，cmd已经把 变量value 替换成 kkkkkkk这个值。

这就是变量的扩展

那么什么是变量的延迟扩展呢？
## 变量延迟两要素
- 变量延迟的启动语句是“SetLocal EnableDelayedExpansion”，
- 并且变量要用一对英文感叹号“!!”括起来

<!-- more -->
延迟变量，全称延迟环境变量扩展。

```
set：设置
local：本地（环境变量）
enable：能够
delayed：延迟
expansion：扩展
SetLocal EnableDelayedExpansion就是扩展本地环境变量延迟，
```

## 示例1
```bat D:\Desktop\test\CMD\延迟变量\test1.bat
@echo off 
set a=4 
set a=5&echo %a% 
pause 
```
运行结果：
```
D:\Desktop\test\CMD\延迟变量>test1.bat
4
请按任意键继续. . .
```
为什么是4而不是5呢？在echo之前明明已经把变量a的值改成5了。
### 原因
这是因为**批处理读取命令时是按行读取的**（另外例如for命令等，其后用一对圆括号闭合的所有语句也当作一行），在处理之前要完成必要的预处理工作，这其中就包括对该行命令中的变量赋值。

批处理在运行到这句“`set a=5&echo %a%`”之前，先把这一句整句读取并做了预处理——对变量a赋了值，那么`%a%`当然就是4了！
## 延迟对变量赋值
而为了能够感知环境变量的动态变化，批处理设计了变量延迟。简单来说，**在读取了一条完整的语句之后，不立即对该行的变量赋值，而会在某个单条语句执行之前再进行赋值，也就是说“延迟”了对变量的赋值**。

那么如何开启变量延迟呢？变量延迟又需要注意什么呢？

### 示例2
```bat D:\Desktop\test\CMD\延迟变量\test2.bat
@echo off 
SetLocal EnableDelayedExpansion
set a=4 
set a=5&echo !a! 
pause
```
运行结果：
```
D:\Desktop\test\CMD\延迟变量>test2.bat
5
请按任意键继续. . .
```
由于启动了变量延迟，这次运行得到了正确的结果。

在上面的示例2中，
- 首先“SetLocal EnableDelayedExpansion”开启变量延迟，
- 然后“set a=4”先给变量a赋值为4，
- “set a=5&echo !a!”这句是给变量a赋值为5并输出。
  - 由于启动了变量延迟，所以批处理能够感知到动态变化，即不是先给该行变量赋值，而是在运行过程中给变量赋值，因此此时a的值就是5了。

### 示例3
```bat D:\Desktop\test\CMD\延迟变量\test3.bat
@echo off 
SetLocal EnableDelayedExpansion
for /l %%i in (1,1,5) do ( set a=%%i & echo !a! ) 
pause
```
运行结果：
```
D:\Desktop\test\CMD\延迟变量>test3.bat
1
2
3
4
5
请按任意键继续. . .
```
本例开启了变量延迟并用“!!”将变量扩起来，因此得到我们预期的结果。如果不用变量延迟会出现什么结果呢？
## 示例4
```bat D:\Desktop\test\CMD\延迟变量\test4.bat
@echo off 
@REM SetLocal EnableDelayedExpansion
@REM for /l %%i in (1,1,5) do ( set a=%%i & echo !a! ) 
for /l %%i in (1,1,5) do ( set a=%%i & echo %a% ) 
pause

```
运行结果：
```
D:\Desktop\test\CMD\延迟变量>test4.bat
5
5
5
5
5
请按任意键继续. . .
```
可以看到echo没有感知到到for语句中变量a的动态变化

## 示例5
```bat D:\Desktop\test\CMD\延迟变量\test5.bat
@echo off 
for /l %%i in (1,1,10) do ( 
    set "str=%%i"
    echo %str% 
) 
pause>nul
```
运行结果：
```
D:\Desktop\test\CMD\延迟变量>test5.bat
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。
ECHO 处于关闭状态。

D:\Desktop\test\CMD\延迟变量>
```
## 示例6
```bat D:\Desktop\test\CMD\延迟变量\test6.bat
@echo off
SetLocal EnableDelayedExpansion
for /l %%i in (1,1,10) do ( 
    set "str=%%i" 
    echo !str! 
) 
pause>nul 
```
运行结果：
```
D:\Desktop\test\CMD\延迟变量>test6.bat
1
2
3
4
5
6
7
8
9
10

D:\Desktop\test\CMD\延迟变量>
```

示例5和示例6的的for循环前str都是没有被定义的，而由于示例5的代码没有开启变量延迟，所以str值一直是没有定义，因而显示出了10行报错信息。

而示例6代码开启了变量延迟，在for循环中每次赋予str的值被传递下去，因而会正确显示10行数字，但这里的**str变量符必须要写成!str!**。


# 参考资料
https://www.jb51.net/article/29323.htm