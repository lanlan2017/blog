---
title: 解决C语言：error C2084：function 'xxx xxx()' already has a body
categories: 
  - C语言
  - Debug
date: 2018-11-14 19:25:05
updated: 2019-12-09 19:55:22
abbrlink: 38f33943
---
## 分析原因 ##
这是因为头文件重复导入了，我在头文件`userBuyMenu.h`中导入了`#include "findMethod.h"`。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/C/debug/alredyHasABody/alreadyhasabody.png)
然后又在主方法中同时导入了这个两个头文件：
```c
#include "userBuyMenu.h"
#include "findMethod.h"
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/C/debug/alredyHasABody/congfudaoru.png)
这样就`findMethod.h`被导入了两次，重复了，所以报这个错。
## 解决方案 ##
注释掉`userBuyMenu.h`中导入的`findMethod.h`的语句：
```c
//#include "findMethod.h"
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/C/debug/alredyHasABody/zhushidiao.png)
## 总结 ##
以后不要在头文件中导入头文件，再主方法中导入即可。
