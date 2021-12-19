---
title: Linux top命令
categories: 
  - 编程
  - Linux
  - 通用
  - 系统状态
abbrlink: 4c6cbbb6
date: 2021-04-21 14:27:00
updated: 2021-04-21 23:33:39
---
# top命令：列出资源占用排名靠前的进程
top命令是Linux下常用的性能分析工具，能够实时显示系统中各个进程的资源占用状况，类似于Windows的任务管理器。top是一个动态显示过程,即可以通过用户按键来不断刷新当前状态.如果在前台执行该命令,它将独占前台,直到用户终止该程序为止.比较准确的说,top命令提供了实时的对系统处理器的状态监视.它将显示系统中CPU最“敏感”的任务列表.该命令可以按CPU使用.内存使用和执行时间对任务进行排序；而且该命令的很多特性都可以通过交互式命令或者在个人定制文件中进行设定。
常在linux系统下玩，这是必须掌握的命令之一；
## top命令示例
```
[root@localhost ~]# top
top - 14:32:01 up 2 days,  7:01,  2 users,  load average: 6.11, 6.22, 6.34
Tasks: 472 total,   5 running, 459 sleeping,   6 stopped,   2 zombie
%Cpu(s): 17.3 us,  8.7 sy,  0.0 ni, 74.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3686064 total,   227300 free,  1768260 used,  1690504 buff/cache
KiB Swap:        0 total,        0 free,        0 used.  1881111 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND                                                                                  
12711 root      20   0  112604   2396   1372 R  27.3  0.1   0:00.13 top                                                                                      
  454 aid_med+  20   0  106552  29592   9628 S  22.7  0.8 933:10.56 mediaserver                                                                              
 9269 10116     16  -4 1811124 425120 204272 S   9.1 11.5   8:18.44 .taobao.litetao                                                                          
    7 root      20   0       0      0      0 S   4.5  0.0   6:00.27 rcu_preempt                                                                              
  272 root      rt   0       0      0      0 S   4.5  0.0  26:36.71 cfinteractive                                                                            
    1 root      20   0    1256   1004    396 S   0.0  0.0   2:21.27 init                                                                                     
    2 root      -2   0       0      0      0 S   0.0  0.0   0:00.45 kthreadd                                                                                 
    3 root      20   0       0      0      0 S   0.0  0.0   3:26.01 ksoftirqd/0                                                                              
    8 root      20   0       0      0      0 S   0.0  0.0   0:00.00 rcu_bh                                                                                   
    9 root      20   0       0      0      0 S   0.0  0.0   0:00.88 rcu_sched                                                                                
   10 root      rt   0       0      0      0 S   0.0  0.0   0:31.49 migration/0                                                                              
   11 root      rt   0       0      0      0 S   0.0  0.0   0:23.31 migration/1                                                                              
   12 root      20   0       0      0      0 S   0.0  0.0   2:14.52 ksoftirqd/1                                                                              
   15 root      rt   0       0      0      0 S   0.0  0.0   0:19.59 migration/2                                                                              
   16 root      20   0       0      0      0 S   0.0  0.0   1:50.65 ksoftirqd/2                                                                              
   19 root      rt   0       0      0      0 S   0.0  0.0   0:18.96 migration/3                                                                              
   20 root      20   0       0      0      0 S   0.0  0.0   1:37.55 ksoftirqd/3                                                                              
   23 root      rt   0       0      0      0 R   0.0  0.0   0:05.20 migration/4                                                                              
   24 root      20   0       0      0      0 R   0.0  0.0   0:05.22 ksoftirqd/4                                                                              
   26 root       0 -20       0      0      0 S   0.0  0.0   0:00.20 kworker/4:0H                                                                             
   27 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 khelper                                                                                  
   28 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 netns                                                                                    
   29 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 wakelock_printk                                                                          
   30 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 perf                                                                                     
   37 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 smd_channel_clo                                                                          
   38 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 smsm_cb_wq                                                                               
   39 root      20   0       0      0      0 D   0.0  0.0   0:00.01 kworker/u16:1                                                                            
   40 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 deferwq                                                                                  
   41 root       0 -20       0      0      0 D   0.0  0.0  13:29.07 kworker/u17:0                                                                            
[root@localhost ~]# 
```
## top命令第1行：系统正常运行时间
top命令输出的第一行信息：
```
top - 14:32:01 up 2 days,  7:01,  2 users,  load average: 6.11, 6.22, 6.34
```

|top命令第一行信息|描述|
|:---|:---|
|14:32:01|当前系统时间|
|up 2 days,|7:01|系统已经运行了2天7小时01分钟（在这期间系统没有重启过）|
|2 users|当前有2个用户登录系统|
|load average: 6.11, 6.22, 6.34|load average后面的三个数分别是1分钟、5分钟、15分钟的负载情况。load average数据是每隔5秒钟检查一次活跃的进程数，然后按特定算法计算出的数值。如果这个数除以逻辑CPU的数量，结果高于5的时候就表明系统在超负荷运转了|



和uptime的输出信息差不多：
```
[root@localhost ~]# uptime
 14:31:59 up 2 days,  7:01,  2 users,  load average: 6.11, 6.22, 6.34
[root@localhost ~]# 
```
## top命令第2行：系统进程状态
```
Tasks: 472 total,   5 running, 459 sleeping,   6 stopped,   2 zombie
```
第2行输出表示当前系统有多少个任务（进程），

|top命令第2行输出|描述|
|:---|:---|
|Tasks: 472 total|系统有472个任务（进程）|
|5 running|有5个任务处于运行状态|
|459 sleeping|有459个任务处于睡眠状态（阻塞状态）|
|6 stopped|有6个任务处于停止状态|
|2 zombie|有2个任务处于僵尸状态|

## top命令第3行：CPU的状态
```
%Cpu(s): 17.3 us,  8.7 sy,  0.0 ni, 74.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
```

|top命令第三行信息|描述|
|:---|:---|
|17.3 us|用户空间占用CPU的百分比。|
|8.7 sy|内核空间占用CPU的百分比。|
|0.0 ni|改变过优先级的进程占用CPU的百分比|
|74.0 id|空闲CPU百分比|
|0.0 wa|IO等待占用CPU的百分比|
|0.0 hi|硬中断（Hardware IRQ）占用CPU的百分比|
|0.0 si|软中断（Software Interrupts）占用CPU的百分比|
|0.0 st|Steal time 虚拟机被hypervisor偷去的CPU时间（如果当前处于一个hypervisor下的vm，实际上hypervisor也是要消耗一部分CPU处理时间的）|

注：这里显示数据是所有cpu的平均值，如果想看每一个cpu的处理情况，按1即可；折叠，再次按1；

## top命令第4行：内存状态
```
KiB Mem :  3686064 total,   227300 free,  1768260 used,  1690504 buff/cache
```

|top命令第4行输出|描述|
|:---|:---|
|3686064 total|物理内存总量|
|227300 free|空闲内存总量|
|1768260 used|使用的物理内存总量|
|1690504 buff/cache|用作内核缓存的内存量|

第四行中
使用中的内存总量（used）指的是现在系统内核控制的内存数，
空闲内存总量（free）是内核还未纳入其管控范围的数量。
纳入内核管理的内存不见得都在使用中，还包括过去使用过的现在可以被重复利用的内存，内核并不把这些可被重新使用的内存交还到free中去，因此在linux上free内存会越来越少，但不用为此担心。

如果出于习惯去计算可用内存数，这里有个近似的计算公式：第四行的free + 第四行的buffers + 第五行的cached。

## top命令第5行：Swap交换分区相关信息 交换空间使用情况
```
KiB Swap:        0 total,        0 free,        0 used.  1881111 avail Mem 
```

|top命令第6行输出|描述|
|:---|:---|
|0 total|交换分区总量|
|0 free|空闲交换分区总量|
|0 used|已经使用的交换分区总量|

对于内存监控，在top里我们要时刻监控第五行swap交换分区的used，如果这个数值在不断的变化，说明内核在不断进行内存和swap的数据交换，这是真正的内存不够用了。
## top命令第6行：空行
后面的是表格，空行作为分隔符。
## top命令第7行之后：最后输出的表格
```
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND                                                                                  
12711 root      20   0  112604   2396   1372 R  27.3  0.1   0:00.13 top                                                                                      
  454 aid_med+  20   0  106552  29592   9628 S  22.7  0.8 933:10.56 mediaserver                                                                              
 9269 10116     16  -4 1811124 425120 204272 S   9.1 11.5   8:18.44 .taobao.litetao                                                                          
    7 root      20   0       0      0      0 S   4.5  0.0   6:00.27 rcu_preempt                                                                              
  272 root      rt   0       0      0      0 S   4.5  0.0  26:36.71 cfinteractive                                                                            
    1 root      20   0    1256   1004    396 S   0.0  0.0   2:21.27 init                                                                                     
    2 root      -2   0       0      0      0 S   0.0  0.0   0:00.45 kthreadd                                                                                 
......                               
```

|top命令第7行|描述|
|:---|:---|
|PID|进程id|
|USER|进程所有者|
|PR|进程优先级|
|NI|nice值。负值表示高优先级，正值表示低优先级|
|VIRT|进程逻辑地址空间大小(virtual)，单位kb。VIRT=SWAP+RES，如果随着时间的增长，逻辑地址空间不断扩大，则该可能出现内存泄露|
|RES|驻留内存数(Resident),也就是真正占用物理的内存数，单位kb。RES=CODE+DATA|
|SHR|与其他进程共享的内存数，单位kb，共享的内存一般有共享函数库，以及其他的共享数据等|
|S|进程状态。D=不可中断的睡眠状态 R=运行 S=睡眠 T=跟踪/停止 Z=僵尸进程|
|%CPU|上次更新到现在的CPU时间占用百分比，CPU占用有超过100%的可能|
|%MEM|进程使用的物理内存百分比|
|TIME+|占用的CPU时间，单位1/100秒。正常清空下占用CPU的时间不应随着时间的增长而增长。如果占用CPU的时间随时间的增长而增长，这说明该进程非常忙碌。则该进程可能出现了死循环|
|COMMAND|进程名称（命令名/命令行）|

## top命令交互操作指令
下面列出一些常用的 top命令操作指令


|top命操作指令|功能|
|:---|:---|
|q|退出top命令|
|<Space>|立即刷新|
|s|设置刷新时间间隔|
|c|显示命令完全模式|
|t:|显示或隐藏进程和CPU状态信息|
|m|显示或隐藏内存状态信息|
|l|显示或隐藏uptime信息|
|f|增加或减少进程显示标志|
|S|累计模式，会把已完成或退出的子进程占用的CPU时间累计到父进程的TIME+|
|**P**|按%CPU使用率排行|
|**T**|按TIME+排行|
|**M**|按%MEM排行|
|u|指定显示用户进程|
|r|修改进程renice值|
|kkill|进程|
|i|只显示正在运行的进程|
|W|保存对top的设置到文件~/.toprc，下次启动将自动调用toprc文件的设置。|
|h|帮助命令。|
|q|退出|


注：强调一下，使用频率最高的是P、T、M，因为通常使用top，我们就想看看是哪些进程最耗cpu资源、占用的内存最多；
注：通过”shift + >”或”shift + <”可以向右或左改变排序列

## 只查看top的内存部分信息
### free
如果只需要查看内存：可用free命令。
### uptime
只查看uptime信息（第一行），可用uptime命令；

# 参考资料
[https://www.cnblogs.com/me115/p/3842081.html](https://www.cnblogs.com/me115/p/3842081.html)
[https://blog.csdn.net/yaomingyang/article/details/78968573](https://blog.csdn.net/yaomingyang/article/details/78968573)
[https://liam.page/2020/01/10/the-states-of-processes-on-Linux/](https://liam.page/2020/01/10/the-states-of-processes-on-Linux/)
[https://www.cnblogs.com/peida/archive/2012/12/24/2831353.html](https://www.cnblogs.com/peida/archive/2012/12/24/2831353.html)
