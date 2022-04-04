---
title: Linux 文件命名和目录结构
categories: 
  - Linux
  - 通用
  - 文件名和文件通配符
abbrlink: 80acc920
date: 2021-05-31 13:53:53
updated: 2022-04-04 00:51:45
---
# 文件和目录的命名规则
## 名字长度
- 一般允许1－255字符
- 有些UNIX不支持长文件名，但至少长度为1-14

## 取名的合法字符
- 除斜线外的所有字符都是命名的合法字符
- 不可打印字符也可以做文件名(除了字节0）
- 斜线（/）留做路径名分割符

## 大小写字母有区别
- Makefile与makefile是两个不同的文件
- 尽量不要依靠字母的大小写区分不同文件名，文件名带来的说明性差，不便于Windows/Linux之间的迁移

# 系统配置信息
## /etc目录
- **供系统维护管理用的命令和配置文件**
  - 文件格式为文本文件
  - **功能类似Windows的注册表信息**

/etc目录包括如下内容
- `passwd，hosts文件
- `*.conf`文件
- ssh,xinet.d,apt,network….等目录
- 系统启动阶段系统初始化和启动各服务的脚本`rc*.d`
- `profile`/`bash.bashrc`系统级bash等shell的偏好设置
- 自定义的需要自启动的服务脚本`rc.local`

# 临时目录
## /tmp
临时文件，每个用户都可以在这里临时创建文件，但只能删除自己的文件，不可以删除其他用户创建的文件
## /var
系统运行时要改变的数据
系统日志syslog等

# 可运行程序和设备文件
（类似Windows的Program Files目录和Windows\system32）
## /bin 
**系统常用命令**，如ls，ln，cp，cat等
## /usr/bin 
**存放一些常用命令**，如ssh,ftp，make，gcc，git等
## /sbin,/usr/sbin
**系统管理员专用命令**
## /dev 
设备文件，如终端设备，磁带机，打印机等

# 头文件和库文件
## /usr/include  (usr=Unix System Resource）
C语言头文件存放目录
## /lib,/usr/lib 
- 存放各种库文件，指C语言的链接库文件，以及terminfo终端库等等
- 静态链接库文件有`.a`后缀(archive，存档)
- 动态链接库文件后缀是`.so`  (shared objects：共享的目标代码，多个.o文件的集成) 
- Linux广泛使用动态链接库，静态链接库逐渐过时

使用动态链接库的好处

### 动态链接
动态链接与静态链接
#### 命令ldd
```
[root@localhost vi]# ldd ./helloworld.out 
    linux-vdso.so.1 =>  (0x0000007f85b2f000)
    libc.so.6 => /lib64/libc.so.6 (0x0000007f859a2000)
    /lib/ld-linux-aarch64.so.1 (0x000000557443e000)
[root@localhost vi]# 
```

```shell
gcc hello.c –o hello          #hello大小(7.2KB)
gcc –static hello.c –o hello  #hello大小(712KB)
```
应用程序可编程控制的动态链接库的加载、卸载和调用
