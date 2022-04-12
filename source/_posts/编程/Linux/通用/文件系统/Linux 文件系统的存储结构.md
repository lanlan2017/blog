---
title: Linux 文件系统的存储结构
categories: 
  - Linux
  - 通用
  - 文件系统
abbrlink: cb70a761
date: 2021-06-20 14:51:43
updated: 2022-04-04 00:51:45
mathjax: true
---
# 文件系统的结构
把整个逻辑设备以块(扇区) 为单位为划分，编号为0，1，2，...。
（每块512字节或其他更大$2^n$字节大小）
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure/1.png)

## 引导块(0号块)
用于启动系统，只有根文件系统的引导块有效

## 专用块(1号块)
也叫管理块，或者超级块
- **存放文件系统的管理信息**。如：文件系统的大小，i节点区的大小，空闲空间大小，空闲块链表的头等等
- mkfs命令时初始化，df命令读出部分信息，df -i和df

```
[root@localhost Linux命令风格；文件系统]# df -h
文件系统                                容量  已用  可用 已用% 挂载点
/dev/block/bootdevice/by-name/userdata   55G   24G   31G   44% /
tmpfs                                   1.8G  368K  1.8G    1% /dev
tmpfs                                   1.8G     0  1.8G    0% /dev/shm
/data/media                              55G   24G   31G   44% /mnt/files
[root@localhost Linux命令风格；文件系统]# df -hi
文件系统                               Inode 已用(I) 可用(I) 已用(I)% 挂载点
/dev/block/bootdevice/by-name/userdata  3.5M    153K    3.4M       5% /
tmpfs                                   445K     910    445K       1% /dev
tmpfs                                   450K       1    450K       1% /dev/shm
/data/media                             3.5M    153K    3.4M       5% /mnt/files
[root@localhost Linux命令风格；文件系统]# 
```
## i节点区
i节点区：i节点(index node，简记为i-node)
- i节点区由若干块构成，在mkfs命令创建文件系统时确定
- 每块可容若干个i节点，每个i节点的大小是固定的（比如64字节）
- i节点从0开始编号，根据编号可以索引到磁盘块
- 每个文件都对应一个i节点，i节点中的信息包括：
  - 指向文件存储区数据块的一些索引（index）指针（组成文件的逻辑块与硬盘的物理块之间的映射）
  - 文件类型，属主，组，权限，link数，大小，时戳（i节点内不含文件名）

## 文件存储区
用于存放文件数据的区域，包括目录表

# 目录的存储结构
Linux目录结构是树形带交叉勾连的目录结构
## 目录表
- 每个目录表也作为一个文件来管理，存于“文件存储区”中，有其自己的i节点和数据存储块
- 目录表由若干个“目录项”构成，目录项只含两部分信息：
  - 文件名
  - i节点号
- 用ls命令列出的目录大小是**目录表文件本身的长度**

## 目录存储结构示意图
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure/2.png)

## 目录表和i节点两级结构
主要目的：分开存放的主要目的是为了提高目录检索效率
### 假定的环境
- 存储文件名使用定长14字节，索引信息需要64字节，每磁盘块512字节
- 当前目录下有100个文件，需要访问的文件的文件名mydata.bin存放在目录表的最末尾处

### 方案一：一级结构
- 文件名和索引信息存放在一起，放在目录表中
- 每个目录项78字节，每块可容纳512÷78=6个目录项
- 读入目录直到第17块才找到mydata.bin以及索引信息，根据索引信息访问文件存储区的数据块

### 方案二：两级结构
- 文件名和索引信息分开，索引信息存放在i节点中，目录表中仅记录文件名和i节点的2字节编号
- 每个目录项16字节，一个磁盘块含512÷16=32个目录项
- 读入4块就检索到名字mydata.bin的i节点号
- 根据i节点号访问对应的磁盘块，读入i节点中的索引信息
- 总共磁盘操作5块，就可以根据名字找到文件的索引信息

两种方案的比较
- 后者需要更少的磁盘访问次数
- 文件系统采用这样的存储结构，完全可以在同一目录或者不同目录中的两个目录项，有相同的i节点号

# 命令stat：读取i节点信息
示例：
```
[root@localhost Linux命令风格；文件系统]# stat useEnv.c 
  文件："useEnv.c"
  大小：239           块：8          IO 块：4096   普通文件
设备：10315h/66325d    Inode：524446      硬链接：1
权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)
最近访问：2021-06-18 22:19:04.164832314 +0800
最近更改：2021-06-18 22:19:04.164832314 +0800
最近改动：2021-06-18 22:19:04.164832314 +0800
创建时间：-
[root@localhost Linux命令风格；文件系统]# 
```




<!-- Blog/programming/LinuxGeneral/FileSystem/LinuxFileSystemStorageStructure -->
