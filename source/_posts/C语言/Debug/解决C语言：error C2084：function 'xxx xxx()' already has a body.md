---
title: 解决C语言：error C2084：function 'xxx xxx()' already has a body
categories: 
  - C语言
  - Debug
date: 2018-11-14 19:25:05
updated: 2019-12-15 10:01:43
abbrlink: 38f33943
---
<div id='my_toc'><a href="/blog/38f33943/#分析原因" class="header_2">分析原因</a><br><a href="/blog/38f33943/#解决方案" class="header_2">解决方案</a><br><a href="/blog/38f33943/#总结" class="header_2">总结</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
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
