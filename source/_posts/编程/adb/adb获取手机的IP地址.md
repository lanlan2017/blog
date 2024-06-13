---
title: adb获取手机的IP地址
categories:
  - 编程
  - adb
abbrlink: 62915f14
date: 2023-05-09 02:31:18
updated: 2023-05-09 02:31:18
---
## adb shell ifconfig
`adb shell ifconfig`会列出所有的IP地址。
例如：
```cmd
C:\Users\haha>adb -s U8ENW18119024027 shell ifconfig
rmnet_ims00 Link encap:UNSPEC
          inet6 addr: fe80::5a02:3ff:fe04:50d/64 Scope: Link
          inet6 addr: 2409:8120:9a34:f7c3:1:2:6112:8ffc/64 Scope: Global
          UP RUNNING NOARP  MTU:1280  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:99 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 TX bytes:5544

wlan0     Link encap:UNSPEC
          inet addr:192.168.0.112  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::b92e:4d41:c756:280c/64 Scope: Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1242540 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1852388 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:655964181 TX bytes:268463682

p2p0      Link encap:UNSPEC
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 TX bytes:0

lo        Link encap:UNSPEC
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope: Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:177062 errors:0 dropped:0 overruns:0 frame:0
          TX packets:177062 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:622693892 TX bytes:622693892

dummy0    Link encap:UNSPEC
          inet6 addr: fe80::b423:b9ff:fe08:f390/64 Scope: Link
          UP BROADCAST RUNNING NOARP  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2279 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 TX bytes:596525


C:\Users\haha>
```

### adb shell ifconfig | findstr Mask
可以使用管道符和findstr命令来做进一步的筛选
```cmd
adb shell ifconfig | findstr Mask
```
例如：
```cmd
adb -s U8ENW18119024027 shell ifconfig | findstr Mask
```
运行结果：
```cmd
C:\Users\haha>adb -s U8ENW18119024027 shell ifconfig | findstr Mask
          inet addr:192.168.0.112  Bcast:192.168.0.255  Mask:255.255.255.0
          inet addr:127.0.0.1  Mask:255.0.0.0

C:\Users\haha>
```
这里有两个地址，第一个就是我当前手机的地址。


###  adb shell ifconfig wlan0

例如：
```cmd
C:\Users\haha>adb -s U8ENW18119024027 shell ifconfig wlan0
wlan0     Link encap:UNSPEC
          inet addr:192.168.0.112  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::b92e:4d41:c756:280c/64 Scope: Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1451964 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1985457 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:946642186 TX bytes:277407859


C:\Users\haha>
```
#### adb shell ifconfig wlan0| findstr Mask
一般来说，我们值需要ipv4的地址就够了，可以使用管道符号和findstr来做更进一步的筛选
例如：
```cmd
C:\Users\haha>adb -s U8ENW18119024027 shell ifconfig wlan0| findstr Mask
          inet addr:192.168.0.112  Bcast:192.168.0.255  Mask:255.255.255.0

C:\Users\haha>
```
## adb shell netcfg
```cmd
C:\Users\haha>adb -s U8ENW18119024027 shell netcfg
rmnet_ims00 UP                                     0.0.0.0/0   0x000000c1
rmnet_tun11 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun01 DOWN                                   0.0.0.0/0   0x00000000
wlan0    UP                               192.168.0.112/24  0x00001043
dummy0   UP                                     0.0.0.0/0   0x000000c3
rmnet4   DOWN                                   0.0.0.0/0   0x00000000
p2p0     UP                                     0.0.0.0/0   0x00001003
rmnet2   DOWN                                   0.0.0.0/0   0x00000000
Hisilicon0 DOWN                                   0.0.0.0/0   0x00001002
rmnet_tun14 DOWN                                   0.0.0.0/0   0x00000000
rmnet0   DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun04 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun12 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun02 DOWN                                   0.0.0.0/0   0x00000000
lo       UP                                   127.0.0.1/8   0x00000049
rmnet_emc0 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun10 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun00 DOWN                                   0.0.0.0/0   0x00000000
rmnet3   DOWN                                   0.0.0.0/0   0x00000000
sit0     DOWN                                   0.0.0.0/0   0x00000080
ip6tnl0  DOWN                                   0.0.0.0/0   0x00000080
rmnet1   DOWN                                   0.0.0.0/0   0x00000000
rmnet_r_ims10 DOWN                                   0.0.0.0/0   0x00000000
ip_vti0  DOWN                                   0.0.0.0/0   0x00000080
ip6_vti0 DOWN                                   0.0.0.0/0   0x00000080
rmnet_r_ims00 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun13 DOWN                                   0.0.0.0/0   0x00000000
rmnet_tun03 DOWN                                   0.0.0.0/0   0x00000000
rmnet_ims10 DOWN                                   0.0.0.0/0   0x00000000

C:\Users\haha>
```

### adb shell netcfg| findstr wlan0

```cmd
C:\Users\haha>adb -s U8ENW18119024027 shell netcfg| findstr wlan0
wlan0    UP                               192.168.0.112/24  0x00001043

C:\Users\haha>
```

# 参考资料
https://blog.csdn.net/HDFQQ188816190/article/details/98599940
