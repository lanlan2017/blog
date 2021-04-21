---
title: Linux vmstat命令
categories: 
  - 编程
  - Linux
  - 通用
  - 系统状态
abbrlink: 4c9a9125
date: 2021-04-21 19:58:37
updated: 2021-04-21 23:33:39
---
<div id='my_toc'><a href="/blog/4c9a9125/#vmstat命令：了解系统负载" class="header_1">vmstat命令：了解系统负载</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-help" class="header_2">vmstat --help</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat输出字段说明" class="header_2">vmstat输出字段说明</a>&nbsp;<br><a href="/blog/4c9a9125/#Procs（进程）" class="header_3">Procs（进程）</a>&nbsp;<br><a href="/blog/4c9a9125/#Memory（内存）" class="header_3">Memory（内存）</a>&nbsp;<br><a href="/blog/4c9a9125/#swap" class="header_3">swap</a>&nbsp;<br><a href="/blog/4c9a9125/#io" class="header_3">io</a>&nbsp;<br><a href="/blog/4c9a9125/#system" class="header_3">system</a>&nbsp;<br><a href="/blog/4c9a9125/#cpu（以百分比表示）" class="header_3">cpu（以百分比表示）</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-a：显示活跃和非活跃内存" class="header_2">vmstat -a：显示活跃和非活跃内存</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-d：查看磁盘的读-写" class="header_2">vmstat -d：查看磁盘的读/写</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-f：查看系统已经fork了多少次" class="header_2">vmstat -f：查看系统已经fork了多少次</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-s：查看内存使用的详细信息" class="header_2">vmstat -s：查看内存使用的详细信息</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-m：获取" class="header_2">vmstat -m：获取</a>&nbsp;<br><a href="/blog/4c9a9125/#slab" class="header_3">slab</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-w宽版输出" class="header_2">vmstat -w宽版输出</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-t显示时间" class="header_2">vmstat -t显示时间</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-wt宽版输出并显示时间" class="header_3">vmstat -wt宽版输出并显示时间</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-秒数" class="header_2">vmstat 秒数</a>&nbsp;<br><a href="/blog/4c9a9125/#vmstat-间隔秒数-采集次数" class="header_2">vmstat 间隔秒数 采集次数</a>&nbsp;<br><a href="/blog/4c9a9125/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# vmstat命令：了解系统负载
vmstat是Virtual Meomory Statistics（虚拟内存统计）的缩写，可对操作系统的虚拟内存、进程、CPU活动进行监控。他是对系统的整体情况进行统计，不足之处是无法对某个进程进行深入分析。vmstat 工具提供了一种低开销的系统性能观察方式。因为 vmstat 本身就是低开销工具，在非常高负荷的服务器上，你需要查看并监控系统的健康情况,在控制窗口还是能够使用vmstat 输出结果。在学习vmstat命令前，我们先了解一下Linux系统中关于物理内存和虚拟内存相关信息。

```
[root@localhost ~]# vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0  49160 492020 2017324    0    0    57    15  108  374 10  2 87  0  0
[root@localhost ~]# 
```
## vmstat --help
```
[root@localhost ~]# vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0  49160 492020 2017324    0    0    57    15  108  374 10  2 87  0  0
[root@localhost ~]# vmstat --help

Usage:
 vmstat [options] [delay [count]]

Options:
 -a, --active           active/inactive memory
 -f, --forks            number of forks since boot
 -m, --slabs            slabinfo
 -n, --one-header       do not redisplay header
 -s, --stats            event counter statistics
 -d, --disk             disk statistics
 -D, --disk-sum         summarize disk statistics
 -p, --partition <dev>  partition specific statistics
 -S, --unit <char>      define display unit
 -w, --wide             wide output
 -t, --timestamp        show timestamp

 -h, --help     display this help and exit
 -V, --version  output version information and exit

For more details see vmstat(8).
[root@localhost ~]# 
```
## vmstat输出字段说明
### Procs（进程）
r: 运行队列中进程数量。
b: 等待IO的进程数量

### Memory（内存）
swpd: 虚拟内存已使用的大小，如果大于0，表示你的机器物理内存不足了，如果不是程序内存泄露的原因，那么你该升级内存了或者把耗内存的任务迁移到其他机器。
free: 可用内存大小
buff: 用作缓冲的内存大小
cache: 用作缓存的内存大小

### swap
si: 每秒从交换区写到内存的大小
so: 每秒写入交换区的内存大小

### io
（现在的Linux版本块的大小为1024bytes）
bi: 每秒读取的块数
bo: 每秒写入的块数

### system
in: 每秒的硬件中断数(interrupt)，包括时钟中断
cs: 每秒上下文切换数。每秒的环境切换次数(context switch)
### cpu（以百分比表示）
us: 用户进程执行时间(user time)。us的值比较高时，说明用户进程消耗的CPU时间多，但是如果长期超50%的使用，那么我们就该考虑优化程序算法或者进行加速。
sy: 系统进程执行时间(system time)。sy的值高时，说明系统内核消耗的CPU资源多，这并不是良性表现，我们应该检查原因。
id: 空闲时间(包括IO等待时间)（id=idle）,中央处理器的空闲时间 。以百分比表示。
wa: 等待IO时间（wa=wait for disk I/O）。wa的值高时，说明IO等待比较严重，这可能由于磁盘大量作随机访问造成，也有可能磁盘出现瓶颈（块操作）。
st：被虚拟机所盗用的 CPU 百分比。


如果r经常大于4 ，且id经常少于40，表示cpu的负荷很重。
如果bi，bo 长期不等于0，表示内存不足。  
## vmstat -a：显示活跃和非活跃内存

<pre>
[root@localhost ~]&#35; vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   <mark>buff</mark>  <mark>cache</mark>   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 1016976 121900 1388660    0    0    54    19  173  477 12  3 85  0  0
[root@localhost ~]&#35; vmstat -a
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free  <mark>inact</mark> <mark>active</mark>   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 1015720 701804 1447844    0    0    54    19  173  477 12  3 85  0  0
</pre>

使用-a选项显示活跃和非活跃内存时，所显示的内容除增加inact和active外，其他显示内容与vmstat的输出结果相同。

```
[root@localhost ~]&#35; vmstat -a 2 4
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free  inact active   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 1015684 701812 1447868    0    0    54    19  173  477 12  3 85  0  0
 0  0      0 1015512 701844 1447560    0    0     0   122  567 2103 15  2 83  0  0
 1  0      0 1015356 701844 1447896    0    0     0    38  959 2730 13  2 85  0  0
 0  0      0 1015232 701852 1447976    0    0     0   128  441 1786 13  2 84  0  0
[root@localhost ~]&#35; 
```

## vmstat -d：查看磁盘的读/写
```
[root@localhost ~]# vmstat -d
disk- ------------reads------------ ------------writes----------- -----IO------
       total merged sectors      ms  total merged sectors      ms    cur    sec
ram0       0      0       0       0      0      0       0       0      0      0
ram1       0      0       0       0      0      0       0       0      0      0
ram2       0      0       0       0      0      0       0       0      0      0
ram3       0      0       0       0      0      0       0       0      0      0
ram4       0      0       0       0      0      0       0       0      0      0
ram5       0      0       0       0      0      0       0       0      0      0
ram6       0      0       0       0      0      0       0       0      0      0
ram7       0      0       0       0      0      0       0       0      0      0
ram8       0      0       0       0      0      0       0       0      0      0
ram9       0      0       0       0      0      0       0       0      0      0
ram10      0      0       0       0      0      0       0       0      0      0
ram11      0      0       0       0      0      0       0       0      0      0
ram12      0      0       0       0      0      0       0       0      0      0
ram13      0      0       0       0      0      0       0       0      0      0
ram14      0      0       0       0      0      0       0       0      0      0
ram15      0      0       0       0      0      0       0       0      0      0
loop0      0      0       0       0      0      0       0       0      0      0
loop1      0      0       0       0      0      0       0       0      0      0
loop2      0      0       0       0      0      0       0       0      0      0
loop3      0      0       0       0      0      0       0       0      0      0
loop4      0      0       0       0      0      0       0       0      0      0
loop5      0      0       0       0      0      0       0       0      0      0
loop6      0      0       0       0      0      0       0       0      0      0
loop7      0      0       0       0      0      0       0       0      0      0
zram0      0      0       0       0      0      0       0       0      0      0
mmcblk0  48322 103620 8479349  122610 112502 182009 3262515  655590      0    213
mmcblk0rpmb      0      0       0       0      0      0       0       0      0      0
[root@localhost ~]#
```
说明：这些信息主要来自于/proc/diskstats.merged:表示一次来自于合并的写/读请求,一般系统会把多个连接/邻近的读/写请求合并到一起来操作.



## vmstat -f：查看系统已经fork了多少次
```
[root@localhost ~]# vmstat -f
        25753 forks
[root@localhost ~]# 
```
## vmstat -s：查看内存使用的详细信息
```
[root@localhost ~]# vmstat -s
      3686064 K total memory
      1150608 K used memory
      1439196 K active memory
       702928 K inactive memory
      1023524 K free memory
       123272 K buffer memory
      1388660 K swap cache
            0 K total swap
            0 K used swap
            0 K free swap
       961982 non-nice user cpu ticks
        14417 nice user cpu ticks
       194461 system cpu ticks
      6825684 idle cpu ticks
        12403 IO-wait cpu ticks
           63 IRQ cpu ticks
         5608 softirq cpu ticks
            0 stolen cpu ticks
      4264662 pages paged in
      1487185 pages paged out
            0 pages swapped in
            0 pages swapped out
     13762036 interrupts
     38103830 CPU context switches
   1619001796 boot time
        25897 forks
[root@localhost ~]# 
```
## vmstat -m：获取
### slab
由于内核会有许多小对象，这些对象构造销毁十分频繁，比如i-node，dentry，这些对象如果每次构建的时候就向内存要一个页(4kb)，而其实只有几个字节，这样就会非常浪费，为了解决这个问题，就引入了一种新的机制来处理在同一个页框中如何分配小存储区，而slab可以对小对象进行分配,这样就不用为每一个对象分配页框，从而节省了空间，内核对一些小对象创建析构很频繁，slab对这些小对象进行缓冲,可以重复利用,减少内存分配次数。
```
[root@localhost ~]# vmstat -m
vmstat: your kernel does not support slabinfo or your permissions are insufficient
[root@localhost ~]# 
```
翻译：vmstat:您的内核不支持slabinfo或您的权限不足

## vmstat -w宽版输出
```
[root@localhost ~]# vmstat -w
procs -----------------------memory---------------------- ---swap-- -----io---- -system-- --------cpu--------
 r  b         swpd         free         buff        cache   si   so    bi    bo   in   cs  us  sy  id  wa  st
 3  0            0      1095624       110728      1352572    0    0    60    19  183  494  13   3  85   0   0
[root@localhost ~]# 
```
## vmstat -t显示时间
```
[root@localhost ~]# vmstat -t
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu----- -----timestamp-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st                 CST
 2  0      0 1067744 112572 1359264    0    0    60    19  182  493 13  3 85  0  0 2021-04-21 22:00:53
[root@localhost ~]# 
```
### vmstat -wt宽版输出并显示时间
```
[root@localhost ~]# vmstat -wt
procs -----------------------memory---------------------- ---swap-- -----io---- -system-- --------cpu-------- -----timestamp-----
 r  b         swpd         free         buff        cache   si   so    bi    bo   in   cs  us  sy  id  wa  st                 CST
 0  0            0      1069064       112492      1359276    0    0    60    19  182  493  13   3  85   0   0 2021-04-21 22:00:40
[root@localhost ~]#
```
## vmstat 秒数
每3秒输出一条结果`vmstat 3`
```
[root@localhost ~]# vmstat 3
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 1021912 117064 1387020    0    0    57    19  177  483 12  3 85  0  0
 0  0      0 1025868 117128 1386988    0    0     0   197  631 2179 14  3 83  1  0
 1  0      0 1025964 117152 1387008    0    0     0    99  468 1978 14  2 84  0  0
 0  0      0 1025880 117152 1387032    0    0     0     0  669 2216 14  2 84  0  0
 3  0      0 1025756 117176 1387012    0    0     0    76  432 1661 13  1 86  0  0
 3  0      0 1025756 117176 1387028    0    0     0    20  468 1844 14  2 83  0  0
 1  0      0 1025492 117220 1387004    0    0     0   153  598 2191 12  3 85  0  0
^C
[root@localhost ~]# 
```
## vmstat 间隔秒数 采集次数
每隔3秒采集一次，共采集4次：`vmstat 3 4`
```
[root@localhost ~]# vmstat 3 4
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0      0 1011904 119464 1388380    0    0    55    19  175  479 12  3 85  0  0
 0  0      0 1011764 119468 1388380    0    0     0    25  371 1729 14  1 85  0  0
 0  2      0 1011640 119520 1388356    0    0     0   176  716 2481 13  3 83  0  0
 2  0      0 1011328 119524 1388380    0    0     0    24  631 2129  7  1 92  0  0
[root@localhost ~]# 
```
# 参考资料
[http://www.ha97.com/4512.html](http://www.ha97.com/4512.html)
[https://wangchujiang.com/linux-command/c/vmstat.html](https://wangchujiang.com/linux-command/c/vmstat.html)
[https://www.yiibai.com/linux/vmstat.html](https://www.yiibai.com/linux/vmstat.html)
[https://www.cnblogs.com/ggjucheng/archive/2012/01/05/2312625.html](https://www.cnblogs.com/ggjucheng/archive/2012/01/05/2312625.html)
[https://segmentfault.com/a/1190000018834649](https://segmentfault.com/a/1190000018834649)
[http://c.biancheng.net/view/1081.html](http://c.biancheng.net/view/1081.html)
[https://www.cnblogs.com/ggjucheng/archive/2012/01/05/2312625.html](https://www.cnblogs.com/ggjucheng/archive/2012/01/05/2312625.html)
