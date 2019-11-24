---
title: cmd schtasks命令
categories: 
  - 批处理
  - 语法
  - 系统相关命令
date: 2019-09-25 00:35:36
updated: 2019-11-14 11:39:33
abbrlink: b1b65659
---
<div id='my_toc'>

- [schtask命令文档](/blog/b1b65659/#schtask命令文档)
    - [创建新任务计划](/blog/b1b65659/#创建新任务计划)
        - [schtasks /create文档](/blog/b1b65659/#schtasks-create文档)
    - [定时关机](/blog/b1b65659/#定时关机)
        - [先用计算器测试](/blog/b1b65659/#先用计算器测试)
    - [查询任务计划](/blog/b1b65659/#查询任务计划)
        - [语法](/blog/b1b65659/#语法)
    - [删除任务计划](/blog/b1b65659/#删除任务计划)
        - [删除上面创建的任务](/blog/b1b65659/#删除上面创建的任务)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# schtask命令文档 #
```cmd
schtasks /parameter [arguments] 

描述:
    允许管理员创建、删除、查询、更改、运行和中止本地或远程系统上的计划任务。

参数列表:
    /create         创建新计划任务。

    /delete         删除计划任务。

    /query          显示所有计划任务。

    /change         更改计划任务属性。

    /run            按需运行计划任务。

    /end            中止当前正在运行的计划任务。

    /showsid        显示与计划的任务名称相应的安全标识符。

    /?              显示此帮助消息。

examples:
    schtasks 
    schtasks /?
    schtasks /run /?
    schtasks /end /?
    schtasks /create /?
    schtasks /delete /?
    schtasks /query  /?
    schtasks /change /?
    schtasks /showsid /?

```
## 创建新任务计划 ##
### schtasks /create文档 ###
```cmd

schtasks /create [/s system [/u username [/p [password]]]]
    [/ru username [/rp password]] /sc schedule [/mo modifier] [/d day]
    [/m months] [/i idletime] /tn taskname /tr taskrun [/st starttime]
    [/ri interval] [ {/et endtime | /du duration} [/k] [/xml xmlfile] [/v1]]
    [/sd startdate] [/ed enddate] [/it | /np] [/z] [/f] [/hresult] [/?]

描述:
     允许管理员在本地或远程系统上创建计划任务。

参数列表:
    /s   system        指定要连接到的远程系统。如果省略这个
                       系统参数，默认是本地系统。

    /u   username      指定应在其中执行 schtasks.exe 的用户上下文。

    /p   [password]    指定给定用户上下文的密码。如果省略则
                       提示输入。

    /ru  username      指定任务在其下运行的“运行方式”用户帐户(用户上下文)。
                                对于系统帐户，有效 值是 ""、"nt authority\system" 或 "system"。
                                对于 v2 任务，"nt authority\localservice"和"nt authority\networkservice"以及常见的 sid 对这三个也都可用。

    /rp  [password]    指定“运行方式”用户的密码。要提示输
                       入密码，值必须是 "*" 或无。系统帐户会忽略该
                       密码。必须和 /ru 或 /xml 开关一起使用。

    /ru/xml    /sc   schedule     指定计划频率。
                       有效计划任务:  minute、 hourly、daily、weekly、 
                       monthly, once, onstart, onlogon, onidle, onevent.

    /mo   modifier     改进计划类型以允许更好地控制计划重复周期。有效值列于下面“修改者”部分中。

    /d    days         指定该周内运行任务的日期。有效值: 
                       mon、tue、wed、thu、fri、sat、sun
                       和对 monthly 计划的 1 - 31
                       (某月中的日期)。通配符“*”指定所有日期。

    /m    months       指定一年内的某月。默认是该月的第一天。
                       有效值: jan、feb、mar、apr、may、jun、
                       jul、 aug、sep、oct、nov  和 dec。通配符
                       “*” 指定所有的月。

    /i    idletime     指定运行一个已计划的 onidle 任务之前
                       要等待的空闲时间。
                       有效值范围: 1 到 999 分钟。

    /tn   taskname     以路径\名称形式指定
                       对此计划任务进行唯一标识的字符串。

    /tr   taskrun      指定在这个计划时间运行的程序的路径
                       和文件名。
                       例如: c:\windows\system32\calc.exe

    /st   starttime    指定运行任务的开始时间。
                       时间格式为 hh:mm (24 小时时间)，例如 14:30 表示
                       2:30 pm。如果未指定 /st，则默认值为
                       当前时间。/sc once 必需有此选项。

    /ri   interval     用分钟指定重复间隔。这不适用于
                       计划类型: minute、hourly、
                       onstart, onlogon, onidle, onevent.
                       有效范围: 1 - 599940 分钟。
                       如果已指定 /et 或 /du，则其默认值为
                       10 分钟。

    /et   endtime      指定运行任务的结束时间。
                       时间格式为 hh:mm (24 小时时间)，例如，14:50 表示 2:50 pm。
                       这不适用于计划类型: onstart、
                       onlogon, onidle, onevent.

    /du   duration     指定运行任务的持续时间。
                       时间格式为 hh:mm。这不适用于 /et 和
                       计划类型: onstart, onlogon, onidle, onevent.
                       对于 /v1 任务，如果已指定 /ri，则持续时间默认值为
                       1 小时。

    /k                 在结束时间或持续时间终止任务。
                       这不适用于计划类型: onstart、
                       onlogon, onidle, onevent. 
                       必须指定 /et 或 /du。

    /sd   startdate    指定运行任务的第一个日期。
                       格式为 yyyy/mm/dd。默认值为
                       当前日期。这不适用于计划类型: once、
                       onstart, onlogon, onidle, onevent.

    /ed   enddate      指定此任务运行的最后一天的日期。
                       格式是 yyyy/mm/dd。这不适用于计划类型: 
                        once、onstart、onlogon、onidle。

    /ec   channelname  为 onevent 触发器指定事件通道。

    /it                仅有在 /ru 用户当前已登录且
                       作业正在运行时才可以交互式运行任务。
                       此任务只有在用户已登录的情况下才运行。

    /np                不储存任何密码。任务以给定用户的身份
                       非交互的方式运行。只有本地资源可用。

    /z                 标记在最终运行完任务后删除任务。

    /xml  xmlfile      从文件的指定任务 xml 中创建任务。
                       可以组合使用 /ru 和 /rp 开关，或者在任务 xml 已包含
                       主体时单独使用 /rp。

    /v1                创建 vista 以前的平台可以看见的任务。
                       不兼容 /xml。

    /f                 如果指定的任务已经存在，则强制创建
                       任务并抑制警告。

    /rl   level        为作业设置运行级别。有效值为
                       limited 和 highest。默认值为 limited。

    /delay delaytime   指定触发触发器后延迟任务运行的
                       等待时间。时间格式为
                       mmmm:ss。此选项仅对计划类型
                       onstart, onlogon, onevent.

    /hresult          为获得更出色的故障诊断能力，处理退出代码
                       将采用 hresult 格式。

    /?                 显示此帮助消息。

修改者: 按计划类型的 /mo 开关的有效值:
    minute:  1 到 1439 分钟。
    hourly:  1 - 23 小时。
    daily:   1 到 365 天。
    weekly:  1 到 52 周。
    once:    无修改者。
    onstart: 无修改者。
    onlogon: 无修改者。
    onidle:  无修改者。
    monthly: 1 到 12，或
             first, second, third, fourth, last, lastday。

    onevent:  xpath 事件查询字符串。
示例:
    ==> 在远程机器 "abc" 上创建计划任务 "doc"，
        该机器每小时在 "runasuser" 用户下运行 notepad.exe。

        schtasks /create /s abc /u user /p password /ru runasuser
                 /rp runaspassword /sc hourly /tn doc /tr notepad 

    ==> 在远程机器 "abc" 上创建计划任务 "accountant"，
        在指定的开始日期和结束日期之间的开始时间和结束时间内，
        每隔五分钟运行 calc.exe。

        schtasks /create /s abc /u domain\user /p password /sc minute
                 /mo 5 /tn accountant /tr calc.exe /st 12:00 /et 14:00
                 /sd 06/06/2006 /ed 06/06/2006 /ru runasuser /rp userpassword

    ==> 创建计划任务 "gametime"，在每月的第一个星期天 
        运行“空当接龙”。

        schtasks /create /sc monthly /mo first /d sun /tn gametime 
                 /tr c:\windows\system32\freecell

    ==> 在远程机器 "abc" 创建计划任务 "report"，
        每个星期运行 notepad.exe。

        schtasks /create /s abc /u user /p password /ru runasuser
                 /rp runaspassword /sc weekly /tn report /tr notepad.exe

    ==> 在远程机器 "abc" 创建计划任务 "logtracker"，
        每隔五分钟从指定的开始时间到无结束时间，
        运行 notepad.exe。将提示输入 /rp 
        密码。

        schtasks /create /s abc /u domain\user /p password /sc minute
                 /mo 5 /tn logtracker 
                 /tr c:\windows\system32\notepad.exe /st 18:30
                 /ru runasuser /rp

    ==> 创建计划任务 "gaming"，每天从 12:00 点开始到
        14:00 点自动结束，运行 freecell.exe。

        schtasks /create /sc daily /tn gaming /tr c:\freecell /st 12:00
                 /et 14:00 /k
    ==> 创建计划任务“eventlog”以开始运行 wevtvwr.msc
        只要在“系统”通道中发布事件 101

        schtasks /create /tn eventlog /tr wevtvwr.msc /sc onevent
                 /ec system /mo *[system/eventid=101] 
    ==> 文件路径中可以加入空格，但需要加上两组引号，
        一组引号用于 cmd.exe，另一组用于 schtasks.exe。用于 cmd
        的外部引号必须是一对双引号；内部引号可以是一对单引号或
        一对转义双引号:
        schtasks /create 
           /tr "'c:\program files\internet explorer\iexplorer.exe' 
           \"c:\log data\today.xml\"" ... 

```
## 定时关机 ##
### 先用计算器测试 ###
**在00:53时启动计算器**
```cmd
schtasks /create /tn shutdown_test /st 00:53 /sc once /tr "c:\windows\system32\calc.exe"
```
## 查询任务计划 ##
### 语法 ###
```cmd

schtasks /query [/s system [/u username [/p [password]]]]
         [/fo format | /xml [xml_type]] [/nh] [/v]
         [/tn taskname] [/hresult] [/?]

描述: 
    允许管理员显示本地或远程系统上的计划任务。

参数列表:
    /s    system         指定要连接到的远程系统。

    /u    username       指定 schtasks.exe 要执行的用户上下文。

    /p    [password]     指定给定的用户上下文密码。如果省略则
                         提示输入。

    /fo   format         为输出指定格式。有效值: table、list、csv。

    /nh                  指定在输出中不显示列标题。
                         只对 table 格式有效。
                         仅适用于 table 和 csv 格式。

    /v                   显示详细任务输出。

    /tn   taskname       指定要检索其信息的任务路径\名称，
                         否则会检索所有任务的信息。

    /xml  [xml_type]     以 xml 格式显示任务定义。

                         如果 xml_type 为 one，则输出为一个有效 xml 文件。

                         如果 xml_type 不存在，则输出将为

                         所有 xml 任务定义的串联。

    /hresult             为获得更出色的故障诊断能力，处理退出代码
                         将采用 hresult 格式。

    /?                   显示此帮助消息。

示例:
    schtasks /query 
    schtasks /query /? 
    schtasks /query /s system /u user /p password
    schtasks /query /fo list /v /s system /u user /p password
    schtasks /query /fo table /nh /v

```
查询该任务:
```cmd
SCHTASKS /Query /TN shutdown_test
```
显示效果:
```cmd
C:\Users\lan>SCHTASKS /Query /TN shutdown_test
文件夹: \
任务名                                   下次运行时间           模式
======================================== ====================== ===============
shutdown_test                            N/A                    就绪
```
## 删除任务计划 ##
```cmd

schtasks /delete [/s system [/u username [/p [password]]]]
         /tn taskname [/f] [/hresult] [/?]

描述:
    删除一个或多个计划任务。

参数列表:
    /s   system         指定要连接到的远程系统。

    /u   username       指定 schtasks.exe  要执行的用户上下文。

    /p   [password]     指定给定用户上下文密码。如果省略则
                        提示输入。

    /tn  taskname       指定要删除的任务的路径\名称。
                        可以使用通配符 "*" 来删除所有任务。

    /f                  强制删除该任务，而且
                        如果指定的任务当前正在运行，则抑制警告。

    /hresult           为获得更好的故障诊断能力，处理退出代码
                        将采用 hresult 格式。

    /?                  显示此帮助消息。

示例:
    schtasks /delete /tn * /f
    schtasks /delete /tn "\备份\备份和还原"
    schtasks /delete /s system /u user /p password /tn "\备份\启动还原"
    schtasks /delete /s system /u user /p password /tn "\备份\启动备份" /f

```
### 删除上面创建的任务 ###
```cmd
schtasks /delete /tn  taskname shutdown_test
```
运行结果:
```cmd
E:\dev2\idea_workspace\CodeGenerator>schtasks /delete /tn shutdown_test
警告: 确实要删除任务 "shutdown_test" 吗 (Y/N )? y
成功: 计划的任务 "shutdown_test" 被成功删除。

```

>原文链接: [cmd schtasks命令](https://lanlan2017.github.io/blog/b1b65659/)
