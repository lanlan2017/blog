---
title: Linux yum安装剪贴板xclip命令提示”没有可用软件包”
categories: 
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
abbrlink: c4a3bc5b
date: 2021-04-23 14:26:12
updated: 2021-04-23 15:43:17
---
# 安装软件包

## 先安装epel-release软件包
很多软件包在yum里面没有的，解决的方法，就是使用epel源,也就是安装epel-release软件包。EPEL (Extra Packages for Enterprise Linux)是基于Fedora的一个项目，为“红帽系”的操作系统提供额外的软件包，适用于RHEL、CentOS等系统。
## 安装xclip
```
yum install xclip
```
## 安装xsel
```
依赖关系解决

================================================================================================================================================
 Package                                   架构                         版本                                 源                            大小
================================================================================================================================================
正在安装:
 libX11-devel                              aarch64                      1.6.7-3.el7_9                        updates                      981 k
 libXmu-devel                              aarch64                      1.1.2-2.el7                          base                          24 k
为依赖而安装:
 libICE                                    aarch64                      1.0.9-9.el7                          base                          63 k
 libICE-devel                              aarch64                      1.0.9-9.el7                          base                          50 k
 libSM                                     aarch64                      1.2.2-2.el7                          base                          38 k
 libSM-devel                               aarch64                      1.2.2-2.el7                          base                          12 k
 libX11                                    aarch64                      1.6.7-3.el7_9                        updates                      582 k
 libX11-common                             noarch                       1.6.7-3.el7_9                        updates                      164 k
 libXau                                    aarch64                      1.0.8-2.1.el7                        base                          29 k
 libXau-devel                              aarch64                      1.0.8-2.1.el7                        base                          14 k
 libXext                                   aarch64                      1.3.3-3.el7                          base                          37 k
 libXext-devel                             aarch64                      1.3.3-3.el7                          base                          74 k
 libXmu                                    aarch64                      1.1.2-2.el7                          base                          68 k
 libXt                                     aarch64                      1.1.5-3.el7                          base                         157 k
 libXt-devel                               aarch64                      1.1.5-3.el7                          base                         445 k
 libxcb                                    aarch64                      1.13-1.el7                           base                         210 k
 libxcb-devel                              aarch64                      1.13-1.el7                           base                         1.1 M
 xorg-x11-proto-devel                      noarch                       2018.4-1.el7                         base                         280 k

事务概要
================================================================================================================================================
安装  2 软件包 (+16 依赖软件包)
```

# 参考资料
[https://blog.csdn.net/you_you0329/article/details/108243871](https://blog.csdn.net/you_you0329/article/details/108243871)
