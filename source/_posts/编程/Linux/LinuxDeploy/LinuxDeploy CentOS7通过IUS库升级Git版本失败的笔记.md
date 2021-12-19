---
title: LinuxDeploy CentOS7通过IUS库升级Git版本失败的笔记
categories: 
  - 编程
  - Linux
  - LinuxDeploy
date: 2021-03-18 07:38:31
updated: 2021-03-19 02:11:59
abbrlink: 3a2566e4
---
# LinuxDeploy CentOS7升级Git版本
**注意！本文并没能升级成功，IUS老是报错404,所以本文对你可能没有帮助，我留着这篇文章只是做个记录而已。**
## 使用EPEL库
EPEL (Extra Packages for Enterprise Linux) 想必大多数人都用过，它是一个免费、开源，广受欢迎的，基于社区的库项目。其目标是提供一个在Fedora下开发、测试和完善的高质量的软件包。并且可以在RHEL, CentOS和Scientific Linux等Linux系统可用。
如果想在你的系统上使用EPEL库，使用如下命令：
```bash
yum install epel-release
```
## IUS Community 库
IUS (Inline with Upstream Stable) ，它是一个新的第三方的、社区支持的库，它为PHP, Python和MySQL提供了最新的高质量的RPM包。
IUS依赖EPEL,所以要先安装epel-release.
安装IUS库：
```bash
yum install \
https://repo.ius.io/ius-release-el7.rpm \
https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```
## 卸载旧版的git
```bash
yum remove git
```
## 安装新版的git
```bash
yum -y install  git2u-all
```
我安装失败了，报错如下：
```
[root@localhost ~]# yum install git2u
已加载插件：fastestmirror
Loading mirror speeds from cached hostfile
Could not get metalink https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=aarch64&infra=stock&content=altarch error was
12: Timeout on https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=aarch64&infra=stock&content=altarch: (28, 'Operation timed out after 30001 milliseconds with 0 out of 0 bytes received')
 * epel: mirrors.bfsu.edu.cn
base                                                                                                                                           | 3.6 kB  00:00:00     
centos-7-aarch64                                                                                                                               | 3.6 kB  00:00:00     
extras                                                                                                                                         | 2.9 kB  00:00:00     
https://repo.ius.io/7/aarch64/repodata/repomd.xml: [Errno 14] HTTPS Error 404 - Not Found
正在尝试其它镜像。
To address this issue please refer to the below wiki article 

https://wiki.centos.org/yum-errors

If above article doesn't help to resolve this issue please use https://bugs.centos.org/.



 One of the configured repositories failed (IUS for Enterprise Linux 7 - aarch64),
 and yum doesn't have enough cached data to continue. At this point the only
 safe thing yum can do is fail. There are a few ways to work "fix" this:

     1. Contact the upstream for the repository and get them to fix the problem.

     2. Reconfigure the baseurl/etc. for the repository, to point to a working
        upstream. This is most often useful if you are using a newer
        distribution release than is supported by the repository (and the
        packages for the previous distribution release still work).

     3. Run the command with the repository temporarily disabled
            yum --disablerepo=ius ...

     4. Disable the repository permanently, so yum won't use it by default. Yum
        will then just ignore the repository until you permanently enable it
        again or use --enablerepo for temporary usage:

            yum-config-manager --disable ius
        or
            subscription-manager repos --disable=ius

     5. Configure the failing repository to be skipped, if it is unavailable.
        Note that yum will try to contact the repo. when it runs most commands,
        so will have to try and fail each time (and thus. yum will be be much
        slower). If it is a very temporary problem though, this is often a nice
        compromise:

            yum-config-manager --save --setopt=ius.skip_if_unavailable=true

failure: repodata/repomd.xml from ius: [Errno 256] No more mirrors to try.
https://repo.ius.io/7/aarch64/repodata/repomd.xml: [Errno 14] HTTPS Error 404 - Not Found
```
# 如何卸载EPEL库
我不知道具体怎么卸载IUS库的方法,下面是下载EPEL库的方法。
```shell
yum remove epel-release
```
运行效果：
```
[root@localhost ~]# yum remove epel-release
已加载插件：fastestmirror
正在解决依赖关系
--> 正在检查事务
---> 软件包 epel-release.noarch.0.7-13 将被 删除
--> 正在处理依赖关系 epel-release = 7，它被软件包 ius-release-2-1.el7.ius.noarch 需要
--> 正在检查事务
---> 软件包 ius-release.noarch.0.2-1.el7.ius 将被 删除
--> 解决依赖关系完成

依赖关系解决

======================================================================================================================================================================
 Package                              架构                           版本                                源                                                      大小
======================================================================================================================================================================
正在删除:
 epel-release                         noarch                         7-13                                @/epel-release-latest-7.noarch                          25 k
为依赖而移除:
 ius-release                          noarch                         2-1.el7.ius                         @/ius-release-el7                                      4.5 k

事务概要
======================================================================================================================================================================
移除  1 软件包 (+1 依赖软件包)

安装大小：29 k
是否继续？[y/N]：y
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  正在删除    : ius-release-2-1.el7.ius.noarch                                                                                                                    1/2 
  正在删除    : epel-release-7-13.noarch                                                                                                                          2/2 
  验证中      : ius-release-2-1.el7.ius.noarch                                                                                                                    1/2 
  验证中      : epel-release-7-13.noarch                                                                                                                          2/2 

删除:
  epel-release.noarch 0:7-13                                                                                                                                          

作为依赖被删除:
  ius-release.noarch 0:2-1.el7.ius                                                                                                                                    

完毕！
[root@localhost ~]#
```
# 如何卸载IUS库
那我要是没猜错的话,卸载IUS库应该和上面卸载EPEL库的命令`yum remove epel-release`差不多,应该是：
```shell
yum remove ius-release
```
# 参考资料
CentOS和RedHat下8个最常用的YUM库：https://zhuanlan.zhihu.com/p/57154163
Centos7升级git：https://zhuanlan.zhihu.com/p/73357795
https://ius.io/
https://ius.io/setup
