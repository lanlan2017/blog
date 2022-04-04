---
title: Linux ps命令
categories: 
  - Linux
  - 通用
  - 系统状态
abbrlink: 56aee8cb
date: 2021-04-21 17:08:30
updated: 2022-04-04 00:51:45
---
# ps命令
## 功能：查阅进程状态
ps(process status)(实际上就是将内核中进程状态信息有选择地打印出来)
## ps列出的进程属性

|ps列出的属性|含义|
|:---|:---|
|UID|用户ID(注册名)|
|PID|进程ID|
|PPID|父进程的PID|
|C|CPU占用指数:最近一段时间(秒级别)进程占用CPU情况|
|STIME|启动时间|
|SZ|进程逻辑内存大小(Size)，如果一个进程的逻辑内存越来越大则可能发生内存泄露|
|TTY|终端的名字|
|COMMAND|命令名|
|WCHAN|睡眠通道，进程在内核的何处睡眠(Wait Channel)|
|TIME|累计执行时间(占用CPU的时间) ，如果一个进程无故占用CPU很长的时间，则该进程可能有问题|
|PRI|优先级|
|S|状态，S(Sleep)（睡眠状态，阻塞状态），R(Run)， Z(Zombie)（僵尸状态）|

## ps选项
### 无选项
无选项：只列出在当前终端上启动的进程
```
[root@localhost ~]# ps
  PID TTY          TIME CMD
15469 pts/3    00:00:00 bash
15520 pts/3    00:00:00 ps
[root@localhost ~]# 
```
## ps -e：列出系统中所有的进程(进程范围)
```
[root@localhost ~]# ps -e
  PID TTY          TIME CMD
    1 ?        00:00:01 init
    2 ?        00:00:00 kthreadd
    3 ?        00:00:01 ksoftirqd/0
......
   19 ?        00:00:00 migration/3
   22 ?        00:00:00 kworker/3:0H
......
   94 ?        00:00:00 irq/86-msm_iomm
......
   99 ?        00:00:00 irq/109-msm_iom
  100 ?        00:00:00 irq/112-msm_iom
......
  585 ?        00:00:00 rild
  588 ?        00:00:00 qti
  596 ?        00:00:00 netmgrd
......
 1085 ?        00:00:00 ad_calc_wq
......
14353 ?        00:00:00 kworker/2:2
......
15648 ?        00:00:00 kworker/0:2
15697 ?        00:00:00 kworker/2:0
15730 pts/6    00:00:00 ps
[root@localhost ~]# 
```
由于`ps -e`输出的结果很长，可以结合`more`或者`less`命令以前使用：`ps -e|more`，`ps -e|less`。
## ps -f：以full格式列出每一个进程(控制列的数目)
```
[root@localhost ~]# ps -f
UID        PID  PPID  C STIME TTY          TIME CMD
root     15563 15561  0 19:00 pts/6    00:00:00 -bash
root     15865 15563  0 19:07 pts/6    00:00:00 ps -f
[root@localhost ~]#
```
## ps -l选项：以long格式列出每一个进程(控制列的数目)
```
[root@localhost ~]# ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
4 S     0 15563 15561  0  80   0 - 27424 do_wai pts/6    00:00:00 bash
0 R     0 15874 15563  0  80   0 - 27844 -      pts/6    00:00:00 ps
[root@localhost ~]# 
```

# 参考资料
[https://www.runoob.com/linux/linux-comm-ps.html](https://www.runoob.com/linux/linux-comm-ps.html)
