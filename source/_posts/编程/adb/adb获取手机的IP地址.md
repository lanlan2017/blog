---
title: adb获取手机的IP地址
categories: 
  - 编程
  - adb
abbrlink: 62915f14
date: 2023-05-09 02:31:18
updated: 2023-05-09 02:37:25
---
# adb 获取 手机的IP地址

## 命令

- adb shell ifconfig
- adb shell netcfg
- adb shell ip addr show




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

## adb shell ip addr show
```
E:\Tools\runnable>adb -s P7CDU17C21010752 shell ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: dummy0: <BROADCAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN group default qlen 1000
    link/ether d2:b0:0a:a9:d0:d1 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::d0b0:aff:fea9:d0d1/64 scope link 
       valid_lft forever preferred_lft forever
3: rmnet0: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:06 brd ff:ff:ff:ff:ff:ff
4: rmnet1: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:07 brd ff:ff:ff:ff:ff:ff
5: rmnet2: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:08 brd ff:ff:ff:ff:ff:ff
6: rmnet3: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:09 brd ff:ff:ff:ff:ff:ff
7: rmnet4: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:0a brd ff:ff:ff:ff:ff:ff
8: rmnet5: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:0b brd ff:ff:ff:ff:ff:ff
9: rmnet6: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:0c brd ff:ff:ff:ff:ff:ff
10: rmnet_ims00: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:0d brd ff:ff:ff:ff:ff:ff
11: rmnet_r_ims00: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:0e brd ff:ff:ff:ff:ff:ff
12: rmnet_r_ims01: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:0f brd ff:ff:ff:ff:ff:ff
13: rmnet_ims10: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:10 brd ff:ff:ff:ff:ff:ff
14: rmnet_r_ims10: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:11 brd ff:ff:ff:ff:ff:ff
15: rmnet_r_ims11: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:12 brd ff:ff:ff:ff:ff:ff
16: rmnet_tun00: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:13 brd ff:ff:ff:ff:ff:ff
17: rmnet_tun01: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:14 brd ff:ff:ff:ff:ff:ff
18: rmnet_tun02: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:15 brd ff:ff:ff:ff:ff:ff
19: rmnet_tun03: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:16 brd ff:ff:ff:ff:ff:ff
20: rmnet_tun04: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:17 brd ff:ff:ff:ff:ff:ff
21: rmnet_tun10: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:18 brd ff:ff:ff:ff:ff:ff
22: rmnet_tun11: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:19 brd ff:ff:ff:ff:ff:ff
23: rmnet_tun12: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:1a brd ff:ff:ff:ff:ff:ff
24: rmnet_tun13: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:1b brd ff:ff:ff:ff:ff:ff
25: rmnet_tun14: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:1c brd ff:ff:ff:ff:ff:ff
26: rmnet_emc0: <> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 58:02:03:04:05:1d brd ff:ff:ff:ff:ff:ff
27: ip_vti0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
28: ip6_vti0@NONE: <NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/tunnel6 :: brd ::
29: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0
30: ip6tnl0@NONE: <NOARP> mtu 1452 qdisc noop state DOWN group default qlen 1000
    link/tunnel6 :: brd ::
32: Hisilicon0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
33: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether b0:55:08:df:cd:c6 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.109/24 brd 192.168.0.255 scope global wlan0
       valid_lft forever preferred_lft forever
    inet6 fe80::694b:a681:89e3:4685/64 scope link stable-privacy 
       valid_lft forever preferred_lft forever
34: p2p0: <NO-CARRIER,BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state DORMANT group default qlen 1000
    link/ether b2:55:08:df:cd:c6 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::b055:8ff:fedf:cdc6/64 scope link 
       valid_lft forever preferred_lft forever

```

### adb shell ip addr show | findstr wlan0


```
E:\Tools\runnable>adb -s P7CDU17C21010752 shell ip addr show | findstr wlan0
33: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    inet 192.168.0.109/24 brd 192.168.0.255 scope global wlan0

E:\Tools\runnable>
```

# 参考资料
https://blog.csdn.net/HDFQQ188816190/article/details/98599940
