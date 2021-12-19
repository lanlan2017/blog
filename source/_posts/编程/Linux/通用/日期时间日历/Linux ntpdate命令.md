---
title: Linux ntpdate命令
categories: 
  - 编程
  - Linux
  - 通用
  - 日期时间日历
abbrlink: 8923c382
date: 2021-04-20 21:10:13
updated: 2021-04-20 23:07:47
---
# ntpdate
## NTP协议
### NTP是什么
NTP 是网络时间协议（Network Time Protocol），它用来同步网络设备【如计算机、手机】的时间的协议。

### NTP实现什么目的
目的很简单，就是为了提供准确时间。因为我们的手表、手机、电脑等设备，经常会跑着跑着时间就出现了误差，或快或慢的少几秒，时间长了甚至误差过分钟。

### NTP服务器列表
Windows系统上自带的两个：time.windows.com 和 time.nist.gov
MacOS上自带的两个：time.apple.com 和 time.asia.apple.com
NTP授时快速域名服务：cn.ntp.org.cn

#### 1、阿里云授时服务器
```
#NTP服务器
ntp.aliyun.com
ntp1.aliyun.com
ntp2.aliyun.com
ntp3.aliyun.com
ntp4.aliyun.com
ntp5.aliyun.com
ntp6.aliyun.com
ntp7.aliyun.com
#Time服务器
time1.aliyun.com
time2.aliyun.com
time3.aliyun.com
time4.aliyun.com
time5.aliyun.com
time6.aliyun.com
time7.aliyun.com
```
#### 2、国内大学授时服务器
```
s1c.time.edu.cn       北京大学
s2m.time.edu.cn       北京大学
s1b.time.edu.cn       清华大学
s1e.time.edu.cn       清华大学
s2a.time.edu.cn       清华大学
s2b.time.edu.cn       清华大学
```
#### 3、国外授时服务器
```
#苹果提供的授时服务器   
time1.apple.com
time2.apple.com
time3.apple.com
time4.apple.com
time5.apple.com
time6.apple.com
time7.apple.com

#Google提供的授时服务器   
time1.google.com
time2.google.com
time3.google.com
time4.google.com
```

通过 NTP 协议校对系统时间
```
ntpdate
```
如果没有安装ntpdate,查找安装包：
```
yum list ntpdate
```
安装ntpdate:
```
yum install ntpdate
```
```
[root@localhost ~]# yum list ntpdate
已加载插件：fastestmirror
Loading mirror speeds from cached hostfile
可安装的软件包
ntpdate.aarch64                                                              4.2.6p5-29.el7.centos.2                                                               base
[root@localhost ~]# yum install ntpdate
已加载插件：fastestmirror
Loading mirror speeds from cached hostfile
正在解决依赖关系
--> 正在检查事务
---> 软件包 ntpdate.aarch64.0.4.2.6p5-29.el7.centos.2 将被 安装
--> 解决依赖关系完成

依赖关系解决
......
```
## 查询时间ntpdate -q NTP服务器
```
ntpdate -q 0.pool.ntp.org
```
运行效果：
```
[root@localhost ~]# ntpdate -q 0.pool.ntp.org
server 139.199.214.202, stratum 2, offset 0.225052, delay 0.06584
server 162.159.200.1, stratum 0, offset 0.000000, delay 0.00000
server 185.209.85.222, stratum 2, offset 0.224910, delay 0.31339
server 5.79.108.34, stratum 3, offset 0.219270, delay 0.26381
20 Apr 21:32:30 ntpdate[22284]: adjust time server 139.199.214.202 offset 0.225052 sec
[root@localhost ~]#
```
使用阿里云
```
ntpdate -q ntp.aliyun.com
```
运行效果：
```
[root@localhost ~]# ntpdate -q ntp.aliyun.com
server 203.107.6.88, stratum 2, offset 0.210540, delay 0.09094
20 Apr 21:33:05 ntpdate[22518]: adjust time server 203.107.6.88 offset 0.210540 sec
[root@localhost ~]#
```
运行效果：
```
[root@localhost ~]# ntpdate -q cn.ntp.org.cn
server 2001:da8:9000::130, stratum 1, offset 0.257669, delay 0.10617
server 2001:da8:9000::81, stratum 1, offset 0.256599, delay 0.10426
server 111.230.50.201, stratum 3, offset 0.266627, delay 0.05635
server 120.25.115.20, stratum 2, offset 0.263829, delay 0.05809
server 203.107.6.88, stratum 2, offset 0.267893, delay 0.08539
server 182.92.12.11, stratum 2, offset 0.264843, delay 0.08183
server 120.25.108.11, stratum 2, offset 0.263255, delay 0.05913
server 120.197.116.202, stratum 1, offset 0.257536, delay 0.08014
server 119.29.26.206, stratum 3, offset 0.262630, delay 0.05463
server 106.75.185.63, stratum 2, offset 0.262619, delay 0.05322
server 223.113.120.195, stratum 3, offset 0.259761, delay 0.07321
server 223.113.97.98, stratum 0, offset 0.000000, delay 0.00000
server 223.65.211.46, stratum 0, offset 0.000000, delay 0.00000
server 36.154.179.82, stratum 5, offset 0.260445, delay 0.07410
server 223.113.103.191, stratum 3, offset 0.182134, delay 0.07329
server 58.220.133.132, stratum 3, offset 0.264724, delay 0.08644
server 114.67.237.130, stratum 2, offset 0.261922, delay 0.08417
server 114.67.103.73, stratum 0, offset 0.000000, delay 0.00000
server 140.143.99.185, stratum 3, offset 0.266090, delay 0.06126
20 Apr 21:31:13 ntpdate[21731]: adjust time server 120.197.116.202 offset 0.257536 sec
[root@localhost ~]# 
```
## 设置时间ntpdate NTP服务器
```
ntpdate ntp.aliyun.com
```
运行结果：
```
[root@localhost ~]# ntpdate ntp.aliyun.com
20 Apr 21:39:16 ntpdate[25139]: adjust time server 203.107.6.88 offset 0.026031 sec
[root@localhost ~]# 
```
# 参考资料
[https://www.jianshu.com/p/28864ab7fdd9](https://www.jianshu.com/p/28864ab7fdd9)
