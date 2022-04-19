---
title: 批处理 随机数 cmd随机数
categories:
  - Windows
  - CMD
  - 批处理
  - 构建程序相关命令
abbrlink: ce0737a0
date: 2022-04-19 17:46:26
updated: 2022-04-19 18:13:50
---
# 原理
## 随机数变量%random%
cmd中的随机数变量`random`的取值范围为：[0,65535]
```cmd
echo %random%
```
## 获取[0,X]之间的随机数
可以对X+1求余,即可得到[0,x]区间的随机数：
```cmd
%random% % X+1
```
## 获取[X,Y]之间的随机数
先对Y-X+1求余，即可得到[0,Y-X]区间的随机数，
然后再整体加上X，即可得到[0+X,Y-X+X]区间的随机数，也就是[X,Y]区间的随机数。

```cmd
%random% % Y-X+1 +X
```
<!-- more -->
## 示例

### 获取[4,12]之间的随机数

```cmd
set min=4
set max=12
set /a mod=%max% - %min% + 1
set /a test=%RANDOM% % %mod% + %min%
```
### 获取[4,5]区间的随机数
也就是要么是4，要么是5：
```cmd
set min=4
set max=5
set /a mod=%max% - %min% + 1
set /a test=%RANDOM% % %mod% + %min%
```

## .bat文件中的求余符号%要写成%%
上面的命令可在cmd窗口中有效。如果要写成.bat文件，则**需要把求余符号写成两个百分号** `%%`。
也就是写成如下的形式：
```bat test.bat
set min=4
set max=5
set /a mod=%max% - %min% + 1
set /a test=%RANDOM% %% %mod% + %min%
```

### 示例 .bat中生成[0,10]区间的随机数
```bat random.bat
@echo off
pause
:loop
set /a i=%random% %% 10 + 1
echo i=%i%
pause
goto loop
```
运行效果：
```
D:\Desktop\test\CMD>random.bat
请按任意键继续. . .
i=6
请按任意键继续. . .
i=6
请按任意键继续. . .
...... 省略部分输出 .......
i=8
请按任意键继续. . .
i=1
请按任意键继续. . .
i=9
请按任意键继续. . .
i=3
请按任意键继续. . .
i=1
请按任意键继续. . .
i=10
请按任意键继续. . .
i=2
请按任意键继续. . .
请按任意键继续. . .
终止批处理操作吗(Y/N)? y

D:\Desktop\test\CMD>
```

### 示例 在自动化脚本中加入随机数

```bat
chcp 65001
@echo off 
echo 脚本名称[刷视频]
rem ======= 请从以下位置开始编辑脚本 =======

set min=4
set max=12
set /a mod=%max% - %min% + 1

set n=0
:n
set /a n+=1
If %n%==80 goto  nn
echo 第 %n% 次循环

adb shell input swipe 5 1650 5 700 200
echo 从：448.6 1523 滑动到 697 478，持续 200 毫秒

set /a test=%RANDOM% %% %mod% + %min%

echo 延时 %test% 秒
choice /t %test% /d y /n >nul

goto n
:nn
```
# 参考资料
https://www.jianshu.com/p/fc78fda5d251
https://blog.csdn.net/weixin_34387284/article/details/92065189
