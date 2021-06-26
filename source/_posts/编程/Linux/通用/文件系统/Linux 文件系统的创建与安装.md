---
title: Linux 文件系统的创建与安装
categories:
  - 编程
  - Linux
  - 通用
  - 文件系统
abbrlink: 58bbb0ab
date: 2021-06-20 14:34:35
updated: 2021-06-20 14:34:35
---
# 根文件系统与子文件系统
## 根文件系统(root filesystem)
根文件系统是整个文件系统的基础，不能“脱卸(umount)”
## 子文件系统
- 子文件系统，包括硬盘，软盘，CD-ROM，USB盘，网络文件系统NFS
- 以根文件系统中某一子目录的身份出现(不似Windows逻辑盘）

## 独立的存储结构
根文件系统和子文件系统都有其自己独立的文件系统存储结构，甚至文件系统的格式也不同

## mkfs和mount：文件系统的创建和安装
### 创建文件系统
```
mkfs /dev/sdb
```
块设备文件/dev/sdb上创建文件系统(make filesystem)
### 安装子文件系统mount
```
mount /dev/sdb /mnt
```
`/mnt`可以是任一个**事先建好的空目录名**，允许处于根文件系统的任何目录中，此后，操作子目录/mnt就是对子文件系统的访问。对于应用程序来说，从所操作的文件或目录名，看不出和其它根文件系统的对象有什么区别。

## 不带参数的mount命令
列出当前已安装的所有的子文件系统
```
root@localhost ~]# mount
/dev/block/mmcblk0p53 on / type ext4 (rw,seclabel,relatime,discard,noauto_da_alloc,errors=panic,data=ordered)
proc on /proc type proc (rw,relatime)
sys on /sys type sysfs (rw,seclabel,relatime)
tmpfs on /dev type tmpfs (rw,seclabel,nosuid,relatime,size=1822552k,nr_inodes=455638,mode=755)
tmpfs on /dev/shm type tmpfs (rw,seclabel,nosuid,nodev,relatime)
devpts on /dev/pts type devpts (rw,seclabel,relatime,mode=600)
/data/media on /mnt/files type sdcardfs (rw,nosuid,nodev,relatime,uid=1023,gid=1023,derive=legacy,reserved=50MB)
[root@localhost ~]#
```

## umount：文件系统的卸载
### umount命令
功能与mount命令相反，卸载一个已安装的子文件系统。例如：
```
umount /dev/sdb
```

## df: 文件系统空闲空间
```
[root@localhost ~]# df
文件系统                                  1K-块     已用     可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata 56814352 24486508 32311460   44% /
tmpfs                                   1822552      368  1822184    1% /dev
tmpfs                                   1843032        0  1843032    0% /dev/shm
/data/media                            56763152 24502892 32260260   44% /mnt/files
[root@localhost ~]# 
```

```
[root@localhost ~]# df -h
文件系统                                容量  已用  可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata   55G   24G   31G   44% /
tmpfs                                   1.8G  368K  1.8G    1% /dev
tmpfs                                   1.8G     0  1.8G    0% /dev/shm
/data/media                              55G   24G   31G   44% /mnt/files
[root@localhost ~]# 
```