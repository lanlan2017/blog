---
title: cmd shutdown命令
categories: 
  - Windows
  - CMD
  - 批处理
  - 系统相关命令
abbrlink: 4508a6a3
date: 2019-09-04 00:23:58
updated: 2022-04-04 16:40:28
---
# cmd shutdown命令
## 帮助文档
```cmd
用法: shutdown [/i | /l | /s | /sg | /r | /g | /a | /p | /h | /e | /o] [/hybrid] [/soft] [/fw] [/f]
    [/m \\computer][/t xxx][/d [p|u:]xx:yy [/c "comment"]]

    没有参数   显示帮助。这与键入 /? 是一样的。
    /?         显示帮助。这与不键入任何选项是一样的。
    /i         显示图形用户界面(GUI)。
               这必须是第一个选项。
    /l         注销。这不能与 /m 或 /d 选项一起使用。
    /s         关闭计算机。
    /sg        关闭计算机。在下一次启动时，
               重启任何注册的应用程序。
    /r         完全关闭并重启计算机。
    /g         完全关闭并重新启动计算机。在重新启动系统后，
               重启任何注册的应用程序。
    /a         中止系统关闭。
               这只能在超时期间使用。
               与 /fw 结合使用，以清除任何未完成的至固件的引导。
    /p         关闭本地计算机，没有超时或警告。
               可以与 /d 和 /f 选项一起使用。
    /h         休眠本地计算机。
               可以与 /f 选项一起使用。
    /hybrid    执行计算机关闭并进行准备以快速启动。
               必须与 /s 选项一起使用。
    /fw        与关闭选项结合使用，使下次启动转到
               固件用户界面。
    /e         记录计算机意外关闭的原因。
    /o         转到高级启动选项菜单并重新启动计算机。
               必须与 /r 选项一起使用。
    /m \\computer 指定目标计算机。
    /t xxx     将关闭前的超时时间设置为 xxx 秒。
               有效范围是 0-315360000 (10 年)，默认值为 30。
               如果超时时间大于 0，则默示为
               /f 参数。
    /c "comment" 有关重新启动或关闭的原因的注释。
               最多允许 512 个字符。
    /f         强制关闭正在运行的应用程序而不事先警告用户。
               如果为 /t 参数指定大于 0 的值，
               则默示为 /f 参数。
    /d [p|u:]xx:yy  提供重新启动或关闭的原因。
               p 指示重启或关闭是计划内的。
               u 指示原因是用户定义的。
               如果未指定 p 也未指定 u，则重新启动或关闭
               是计划外的。
               xx 是主要原因编号(小于 256 的正整数)。
               yy 是次要原因编号(小于 65536 的正整数)。

此计算机上的原因:
(E = 预期 U = 意外 P = 计划内，C = 自定义)
类别    主要     次要    标题

 U      0    0    其他(计划外)
E       0    0    其他(计划外)
E P     0    0    其他(计划内)
 U      0    5    其他故障: 系统没有反应
E       1    1    硬件: 维护(计划外)
E P     1    1    硬件: 维护(计划内)
E       1    2    硬件: 安装(计划外)
E P     1    2    硬件: 安装(计划内)
E       2    2    操作系统: 恢复(计划外)
E P     2    2    操作系统: 恢复(计划内)
  P     2    3    操作系统: 升级(计划内)
E       2    4    操作系统: 重新配置(计划外)
E P     2    4    操作系统: 重新配置(计划内)
  P     2    16    操作系统: Service Pack (计划内)
        2    17    操作系统: 热修补(计划外)
  P     2    17    操作系统: 热修补(计划内)
        2    18    操作系统: 安全修补(计划外)
  P     2    18    操作系统: 安全修补(计划内)
E       4    1    应用程序: 维护(计划外)
E P     4    1    应用程序: 维护(计划内)
E P     4    2    应用程序: 安装(计划内)
E       4    5    应用程序: 没有反应
E       4    6    应用程序: 不稳定
 U      5    15    系统故障: 停止错误
 U      5    19    安全问题(计划外)
E       5    19    安全问题(计划外)
E P     5    19    安全问题(计划内)
E       5    20    网络连接丢失(计划外)
 U      6    11    电源故障: 电线被拔掉
 U      6    12    电源故障: 环境
  P     7    0    旧版 API 关机

```
## shutdown /i

启动后的图形界面如下图所示，但是我看不懂该怎么操作。知道就行。

![image-20220426132253567](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220426132253.png)

## shutdown /h

这个命令可以让当前计算机立即休眠。
需要注意的是，`shutdown /h -t 60`这样的命令是错误的。

## 应用
### 定时关机

|命令|描述|
|:---|:---|
|`shutdown -s -t 0`|立即关机|
|`shutdown -s -t 3600`|3600秒后关机|

### 在执行其他命令后休眠
可以使用`&&`符号把命令链接起来,例如:
`A命令 && B命令`的意思是`先执行A命令`,`如果A命令执行成功则执行B命令`。
我有使用Hexo写博客,在睡觉之前我会发布博客,但是发布需要一定的时间,可以通过在发布命令后用`&&`连接上休眠命令`shutdown /h`，这样发布接收之后就会休眠电脑。
休眠的好处就是下次开机不用打开常用的软件.

|命令|描述|
|:---|:---|
|`hexo clean&&hexo g&&hexo d&&shutdown /h`|发布`Hexo`博客后休眠电脑|
