---
title: JVM内存配置参数
categories:
  - 编程
  - Java
  - JVM
abbrlink: dd00c2d7
date: 2021-09-24 10:26:32
updated: 2021-09-24 10:26:32
---
# JVM内存配置参数


|参数|描述|
|:---|:---|
|`-Xmx`|堆的最大堆|
|`-Xms`|堆的最小值|
|`-Xmn`|新生代大小|
|`-XX：Survivor-Ratio=8`|新生代中Eden区与**一个Survivor区**的空间比例是8∶1|

Survivor有From和to两个区域。

-XX:SurvivorRatio    设置新生代中eden和S0/S1空间的比例

默认
```
-XX:SurvivorRatio=8,Eden:S0:S1=8:1:1
```
假如
```
-XX:SurvivorRatio=4,Eden:S0:S1=4:1:1
```
SurvivorRatio值就是设置Eden区的比例占多少,S0/S1相同


## 参考资料
[3.8.1 对象优先在Eden分配](/JavaReadingNotes/7d7f0242/)
[/JavaReadingNotes/ba848843/](/JavaReadingNotes/ba848843/)