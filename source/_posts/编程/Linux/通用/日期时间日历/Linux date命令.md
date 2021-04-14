---
title: Linux date命令
categories: 
  - 编程
  - Linux
  - 通用
  - 日期时间日历
abbrlink: 4afae6e5
date: 2021-04-20 17:36:46
updated: 2021-04-20 23:07:47
---
<div id='my_toc'><a href="/blog/4afae6e5/#读取系统日期和时间命令date" class="header_1">读取系统日期和时间命令date</a>&nbsp;<br><a href="/blog/4afae6e5/#定制date输出格式" class="header_2">定制date输出格式</a>&nbsp;<br><a href="/blog/4afae6e5/#date格式控制字符串" class="header_3">date格式控制字符串</a>&nbsp;<br><a href="/blog/4afae6e5/#man-date" class="header_2">man date</a>&nbsp;<br><a href="/blog/4afae6e5/#date-d-String" class="header_2">date -d String</a>&nbsp;<br><a href="/blog/4afae6e5/#date-f-日期文件" class="header_2">date -f 日期文件</a>&nbsp;<br><a href="/blog/4afae6e5/#date-r-文件" class="header_2">date -r 文件</a>&nbsp;<br><a href="/blog/4afae6e5/#date-R" class="header_2">date -R</a>&nbsp;<br><a href="/blog/4afae6e5/#date-s-日期时间字符串" class="header_2">date -s 日期时间字符串</a>&nbsp;<br><a href="/blog/4afae6e5/#date-u" class="header_2">date -u</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 读取系统日期和时间命令date
```
date
```
运行结果：
```
[root@localhost ~]# date
2021年 04月 20日 星期二 17:38:08 CST
[root@localhost ~]# 
```
## 定制date输出格式
```
date "+%Y-%m-%d %H:%M:%S Day %j"
```
运行结果：
```
[root@localhost ~]# date "+%Y-%m-%d %H:%M:%S Day %j"
2021-04-20 17:41:05 Day 110
[root@localhost ~]# 
```
110 指 的是今天是今年的 第 110 天，

### date格式控制字符串
**第一个字符必须为`+`号**，`%Y`代表年号，`%m`代表月份，`%M` 代表分钟。`%H`表示小时
`%s`表示秒坐标（从 UTC1970 开始），或者叫时间戳常用于计算时间间隔。
```
date "+%s"
```
运行结果
```
[root@localhost ~]# date "+%s"
1618912024
[root@localhost ~]#
```
## man date
Linux 命令 往往有很多选项和复杂的功能，通过 man date 查阅联机手册
```
DATE(1)                                                                         FSF                                                                        DATE(1)

NAME
       date - 打印或设置系统日期和时间

总览
       date [选项]... [+格式]
       date [选项] [MMDDhhmm[[CC]YY][.ss]]

描述
       根据指定格式显示当前时间或设置系统时间.

       -d, --date=STRING
              显示由 STRING 指定的时间, 而不是当前时间

       -f, --file=DATEFILE
              显示 DATEFILE 中每一行指定的时间, 如同将 DATEFILE 中的每行作为 --date 的参数一样

              -I, --iso-8601[=TIMESPEC] 按照 ISO-8601 的日期/时间格式输出时间.

              TIMESPEC=`date' (或者不指定时)仅输出日期,等于 `hours', `minutes', 或`seconds' 时按照指定精度输出日期及时间.

       -r, --reference=FILE
              显示 FILE 的最后修改时间

       -R, --rfc-822
              根据 RFC-822 指定格式输出日期

       -s, --set=STRING
              根据 STRING 设置时间

       -u, --utc, --universal
              显示或设置全球时间(格林威治时间)

       --help 显示本帮助文件并退出

       --version
              显示版本信息并退出


       格式 FORMAT 控制着输出格式. 仅当选项指定为全球时间时本格式才有效。 分别解释如下:

       %%     文本的 %

       %a     当前区域的星期几的简写 (Sun..Sat)

       %A     当前区域的星期几的全称 (不同长度) (Sunday..Saturday)

       %b     当前区域的月份的简写 (Jan..Dec)

       %B     当前区域的月份的全称(变长) (January..December)

       %c     当前区域的日期和时间 (Sat Nov 04 12:02:33 EST 1989)

       %d     (月份中的)几号(用两位表示) (01..31)

       %D     日期(按照 月/日期/年 格式显示) (mm/dd/yy)

       %e     (月份中的)几号(去零表示) ( 1..31)

       %h     同 %b

       %H     小时(按 24 小时制显示，用两位表示) (00..23)

       %I     小时(按 12 小时制显示，用两位表示) (01..12)

       %j     (一年中的)第几天(用三位表示) (001..366)

       %k     小时(按 24 小时制显示，去零显示) ( 0..23)

       %l     小时(按 12 小时制显示，去零表示) ( 1..12)

       %m     月份(用两位表示) (01..12)

       %M     分钟数(用两位表示) (00..59)

       %n     换行

       %p     当前时间是上午 AM 还是下午 PM

       %r     时间,按 12 小时制显示 (hh:mm:ss [A/P]M)

       %s     从 1970年1月1日0点0分0秒到现在历经的秒数 (GNU扩充)

       %S     秒数(用两位表示)(00..60)

       %t     水平方向的 tab 制表符

       %T     时间,按 24 小时制显示(hh:mm:ss)

       %U     (一年中的)第几个星期，以星期天作为一周的开始(用两位表示) (00..53)

       %V     (一年中的)第几个星期，以星期一作为一周的开始(用两位表示) (01..52)

       %w     用数字表示星期几 (0..6); 0 代表星期天

       %W     (一年中的)第几个星期，以星期一作为一周的开始(用两位表示) (00..53)

       %x     按照 (mm/dd/yy) 格式显示当前日期

       %X     按照 (%H:%M:%S) 格式显示当前时间

       %y     年的后两位数字 (00..99)

       %Y     年(用 4 位表示) (1970...)





       %z     按照 RFC-822 中指定的数字时区显示(如, -0500) (为非标准扩充)

       %Z     时区(例如, EDT (美国东部时区)), 如果不能决定是哪个时区则为空

       默认情况下,用 0 填充数据的空缺部分.  GNU 的 date 命令能分辨在 `%'和数字指示之间的以下修改.

              `-' (连接号) 不进行填充 `_' (下划线) 用空格进行填充

BUG报告
       请向<bug-sh-utils@gnu.org>报告BUG.

参考
       关于 date 的详细说明是个 Texinfo 手册. 如果在你的计算机上已经成功安装了 info 和 date 程序,你可以使用

              info date

       命令访问完全手册.

```
## date -d String
显示字符串对应的时间
```
[root@localhost ~]# date -d 2014-2-7
2014年 02月 07日 星期五 00:00:00 CST
[root@localhost ~]# 
```
## date -f 日期文件
解析日期文件中的每个日期
```
[root@localhost Linux_Test]# cat date_test.txt 
2020-01-24 04:05:06
2021/4/25
[root@localhost Linux_Test]#
```
显示date_test.txt文件中每行日期对应的具体时间：
```
[root@localhost Linux_Test]# date -f date_test.txt 
2020年 01月 24日 星期五 04:05:06 CST
2021年 04月 25日 星期日 00:00:00 CST
[root@localhost Linux_Test]# 
```
## date -r 文件
显示文件最新更改时间。
```
[root@localhost Linux_Test]# ls
date_test.txt  vi_replaceAllTest.txt
[root@localhost Linux_Test]# date -r vi_replaceAllTest.txt 
2021年 04月 14日 星期三 01:48:41 CST
[root@localhost Linux_Test]# 
```
## date -R
```
[root@localhost Linux_Test]# date -R
Tue, 20 Apr 2021 18:25:59 +0800
[root@localhost Linux_Test]# 
```
## date -s 日期时间字符串
根据传入的日期时间字符串设置系统的时间
## date -u
显示格林威治时间
```
[root@localhost Linux_Test]# date -u
2021年 04月 20日 星期二 10:28:52 UTC
[root@localhost Linux_Test]# 
```
