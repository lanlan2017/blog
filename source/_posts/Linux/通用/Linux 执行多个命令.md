---
title: Linux 执行多个命令
categories:
  - Linux
  - 通用
abbrlink: 1598bd9
date: 2019-11-01 10:24:47
updated: 2019-11-01 10:24:47
---
- [Linux执行多个命令](/blog/html/null/#Linux执行多个命令)
    - [全部执行](/blog/html/null/#全部执行)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# Linux执行多个命令 #
## 全部执行 ##
使用英文分号将多个命令隔开,这样不管前面的命令执行是否成功,后面的命令都会执行
```bash
echo hello1;echo hello2;echo hello3
```
