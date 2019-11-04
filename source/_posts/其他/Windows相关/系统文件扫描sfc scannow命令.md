---
title: 系统文件扫描sfc scannow命令
categories: 
  - 其他
  - Windows相关
date: 2019-05-23 18:49:38
updated: 2019-10-30 13:53:55
abbrlink: 9b2b8330
---
- [sfc /scannow命令说明](/blog/html/9b2b8330/#sfc-scannow命令说明)
- [参考资料](/blog/html/9b2b8330/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# sfc /scannow命令说明 #
> `sfc`的全称是`SystemFileChecker`，指代系统文件检查程序用于扫描和检查是否存在已损坏或被取代的系统档案文件，并进行正确文件的修复替换
```cmd
C:\Windows\system32>sfc /scannow
开始系统扫描。此过程将需要一些时间。
开始系统扫描的验证阶段。
验证 100% 已完成。
Windows 资源保护找到了损坏文件并成功修复了它们。
对于联机修复，位于 windir\Logs\CBS\CBS.log 的 CBS 日志文件中
有详细信息。例如 C:\Windows\Logs\CBS\CBS.log。对于脱机修复，
/OFFLOGFILE 标记提供的日志文件中有详细信息。
C:\Windows\system32>
```
# 参考资料 #
[https://blog.csdn.net/zhangyihui2016/article/details/47376093](https://blog.csdn.net/zhangyihui2016/article/details/47376093)
>原文链接: [系统文件扫描sfc scannow命令](https://lanlan2017.github.io/blog/9b2b8330/)
