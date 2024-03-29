---
title: 批处理 set命令详解
categories:
  - Windows
  - CMD
  - 批处理
  - 构建程序相关命令
abbrlink: acfff981
date: 2022-04-25 15:20:49
updated: 2022-04-25 15:20:49
---
# 批处理set命令详解
set命令用于在当前cmd窗口中设置环境变量，这些环境变量只对当前cmd窗口有效。
`set /a`可以进行数学运算，如执行加减乘除，求余等。
`set /p`可以读取一行键盘输入。

<!-- more -->
## set帮助文档
```cmd
D:\Desktop\test\CMD>set /?
显示、设置或删除 cmd.exe 环境变量。

SET [variable=[string]]

  variable  指定环境变量名。
  string    指定要指派给变量的一系列字符串。

要显示当前环境变量，键入不带参数的 SET。

如果命令扩展被启用，SET 会如下改变:

可仅用一个变量激活 SET 命令，等号或值不显示所有前缀匹配
SET 命令已使用的名称的所有变量的值。例如:

    SET P

会显示所有以字母 P 打头的变量

如果在当前环境中找不到该变量名称，SET 命令将把 ERRORLEVEL
设置成 1。

SET 命令不允许变量名含有等号。

在 SET 命令中添加了两个新命令行开关:

    SET /A expression
    SET /P variable=[promptString]

/A 命令行开关指定等号右边的字符串为被评估的数字表达式。该表达式
评估器很简单并以递减的优先权顺序支持下列操作:

    ()                  - 分组
    ! ~ -               - 一元运算符
    * / %               - 算数运算符
    + -                 - 算数运算符
    << >>               - 逻辑移位
    &                   - 按位“与”
    ^                   - 按位“异”
    |                   - 按位“或”
    = *= /= %= += -=    - 赋值
      &= ^= |= <<= >>=
    ,                   - 表达式分隔符

如果你使用任何逻辑或取余操作符， 你需要将表达式字符串用
引号扩起来。在表达式中的任何非数字字符串键作为环境变量
名称，这些环境变量名称的值已在使用前转换成数字。如果指定
了一个环境变量名称，但未在当前环境中定义，那么值将被定为
零。这使你可以使用环境变量值做计算而不用键入那些 % 符号
来得到它们的值。如果 SET /A 在命令脚本外的命令行执行的，
那么它显示该表达式的最后值。该分配的操作符在分配的操作符
左边需要一个环境变量名称。除十六进制有 0x 前缀，八进制
有 0 前缀的，数字值为十进位数字。因此，0x12 与 18 和 022
相同。请注意八进制公式可能很容易搞混: 08 和 09 是无效的数字，
因为 8 和 9 不是有效的八进制位数。(& )

/P 命令行开关允许将变量数值设成用户输入的一行输入。读取输入
行之前，显示指定的 promptString。promptString 可以是空的。

环境变量替换已如下增强:

    %PATH:str1=str2%

会扩展 PATH 环境变量，用 "str2" 代替扩展结果中的每个 "str1"。
要有效地从扩展结果中删除所有的 "str1"，"str2" 可以是空的。
"str1" 可以以星号打头；在这种情况下，"str1" 会从扩展结果的
开始到 str1 剩余部分第一次出现的地方，都一直保持相配。

也可以为扩展名指定子字符串。

    %PATH:~10,5%

会扩展 PATH 环境变量，然后只使用在扩展结果中从第 11 个(偏
移量 10)字符开始的五个字符。如果没有指定长度，则采用默认
值，即变量数值的余数。如果两个数字(偏移量和长度)都是负数，
使用的数字则是环境变量数值长度加上指定的偏移量或长度。

    %PATH:~-10%

会提取 PATH 变量的最后十个字符。

    %PATH:~0,-2%

会提取 PATH 变量的所有字符，除了最后两个。

终于添加了延迟环境变量扩充的支持。
该支持总是按默认值被停用，但也可以
通过 CMD.EXE 的 /V 命令行开关而被启用/停用。请参阅 CMD /?

考虑到读取一行文本时所遇到的目前扩充的限制时，延迟环境
变量扩充是很有用的，而不是执行的时候。
以下例子
说明直接变量扩充的问题:

 set VAR=before
 if "%VAR%" == "before" (
set VAR=after
 if "%VAR%" == "after" @echo If you see this, it worked )


不会显示消息，因为在读到第一个 IF 语句时，BOTH IF 语句中的 %VAR% 会被代替；
原因是: 它包含 IF 的文体
，IF 是一个复合语句。所以，
复合语句中的 IF 实际上是在比较 "before"
和"after"，这两者永远不会相等。同样，以下这个例子
也不会达到预期效果:

 set LIST=
 for% i in (*) do set LIST=%LIST%%i
 echo%LIST%

 原因是，它不会在目前的目录中建立一个文件列表，
而只是将LIST 变量设成找到的最后一个文件。
这也是因为 %LIST% 在
FOR 语句被读取时，只被扩充了一次；而且，那时的 LIST 变量是空的。
因此，我们真正执行的 FOR 循环是:

 for% i in (*) do set LIST= %i

这个循环继续将 LIST 设成找到的最后一个文件。

延迟环境变量扩充允许你使用一个不同的
字符(惊叹号)在
执行时间扩充环境变量。如果延迟的变量扩充被启用，
可以将上面例子写成以下所示，以达到预期效果:

 set VAR=before
if "%VAR%" == "before" (
 set VAR=after
 if "!VAR!" == "after" @echo If you see this, it worked
 )

 set LIST=
 for% i in (*) do set LIST=!LIST! %i
 echo %LIST%

如果命令扩展被启用，有几个动态环境变量可以被扩展，但不会出现在 SET 显示的变
量列表中。每次变量数值被扩展时，这些变量数值都会被动态计算。如果用户用这些
名称中任何一个明确定义变量，那个定义会替代下面描述的动态定义:

%CD% - 扩展到当前目录字符串。

%DATE% - 用跟 DATE 命令同样的格式扩展到当前日期。

%TIME% - 用跟 TIME 命令同样的格式扩展到当前时间。

%RANDOM% - 扩展到 0 和 32767 之间的任意十进制数字。

%ERRORLEVEL% - 扩展到当前 ERRORLEVEL 数值。

%CMDEXTVERSION% - 扩展到当前命令处理器扩展版本号。

%CMDCMDLINE% - 扩展到调用命令处理器的原始命令行。

%HIGHESTNUMANODENUMBER% - 扩展到此计算机上的最高 NUMA 节点号。
```
## set：查看所有环境变量
不带参数的set命令会打印所有的环境变量
```cmd
D:\Desktop\test\CMD>set
ALLUSERSPROFILE=C:\ProgramData
APPDATA=C:\\Users\\haha\AppData\Roaming
CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
......
JAVA_HOME=G:\java\java11\jdk-11.0.4
......
NVM_HOME=G:\dev2\nvm
......
```
## SET /A var=math expression：执行数学运算
### 没有使用/a时
```bat D:\Desktop\test\CMD\set\set_a_test.bat
@echo off
@REM 最小的秒
set /a min=5
@REM 最大的秒
set /a max=14
@REM 求平均值
set average=(%max%+%min%)/2
echo min=%min% max=%max% average=%average%
```
运行结果：
```
D:\Desktop\test\CMD\set>test.bat
min=5 max=14 average=(14+5)/2

D:\Desktop\test\CMD\set>
```
可以看到，没有使用/a参数时，等号右边的会当成字符串进行处理，而不是算术表达式。
### 使用/a参数时
```bat D:\Desktop\test\CMD\set\set_a_test.bat
@echo off
@REM 最小的秒
set /a min=5
@REM 最大的秒
set /a max=14
@REM 求平均值
set /a average=(%max%+%min%)/2
echo min=%min% max=%max% average=%average%
```

运行结果：
```
D:\Desktop\test\CMD\set>test.bat
min=5 max=14 average=9

D:\Desktop\test\CMD\set>
```
可以看到使用/a参数后，等号右边的当成数学表达式进行计算，可以正确求得两个数的平均值。
## set /p var=提示信息：读取键盘输入
```bat D:\Desktop\test\CMD\set\set_p.bat
@echo off
set /p input=请输入字符串:
echo input=%input%
pause
```
运行之后，程序阻塞，并且要求用户输入一行字符串：
![image-20220425155159669](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220425155200.png)

运行结果：

```
D:\Desktop\test\CMD\set>set_p.bat
请输入字符串:helloworld!
input=helloworld!
请按任意键继续. . .
```
## set变量默认值
https://zhidao.baidu.com/question/269052314.html

可以提前给变量赋值，然后再使用set /p从键盘读取内容给该变量。运行的时候，不输入任何东西，直接按回车。即可得到默认值。
```bat
set phone_id=75aed56d
set /p phone_id=手机设备ID(默认%phone_id%):
```
![image-20220428182056459](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220428182056.png)

## 示例

```bat D:\Desktop\test\CMD\set\set_p_a.bat
@echo off
:head
echo ............................
set /p input=请输入计算表达式：
@REM 转换成数学表达式
set /a var=%input%
echo 计算结果：%input% = %var%
echo ............................
goto head
```
### 计算加减法
```
D:\Desktop\test\CMD\set>set_p_a.bat
............................
请输入计算表达式：1+9+20+30-10
计算结果：1+9+20+30-10 = 50
............................
```
### 计算除法
除法只能精确到整数
```
............................
请输入计算表达式：10/3
计算结果：10/3 = 3
............................
```
### 负数计算
```
............................
请输入计算表达式：-100+62
计算结果：-100+62 = -38
............................
```
### 求余运算
```
............................
请输入计算表达式：10%3
计算结果：10%3 = 1
............................
```
### 计算复杂表达式
```
............................
请输入计算表达式：(25+75)*2/(15+5)
计算结果：(25+75)*2/(15+5) = 10
............................
```
### dos计算精确范围
DOS计算只能精确到32位，这个32位是指二进制32位，其中最高位为符号位（0为正，1为负），低位31位为数值。 31个1换成十进制为2147483647，所以DOS计算的有效值范围是-2147483648至2147483647，超出该数值范围时计算出错

```
............................
请输入计算表达式：1234567890*9876543210
无效数字。数字精确度限为 32 位。
计算结果：1234567890*9876543210 = 10
............................
```
#### 最大值减1 结果正确
```
............................
请输入计算表达式：2147483647-1
计算结果：2147483647-1 = 2147483646
............................
```
#### 最大值加一 溢出
```
............................
请输入计算表达式：2147483647+1
计算结果：2147483647+1 = -2147483648
............................
```
#### 最小值减一 不正确
```
............................
请输入计算表达式：-2147483648-1
无效数字。数字精确度限为 32 位。
计算结果：-2147483648-1 = -2147483648
............................
```
## 一行代码设置多个变量 同时声明多个变量
```bat D:\Desktop\test\CMD\set\set_a_mul.bat
@echo off
set /a a=1+1,b=2+1,c=3+1
echo %a% %b% %c%
```

运行结果：
```
D:\Desktop\test\CMD\set>set_a_mul.bat
2 3 4
```

未完待续

# 参考资料
https://www.cnblogs.com/boltkiller/articles/4791706.html