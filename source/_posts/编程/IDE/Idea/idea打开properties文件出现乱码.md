---
title: idea打开properties文件出现乱码
categories:
  - 编程
  - IDE
  - Idea
abbrlink: 8215c991
date: 2024-06-23 11:24:53
updated: 2024-06-23 11:24:53
---
## 问题描述

重新安装了idea，打开原来的项目中得properties文件是出现类似如下的乱码：

```properties
com.taobao.live=\u70b9\u6dd8
```

## 解决

打开Setting，Editor，File Encodings。然后在右侧底部勾选**Transparent native-to-ascii conversion**即可。
