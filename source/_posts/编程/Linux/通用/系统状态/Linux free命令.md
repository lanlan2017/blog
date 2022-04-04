---
title: Linux free命令
categories: 
  - Linux
  - 通用
  - 系统状态
abbrlink: 6b5379d9
date: 2021-04-21 19:23:59
updated: 2022-04-04 00:51:45
---
# free命令：了解内存使用情况
```
[root@localhost ~]# free
              total        used        free      shared  buff/cache   available
Mem:        3686064     1049024       49864        1508     2587176     2605751
Swap:             0           0           0
[root@localhost ~]# 
```
默认的free命令输出的单位是KB.

## free -h
```
[root@localhost ~]# free -h
              total        used        free      shared  buff/cache   available
Mem:           3.5G        1.0G         44M        1.5M        2.5G        2.5G
Swap:            0B          0B          0B
[root@localhost ~]# 
```

这里空闲内存free只有44MB，这点内存好像不够用了。实际上是因为Linux为提高效率，利用程序暂时不用的内存，缓冲读写过的磁盘信息。
从上面的输出结果可以看出，当前有2587176KB的缓冲内存buffer/cache，不计buffer/cache的话,系统的实际可用内存available为2605751KB，远不止free的44MB。
## free命令输出列的含义

|free命令输出的列|含义|
|:---|:---|
|total|总内存|
|used|已使用的内存|
|free|空闲内存|
|buff/cache|缓存内存|
|available|实际可用内存|

## free命令手册
```
FREE(1)                                                                User Commands                                                               FREE(1)

NAME
       free - Display amount of free and used memory in the system

SYNOPSIS
       free [options]

DESCRIPTION
       free  displays  the total amount of free and used physical and swap memory in the system, as well as the buffers and caches used by the kernel. The
       information is gathered by parsing /proc/meminfo. The displayed columns are:

       total  Total installed memory (MemTotal and SwapTotal in /proc/meminfo)

       used   Used memory (calculated as total - free - buffers - cache)

       free   Unused memory (MemFree and SwapFree in /proc/meminfo)

       shared Memory used (mostly) by tmpfs (Shmem in /proc/meminfo, available on kernels 2.6.32, displayed as zero if not available)

       buffers
              Memory used by kernel buffers (Buffers in /proc/meminfo)

       cache  Memory used by the page cache and slabs (Cached and SReclaimable in /proc/meminfo)

       buff/cache
              Sum of buffers and cache

       available
              Estimation of how much memory is available for starting new applications, without swapping. Unlike the data provided by the  cache  or  free
              fields,  this field takes into account page cache and also that not all reclaimable memory slabs will be reclaimed due to items being in use
              (MemAvailable in /proc/meminfo, available on kernels 3.14, emulated on kernels 2.6.27+, otherwise the same as free)

OPTIONS
       -b, --bytes
              Display the amount of memory in bytes.

       -k, --kilo
              Display the amount of memory in kilobytes.  This is the default.

       -m, --mega
              Display the amount of memory in megabytes.

       -g, --giga
              Display the amount of memory in gigabytes.

       --tera Display the amount of memory in terabytes.

       --peta Display the amount of memory in petabytes.

       -h, --human
              Show all output fields automatically scaled to shortest three digit unit and display the units of print out.  Following units are used.

                B = bytes
                K = kilos
                M = megas
                G = gigas
                T = teras
                P = petas

              If unit is missing, and you have exabyte of RAM or swap, the number is in terabytes and columns might not be aligned with header.

       -w, --wide
              Switch to the wide mode. The wide mode produces lines longer than 80 characters. In this mode buffers and cache are reported in two separate
              columns.

       -c, --count count
              Display the result count times.  Requires the -s option.

       -l, --lohi
              Show detailed low and high memory statistics.

       -s, --seconds seconds
              Continuously  display  the  result delay seconds apart.  You may actually specify any floating point number for delay, usleep(3) is used for
              microsecond resolution delay times.

       --si   Use power of 1000 not 1024.

       -t, --total
              Display a line showing the column totals.

       --help Print help.

       -V, --version
              Display version information.

FILES
       /proc/meminfo
              memory information

SEE ALSO
       ps(1), slabtop(1), top(1), vmstat(8).

AUTHORS
       Written by Brian Edmonds.

REPORTING BUGS
       Please send bug reports to ⟨procps@freelists.org⟩
```

## free选项
```
[root@localhost ~]# free --help

Usage:
 free [options]

Options:
 -b, --bytes         show output in bytes
 -k, --kilo          show output in kilobytes
 -m, --mega          show output in megabytes
 -g, --giga          show output in gigabytes
     --tera          show output in terabytes
     --peta          show output in petabytes
 -h, --human         show human-readable output
     --si            use powers of 1000 not 1024
 -l, --lohi          show detailed low and high memory statistics
 -t, --total         show total for RAM + swap
 -s N, --seconds N   repeat printing every N seconds
 -c N, --count N     repeat printing N times, then exit
 -w, --wide          wide output

     --help     display this help and exit
 -V, --version  output version information and exit

For more details see free(1).
[root@localhost ~]# 
```
-b 　以Byte为单位显示内存使用情况。
-k 　以KB为单位显示内存使用情况。
-m 　以MB为单位显示内存使用情况。
-h 　以合适的单位显示内存使用情况，最大为三位数，自动计算对应的单位值。单位有：
B = bytes
K = kilos
M = megas
G = gigas
T = teras
-s<间隔秒数> 　持续观察内存使用状况。
-c<重复次数>   
-t 　显示内存总和列。
-V 　显示版本信息。


## free -b以Byte为单位显示内存使用情况
```
[root@localhost ~]# free -b
              total        used        free      shared  buff/cache   available
Mem:     3774529536  1067212800    57638912     1544192  2649677824  2675276800
Swap:             0           0           0
[root@localhost ~]# 
```
## free -k以KB为单位显示内存使用情况
```
[root@localhost ~]# free -k
              total        used        free      shared  buff/cache   available
Mem:        3686064     1044696       53052        1508     2588316     2610079
Swap:             0           0           0
[root@localhost ~]# 
```
## free -m以MB为单位显示内存使用情况
```
[root@localhost ~]# free -m
              total        used        free      shared  buff/cache   available
Mem:           3599        1008          63           1        2527        2560
Swap:             0           0           0
[root@localhost ~]# 
```
## free -g以GB为单位显示内存使用情况
```
[root@localhost ~]# free -g
              total        used        free      shared  buff/cache   available
Mem:              3           0           0           0           2           2
Swap:             0           0           0
[root@localhost ~]# 
```
## free -h以人类友好方式显示内存使用情况
```
[root@localhost ~]# free -h
              total        used        free      shared  buff/cache   available
Mem:           3.5G        1.0G         61M        1.5M        2.4G        2.5G
Swap:            0B          0B          0B
[root@localhost ~]#
```
## free -w
```
[root@localhost ~]# free -w
              total        used        free      shared     buffers       cache   available
Mem:        3686064     1084684       54540        1508      464712     2082128     2570087
Swap:             0           0           0
[root@localhost ~]# 
```
## free -t以总和的形式查询内存的使用信息
```
[root@localhost ~]# free -t
              total        used        free      shared  buff/cache   available
Mem:        3686064     1087824       50896        1508     2547344     2566951
Swap:             0           0           0
Total:      3686064     1087824       50896
[root@localhost ~]# 
```
## free -s 秒数：周期性的查询内存使用信息
`free -s 10`表示每隔10秒执行一次free命令。
```
[root@localhost ~]# free -s 10
              total        used        free      shared  buff/cache   available
Mem:        3686064     1080672       56516        1508     2548876     2574103
Swap:             0           0           0

              total        used        free      shared  buff/cache   available
Mem:        3686064     1072048       65064        1508     2548952     2582727
Swap:             0           0           0

              total        used        free      shared  buff/cache   available
Mem:        3686064     1077880       59172        1508     2549012     2576895
Swap:             0           0           0

......
```
### free -s 间隔秒数 -c 执行次数：周期性执行free并统计次数
```
-s N, --seconds N   repeat printing every N seconds
-c N, --count N     repeat printing N times, then exit
```
命令`free -s 5 -c 3`表示每隔5秒执行一次free命令，并重复执行3次。
运行结果：
```
[root@localhost ~]# free -s 5 -c 3
              total        used        free      shared  buff/cache   available
Mem:        3686064     1084308       51740        1508     2550016     2570467
Swap:             0           0           0

              total        used        free      shared  buff/cache   available
Mem:        3686064     1082564       53464        1508     2550036     2572211
Swap:             0           0           0

              total        used        free      shared  buff/cache   available
Mem:        3686064     1080316       55648        1508     2550100     2574459
Swap:             0           0           0
[root@localhost ~]# 
```
# 参考资料
[https://www.runoob.com/linux/linux-comm-free.html](https://www.runoob.com/linux/linux-comm-free.html)
