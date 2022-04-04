---
title: cmd tasklist命令
categories: 
  - Windows
  - CMD批处理
  - 语法
  - 系统相关命令
abbrlink: 524a6762
date: 2019-12-22 10:34:53
updated: 2022-04-04 00:51:44
---
# tasklist命令帮助文档
```cmd
TASKLIST [/S system [/U username [/P [password]]]]
         [/M [module] | /SVC | /V] [/FI filter] [/FO format] [/NH]
描述:
    该工具显示在本地或远程机器上当前运行的进程列表。
参数列表:
   /S     system           指定连接到的远程系统。
   /U     [domain\]user    指定应该在哪个用户上下文执行这个命令。
   /P     [password]       为提供的用户上下文指定密码。如果省略，则
                           提示输入。
   /M     [module]         列出当前使用所给 exe/dll 名称的所有任务。
                           如果没有指定模块名称，显示所有加载的模块。
   /SVC                    显示每个进程中主持的服务。
   /APPS 显示 Microsoft Store 应用及其关联的进程。
   /V                      显示详细任务信息。
   /FI    filter           显示一系列符合筛选器
                           指定条件的任务。
   /FO    format           指定输出格式。
                           有效值: "TABLE"、"LIST"、"CSV"。
   /NH                     指定列标题不应该在输出中显示。
                           只对 "TABLE" 和 "CSV" 格式有效。
   /?                      显示此帮助消息。
筛选器:
    筛选器名称     有效运算符           有效值
    -----------     ---------------           --------------------------
    STATUS          eq, ne                    RUNNING | SUSPENDED
                                              NOT RESPONDING | UNKNOWN
    IMAGENAME       eq, ne                    映像名称
    PID             eq, ne, gt, lt, ge, le    PID 值
    SESSION         eq, ne, gt, lt, ge, le    会话编号
    SESSIONNAME     eq, ne                    会话名称
    CPUTIME         eq, ne, gt, lt, ge, le    CPU 时间，格式为
                                              hh:mm:ss。
                                              hh - 小时，
                                              mm - 分钟，ss - 秒
    MEMUSAGE        eq, ne, gt, lt, ge, le    内存使用(以 KB 为单位)
    USERNAME        eq, ne                    用户名，格式为
                                              [域\]用户
    SERVICES        eq, ne                    服务名称
    WINDOWTITLE     eq, ne                    窗口标题
    模块         eq, ne                    DLL 名称
注意: 当查询远程计算机时，不支持 "WINDOWTITLE" 和 "STATUS"
      筛选器。
Examples:
    TASKLIST
    TASKLIST /M
    TASKLIST /V /FO CSV
    TASKLIST /SVC /FO LIST
    TASKLIST /APPS /FI "STATUS eq RUNNING"
    TASKLIST /M wbem*
    TASKLIST /S system /FO LIST
    TASKLIST /S system /U 域\用户名 /FO CSV /NH
    TASKLIST /S system /U username /P password /FO TABLE /NH
    TASKLIST /FI "USERNAME ne NT AUTHORITY\SYSTEM" /FI "STATUS eq running"
```
## csv输出格式
```cmd
tasklist /v /fo csv
```
显示效果:
```
"映像名称","PID","会话名      ","会话#   ","内存使用 ","状态  ","用户名   ","CPU 时间","窗口标题    "
......
"Code.exe","1720","Console","2","114,740 K","Running","DESKTOP-8ISAT6B\lan","0:01:16","cmd tasklist命令.md - 9.3 类型通配符 - Visual Studio Code"
......
"cmd.exe","12920","Console","2","4,660 K","Running","DESKTOP-8ISAT6B\lan","0:00:00","hexo"
......
```
## list输出格式
```cmd
tasklist /v /fo list
```
```
映像名称:     System Idle Process
PID:          0
会话名      : Services
会话#   :     0
内存使用 :    8 K
状态  :       Unknown
用户名   :    NT AUTHORITY\SYSTEM
CPU 时间:     33:34:44
窗口标题    : 暂缺

映像名称:     System
PID:          4
会话名      : Services
会话#   :     0
内存使用 :    4,516 K
状态  :       Unknown
用户名   :    暂缺
CPU 时间:     0:23:25
窗口标题    : 暂缺

......
```
list输出格式会输出很长的内容.



杀死窗口标题为hexo的进程:
```cmd
E:\Blog\JavaReadingNotes>taskkill /pid 12920
成功: 给进程发送了终止信号，进程的 PID 为 12920。
```
# 参考资料
[https://www.yiibai.com/batch_script/batch_script_process.html](https://www.yiibai.com/batch_script/batch_script_process.html)
