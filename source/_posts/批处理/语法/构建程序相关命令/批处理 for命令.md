---
title: 批处理 for命令
categories: 
  - 批处理
  - 语法
  - 构建程序相关命令
date: 2019-02-01 21:57:48
updated: 2019-11-14 11:39:32
abbrlink: c4029a06
---
<div id='my_toc'>

- [命令格式](/blog/c4029a06/#命令格式)
    - [无参数](/blog/c4029a06/#无参数)
    - [参数 /d](/blog/c4029a06/#参数-d)
    - [参数 /R](/blog/c4029a06/#参数-R)
    - [参数 /L](/blog/c4029a06/#参数-L)
    - [参数 /F](/blog/c4029a06/#参数-F)
- [参考资料](/blog/c4029a06/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 命令格式 ##
```cmd
for [参数] %%变量名 in (相关文件或命令) do 执行的命令
```
对一个或一组`文件`，`字符串`或`命令结果`中的每一个对象执行特定命令，达到我们想要的结果。
**注意**:
- 在`批处理文件`中使用 `for` 命令时，指定变量请使用 `%%variable`,而不要用 `%variable`,而在cmd窗口中直接输入的for命令则使用`%variable`的形式。
- 变量名称是区分大小写的，所以 `%i` 不同于 `%I`.

for命令可以带参数或不带参数，带参数时支持以下参数:`/d`,`/l`,`/r`,`/f`.
### 无参数 ###
```cmd
for %variable in (set) do command [command-parameters]
```
- `%variable`: 指定一个单一字母可替换的参数。
- `(set)`:指定一个或一组**文件**。可以使用通配符。
- `command`:指定对每个文件执行的命令。
- `command-parameters`:为特定命令指定参数或命令行开关。

#### 实例 ####
显示当前目录下与`t*.*`相匹配的文件(只显示文件名，不显示路径)
```cmd
for %%i in (t*.*) do echo %%i 
```
显示`d:\mydocuments\`目录下与*.doc相匹配的文件
```cmd
for %%i in (d:\mydocuments\*.doc) do @echo %%i 
```
### 参数 /d ###
```cmd
for /d %variable in (set) do command [command-parameters]
```
这个参数主要用于目录搜索,不会搜索文件,`/d` 参数只能指定目录下的目录名字,不会显示该目录的子目录下的目录。也就是只会搜索指定目录下的目录，不会搜索再下一级的目录。
#### 实例 ####
显示c盘根目录下的所有目录
```bat
@echo off
for /d %%i in (c:\*) do echo %%i
```
运行效果:
```
D:\学习9\书籍\批处理>for_d.bat
c:\Analog
c:\AppData
c:\Intel
c:\PerfLogs
c:\Program Files
c:\Program Files (x86)
c:\Update
c:\Users
c:\Windows
```
显示当前目录下名字只有1-3个字母的目录
```bat
@echo off
for /d %%i in (????) do echo %%i
```
运行效果:
```
D:\学习9\书籍\批处理>for_d2.bat
1
22
333
4444
测试目录
```
### 参数 /R ###
```bat
for /r [[drive:]path] %variable in (set) do command [command-parameters]
```
此命令会搜索指定路径及所有子目录中与set相符合的所有`文件`，注意是指定路径及所有子目录。
- set中的文件名
	- 如果含有通配符(`？`或`*`)，则列举`/R`参数指定的目录及其下面的子目录中与set相符合的所有文件，无相符文件的目录则不列举。
	- 如果set中为具体文件名，不含通配符，则枚举该目录树(并在后面加上具体的文件名)，而不管set中的指定文件是否存在。


#### 实例 ####
遍历`D:\dev\workspace\LatexTools`目录树,列出目录树上的所有的`java`文件
for_r1.bat:
```cmd
@echo off
for /r D:\dev\workspace\LatexTools %%i in (*.java) do echo %%i
```
运行结果:
```
D:\学习9\书籍\批处理>for_r1.bat
D:\dev\workspace\LatexTools\src\cos\tools\COSTools.java
D:\dev\workspace\LatexTools\src\latex\symbols\LatexArraow.java
D:\dev\workspace\LatexTools\src\latex\symbols\LatexInftyGenerator.java
D:\dev\workspace\LatexTools\src\latex\tools\Latex.java
D:\dev\workspace\LatexTools\src\latex\tools\LatexMain.java
D:\dev\workspace\LatexTools\src\math\tools\CrossMultiplication.java
```
for_r2.bat：
```bat
@echo off
for /r D:\dev\workspace\LatexTools %%i in (index.html) do if exist %%i echo %%i
```
运行结果:
```
D:\学习9\书籍\批处理>for_r2.bat
D:\dev\workspace\LatexTools\bin\index.html
D:\dev\workspace\LatexTools\bin\latex\symbols\index.html
D:\dev\workspace\LatexTools\src\index.html
D:\dev\workspace\LatexTools\src\latex\symbols\index.html
```
### 参数 /L ###
格式：
```bat
for /l %variable in (start,step,end) do command [command-parameters]
```
该集`(start,step,end)`表示以增量Step形式从开始到结束的一个数字序列。可以使用负的Step
- `for /l %%i in (1,1,5) do @echo %%i` 
	- 输出:`1,2,3,4,5`
- `for /l %%i in (1,2,10) do @echo %%i` 
	- 增量为2输出:`1,3,5,7,9`
- `for /l %%i in (100,-20,1) do @echo %%i` 
	- 增量为-20,输出:`100,80,60,40,20`
- `for /l %%i in (1,1,5) do start cmd` --打开5个CMD窗口
- `for /l %%i in (1,1,5) do md %%i` --建立名称为`1,2,3,4,5`的5个文件夹
- `for /l %%i in (1,1,5) do rd /q %%i` --删除从1~5共5个文件夹

### 参数 /F ###
使用文件解析来处理`命令输出`、`字符串`及`文件内容`。使用迭代变量(%%i,%%j,...)定义要检査的内容或字符串,并使用各种 `options`选项进一步修改解析方式。使用 options`令牌选项`(tokens)指定哪些令牌应该作为迭代变量.
请注意:在没有使用令牌选项时,/F将只检查第一个令牌.
#### 文件解析过程 ####
文件解析过程包括读取`命令输出`、`字符串`或`文件内容`,将其`分成独立的文本行`以及**再将每行`解析成`零个或更多个`令牌`**。然后通过为令牌对应的迭代变量设置值,调用for循环。
#### 格式 ####
```
for /f ["options"] %variable in (file-set) do command [command-parameters]
for /f ["options"] %variable in ("string") do command [command-parameters]
for /f ["options"] %variable in ('command') do command [command-parameters]
```
带引号的字符串`"options"`包括一个或多个
- `eol=c`:指一个行注释字符的结尾(`就一个`)
- `skip=n`:指在文件开始时忽略的行数。
- `delims=xxx`:指分隔符集。
- `tokens=x,y,m-n`:指每行的哪一个符号被传递到for的迭代变量的。这会导致额外变量名称的分配。
	- `m-n`格式为一个范围。通过nth符号指定mth。
	- 如果符号字符串中的最后一个字符为**星号**`*`,这表示把剩下的字符留给下一个迭代变量。经测试,该参数最多只能区分31个字段。
- `usebackq`：使用后引号(键盘上数字1左面的那个键: **\`** )
	- 未使用参数 `usebackq` 时:
		- `file-set`表示文件,但**不能含有空格**,
		- 双引号表示字符串,即"string"
		- 单引号表示执行命令,即`command`
	- 使用参数 usebackq时:
		- `file-set`和双引号,即:`"file-set"`,都表示文件,好处在于:当文件路径或名称中有空格时,就可以用双引号括起来.
		- 单引号表示字符串,即:`'sting'`
		- 后引号(反引号)表示命令执行,即:**\`command\`**


#### 实例 ####
```bat
@echo off
rem 首先建立临时文件 test.txt
echo ;注释行,这是临时文件,用完删除>test.txt
echo 11段 12段 13段 14段 15段 16段>>test.txt
echo 21段,22段,23段,24段,25段,26段>>test.txt
echo 31段-32段-33段-34段-35段-36段>>test.txt
FOR /F "eol=;tokens=1,3* delims=,- " %%i in (test.txt) do echo %%i %%j %%k
pause
Del test.txt
```
运行结果:
```
D:\学习9\书籍\批处理>for_f3.bat
11段 13段 14段 15段 16段
21段 23段 24段,25段,26段
31段 33段 34段-35段-36段
请按任意键继续. . .
```
解释:
- `eol=;`分号开头的行为注释行,扫描到改行for命令直接跳过。
- `tokens=1,3*`将每行第`1`段第`3`段和`剩余字段`(`*`)分别赋予变量`%%i`,`%%j`,`%%k`
- `delims=,- `(减号后有一空格)以`逗号``减号`和`空格`为分隔符,空格必须放在最后

另外/F参数还可以以输出命令的结果看这个例子:
```bat
@echo off
FOR /F "delims=" %%i in ('net user') do @echo %%i
pause
```
这样你本机全部帐号名字就出来了
把扩号内的内容用两个`单引号`包裹起来,就表示单引号内的内容`当命令来执行`,
FOR会返回命令的每行结果,加那个`"delims="`是为了能`让有空格的行能整行显示出来`,**不加就只显示空格左边一列**!
运行结果:
```
D:\学习9\书籍\批处理>for_f4.bat
\\DESKTOP-8ISAT6B 的用户帐户
-------------------------------------------------------------------------------
Administrator            DefaultAccount           Guest
lan                      WDAGUtilityAccount
命令成功完成。
请按任意键继续. . .
```
## 参考资料 ##
[http://www.hechaku.com/arcitle/201810398.html](http://www.hechaku.com/arcitle/201810398.html)
[http://www.hechaku.com/arcitle/201810344.html](http://www.hechaku.com/arcitle/201810344.html)

>原文链接: [批处理 for命令](https://lanlan2017.github.io/blog/c4029a06/)
