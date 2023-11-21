---
title: int静态数组转String静态数组
categories:
  - 其他
  - 正则表达式
abbrlink: b334204a
date: 2023-07-04 12:10:22
updated: 2023-07-04 12:10:22
---

# int数组正则替换为String数组
查找:
```regex
(\d+)(,|})
```
替换为:
```regex
"$1"$2
```
# 示例
要处理的文本
```java
private String[] widthArr = {600, 540, 500, 480, 420, 360, 350, 340};
```
替换之后：
```java
private String[] widthArr = {"600", "540", "500", "480", "420", "360", "350", "340"};
```
