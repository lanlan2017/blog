---
title: Linux df命令详解
categories:
  - 编程
  - Linux
  - 通用
abbrlink: a8f2d755
date: 2021-03-23 06:00:43
updated: 2021-03-23 10:23:16
---
<div id='my_toc'><a href="/blog/null/#df命令" class="header_1">df命令</a>&nbsp;<br><a href="/blog/null/#语法" class="header_1">语法</a>&nbsp;<br><a href="/blog/null/#选项" class="header_2">选项</a>&nbsp;<br><a href="/blog/null/#实例" class="header_1">实例</a>&nbsp;<br><a href="/blog/null/#df" class="header_2">df</a>&nbsp;<br><a href="/blog/null/#df--a" class="header_2">df -a</a>&nbsp;<br><a href="/blog/null/#df--h" class="header_2">df -h</a>&nbsp;<br><a href="/blog/null/#df--H" class="header_2">df -H</a>&nbsp;<br><a href="/blog/null/#df--i" class="header_2">df -i</a>&nbsp;<br><a href="/blog/null/#df--k" class="header_2">df -k</a>&nbsp;<br><a href="/blog/null/#df--l" class="header_2">df -l</a>&nbsp;<br><a href="/blog/null/#df--m" class="header_2">df -m</a>&nbsp;<br><a href="/blog/null/#df--T" class="header_2">df -T</a>&nbsp;<br><a href="/blog/null/#df--t-要显示的文件系统" class="header_2">df -t 要显示的文件系统</a>&nbsp;<br><a href="/blog/null/#df--x-不显示的文件系统" class="header_2">df -x 不显示的文件系统</a>&nbsp;<br><a href="/blog/null/#显示一个目录的磁盘使用情况" class="header_2">显示一个目录的磁盘使用情况</a>&nbsp;<br><a href="/blog/null/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# df命令
Linux df（英文全拼：disk free） 命令用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计。

日常普遍用该命令可以查看磁盘被占用了多少空间、还剩多少空间等信息。
# 语法
```
df [OPTION]... [FILE]...
```
## 选项
```
-a, --all
        include pseudo, duplicate, inaccessible file systems

-B, --block-size=SIZE
        scale sizes by SIZE before printing them; e.g., '-BM' prints sizes in units of 1,048,576 bytes; see SIZE format below

--direct
        show statistics for a file instead of mount point

--total
        produce a grand total

-h, --human-readable
        print sizes in human readable format (e.g., 1K 234M 2G)

-H, --si
        likewise, but use powers of 1000 not 1024

-i, --inodes
        list inode information instead of block usage

-k     like --block-size=1K

-l, --local
        limit listing to local file systems

--no-sync
        do not invoke sync before getting usage info (default)

--output[=FIELD_LIST]
        use the output format defined by FIELD_LIST, or print all fields if FIELD_LIST is omitted.

-P, --portability
        use the POSIX output format

--sync invoke sync before getting usage info

-t, --type=TYPE
        limit listing to file systems of type TYPE

-T, --print-type
        print file system type

-x, --exclude-type=TYPE
        limit listing to file systems not of type TYPE

-v     (ignored)

--help display this help and exit

--version
        output version information and exit
```
# 实例
## df
```
[root@localhost exam]# df
文件系统                                  1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 56814352 11591764 45206204   21% /
tmpfs                                   1822552      364  1822188    1% /dev
tmpfs                                   1843032        0  1843032    0% /dev/shm
/data/media                            56763152 11608148 45155004   21% /mnt/files
[root@localhost exam]# 
```
输出结果分为六列。我们来看一下每一列的含义。

- Filesystem – Linux 系统中的文件系统
- 1K-blocks – 文件系统的大小，用 1K 大小的块来表示。
- Used – 以 1K 大小的块所表示的已使用数量。
- Available – 以 1K 大小的块所表示的可用空间的数量。
- Use% – 文件系统中已使用的百分比。
- Mounted on – 已挂载的文件系统的挂载点。

## df -a
```
文件系统                                  1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 56814352 11591764 45206204   21% /
proc                                          0        0        0     - /proc
sys                                           0        0        0     - /sys
tmpfs                                   1822552      364  1822188    1% /dev
tmpfs                                   1843032        0  1843032    0% /dev/shm
devpts                                        0        0        0     - /dev/pts
/data/media                            56763152 11608148 45155004   21% /mnt/files
[root@localhost exam]#
```
## df -h
在上面的示例中你可能已经注意到了，它使用 1K 大小的块为单位来表示使用情况，如果你以人类友好格式来显示它们，可以使用 -h 标志。
```
[root@localhost exam]# df -h
文件系统                                容量  已用  可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata   55G   12G   44G   21% /
tmpfs                                   1.8G  364K  1.8G    1% /dev
tmpfs                                   1.8G     0  1.8G    0% /dev/shm
/data/media                              55G   12G   44G   21% /mnt/files
[root@localhost exam]# 
```
可用现在的容量，已用，可用，这三列则都是以 GB，MB，KB等为单位来显示的。
## df -H
```
[root@localhost exam]# df -H
文件系统                                容量  已用  可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata   59G   12G   47G   21% /
tmpfs                                   1.9G  373k  1.9G    1% /dev
tmpfs                                   1.9G     0  1.9G    0% /dev/shm
/data/media                              59G   12G   47G   21% /mnt/files
[root@localhost exam]#
```
## df -i 以inode模式来显示磁盘使用情况
通过使用 -i 标记来列出节点而不是块的使用情况。
```
[root@localhost exam]# df -i
文件系统                                 Inode 已用(I) 可用(I) 已用(I)% 挂载点
/dev/block/bootdevice/by-name/userdata 3620864  121008 3499856       4% /
tmpfs                                   455638     658  454980       1% /dev
tmpfs                                   460758       1  460757       1% /dev/shm
/data/media                            3620864  121008 3499856       4% /mnt/files
[root@localhost exam]# 
```
## df -k
```
[root@localhost exam]# df -k
文件系统                                  1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 56814352 11591724 45206244   21% /
tmpfs                                   1822552      364  1822188    1% /dev
tmpfs                                   1843032        0  1843032    0% /dev/shm
/data/media                            56763152 11608108 45155044   21% /mnt/files
[root@localhost exam]#
```
## df -l
```
[root@localhost exam]# df -l
文件系统                                  1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 56814352 11591948 45206020   21% /
tmpfs                                   1822552      364  1822188    1% /dev
tmpfs                                   1843032        0  1843032    0% /dev/shm
/data/media                            56763152 11608332 45154820   21% /mnt/files
```
## df -m:以MB为单位显示文件系统的磁盘使用情况
以 MB 为单位来显示文件系统磁盘空间使用情况，使用 -m 标志。
```
[root@localhost exam]# df -m
文件系统                               1M-块  已用  可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 55483 11321 44147   21% /
tmpfs                                   1780     1  1780    1% /dev
tmpfs                                   1800     0  1800    0% /dev/shm
/data/media                            55433 11337 44097   21% /mnt/files
[root@localhost exam]#
```
## df -T
使用 -T 标志显示文件系统类型。
```
[root@localhost exam]# df -T
文件系统                               类型        1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata ext4     56814352 11592360 45205608   21% /
tmpfs                                  tmpfs     1822552      364  1822188    1% /dev
tmpfs                                  tmpfs     1843032        0  1843032    0% /dev/shm
/data/media                            sdcardfs 56763152 11608744 45154408   21% /mnt/files
```
## df -t 文件系统类型:显示指定类型的文件系统的磁盘使用情况
我们可以限制仅列出某些文件系统。比如，只列出 ext4 文件系统。我们使用 -t 标志。
```
[root@localhost exam]# df -t ext4
文件系统                                  1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 56814352 11592032 45205936   21% /
[root@localhost exam]# 
```
## df -x 文件系统类型:
有时，我们可能需要从结果中去排除指定类型的文件系统。我们可以使用 -x 标记达到我们的目的。
```
[root@localhost exam]# df -x ext4
文件系统          1K-块     已用     可用 已用% 挂载点
tmpfs           1822552      364  1822188    1% /dev
tmpfs           1843032        0  1843032    0% /dev/shm
/data/media    56763152 11608420 45154732   21% /mnt/files
[root@localhost exam]# 
```
## 显示一个目录的磁盘使用情况
去显示某个目录的硬盘空间使用情况以及它的挂载点，例如`~/share/`目录，可以使用如下的命令：
```
[root@localhost exam]#  df -hT ~/share/
文件系统       类型      容量  已用  可用 已用% 挂载点
/data/media    sdcardfs   55G   12G   44G   21% /mnt/files
[root@localhost exam]# 
```
# 参考资料
[https://linux.cn/article-10096-1.html](https://linux.cn/article-10096-1.html)
[https://www.runoob.com/linux/linux-comm-df.html](https://www.runoob.com/linux/linux-comm-df.html)
[https://www.yiibai.com/linux/df.html](https://www.yiibai.com/linux/df.html)
[https://www.linuxcool.com/df](https://www.linuxcool.com/df)