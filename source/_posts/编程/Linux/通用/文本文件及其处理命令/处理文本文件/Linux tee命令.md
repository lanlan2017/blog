---
title: Linux tee命令
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 处理文本文件
abbrlink: e84a1417
date: 2021-04-24 12:57:15
updated: 2021-04-24 12:57:15
---
# tee命令功能
将从标准输入 stdin 得到的数据抄送到标准输出 stdout 显示 ，同时存入磁盘文件中
简单的说就是把数据重定向到给定文件和屏幕上。
```
[root@localhost 2021年04月]# tee --help
用法：tee [选项]... [文件]...
将标准输入复制到每个指定文件，并显示到标准输出。

  -a, --append        内容追加到给定的文件而非覆盖
  -i, --ignore-interrupts    忽略中断信号
      --help        显示此帮助信息并退出
      --version        显示版本信息并退出

如果文件指定为"-"，则将输入内容复制到标准输出。

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
请向<http://translationproject.org/team/zh_CN.html> 报告tee 的翻译错误
要获取完整文档，请运行：info coreutils 'tee invocation'
[root@localhost 2021年04月]# 
```
```
TEE(1)                                                                          FSF                                                                         TEE(1)

NAME
       tee - 从标准输入写往文件和标准输出

总览 (SYNOPSIS)
       tee [OPTION]... [FILE]...

描述 (DESCRIPTION)
       把 标准输入 的 数据 复制到 每一个 文件 FILE, 同时 送往 标准输出.
TEE(1)                                                                          FSF                                                                         TEE(1)

NAME
       tee - 从标准输入写往文件和标准输出

总览 (SYNOPSIS)
       tee [OPTION]... [FILE]...

描述 (DESCRIPTION)
       把 标准输入 的 数据 复制到 每一个 文件 FILE, 同时 送往 标准输出.

       -a, --append
              追加到 给出的 文件, 而不是 覆盖

       tee - 从标准输入写往文件和标准输出

总览 (SYNOPSIS)
       tee [OPTION]... [FILE]...

描述 (DESCRIPTION)
       把 标准输入 的 数据 复制到 每一个 文件 FILE, 同时 送往 标准输出.

       -a, --append
              追加到 给出的 文件, 而不是 覆盖

       -i, --ignore-interrupts
              忽略 中断信号

       --help 显示 帮助信息, 然后 结束

       --version
              显示 版本信息, 然后 结束
```
# tee示例
## ls | tee 文件
在终端打印stdout同时重定向到文件中：
```
[root@localhost 2021年04月]# ls | tee out.txt
2021年04月09日Linux专项练习1.md
2021年04月11日Linux专项练习1.md
2021年04月12日Linux专项练习1.md
2021年04月12日Linux专项练习2.md
2021年04月12日Linux专项练习3.md
2021年04月17日Linux专项联系1.md
2021年04月18日Linux专项练习1.md
2021年04月18日Linux专项练习2.md
2021年04月18日Linux专项练习3.md
2021年04月18日Linux专项练习4.md
2021年04月18日Linux专项练习5.md
out.txt
[root@localhost 2021年04月]# cat out.txt 
2021年04月09日Linux专项练习1.md
2021年04月11日Linux专项练习1.md
2021年04月12日Linux专项练习1.md
2021年04月12日Linux专项练习2.md
2021年04月12日Linux专项练习3.md
2021年04月17日Linux专项联系1.md
2021年04月18日Linux专项练习1.md
2021年04月18日Linux专项练习2.md
2021年04月18日Linux专项练习3.md
2021年04月18日Linux专项练习4.md
2021年04月18日Linux专项练习5.md
out.txt
[root@localhost 2021年04月]# 
```
## ps -ef |tee 文件
将进程信息通过管道输出到标准输出（终端）并覆盖写入到文件中。
```
ps -ef |tee info_a.log
```
```
[root@localhost Linux_Test]# ps -ef|head|tee info_a.log
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 4月21 ?       00:02:42 /init
root         2     0  0 4月21 ?       00:00:00 [kthreadd]
root         3     2  0 4月21 ?       00:04:01 [ksoftirqd/0]
root         7     2  0 4月21 ?       00:07:22 [rcu_preempt]
root         8     2  0 4月21 ?       00:00:00 [rcu_bh]
root         9     2  0 4月21 ?       00:00:01 [rcu_sched]
root        10     2  0 4月21 ?       00:01:09 [migration/0]
root        11     2  0 4月21 ?       00:00:44 [migration/1]
root        12     2  0 4月21 ?       00:02:51 [ksoftirqd/1]
[root@localhost Linux_Test]# ls
cat_test.txt   info_a.log     ls_out.txt   man_less.txt    more_test3.txt  more_test.txt  vi_replaceAllTest.txt
date_test.txt  less_test.txt  ls_sort.txt  more_test2.txt  more_test4.txt  sortFile.txt
[root@localhost Linux_Test]# cat info_a.log 
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 4月21 ?       00:02:42 /init
root         2     0  0 4月21 ?       00:00:00 [kthreadd]
root         3     2  0 4月21 ?       00:04:01 [ksoftirqd/0]
root         7     2  0 4月21 ?       00:07:22 [rcu_preempt]
root         8     2  0 4月21 ?       00:00:00 [rcu_bh]
root         9     2  0 4月21 ?       00:00:01 [rcu_sched]
root        10     2  0 4月21 ?       00:01:09 [migration/0]
root        11     2  0 4月21 ?       00:00:44 [migration/1]
root        12     2  0 4月21 ?       00:02:51 [ksoftirqd/1]
[root@localhost Linux_Test]# 
```
将进程信息通过管道输出到标准输出（终端）并追加写入到文件中。
```
ps -ef |tee -a info_a.log info_b.log
```
# 参考资料
[https://zhuanlan.zhihu.com/p/34510815](https://zhuanlan.zhihu.com/p/34510815)
[https://linux.cn/article-9435-1.html](https://linux.cn/article-9435-1.html)
[https://man.linuxde.net/tee](https://man.linuxde.net/tee)