---
title: Linux 访问i节点和目录
categories: 
  - Linux
  - 通用
  - 文件系统
abbrlink: 406107e0
date: 2021-06-20 18:33:25
updated: 2022-04-04 00:51:45
---
# 统调用stat/fstat：从i节点获得文件的状态信息
从i节点获得文件的状态信息
- stat得到指定路径名的文件的i节点
- fstat得到已打开文件的i节点

stat和fstat将数据放入调用者提供的stat结构中
```
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
int stat(const char *pathname, struct stat *buf);
int fstat(int fd, struct stat *buf);
struct stat {
    dev_t st_dev; /* 存储该文件的块设备的设备号ID */
    ino_t st_ino; /* inode号 */
    mode_t st_mode; /* 访问权限及文件类型 */
    nlink_t st_nlink; /* link数 */
    uid_t st_uid; /* 文件主ID */
    gid_t st_gid; /* 组ID */
    dev_t st_rdev; /* device ID (if special file) */
    off_t st_size; /* 文件大小（字节数）*/
    blksize_t st_blksize; /* blocksize for filesystem I/O */
    blkcnt_t st_blocks; /* 分配的512字节尺寸块个数 */
    struct timespec st_atim; /* access时间 */
    struct timespec st_mtim; /* modification时间 */
    struct timespec st_ctim; /* change时间 */
};
```
## 结构体stat
 st_dev：存储该文件的块设备的设备号，包括主设备号与次设备号
例如stat命令显示文件Device: 821h/2081d
十六进制0821，主设备号8（高字节），次设备号33(低字节)， /dev/sdc1
```
ls -l /dev | grep '^b.* 8, *33'
brw-rw---- 1 root disk      8,  33 Nov 18 10:40 sdc1
```
### st_mode域：16比特
文件的基本存取权限和SUID/SGID权限(11比特)以及文件的类型(若干比特)
文件类型判st_mode & S_IFMT
S_IFREG     普通磁盘文件
S_IFDIR     目录文件
S_IFCHR     字符设备文件
S_IFIFO      管道文件
S_IFLNK     符号连接文件

### st_size与st_blocks
程序可以通过st_size获取文件大小。
一般情况:st_size ≤ st_blocks * 512
稀疏文件:st_size > st_blocks * 512

### st_ctim，st_atim，st_mtim域
Linux中存储这三个时间的精度为纳秒
“a访问”：读，执行（有些系统为了效率做懒惰处理，不更新，但不早于m时间）
“m修改”：文件内容修改。写文件
“c改变”：i节点信息变化。写文件，修改权限/link数/文件主等（m变，c也变）
## 目录访问
早期的UNIX象普通磁盘文件那样open()打开目录read()读取
现在的系统不再这样操作，而是直接使用封装好的库函数

## 目录访问的一组库函数
```c
#include <dirent.h>
DIR *opendir(char *dirname);
struct dirent *readdir(DIR *dir);
int closedir(DIR *dir);
```
opendir打开目录得到句柄（NULL表示失败）
readdir获取一个目录项
- 返回值指针指向的dirent结构体（返回NULL表示已经读到目录尾）
- dirent结构体：记录i节点号和文件名(d_ino和d_name成员)
访问结束：用closedir关闭不再使用的目录句柄。

## 目录访问程序
```c
#include <stdio.h>
#include <dirent.h>
#include <errno.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    DIR *dir;
    struct dirent *entry;
    if (argc != 2) {
        fprintf(stderr, "Usage : %s <dirname>\n", argv[0]);
        exit(1);
    }
    if ((dir = opendir(argv[1])) == NULL) {
        printf("Open directory \"%s\": %s (ERROR %d)\n", argv[1], strerror(errno), errno);
        exit(1);
    }
    while ((entry = readdir(dir)) != NULL)
        printf("%d %s\n", entry->d_ino, entry->d_name);
    closedir(dir);
}
```
运行效果：
```
[root@localhost Linux命令风格；文件系统]# ./dir .
524351 .
524325 ..
524413 useEnv
524326 openfile
524446 useEnvC
524336 openfile.c
524346 dir
524353 dir.c
[root@localhost Linux命令风格；文件系统]# 
```
## 利用目录访问和stat调用来 编程构造自己的工具
- 目录访问：可以穷举一个目录中的所有项目，可得文件名及节点号
- stat调用：可以根据文件名获得文件i节点中的状态信息

由此，可以编程构造诸如ls, rm, find等类似的工具，并理解系统命令是如何实现的。
